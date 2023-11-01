import UIKit
import Foundation

struct Måling: Identifiable {
  let id = UUID()
  let tid: Date
  let værdi: Double
  let note: String
}

class Tendens: Identifiable {
  init(prioritet: Int, navn: String, måleenhed: String, målinger: [Måling]) {
    self.prioritet = prioritet
    self.navn = navn
    self.måleenhed = måleenhed
    self.målinger = målinger
  }
  
  let id = UUID()
  var prioritet: Int
  let navn: String
  let måleenhed: String
  var målinger: [Måling]
}
extension Tendens: Comparable {
  static func == (lhs: Tendens, rhs: Tendens) -> Bool {
    lhs.navn == rhs.navn
  }
  
  static func < (lhs: Tendens, rhs: Tendens) -> Bool {
    return lhs.navn < rhs.navn
  }
}


var tendenser = [
  Tendens(
    prioritet: 4,
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
    prioritet: 5,
    navn: "Mad",
    måleenhed: "kr",
    målinger: [
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 22))!,   værdi: 83, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 24))!,   værdi: 77, note: ""),
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 2))!,   værdi: 73, note: "")]),
  Tendens(
    prioritet: 1,
    navn: "Grøn cirkel",
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
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 9))!,   værdi: 3, note: "")])
]

let tendensIndices = tendenser.indices
let tendensListe = tendenser
let tendensIndexPar = Array(zip(tendensListe, tendensIndices))
.sorted(by: {$0.self.0.prioritet < $1.self.0.prioritet})

print(tendensIndices)

