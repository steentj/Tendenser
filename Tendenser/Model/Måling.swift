//
//  Måling.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 07/07/2023.
//

import Foundation

struct Måling: Identifiable, Hashable {
  let id = UUID()
  let tid: Date
  let værdi: Double
  let note: String
}
