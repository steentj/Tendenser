//
//  Tendenser.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 15/07/2023.
//

import Foundation
import SwiftData

@Model
final class Tendenser {
 
  internal init(sidstOpdateret: Date = Date.now, TendensListe: [Tendens]) {
    self.sidstOpdateret = sidstOpdateret
    self.TendensListe = TendensListe
  }
  
  var sidstOpdateret: Date = Date.now
  var TendensListe: [Tendens]
  
  func slet(_ tendens: Tendens) {
    TendensListe.removeAll { $0.id == tendens.id }
  }
  
  func add(_ tendens: Tendens) {
    TendensListe.append(tendens)
  }
}
