//
//  Province.swift
//  TestCOV19


import Foundation

struct Provincia: Decodable {
    var lat: Double?
    var long: Double?
    var denominazioneRegione: String
    var siglaProvincia: String?
    var denominazioneProvincia: String
    var data: String
    var codiceProvincia: Int
    var codiceRegione: Int
    var totaleCasi: Int
    var stato: String
}

typealias Province = [Provincia]
