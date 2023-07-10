//
//  Tendenser.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import Foundation

class Tendenser: ObservableObject {
  @Published var målinger = [
    Tendens(
      prioritet: 1,
      navn: "Blodsukker",
      måleenhed: "mmol",
      målinger: [
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 1, day: 15))!,   værdi: 42, note: ""),
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 15))!,   værdi: 45, note: ""),
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: "")]),
    Tendens(
      prioritet: 2,
      navn: "Vægt",
      måleenhed: "kg",
      målinger: [
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   værdi: 83, note: ""),
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   værdi: 77, note: ""),
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   værdi: 73, note: "")]),
    Tendens(
      prioritet: 3,
      navn: "Cirkler lukket",
      måleenhed: "stk",
      målinger: [
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 7))!,   værdi: 3, note: ""),
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 8))!,   værdi: 2, note: ""),
        Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 9))!,   værdi: 3, note: "")])]
}
