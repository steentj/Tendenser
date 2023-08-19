//
//  Tendenser.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 10/07/2023.
//

import Foundation

var tendensTestdata: [Tendens] = [
  Tendens(
    4,
    "Blodsukker",
    "mmol",
    false,
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2018, month: 1, day: 15))!,   værdi: 42, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2022, month: 6, day: 15))!,   værdi: 45, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 2))!,   værdi: 51, note: "")]),
  Tendens(
    2,
    "Vægt",
    "kg",
    false,
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   værdi: 83, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   værdi: 77, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   værdi: 73, note: "")]),
  Tendens(
    5,
    "Mad",
    "kr",
    false,
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   værdi: 83, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   værdi: 77, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   værdi: 73, note: "")]),
  Tendens(
    1,
    "Grøn cirkel",
    "kg",
    true,
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22, hour: 13, minute: 20, second: 15))!,   værdi: 83, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24, hour: 12, minute: 20, second: 15))!,   værdi: 77, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2, hour: 11, minute: 20, second: 15))!,   værdi: 73, note: "")]),
  Tendens(
    3,
    "Cirkler lukket",
    "stk",
    false,
    [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 7, hour: 13, minute: 20, second: 15))!,   værdi: 3, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 8, hour: 13, minute: 20, second: 15))!,   værdi: 2, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 9, hour: 13, minute: 20, second: 15))!,   værdi: 3, note: "")])]
