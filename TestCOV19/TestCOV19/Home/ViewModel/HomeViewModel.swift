//
//  HomeViewModel.swift
//  TestCOV19
//
import UIKit

class HomeViewModel: ObservableObject {
    @Published var actIndAnim = false
    
    @Published var andamentoNazionale = CasiNazionali()
    @Published var provinceData = CasiProvincialiLatest()
    @Published var allProvince = Province()
    @Published var allCitiesFinishRefresh = false
    @Published var yourCityData = [(String,Int)]()
    @Published var citiesName = [String]()
    @Published var posDataChart = [Double]()
    @Published var newPosDataChart = [Double]()
    @Published var deathDataChart = [Double]()
    @Published var healedDataChart = [Double]()
    @Published var selectedCity : (String,Int) = ("",-1)
    private var service = C19Service()
    func getData() {
        actIndAnim = true
        self.service.getAndamentoNazionale { result  in
            switch result {
            case .success(let casiNazionali):
                self.andamentoNazionale = casiNazionali
                self.andamentoNazionale.suffix(80).forEach { element in
                    self.posDataChart.append(Double(element.totalePositivi))
                    self.deathDataChart.append(Double(element.deceduti))
                    self.healedDataChart.append(Double(element.dimessiGuariti))
                    self.newPosDataChart.append(Double(element.nuoviPositivi))
                }
                var arrHeal = [Int]()
                var arrDeath = [Int]()
                var val = self.healedDataChart.count-1
                while val > 1 {
                    arrHeal.append(Int(self.healedDataChart[val] - self.healedDataChart[val-1]))
                    arrDeath.append(Int(self.deathDataChart[val] - self.deathDataChart[val-1]))
                    val = val - 1
                }
                self.deathDataChart.removeAll()
                self.healedDataChart.removeAll()
                self.healedDataChart = arrHeal.reversed().map({ Double($0)})
                self.deathDataChart = arrDeath.reversed().map({ Double($0)})
                self.getCitiesData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCitiesData() {
        self.service.getAndamentoProvinciale { result in
            switch result {
            case .success(let casiProvinciali):
                self.provinceData = casiProvinciali
                self.citiesName = self.provinceData.map({ $0.denominazioneProvincia })
                self.citiesName = self.citiesName.sorted{ $0.lowercased() < $1.lowercased() }
                self.getAllCitiesData()
                self.checkCityIsSel()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getAllCitiesData() {
        allCitiesFinishRefresh = false
        self.service.getProvince { result in
            switch result {
            case .success(let province):
                self.allProvince = province
                self.allCitiesFinishRefresh = true
                self.actIndAnim = false
                self.refreshChartCity()
            case .failure(let error):
                print(error)
            }
        }
    }
    func refreshChartCity() {
        if allCitiesFinishRefresh && selectedCity.0 != "" && selectedCity.1 != -1 {
            yourCityData.removeAll()
            var dateArr = [String]()
            var numbArr = [Int]()
            
            for ind in allProvince where ind.denominazioneProvincia == self.selectedCity.0 {
                let strData = getDateFromString(str: ind.data)
                dateArr.append(strData)
                numbArr.append(ind.totaleCasi)
            }
            var val = numbArr.count - 1
            var helpArr = [Int]()
            while val > 0 {
                helpArr.append(numbArr[val] - numbArr[val-1])
                val = val - 1
            }
            helpArr.append(0)
            numbArr.removeAll()
            
            for el in helpArr.reversed() {
                numbArr.append(el)
            }
            
            let max = numbArr.count
            var index = 0
            while index < max {
                self.yourCityData.append((dateArr[index], numbArr[index]))
                index = index + 1
            }
            yourCityData = yourCityData.suffix(15)
        }
    }
    
    
    func checkCityIsSel() {
        if (UserDefaults.standard.object(forKey: "SELECTEDCITY") != nil) {
            if let name = UserDefaults.standard.object(forKey: "SELECTEDCITY") as? String {
                for prov in provinceData where name == prov.denominazioneProvincia {
                    self.selectedCity = (name, prov.totaleCasi)
                }
            }
            self.refreshChartCity()
        }
    }
}
