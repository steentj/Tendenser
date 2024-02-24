//
//  ContentView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 06/07/2023.
//

import SwiftUI
import SwiftData

struct TendensListeView: View {
  @Query(sort: \Tendens.prioritet) private var tendenser: [Tendens]
  @State private var sti = [Tendens]()
  @State private var nyTendens = false
  @State private var redigerTendens = false
  @State private var arbejdsTendens: Tendens?
  
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
      NavigationStack(path: $sti) {
        List {
          ForEach(tendenser) { tendens in
            NavigationLink(value: tendens) {
              Text(tendens.navn)
              .badge(tendens.maalinger.count)
            }
            .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
              Button {
                redigerTendens = true
              } label: {
                Image(systemName: "pencil")
              }
              .tint(Color("mørkegrøn").opacity(0.3))
            })
            .sheet(isPresented: $redigerTendens, content: {
                RedigerTendensGenerelleVærdier(tendens: tendens)
                  .presentationDetents([.medium])
            })
            .background(Color("lysegrøn").opacity(0.50))
            .foregroundColor(Color("mørkegrøn"))
            .listRowBackground(Color("lysegrøn").opacity(0.75))
            .listRowSeparator(Visibility.automatic)
            .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
              Button(role: .destructive) {
                sletTendens(tendens)
              } label: {
                Image(systemName: "trash")
              }
              .tint(.red)
              .foregroundColor(.white)
            })
          }
        }
        .navigationDestination(for: Tendens.self, destination: { tendens in
          TendensView(tendens: tendens)
        })
        .scrollContentBackground(.hidden)
        .listStyle(InsetListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("lysegrøn").opacity(0.75))
        .toolbar {
          ToolbarItem(placement: .principal) { 
            HStack {
              Image(systemName: "chart.line.uptrend.xyaxis")
              Text("Tendenser")
            }
            .padding()
            .font(.title)
            .foregroundColor(.white)
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              nyTendens.toggle()
            } label: {
              Image(systemName: "plus")
                .font(.title2)
            }
          }
        }
        .toolbarBackground(Visibility.visible, for: .tabBar)
        .sheet(isPresented: $nyTendens, content: {
          RedigerTendensGenerelleVærdier()
            .presentationDetents([.medium])
        })
    }
    .tint(.white)
    .onAppear {
      let appearance = UINavigationBarAppearance()
      
      appearance.backgroundColor = UIColor(Color("mørkegrøn"))
      
      UINavigationBar.appearance().standardAppearance = appearance
      UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
  }
  
  func sletTendenser(_ indexSet: IndexSet) {
    for index in indexSet {
      let tendens = tendenser[index]
      modelContext.delete(tendens)
    }
  }
  
  func sletTendens(_ tendens: Tendens) {
    modelContext.delete(tendens)
  }
  
  func navigationLink(tendens: Tendens?) -> some View {
    return Text(tendens!.navn)
    .badge(tendens!.maalinger.count)}
}

#if DEBUG
#Preview {
  TendensListeView()
    .modelContainer(Tendens.preview)
}
#endif
