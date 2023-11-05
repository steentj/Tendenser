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
    lhs.maaleenhed == rhs.maaleenhed &&
    lhs.inkluderTidspunkt == rhs.inkluderTidspunkt &&
    lhs.prioritet == rhs.prioritet &&
    lhs.maalinger == rhs.maalinger
  }
  
  static func < (lhs: Tendens, rhs: Tendens) -> Bool {
    return lhs.prioritet > rhs.prioritet
  }
}

extension Maaling: Comparable, Equatable {
  static func == (lhs: Maaling, rhs: Maaling) -> Bool {
    lhs.id == rhs.id &&
    lhs.tid == rhs.tid &&
    lhs.note == rhs.note &&
    lhs.vaerdi == rhs.vaerdi
  }
  
  static func < (lhs: Maaling, rhs: Maaling) -> Bool {
    return lhs.tid < rhs.tid
  }
}
