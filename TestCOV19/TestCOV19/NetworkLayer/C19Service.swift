//
//  C19Service.swift
//  TestCOV19


import Foundation

class C19Service {
    enum Path: String {
        case province = "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-province.json"
        case andamentoNazione = "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale.json"
        case provinceLatest = "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-province-latest.json"
    }
    
    func getAndamentoNazionale(_ completion: @escaping (Result<CasiNazionali, Error>) -> Void) {
        let url = URL(string: Path.andamentoNazione.rawValue)!
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            let decoded = try! jsonDecoder.decode(CasiNazionali.self, from: data!)
            DispatchQueue.main.async {
                completion(.success(decoded))
            }
        }.resume()
    }
    
    func getAndamentoProvinciale(_ completion: @escaping (Result<CasiProvincialiLatest, Error>) -> Void) {
        let url = URL(string: Path.provinceLatest.rawValue)!
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            let decoded = try! jsonDecoder.decode(CasiProvincialiLatest.self, from: data!)
            DispatchQueue.main.async {
                completion(.success(decoded))
            }
        }.resume()
    }
    func getProvince(_ completion: @escaping (Result<Province, Error>) -> Void) {
        let url = URL(string: Path.province.rawValue)!
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            let decoded = try! jsonDecoder.decode(Province.self, from: data!)
            DispatchQueue.main.async {
                completion(.success(decoded))
            }
        }.resume()
    }
}
