//
//  TendensView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import SwiftUI

struct TendensView: View {
  @Binding var tendens: Tendens
  var body: some View {
    NavigationView {
//      VStack {
//        Text("Tendens for målinger af \(tendens.navn)")
//          .padding(.all, 11.0)
//          .cornerRadius(10)
//          .background(Color(rgb: 0xabd1c6))
        List {
          let målingIndices = tendens.målinger.indices
          let målinger = tendens.målinger
          let målingIndexPairs = Array(zip(målinger, målingIndices))
          
          ForEach(målingIndexPairs, id: \.0.id, content: {
            måling, målingIndex in
            
            let tendenserWrapper = $tendens
            
            HStack {
              Text("\(måling.tid.formatted(date: .abbreviated, time: .omitted)):")
              Spacer()
              Text("\(måling.værdi.formatted(.number)) \(tendens.måleenhed)")
            }
            .foregroundColor(Color(rgb: 0x0f3433))
          }).onDelete(perform: { indexSet in
            tendens.målinger.remove(atOffsets: indexSet)
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
        .foregroundColor(Color(rgb: 0xfffffe))
      }
      .padding(.all, 0.0)
//    }
    .toolbarBackground(Color(rgb: 0x004643), for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
    .navigationTitle(
      Text(tendens.navn).font(.body))
    .foregroundColor(Color(rgb: 0xfffffe))
  }
}

struct TendensView_Previews: PreviewProvider {
    static var previews: some View {
      TendensView(tendens: Binding<Tendens>.constant(Tendens(
        prioritet: 1,
        navn: "Blodsukker",
        måleenhed: "mmol",
        målinger: [
          Måling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 1, day: 15))!,   værdi: 42, note: ""),
          Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 15))!,   værdi: 45, note: ""),
          Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: "")])))
    }
}
