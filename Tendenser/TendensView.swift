//
//  TendensView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import SwiftUI
import Combine
import Charts

struct TendensView: View {
  @Binding var tendens: Tendens
  let isEditing: Bool
  @State private var taskVærdi = "0"
  
  var body: some View {
    NavigationView {
      VStack {
        VStack {
          if isEditing {
            RedigerTendensGenerelleVærdier(tendens: $tendens)
          }
          else {
            HStack {
              Text("Målinger af").font(.title2)
              Text(tendens.navn).font(.title2).fontWeight(.bold)
              Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
            HStack {
              Text("Måleenhed").font(.title2)
              Text(tendens.måleenhed).font(.title2).fontWeight(.bold)
              Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 0))
          }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
        .background(Color(rgb: 0x004643))
        .foregroundColor(Color(rgb: 0xfffffe))
        
        List {
          let dateFormatStyle = tendens.inkluderTidspunkt
              ? Date.FormatStyle.TimeStyle.shortened
              : Date.FormatStyle.TimeStyle.omitted
          
          let målingIndices = tendens.målinger.indices
          let målinger = tendens.målinger
          let målingIndexPairs = Array(zip(målinger, målingIndices)).sorted(by: {$0.self.0.tid < $1.self.0.tid})
          
          ForEach(målingIndexPairs,
                  id: \.0.id, content: {
            måling, målingIndex in
            
            let målingWrapper = $tendens.målinger
            let målingBinding = målingWrapper
            let theMålingBinding = målingBinding[målingIndex]
            
            HStack {
              if isEditing {
                RedigerMåling(item: theMålingBinding)
              } else {
                MålingView(måling: theMålingBinding, måleenhed: tendens.måleenhed, dateFormatStyle: dateFormatStyle)
              }
            }
            .foregroundColor(Color(rgb: 0x0f3433))
          }).onDelete(perform: { indexSet in
            tendens.målinger.remove(atOffsets: indexSet)
          })
          
          if isEditing {
            Button {
              tendens.målinger.append(Måling(tid: Date.now, værdi: 0, note: ""))
            } label: {
              HStack {
                Image(systemName: "plus")
                Text("Tilføj måling")
              }
            }
            .buttonStyle(.borderless)
          }
        }
        .listStyle(InsetListStyle())
//        .foregroundColor(Color(rgb: 0xfffffe))
        
        if tendens.målinger.count > 2 {
          Chart(tendens.målinger) { m in
            LineMark(x: .value("Dato", m.tid), y: .value("Værdi", m.værdi))
          }
          .padding(20)
        } else {
          Text("Ved mindst 3 målinger vises her en graf over værdierne.")
            .padding(20)
        }
        
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
                true,
                [Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   værdi: 42, note: ""),
                  Måling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   værdi: 45, note: " note "),
                  Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: " ")])),
        isEditing: false)
    }
}
