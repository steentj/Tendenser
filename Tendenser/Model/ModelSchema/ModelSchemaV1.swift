//
//  ModelSchemaV1.swift
//  Tendenser
//
//  Created by Steen Thrane Jacobsen on 19/10/2023.
//

import SwiftUI
import SwiftData

enum ModelSchemaV1: VersionedSchema {
  static var versionIdentifier = Schema.Version(0, 1, 0)
  
  static var models: [any PersistentModel.Type] {
    [Tendens.self, Maaling.self]
  }
  
  @Model
  class Tendens {
    
    @Attribute(.unique) let id = UUID()
    var prioritet: Int
    @Attribute(.unique) var navn: String
    var maaleenhed: String
    var inkluderTidspunkt: Bool
    @Relationship(deleteRule: .cascade, inverse: \Maaling.tendens)
    var maalinger: [Maaling] = []
    
    init() {
      prioritet = 0
      navn = ""
      maaleenhed = ""
      maalinger = []
      inkluderTidspunkt = false
      return
    }
    
    init(_ prio: Int = 0, _ nytNavn: String = "", _ nyMaaleenhed: String = "", _ inkluderTid: Bool = false, _ nyeMaalinger: [Maaling] = []) {
      prioritet = prio
      navn = nytNavn
      maaleenhed = nyMaaleenhed
      maalinger = nyeMaalinger
      inkluderTidspunkt = inkluderTid
      return
    }
  }
  
  @Model
  class Maaling: Identifiable {
    @Attribute(.unique) let id = UUID()
    var tid: Date
    var vaerdi: Decimal?
    var note: String
    var tendens: Tendens?
    
    init(tid: Date = Date.now, vaerdi: Decimal? = nil, note: String = "") {
      print(vaerdi ?? -99)
      self.tid = tid
      self.vaerdi = vaerdi
      self.note = note
    }
  }
}
