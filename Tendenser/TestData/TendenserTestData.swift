//
//  Tendenser.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import Foundation

let tendensTestdata =
  [
    Tendens(
      4,
      "Blodsukker",
      "mmol",
      false,
      [
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 1, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2019, month: 1, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2020, month: 1, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 1, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 45, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 2))!,   vaerdi: 51, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 21))!,   vaerdi: 52, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 28))!,   vaerdi: 34, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 2))!,   vaerdi: 51, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 21))!,   vaerdi: 52, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 28))!,   vaerdi: 34, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 2, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2019, month: 2, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2020, month: 2, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 2, day: 15))!,   vaerdi: 42, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 1, day: 15))!,   vaerdi: 45, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 2))!,   vaerdi: 51, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 21))!,   vaerdi: 52, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 28))!,   vaerdi: 34, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 28))!,   vaerdi: 30, note: "")]),
    Tendens(
      2,
      "Vægt",
      "kg",
      false,
      [
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2019, month: 2, day: 22))!,   vaerdi: 83, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2019, month: 4, day: 24))!,   vaerdi: 77, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2019, month: 6, day: 2))!,   vaerdi: 73, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2020, month: 2, day: 22))!,   vaerdi: 83, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2020, month: 4, day: 24))!,   vaerdi: 77, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2020, month: 6, day: 2))!,   vaerdi: 73, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 2, day: 22))!,   vaerdi: 83, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 4, day: 24))!,   vaerdi: 77, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2021, month: 6, day: 2))!,   vaerdi: 73, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 22))!,   vaerdi: 83, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 24))!,   vaerdi: 77, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 2))!,   vaerdi: 73, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   vaerdi: 83, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   vaerdi: 77, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   vaerdi: 73, note: "")]),
    Tendens(
      5,
      "Mad",
      "kr",
      false,
      [
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   vaerdi: 83, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   vaerdi: 77, note: "Dette er en note.\nDen er på 2 linjer."),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   vaerdi: 73, note: "")]),
    Tendens(
      1,
      "Grøn cirkel",
      "kg",
      true,
      [
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22, hour: 13, minute: 20, second: 15))!,   vaerdi: 83, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24, hour: 12, minute: 20, second: 15))!,   vaerdi: 77, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2, hour: 11, minute: 20, second: 15))!,   vaerdi: 73, note: "")]),
    Tendens(
      3,
      "Cirkler lukket",
      "stk",
      false,
      [
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 7, hour: 13, minute: 20, second: 15))!,   vaerdi: 3, note: ""),
        Maaling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 9, hour: 13, minute: 20, second: 15))!,   vaerdi: 3, note: "")])]
