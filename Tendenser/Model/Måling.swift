//
//  Måling.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 07/07/2023.
//

import Foundation

struct Måling: Identifiable, Hashable {
  let id = UUID()
  var tid: Date
  var værdi: Double
  var note: String
}

extension Måling: Comparable, Equatable {
  static func == (lhs: Måling, rhs: Måling) -> Bool {
    lhs.id == rhs.id &&
    lhs.tid == rhs.tid &&
    lhs.note == rhs.note &&
    lhs.værdi == rhs.værdi
  }
  
  static func < (lhs: Måling, rhs: Måling) -> Bool {
    return lhs.tid < rhs.tid
  }
}
