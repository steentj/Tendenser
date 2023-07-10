//
//  Tendens.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 07/07/2023.
//

import Foundation

struct Tendens: Identifiable {
  let id = UUID()
  var prioritet: Int
  let navn: String
  let måleenhed: String
  var målinger: [Måling]
}
