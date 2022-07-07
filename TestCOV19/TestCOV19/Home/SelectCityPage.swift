//
//  SelectCityPage.swift
//  TestCOV19
//
//  Created by Giulio Mignemi on 25/04/2020.
//  Copyright © 2020 Giulio Mignemi. All rights reserved.
//

import SwiftUI

struct SelectCityPage: View {
    var allCities: [String]
    @Binding var showSelCities : Bool
    var body: some View {
        NavigationView{
            List(allCities, id: \.hash, rowContent: { city in
                HStack{
                    Text(city)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                    Spacer()
                }
                .background(Color.white)
                .gesture(TapGesture()
                    .onEnded({ (end) in
                        print(city)
                        UserDefaults.standard.set(city, forKey: "SELECTEDCITY")
                        self.showSelCities.toggle()
                    }))
            })
            .navigationBarTitle("Seleziona la tua Città")
                .navigationBarItems(trailing: Button(action: {
                    self.showSelCities.toggle()
                }){
                    Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 30))
                    .frame(width: 30, height: 30)
                        .accentColor(.white)
                    .background(Color.clear)
                    .cornerRadius(25)
                })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SelectCityPage_Previews: PreviewProvider {
    static var previews: some View {
        SelectCityPage(allCities: ["Catania", "Torino"], showSelCities: .constant(true))
    }
}
