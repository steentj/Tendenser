//
//  MaalingView.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 24/08/2023.
//

import SwiftUI

struct MaalingView: View {
  @Bindable var tendens: Tendens
  @Bindable var maaling: Maaling
  var maaleenhed: String
  var formatStyle: Date.FormatStyle
  
  @State private var visNote = false
  
  var body: some View {
    HStack {
      Text("\(formatStyle.format(maaling.tid)):")
        .frame(width: 160.0, height: nil, alignment: .leading)
      if let vaerdi = maaling.vaerdi {
        Text("\(vaerdi.formatted(.number)) \(maaleenhed)")
          .frame(width: 120, height: 20, alignment: .trailing)
          .fontWeight(.bold)
      } else {
        Text("")
          .frame(width: 120, height: 20, alignment: .trailing)
          .fontWeight(.bold)
      }
      
      if maaling.note.trimmingCharacters(in: .whitespaces).count > 0 {
        Text(Image(systemName: "note.text"))
      } else {
        Text(" ")
          .frame(width: 20, height: nil, alignment: .trailing)
      }
      Spacer()
    }
    .foregroundColor(Color("mørkegrøn"))
  }
}

func sletMaalinger(_ tendens: Tendens, _ maalingSlet: Maaling) {
  for ix in 0...tendens.maalinger.count-1 {
    if tendens.maalinger[ix].id == maalingSlet.id {
      tendens.maalinger.remove(at: ix)
      break
    }
  }
}

#Preview {
  let tendens = Tendens(
    1,
    "Grøn cirkel",
    "kg",
    true,
    [Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22, hour: 13, minute: 20, second: 15))!,   vaerdi: 83, note: ""),
     Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24, hour: 12, minute: 20, second: 15))!,   vaerdi: 77, note: ""),
     Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2, hour: 11, minute: 20, second: 15))!,   vaerdi: 73, note: "")])
  
  @State var maaling = Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24, hour: 12, minute: 20, second: 15))!, vaerdi: 77, note: "Hansen")
  
  let dateformat = Date.FormatStyle()
    .locale(Locale(identifier: "da_DK"))
    .year(.padded(4))
    .month(.twoDigits)
    .day(.twoDigits)
    .hour(.twoDigits(amPM: .omitted))
    .minute(.twoDigits)
  return MaalingView(tendens: tendens, maaling: maaling, maaleenhed: "Stk", formatStyle: dateformat)
}
