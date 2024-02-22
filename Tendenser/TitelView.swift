//
//  TitelView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 22/11/2023.
//

import SwiftUI

struct TitelView: View {
  var tilføjTendens:() -> Void
  var sti: [Tendens]
  
  var body: some View {
    HStack(alignment: .top) {
      
      Spacer()
      Label("Tendenser", systemImage: "chart.line.uptrend.xyaxis")
        .font(.title2)
      Spacer()
      if sti.isEmpty {
        Button("+", action: {
          tilføjTendens()
        })
        .padding(.trailing)
        .font(.title2).fontWeight(.bold)
      }
    }
    .frame(height: 32.0)
    .background(Color(rgb: 0x004643))
    .foregroundColor(Color(rgb: 0xfffffe))
    .cornerRadius(10)
  }
}


#Preview {
  TitelView(tilføjTendens: { }, sti: [])
}
