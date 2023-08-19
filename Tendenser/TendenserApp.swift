//
//  TendenserApp.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI

@main
struct TendenserApp: App {
  @StateObject private var tendenser = Tendenser(sidstOpdateret: Date.now, TendensListe: tendensTestdata)
  
  var body: some Scene {
      WindowGroup {
        NavigationView{
          TendenslisteView()
          Text("Vælg en tendens")
            .foregroundStyle(.secondary)
        }
        .environmentObject(tendenser)
      }
  }
}

struct TendenserApp_Previews: PreviewProvider {
  static var previews: some View {
    let tendenser = Tendenser(sidstOpdateret: Date.distantPast, TendensListe: tendensTestdata)
    TendenslisteView().environmentObject(tendenser)
  }
}
