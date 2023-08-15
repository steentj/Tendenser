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
    return
  }
  
  init(_ prio: Int, _ nytNavn: String, _ nytMåleenhed: String, _ nyeMålinger: [Måling]) {
    prioritet = prio
    navn = nytNavn
    måleenhed = nytMåleenhed
    målinger = nyeMålinger
    return
  }
  
  let id = UUID()
  var prioritet: Int
  var navn: String
  var måleenhed: String
  var målinger: [Måling]
}

extension Tendens: Comparable {
  static func == (lhs: Tendens, rhs: Tendens) -> Bool {
    lhs.prioritet == rhs.prioritet
  }
  
  static func < (lhs: Tendens, rhs: Tendens) -> Bool {
    return lhs.prioritet > rhs.prioritet
  }
}
