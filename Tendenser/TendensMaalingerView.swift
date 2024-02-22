//
//  TendensView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import SwiftUI
import Combine
import SwiftData

struct TendensMaalingerView: View {
  @Bindable var tendens: Tendens
  
  @State private var visChart = false
  @State private var redigerMaaling = false
  @State private var tempMaaling: Maaling = Maaling()
  
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    VStack {
      ScrollViewReader { scrollView in
        VStack {
          List {
            ForEach(tendens.maalinger.sorted(by: { m1, m2 in
              m1.tid <= m2.tid })) { maaling in
                MaalingView(tendens: tendens, maaling: maaling, maaleenhed: tendens.maaleenhed, formatStyle: findDatoFormat(inkluderTid: tendens.inkluderTidspunkt))
                  .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button() {
                      redigerMaaling.toggle()
                    } label: {
                      Label("Slet", systemImage: "pencil")
                    }
                  }
                  .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                      sletMaalinger(tendens, maaling)
                    } label: {
                      Label("Slet", systemImage: "trash")
                    }
                  }
                  .sheet(isPresented: $redigerMaaling, content: {
                    RedigerMaalingView(tendens: tendens, item: maaling)
                      .presentationDetents([.medium])
                  })
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
        MaalingerGraf(tendens: tendens)
      }
      .buttonStyle(.borderless)
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

#if DEBUG
#Preview {
  var fetchDescriptor = FetchDescriptor<Tendens>(predicate: #Predicate { måling  in
    måling.navn == "Mad"
  })
  fetchDescriptor.fetchLimit = 1
  
  let tendens = try! Tendens.preview.mainContext.fetch(fetchDescriptor).first!
  
  return TendensMaalingerView(tendens: tendens)
    .modelContainer(Tendens.preview)
}
#endif


