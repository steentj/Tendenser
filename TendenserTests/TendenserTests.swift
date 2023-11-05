//
//  TendenserTests.swift
//  TendenserTests
//
//  Created by Steen Thrane Jacobsen on 24/07/2023.
//

import XCTest
@testable import Tendenser

final class TendenserTests: XCTestCase {
//  var tendenser: Tendenser!
  var målingIndices: Range<Int>!
  var maalinger: [Tendens]!
  var målingIndexPairs: [(Tendens, Int)]!
  var sut: ContentView!

//  override func setUpWithError() throws {
//    tendenser = Tendenser(TendensListe: tendensTestdata)
//    målingIndices = tendenser.TendensListe.indices
//    maalinger = tendenser.TendensListe
//    målingIndexPairs = Array(zip(maalinger, målingIndices)).sorted(by: {$0.self.0.prioritet < $1.self.0.prioritet})
//    sut = ContentView()
//  }
//
//  override func tearDownWithError() throws {
//    tendenser = nil
//    maalinger = nil
//    målingIndices = nil
//    målingIndexPairs = nil
//    sut = nil
//  }
//
//  func testListeSorteretKorrekt() throws {
//    var i = 1
//    for mip in målingIndexPairs {
//      XCTAssertEqual(mip.0.prioritet, i)
//      i += 1
//    }
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.prioritet == 1})?.navn,
//                   målingIndexPairs[0].0.navn)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.prioritet == 2})?.navn,
//                   målingIndexPairs[1].0.navn)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.prioritet == 3})?.navn,
//                   målingIndexPairs[2].0.navn)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.prioritet == 4})?.navn,
//                   målingIndexPairs[3].0.navn)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.prioritet == 5})?.navn,
//                   målingIndexPairs[4].0.navn)
//  }
//
//  func testTendenserPrePrio() throws {
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Grøn cirkel"})?.prioritet, 1)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Vægt"})?.prioritet, 2)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Cirkler lukket"})?.prioritet, 3)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Blodsukker"})?.prioritet, 4)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Mad"})?.prioritet, 5)
//  }
//
//  func testFlytOp4_0() throws {
//    var indices = IndexSet()
//    indices.insert(4)
//    let newOffset = 0
//    sut.opdaterProriteter(tendenser: tendenser, indices: indices, newOffset: newOffset, målingIndexPairs:  målingIndexPairs)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Mad"})?.prioritet, 1)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Grøn cirkel"})?.prioritet, 2)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Vægt"})?.prioritet, 3)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Cirkler lukket"})?.prioritet, 4)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Blodsukker"})?.prioritet, 5)
//  }
//
//  func testFlytOp3_0() throws {
//    var indices = IndexSet()
//    indices.insert(3)
//    let newOffset = 0
//    sut.opdaterProriteter(tendenser: tendenser, indices: indices, newOffset: newOffset, målingIndexPairs:  målingIndexPairs)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Blodsukker"})?.prioritet, 1)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Grøn cirkel"})?.prioritet, 2)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Vægt"})?.prioritet, 3)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Cirkler lukket"})?.prioritet, 4)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Mad"})?.prioritet, 5)
//  }
//
//  func testFlytOp2_1() throws {
//    var indices = IndexSet()
//    indices.insert(2)
//    let newOffset = 1
//    sut.opdaterProriteter(tendenser: tendenser, indices: indices, newOffset: newOffset, målingIndexPairs:  målingIndexPairs)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Grøn cirkel"})?.prioritet, 1)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Cirkler lukket"})?.prioritet, 2)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Vægt"})?.prioritet, 3)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Blodsukker"})?.prioritet, 4)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Mad"})?.prioritet, 5)
//  }
//
//  func testFlytNet() throws {
//    var indices = IndexSet()
//    indices.insert(0)
//    let newOffset = 5
//    sut.opdaterProriteter(tendenser: tendenser, indices: indices, newOffset: newOffset, målingIndexPairs:  målingIndexPairs)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Vægt"})?.prioritet, 1)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Cirkler lukket"})?.prioritet, 2)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Blodsukker"})?.prioritet, 3)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Mad"})?.prioritet, 4)
//    XCTAssertEqual(tendenser.TendensListe.first(where: { $0.navn == "Grøn cirkel"})?.prioritet, 5)
//  }
}
