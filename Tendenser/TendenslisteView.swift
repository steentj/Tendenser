//
//  ContentView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI

struct TendenslisteView: View {
  
  @EnvironmentObject var tendenser: Tendenser
  
  @State private var nyTendens: Tendens = Tendens()
  @State private var tilføjerNyTendens: Bool = false
  
  var body: some View {
    NavigationStack{
      List {
        let målingIndices = tendenser.TendensListe.indices
        let målinger = tendenser.TendensListe
        let målingIndexPairs = Array(zip(målinger, målingIndices)).sorted(by: {$0.self.0.prioritet < $1.self.0.prioritet})
        
        ForEach(målingIndexPairs,
                id: \.0.id, content: {
          måling, målingIndex in
          
          let tendenserWrapper = $tendenser
          let tendensBinding = tendenserWrapper.TendensListe
          let theTendensBinding = tendensBinding[målingIndex]
          
          NavigationLink(
            måling.navn,
            destination: TendensEditor(tendens: theTendensBinding, erNy: false)
            )
          .background(Color(rgb: 0xabd1c6))
          .foregroundColor(Color(rgb: 0x0f3433))
          .listRowBackground(Color(rgb: 0xabd1c6))
          .listRowSeparator(Visibility.automatic)
          .swipeActions {
            Button(role: .destructive) {
              tendenser.slet(måling)
            } label: {
              Label("Slet", systemImage: "trash")
            }
          }
        })
        .onMove(perform: { indices, newOffset in
          opdaterProriteter(tendenser: tendenser, indices: indices, newOffset: newOffset, målingIndexPairs: målingIndexPairs)
        })
      }
      .scrollContentBackground(.hidden)
      .background(Color(rgb: 0xabd1c6))
      .navigationTitle(Text("Tendenser"))
      .navigationBarTitleDisplayMode(.automatic)
      .listStyle(InsetListStyle())
      .toolbar {
        ToolbarItem (placement: .navigationBarLeading) {
          EditButton()
        }
        ToolbarItem (placement: .navigationBarTrailing) {
            Button {
              let maxPrio = ((tendenser.TendensListe.max(by: { $0.prioritet < $1.prioritet})?.prioritet) ?? 0) + 1
              nyTendens = Tendens()
              nyTendens.prioritet = maxPrio
              tilføjerNyTendens = true
            } label: {
              Image(systemName: "plus")
            }
          }
        }
        .sheet(isPresented: $tilføjerNyTendens) {
          NavigationView {
            TendensEditor(tendens: $nyTendens, erNy: true)
          }
        }
        .toolbarColorScheme(.dark, for: .navigationBar)
//        .toolbarBackground(LinearGradient(colors: [.red, .blue],
        .toolbarBackground(LinearGradient(colors: [Color(rgb: 0x004643), Color(rgb: 0x005643)],
                                          startPoint: .leading, endPoint: .trailing), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
      }
    }
  
  func opdaterProriteter(tendenser: Tendenser, indices: IndexSet, newOffset: Int, målingIndexPairs: [(Tendens, Int)]) -> Void {
    if indices.count > 0 {
      var offset = newOffset
      var prioStart: Int
      var prioSlut: Int
      var ændring: Int
      var nyPrio: Int
      
      if (newOffset > indices.first!) {
        offset -= 1
        prioStart = målingIndexPairs[indices.first!].0.prioritet
        prioSlut = målingIndexPairs[offset].0.prioritet
        ændring = -1
        nyPrio = målingIndexPairs[offset].0.prioritet
      } else {
        prioStart = målingIndexPairs[offset].0.prioritet
        prioSlut = målingIndexPairs[indices.first!].0.prioritet
        ændring = 1
        nyPrio = målingIndexPairs[offset].0.prioritet
      }
      
      for tp in 0..<tendenser.TendensListe.count {
        if tendenser.TendensListe[tp].prioritet >= prioStart &&
            tendenser.TendensListe[tp].prioritet <= prioSlut {
          tendenser.TendensListe[tp].prioritet += ændring
        }
      }
      
      tendenser.TendensListe[målingIndexPairs[indices.first!].1].prioritet = nyPrio
    }
  }
}

struct HovedTitel: View {
  var body: some View {
    HStack(alignment: .top) {
      Spacer()
      Text(Image(systemName: "chart.line.uptrend.xyaxis")).font(.title2)
      Text("Tendenser").font(.title2)
      Spacer()
      Button("+", action: {
        // gør noget
      })
        .padding(.trailing)
        .font(.title2).fontWeight(.bold)
    }
    .frame(height: 32.0)
    .background(Color(rgb: 0x004643))
    .foregroundColor(Color(rgb: 0xfffffe))
    .cornerRadius(10)
  }
}

//struct NavigationConfigurator: UIViewControllerRepresentable {
//  var configure: (UINavigationController) -> Void = { _ in }
//  
//  func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
//    UIViewController()
//  }
//  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
//    if let nc = uiViewController.navigationController {
//      self.configure(nc)
//    }
//  }
//  
//}

struct TendenslisteView_Previews: PreviewProvider {
  static var previews: some View {
    let tendenser = Tendenser(sidstOpdateret: Date.distantPast, TendensListe: tendensTestdata)
    TendenslisteView().environmentObject(tendenser)
  }
}
