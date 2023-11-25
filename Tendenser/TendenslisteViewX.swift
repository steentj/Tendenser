//
//  TendenslisteView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 22/09/2023.
//

import SwiftUI

struct TendenslisteView: View {
//  @Bindable var tendenser: [Tendens]
  
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    List
    {
      //      let tendensIndices = tendenser.indices
      //      let tendensListe = tendenser
      //      let tendensIndexPar = Array(zip(tendensListe, tendensIndices))
      //        .sorted(by: {$0.self.0.prioritet < $1.self.0.prioritet})
      //
      //      ForEach(tendensIndexPar,
      //              id: \.0.id, content: {
      //        tendens, tendensIndex in
      //
      //        let tendenserWrapper = tendenser
      //        let tendensBinding = tendenserWrapper
      //        let theTendensBinding = tendensBinding[tendensIndex]
      //
      //        NavigationLink(
      //          tendens.navn,
      //          destination: TendensView(tendens: theTendensBinding, erNy: false, tendenser: tendenser)
      //        )
      //        .background(Color(rgb: 0xabd1c6))
      //        .foregroundColor(Color(rgb: 0x0f3433))
      //        .listRowBackground(Color(rgb: 0xabd1c6))
      //        .listRowSeparator(Visibility.automatic)
      //        .swipeActions {
      //          Button(role: .destructive) {
      //            tendenser.slet(tendens)
      //          } label: {
      //            Label("Slet", systemImage: "trash")
      //          }
      //        }
      //      })
      //      .onMove(perform: { indices, newOffset in
      //        opdaterProriteter(tendenser: tendenser, indices: indices, newOffset: newOffset, tendensIndexPar: tendensIndexPar)
      //      })
      //    }
    }
  }
  
//  func opdaterProriteter(tendenser: [Tendens], indices: IndexSet, newOffset: Int, tendensIndexPar: [(Tendens, Int)]) -> Void {
//    if indices.count > 0 {
//      var offset = newOffset
//      var prioStart: Int
//      var prioSlut: Int
//      var ændring: Int
//      var nyPrio: Int
//      
//      if (newOffset > indices.first!) {
//        offset -= 1
//        prioStart = tendensIndexPar[indices.first!].0.prioritet
//        prioSlut = tendensIndexPar[offset].0.prioritet
//        ændring = -1
//        nyPrio = tendensIndexPar[offset].0.prioritet
//      } else {
//        prioStart = tendensIndexPar[offset].0.prioritet
//        prioSlut = tendensIndexPar[indices.first!].0.prioritet
//        ændring = 1
//        nyPrio = tendensIndexPar[offset].0.prioritet
//      }
//      
//      for tp in 0..<tendenser.count {
//        if tendenser[tp].prioritet >= prioStart &&
//            tendenser[tp].prioritet <= prioSlut {
//          tendenser[tp].prioritet += ændring
//        }
//      }
//      
//      tendenser[tendensIndexPar[indices.first!].1].prioritet = nyPrio
//    }
//  }
}

//#Preview {
//  TendenslisteView(tendenser: Binding<[Tendens]>(tendensTestdata))
//}
