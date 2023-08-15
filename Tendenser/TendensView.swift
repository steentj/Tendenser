//
//  TendensView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import SwiftUI

struct TendensView: View {
  @Binding var tendens: Tendens
  let isEditing: Bool
  
  var body: some View {
    NavigationView {
      VStack {
        VStack {
          HStack {
            Text("Målinger af").font(.title2)
            if isEditing {
              TextField("Navn", text: $tendens.navn)
                .foregroundColor(Color(rgb: 0xfffffe))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                  //
                }
            } else {
              Text(tendens.navn).font(.title2).fontWeight(.bold)
            }
            Spacer()
          }
          .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
          HStack {
            Text("Måleenhed:").font(.title3)
            if isEditing {
              TextField("betegnelse for måleenhed", text: $tendens.måleenhed)
                .foregroundColor(Color(rgb: 0xfffffe))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                  //
                }
            } else {
              Text(tendens.måleenhed).font(.title3)
            }
            Spacer()
          }
          .padding(EdgeInsets(top: 2, leading: 20, bottom: 10, trailing: 10))
        }
        .background(Color(rgb: 0x004643))
        .foregroundColor(Color(rgb: 0xfffffe))
        
        List {
          let målingIndices = tendens.målinger.sorted(by: {$0.tid < $1.tid}).indices
          let målinger = tendens.målinger.sorted(by: {$0.tid < $1.tid})
          let målingIndexPairs = Array(zip(målinger, målingIndices))
          
          ForEach(målingIndexPairs, id: \.0.id, content: {
            måling, målingIndex in
            
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
//        .toolbar {
//          ToolbarItem(placement: .navigationBarLeading) {
//            EditButton()
//          }
//          ToolbarItem(placement: .navigationBarTrailing) {
//            Button {
//              var nyMåling = Måling(tid: Date.now, værdi: 0, note: "")
//            } label: {
//              Image(systemName: "plus")
//            }
//          }
//        }
        .foregroundColor(Color(rgb: 0xfffffe))
      }
    }
  }
}

struct TendensView_Previews: PreviewProvider {
    static var previews: some View {
      TendensView(tendens: Binding<Tendens>.constant(
        Tendens(1,
                "Blodsukker",
                "mmol",
                [Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   værdi: 42, note: ""),
                  Måling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   værdi: 45, note: ""),
                  Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: "")])),
        isEditing: true)
    }
}
