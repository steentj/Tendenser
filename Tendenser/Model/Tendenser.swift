//
//  Tendenser.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 15/07/2023.
//

import Foundation

class Tendenser: ObservableObject {
  internal init(sidstOpdateret: Date = Date.now, TendensListe: [Tendens]) {
    self.sidstOpdateret = sidstOpdateret
    self.TendensListe = TendensListe
  }
  
  @Published var sidstOpdateret: Date = Date.now
  @Published var TendensListe: [Tendens]
  
  func slet(_ tendens: Tendens) {
    TendensListe.removeAll { $0.id == tendens.id }
  }
}
