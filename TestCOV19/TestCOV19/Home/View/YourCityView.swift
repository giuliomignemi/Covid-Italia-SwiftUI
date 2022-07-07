//
//  YourCityView.swift
//  TestCOV19
//

import SwiftUI

struct YourCityView: View {
    @Binding var showSelectCity : Bool
    @ObservedObject var vm: HomeViewModel
    private var heightCellSelCity : CGFloat {
        return vm.selectedCity.0 == "" ? 80 : 300
    }
    
    private var showChartSelCity : Bool{
        return vm.selectedCity.0 != ""
    }
    var citiesNames : [String]
    var body: some View{
        VStack{
            HStack{
                Text("Nella Tua Città")
                    .fontWeight(.semibold)
                .font(.system(size: 20))

                Spacer()

                Button(action: {
                    self.showSelectCity = true
                }){
                    Text("Cambia")
                        .fontWeight(.bold)
                }.sheet(isPresented: $showSelectCity, onDismiss: {
                    self.vm.checkCityIsSel()
                }){
                    if self.citiesNames.count > 0{
                        SelectCityPage(allCities: self.citiesNames, showSelCities: self.$showSelectCity)
                    }
                }
            }.padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, 10)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                    .frame(height: self.heightCellSelCity)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 1, y: 0)
                VStack{
                    HStack{
                        if vm.selectedCity.0 == "" && vm.selectedCity.1 == -1{
                            Button(action: {
                                self.showSelectCity = true
                            }){
                                Text("Seleziona la tua Città")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 25)
                                Image("tap")
                                .padding(.bottom, 25)
                            }.sheet(isPresented: $showSelectCity, onDismiss: {
                                self.vm.checkCityIsSel()
                            }){
                                if self.citiesNames.count > 0{
                                    SelectCityPage(allCities: self.citiesNames, showSelCities: self.$showSelectCity)
                                }
                            }
                        }
                        else{
                            Text(vm.selectedCity.0)
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()

                            Text("\(vm.selectedCity.1)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "#22a6b3"))
                        }

                    }.padding(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 40))
                    if self.showChartSelCity{
                        BarChartView(data: ChartData(values: vm.yourCityData), title: "", form: CGSize(width: UIScreen.main.bounds.width-80, height: 200))
                        Spacer()
                    }
                }
            }
        }
    }
}

struct YourCityView_Previews: PreviewProvider {
    static var previews: some View {
        YourCityView(showSelectCity: .constant(true), vm: .init(), citiesNames: ["Catania", "Torino"])
            .previewLayout(.sizeThatFits)
    }
}
