import UIKit
import Foundation

struct Måling: Identifiable {
  let id = UUID()
  let tid: Date
  let værdi: Double
  let note: String
}

struct Tendens: Identifiable {
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

struct Tendenser {
  var sidstOpdateret: Date
  var TendensListe: [Tendens]
}

var tendenser = Tendenser(sidstOpdateret: Date.now,
                          TendensListe: [
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
      Måling(tid: Calendar.current.date(from: DateComponents(year: 2023, month: 7, day: 9))!,   værdi: 3, note: "")])])

let maxPrio = ((tendenser.TendensListe.max(by: { $0.prioritet < $1.prioritet})?.prioritet) ?? 0) + 1

var indices = IndexSet()
indices.insert(3)
var newOffset = 1
let målingIndices = tendenser.TendensListe.indices
let målinger = tendenser.TendensListe
let målingIndexPairs = Array(zip(målinger, målingIndices)).sorted(by:  {$0.self.0.prioritet < $1.self.0.prioritet})

if indices.count > 0 {
  var offset = newOffset
  if (newOffset > indices.first!) {
    offset -= 1
  }
//  indices.forEach{
//    i in print("Index: \(i)")
//  }
//  print("NewOffset: \(offset)")
//  print("--Før--")
//  tendenser.TendensListe.forEach {
//    i in print("\(i.navn): \(i.prioritet)")
//  }
  let prioStart = målingIndexPairs[offset].0.prioritet
  let prioSlut = målingIndexPairs[indices.first!].0.prioritet
  for tp in 0..<tendenser.TendensListe.count {
    print("\(tendenser.TendensListe[tp].navn): \(tendenser.TendensListe[tp].prioritet)")
    if tendenser.TendensListe[tp].prioritet >= prioStart &&
      tendenser.TendensListe[tp].prioritet <= prioSlut {
      tendenser.TendensListe[tp].prioritet += 1
      print("--> \(tendenser.TendensListe[tp].navn): \(tendenser.TendensListe[tp].prioritet)")
    }
  }
  let ligefter = tendenser.TendensListe
  print("First index \(målingIndexPairs[indices.first!].1)")
  tendenser.TendensListe[målingIndexPairs[indices.first!].1].prioritet = prioStart
  
  let efter = tendenser.TendensListe
//  print("--Efter--")
//  tendenser.TendensListe.forEach {
//    i in print("\(i.navn): \(i.prioritet)")
//  }
}

//var ts1 = ""
////tendenser.sort()
//
//for x in tendenser {
//  ts1 += "\(x.navn): \(x.målinger.count)\n"
//}
//
//print(ts1)

//let målingIndices = tendenser.indices
//let målinger = tendenser
//let målingIndexPairs = Array(zip(tendenser, målingIndices))
//
//for (måling, målingIndex) in målingIndexPairs.sorted(by: {$0.self.0.navn < $1.self.0.navn}) {
//  print("\(målingIndex): \(måling.navn)")
//}

//var ixs = IndexSet()
//
//ixs.insert(1)
//ixs.insert(2)
//ixs.insert(3)
//ixs.insert(5)
//ixs.insert(7)
//ixs.insert(11)
//
//ixs.forEach{
//  i in print(i)
//}
//print(ixs)
