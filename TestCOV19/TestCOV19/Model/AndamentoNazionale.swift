//
//  AndamentoNazionale.swift
//  TestCOV19


import Foundation

struct AndamentoNazionale: Decodable {
    var data: String
    var stato: String
    var ricoveratiConSintomi: Int
    var terapiaIntensiva: Int
    var totaleOspedalizzati: Int
    var isolamentoDomiciliare: Int
    var totalePositivi: Int
    var variazioneTotalePositivi: Int
    var nuoviPositivi: Int
    var dimessiGuariti: Int
    var deceduti: Int
    var totaleCasi: Int
    var tamponi: Int
}

typealias CasiNazionali = [AndamentoNazionale]
