//
//  HomePage.swift
//  TestCOV19
//
//  Created by Giulio Mignemi on 18/04/2020.
//  Copyright © 2020 Giulio Mignemi. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    @StateObject var vm = HomeViewModel()
    @State var showSelectedCity = false

    var body: some View {
        NavigationView{
            LoadingView(isShowing: $vm.actIndAnim){
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        if !self.vm.andamentoNazionale.isEmpty, let last = self.vm.andamentoNazionale.last {
                            HomeSummaryInfo(lastAndNaz: last)
                            TrendChartsView(newPosDataChart: vm.newPosDataChart,
                                            deathDataChart: vm.deathDataChart,
                                            healedDataChart: vm.healedDataChart)
                            YourCityView(showSelectCity: $showSelectedCity, vm: vm, citiesNames: vm.citiesName)
                            HelpUserView()
                            CallView()
                        }
                    }
                    .onAppear {
                        self.vm.getData()
                    }
                }.padding(.top, 120)
                    .background(Color(hex: "#f0f0f0"))
                    .edgesIgnoringSafeArea(.all)
            }
            .navigationBarTitle(Text("Covid-19 Italia"), displayMode: .inline)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}



