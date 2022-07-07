//
//  AndamentoProv.swift
//  TestCOV19

import Foundation

struct AndamentoProv: Decodable {
    let lat: Double?
    let long: Double?
    let denominazioneRegione: String
    let siglaProvincia: String
    let denominazioneProvincia: String
    let data: String
    let codiceProvincia: Int
    let codiceRegione: Int
    let totaleCasi: Int
    let stato: String
}

typealias CasiProvincialiLatest = [AndamentoProv]
