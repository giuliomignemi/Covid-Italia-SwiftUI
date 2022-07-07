//
//  CallView.swift
//  TestCOV19
//

import SwiftUI

struct CallView: View {
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width-40, height: 250, alignment: .center)
                .padding(.top, 20)
                .foregroundColor(Color(hex: "#218c74"))
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 1, y: 0)
            HStack{
                VStack(alignment: .leading, spacing: 15){
                    Text("Vuoi maggiori informazioni?")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 25, leading: 15, bottom: 0, trailing: 5))
                    
                    Text("Il servizio di risposta ai cittadini è attivo 24 ore su 24, tutti i giorni. Rispondono operatori appositamente formati insieme a dirigenti sanitari e mediatori culturali.")
                        .fontWeight(.regular)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    
                    Button(action: {
                            let telephone = "tel://"
                           let formattedString = telephone + "1500"
                           guard let url = URL(string: formattedString) else { return }
                           UIApplication.shared.open(url)
                    }){
                        HStack{
                            Image("call")
                            .foregroundColor(Color(hex: "#218c74"))
                            .padding(.leading, 20)
                            Text("Chiama ora ")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                                .foregroundColor(Color(hex: "#218c74"))
                        }
                        .frame(width: 180, height: 60, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: Color.white.opacity(0.5), radius: 5, x: 1, y: 0)
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 20))
                    }
                }
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        }
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
            .previewLayout(.sizeThatFits)
    }
}
