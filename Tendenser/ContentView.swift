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
      VStack(alignment: .leading){
        HovedTitel()
        
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
//                    .background(Color(rgb: 0xabd1c6))
                .foregroundColor(Color(rgb: 0x0f3433))
                .listRowSeparator(Visibility.hidden)
//                      .listRowBackground(Color(rgb: 0xabd1c6))
                .font(.body)
              })
            }
            .listStyle(InsetListStyle())
        }
        
      }
      .padding([.top, .leading, .trailing])
      
//        .background(Color(rgb: 0xabd1c6))
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
