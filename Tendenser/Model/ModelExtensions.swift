//
//  ModelExtensions.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 19/10/2023.
//

import Foundation

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
