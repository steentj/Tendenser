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
//          else {
//            HStack {
//              Text("Målinger af").font(.title2)
//              Text(tendens.navn).font(.title2).fontWeight(.bold)
//              Spacer()
//            }
//            .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 0))
//            HStack {
//              Text("Måleenhed").font(.title2)
//              Text(tendens.måleenhed).font(.title2).fontWeight(.bold)
//              Spacer()
//            }
//            .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 0))
//          }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
//        .background(Color(rgb: 0x004643))
        .foregroundColor(Color(rgb: 0xfffffe))
        
        let målingIndices = tendens.målinger.indices
        let målinger = tendens.målinger
        let målingIndexPairs = Array(zip(målinger, målingIndices)).sorted(by: {$0.self.0.tid < $1.self.0.tid})
        
        ScrollView {
          ScrollViewReader { scrollView in
            
            VStack {
                ForEach(målingIndexPairs,
                        id: \.0.id) {
                  måling, målingIndex in
                  
                  let målingWrapper = $tendens.målinger
                  let målingBinding = målingWrapper
                  let theMålingBinding = målingBinding[målingIndex]
                  
                  HStack {
                    if isEditing {
                      RedigerMåling(item: theMålingBinding, inkluderTid: tendens.inkluderTidspunkt)
                    } else {
                      MålingView(måling: theMålingBinding, måleenhed: tendens.måleenhed, formatStyle: findDatoFormat(inkluderTid: tendens.inkluderTidspunkt))
                    }
                  }
                  .id(målingIndex)
                  .foregroundColor(Color(rgb: 0x0f3433))
                }
                .onDelete(perform: { indexSet in
                  tendens.målinger.remove(atOffsets: indexSet)
                })
              Button {
                tendens.målinger.append(Måling(tid: Date.now, værdi: 0, note: ""))
              } label: {
                HStack {
                  Image(systemName: "plus")
                  Text("Tilføj måling")
                }
              }
              .buttonStyle(.borderless)
              .id(tendens.målinger.count)
            }
            .onAppear(perform: {
              scrollView.scrollTo(tendens.målinger.count, anchor: .bottom)
            })
          }
        }
        
        if isEditing {
//          Button {
//            tendens.målinger.append(Måling(tid: Date.now, værdi: 0, note: ""))
//          } label: {
//            HStack {
//              Image(systemName: "plus")
//              Text("Tilføj måling")
//            }
//          }
//          .buttonStyle(.borderless)
        } else {          
          GroupBox {
            if tendens.målinger.count >= 2 {
              Chart(tendens.målinger.sorted()) { m in
                LineMark(x: .value("Dato", m.tid), y: .value("Værdi", m.værdi))
                  .interpolationMethod(InterpolationMethod.catmullRom)
                  .symbol(.asterisk)
                  .symbolSize(30)
              }
            } else {
              Text("Ved mindst 2 målinger vises her en graf over værdierne.")
            }
          }
          .groupBoxStyle(YellowGroupBoxStyle())
          .padding(20)
        }
      }
    }
  }
}

struct YellowGroupBoxStyle: GroupBoxStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.content
      .padding(.top, 30)
      .padding(20)
      .background(Color(hue: 0.10, saturation: 0.10, brightness: 0.98))
      .cornerRadius(20)
      .overlay(
        configuration.label.padding(10),
        alignment: .topLeading
      )
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
