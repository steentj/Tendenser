//
//  Tendenser.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import Foundation

let tendensTestdata: [Tendens] = [
  Tendens(
    4,
    "Blodsukker",
    "mmol",
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 1, day: 15))!,   værdi: 42, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 15))!,   værdi: 45, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: "")]),
  Tendens(
    2,
    "Vægt",
    "kg",
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   værdi: 83, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   værdi: 77, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   værdi: 73, note: "")]),
  Tendens(
    5,
    "Mad",
    "kr",
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   værdi: 83, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   værdi: 77, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   værdi: 73, note: "")]),
  Tendens(
    1,
    "Grøn cirkel",
    "kg",
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   værdi: 83, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   værdi: 77, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   værdi: 73, note: "")]),
  Tendens(
    3,
    "Cirkler lukket",
    "stk",
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 7))!,   værdi: 3, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 8))!,   værdi: 2, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 9))!,   værdi: 3, note: "")])]
