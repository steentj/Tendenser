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
  @State private var redigerMaaling = false
  
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    VStack {
        ScrollViewReader { scrollView in
          VStack {
            List {
              ForEach(tendens.maalinger.sorted(by: { m1, m2 in
                m1.tid <= m2.tid })) { maaling in
                  if maaling.note.trimmingCharacters(in: .whitespaces).count > 0 {
                    DisclosureGroup {
                      Text(maaling.note)
                    } label: {
                      MaalingView(tendens: tendens, maaling: maaling, maaleenhed: tendens.maaleenhed, formatStyle: findDatoFormat(inkluderTid: tendens.inkluderTidspunkt))
                    }
                  } else{
                    MaalingView(tendens: tendens, maaling: maaling, maaleenhed: tendens.maaleenhed, formatStyle: findDatoFormat(inkluderTid: tendens.inkluderTidspunkt))
                  }
                }
            }
            .listStyle(.plain)
            .listRowSeparator(Visibility.automatic)
            .onAppear(perform: {
              scrollView.scrollTo(tendens.maalinger.count, anchor: .bottom)
            })
        }
      }
      
      Spacer()
      
      if (tendens.maalinger.count > 1) {
        Button {
          visChart = true
        } label: {
          Image(systemName: "chart.xyaxis.line")
        }
        .sheet(isPresented: $visChart) {
          GroupBox {
            Chart(tendens.maalinger.sorted()) { m in
              LineMark(x: .value("Dato", m.tid), y: .value("Værdi", m.vaerdi))
                .interpolationMethod(InterpolationMethod.catmullRom)
                .symbol(.asterisk)
                .symbolSize(30)
            }
          }
          .presentationDragIndicator(.visible)
          .presentationDetents([.fraction(0.25),.fraction(0.50),.fraction(0.75),.fraction(1)])
          .groupBoxStyle(YellowGroupBoxStyle())
        }
        .buttonStyle(.borderless)
      }
    }
  }
                      
  func sletMaalinger(_ maalingSlet: Maaling) {
    for ix in 0...tendens.maalinger.count-1 {
      if tendens.maalinger[ix].id == maalingSlet.id {
        tendens.maalinger.remove(at: ix)
        break
      }
    }
  }
}


func findDatoFormat(inkluderTid: Bool) -> Date.FormatStyle {
  return inkluderTid
  ? Date.FormatStyle()
    .locale(Locale(identifier: "da_DK"))
    .year(.padded(4))
    .month(.twoDigits)
    .day(.twoDigits)
    .hour(.twoDigits(amPM: .omitted))
    .minute(.twoDigits)
  : Date.FormatStyle()
    .locale(Locale(identifier: "da_DK"))
    .year(.padded(4))
    .month(.twoDigits)
    .day(.twoDigits)
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

//#Preview {
//  Group {
//    var tendens =
//      Tendens(
//        4,
//        "Blodsukker",
//        "mmol",
//        false,
//        [
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 1, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2019, month: 1, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2020, month: 1, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 1, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 45, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 2))!,   vaerdi: 51, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 21))!,   vaerdi: 52, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 28))!,   vaerdi: 34, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 2))!,   vaerdi: 51, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 21))!,   vaerdi: 52, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 28))!,   vaerdi: 34, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 2, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2019, month: 2, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2020, month: 2, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 2, day: 15))!,   vaerdi: 42, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 45, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 2))!,   vaerdi: 51, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 21))!,   vaerdi: 52, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 28))!,   vaerdi: 34, note: ""),
//          Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 28))!,   vaerdi: 30, note: "")])
//        
//    TendensMaalingerView(tendens: tendens)
//  }
//}
