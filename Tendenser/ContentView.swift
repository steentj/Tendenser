//
//  ContentView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tendenser: Tendenser

    var body: some View {
        NavigationView{
            List {
              let målingIndices = tendenser.målinger.indices
              let målinger = tendenser.målinger
              let målingIndexPairs = Array(zip(målinger, målingIndices))
              
              ForEach(målingIndexPairs, id: \.0.id, content: {
                måling, målingIndex in
                
                let tendenserWrapper = $tendenser
                let tendensBinding = tendenserWrapper.målinger
                let theTendensBinding = tendensBinding[målingIndex]
                
                NavigationLink(
                  destination: TendensView(tendens: theTendensBinding),
                  label: {Text(måling.navn)})
//                .background(Color(rgb: 0xabd1c6))
                .foregroundColor(Color(rgb: 0x0f3433))
//                .listRowBackground(Color(rgb: 0xabd1c6))
                .listRowSeparator(Visibility.automatic)
//                .font(.body)
              }).onDelete(perform: { indexSet in
                tendenser.målinger.remove(atOffsets: indexSet)
              })
              .onMove(perform: { indices, newOffset in
                tendenser.målinger.move(fromOffsets: indices, toOffset: newOffset)
              })
            }
            .listStyle(InsetListStyle())
            .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
              }
            }
            .toolbarBackground(Color(rgb: 0x004643), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle(Text("Tendenser"))
            .foregroundColor(Color(rgb: 0xfffffe))
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let tendenser = Tendenser()
    ContentView(tendenser: tendenser)
  }
}
