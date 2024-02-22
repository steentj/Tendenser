//
//  MaalingerGraf.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 15/02/2024.
//

import SwiftUI
import SwiftData
import Charts

struct MaalingerGraf: View {
  var tendens: Tendens
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    GroupBox {
      VStack(spacing: 20) {
        Chart(tendens.maalinger.sorted()) { m in
          LineMark(x: .value("Dato", m.tid), y: .value("Værdi", m.vaerdi!))
            .interpolationMethod(InterpolationMethod.catmullRom)
            .symbol(.asterisk)
            .symbolSize(30)
        }
        Button("\(Image(systemName: "arrow.down.circle"))") {
          dismiss()
        }
      }
    }
    .presentationDragIndicator(.visible)
    .presentationDetents([.medium, .large])
    .groupBoxStyle(YellowGroupBoxStyle())
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

#if DEBUG
#Preview {
  var fetchDescriptor = FetchDescriptor<Tendens>(predicate: #Predicate { måling  in
    måling.navn == "Mad"
  })
  
  fetchDescriptor.fetchLimit = 1
  
  let tendens = try! Tendens.preview.mainContext.fetch(fetchDescriptor).first!
  
  return MaalingerGraf(tendens: tendens)
    .modelContainer(Tendens.preview)
}
#endif
