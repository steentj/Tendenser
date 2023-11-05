//
//  TendensView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import SwiftUI
import Combine
import Charts

struct TendensMaalingerView: View {
  @Bindable var tendens: Tendens
  
  @State private var visChart = false
  
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    VStack {
      ScrollView {
        ScrollViewReader { scrollView in
          VStack {
            ForEach(tendens.maalinger) { måling in
                MaalingView(måling: måling, maaleenhed: tendens.maaleenhed, formatStyle: findDatoFormat(inkluderTid: tendens.inkluderTidspunkt))
                .foregroundColor(Color(rgb: 0x0f3433))
            }
                    
            Button {
              tendens.maalinger.append(Maaling(tid: Date.now, vaerdi: 0, note: ""))
            } label: {
              HStack {
                Image(systemName: "plus")
                Text("Tilføj måling")
              }
            }
            .buttonStyle(.borderless)
            .id(tendens.maalinger.count)
          }
          .onAppear(perform: {
            scrollView.scrollTo(tendens.maalinger.count, anchor: .bottom)
          })
        }
      }
      .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
      Button {
        visChart = true
      } label: {
        Image(systemName: "chart.xyaxis.line")
      }
      .sheet(isPresented: $visChart) {
        GroupBox {
          if tendens.maalinger.count >= 2 {
            Chart(tendens.maalinger.sorted()) { m in
              LineMark(x: .value("Dato", m.tid), y: .value("Værdi", m.vaerdi))
                .interpolationMethod(InterpolationMethod.catmullRom)
                .symbol(.asterisk)
                .symbolSize(30)
            }
          } else {
            Text("Ved mindst 2 maalinger vises her en graf over vaerdierne.")
          }
        }
        .presentationDragIndicator(.visible)
        .presentationDetents([.fraction(0.25),.fraction(0.50),.fraction(0.75),.fraction(1)])
        .groupBoxStyle(YellowGroupBoxStyle())
      }
      .buttonStyle(.borderless)
    }
  }
                      
//  func sletMaalinger(sletMaaling: Maaling) {
//    var ix = 0
//    for måling in tendens.maalinger {
//      if måling.id == sletMaaling.id {
//        let tendens = tendens.maalinger.remove(at: ix)
//      }
//      ix += 1
//    }
//  }
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

//struct TendensMaalingerView_Previews: PreviewProvider {
//    static var previews: some View {
//      TendensMaalingerView(tendens: Binding<Tendens>.constant(
//        Tendens(1,
//                "Blodsukker",
//                "mmol",
//                true,
//                [Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 42, note: ""),
//                  Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 15))!,   vaerdi: 45, note: " note "),
//                  Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   vaerdi: 51, note: " ")])),
//        isEditing: true)
//    }
//}
