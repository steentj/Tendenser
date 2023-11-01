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
    [Tendens.self, Måling.self]
  }
  
  @Model
  class Tendens {
    
    @Attribute(.unique) let id = UUID()
    var prioritet: Int
    @Attribute(.unique) var navn: String
    var måleenhed: String
    var inkluderTidspunkt: Bool
    @Relationship(deleteRule: .cascade) var målinger: [Måling]
    
    init() {
      prioritet = 0
      navn = ""
      måleenhed = ""
      målinger = []
      inkluderTidspunkt = false
      return
    }
    
    init(_ prio: Int = 0, _ nytNavn: String = "", _ nytMåleenhed: String = "", _ inkluderTid: Bool = false, _ nyeMålinger: [Måling] = []) {
      prioritet = prio
      navn = nytNavn
      måleenhed = nytMåleenhed
      målinger = nyeMålinger
      inkluderTidspunkt = inkluderTid
      return
    }
  }
  
  @Model
  class Måling: Identifiable {
    @Attribute(.unique) let id = UUID()
//    var tendens: Tendens
    var tid: Date
    var værdi: Double
    var note: String
    
    init(tid: Date = Date.now, værdi: Double = 0, note: String = "") {
      self.tid = tid
      self.værdi = værdi
      self.note = note
//      self.tendens = tendens
    }
  }
}
