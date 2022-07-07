//
//  SwiftUIView.swift
//  TestCOV19
//
//  Created by Giulio Mignemi on 19/04/2020.
//  Copyright © 2020 Giulio Mignemi. All rights reserved.
//

import SwiftUI

struct AndNaziModel : Identifiable{
    
    var id = UUID().uuidString
    var data : String
    var stato : String
    var ricoverati_con_sintomi : Int
    var terapia_intensiva : Int
    var totale_ospedalizzati : Int
    var isolamento_domiciliare : Int
    var totale_positivi : Int
    var variazione_totale_positivi : Int
    var nuovi_positivi : Int
    var dimessi_guariti : Int
    var deceduti : Int
    var totale_casi : Int
    var tamponi : Int
    var note_it : String
    var note_en : String
    
    
    static func getSingleMockData() -> AndNaziModel {
        return AndNaziModel(data: "data", stato: "stato", ricoverati_con_sintomi: 10, terapia_intensiva: 20, totale_ospedalizzati: 30, isolamento_domiciliare: 40, totale_positivi: 50, variazione_totale_positivi: 60, nuovi_positivi: 70, dimessi_guariti: 80, deceduti: 90, totale_casi: 100, tamponi: 120, note_it: "note", note_en: "note")
    }
}
