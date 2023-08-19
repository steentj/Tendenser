//
//  Tendens.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 07/07/2023.
//

import Foundation

struct Tendens: Identifiable, Hashable {
  init() {
    prioritet = 0
    navn = ""
    måleenhed = ""
    målinger = []
    inkluderTidspunkt = false
    return
  }
  
  init(_ prio: Int, _ nytNavn: String, _ nytMåleenhed: String, _ inkluderTid: Bool, _ nyeMålinger: [Måling]) {
    prioritet = prio
    navn = nytNavn
    måleenhed = nytMåleenhed
    målinger = nyeMålinger
    inkluderTidspunkt = inkluderTid
    return
  }
  
  let id = UUID()
  var prioritet: Int
  var navn: String
  var måleenhed: String
  var inkluderTidspunkt: Bool
  var målinger: [Måling]
}

extension Tendens: Comparable, Equatable {
  static func == (lhs: Tendens, rhs: Tendens) -> Bool {
    lhs.id == rhs.id &&
    lhs.navn == rhs.navn &&
    lhs.måleenhed == rhs.måleenhed &&
    lhs.inkluderTidspunkt == rhs.inkluderTidspunkt &&
    lhs.prioritet == rhs.prioritet &&
    lhs.målinger == rhs.målinger
  }
  
  static func < (lhs: Tendens, rhs: Tendens) -> Bool {
    return lhs.prioritet > rhs.prioritet
  }
}
