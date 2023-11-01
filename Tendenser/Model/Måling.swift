//
//  Måling.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 07/07/2023.
//

import Foundation
import SwiftData

//@Model
class xMåling: Identifiable {
  @Attribute(.unique) let id = UUID()
  var tid: Date
  var værdi: Double
  var note: String
  
  init(tid: Date, værdi: Double, note: String) {
    self.tid = tid
    self.værdi = værdi
    self.note = note
  }
}

extension xMåling: Comparable, Equatable {
  static func == (lhs: xMåling, rhs: xMåling) -> Bool {
    lhs.id == rhs.id &&
    lhs.tid == rhs.tid &&
    lhs.note == rhs.note &&
    lhs.værdi == rhs.værdi
  }
  
  static func < (lhs: xMåling, rhs: xMåling) -> Bool {
    return lhs.tid < rhs.tid
  }
}
