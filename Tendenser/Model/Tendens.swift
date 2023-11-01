//
//  Tendens.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 07/07/2023.
//

import Foundation
import SwiftData

//@Model
class xTendens {
//class xTendens: Identifiable {
  init() {
    prioritet = 0
    navn = ""
    måleenhed = ""
    målinger = []
    inkluderTidspunkt = false
    return
  }
  
  init(_ prio: Int, _ nytNavn: String, _ nytMåleenhed: String, _ inkluderTid: Bool, _ nyeMålinger: [xMåling]) {
    prioritet = prio
    navn = nytNavn
    måleenhed = nytMåleenhed
    målinger = nyeMålinger
    inkluderTidspunkt = inkluderTid
    return
  }
  
  @Attribute(.unique) let id = UUID()
  var prioritet: Int
  var navn: String
  var måleenhed: String
  var inkluderTidspunkt: Bool
  var målinger: [xMåling]
//  @Relationship(.cascade) var målinger: [xMåling]? = []
}

extension xTendens: Comparable, Equatable {
  static func == (lhs: xTendens, rhs: xTendens) -> Bool {
    lhs.id == rhs.id &&
    lhs.navn == rhs.navn &&
    lhs.måleenhed == rhs.måleenhed &&
    lhs.inkluderTidspunkt == rhs.inkluderTidspunkt &&
    lhs.prioritet == rhs.prioritet &&
    lhs.målinger == rhs.målinger
  }
  
  static func < (lhs: xTendens, rhs: xTendens) -> Bool {
    return lhs.prioritet > rhs.prioritet
  }
}
