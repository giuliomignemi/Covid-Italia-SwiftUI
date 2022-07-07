//
//  HomeSummaryInfo.swift
//  TestCOV19
//

import SwiftUI

struct HomeSummaryInfo: View {
    var lastAndNaz : AndamentoNazionale
    var body: some View {
            VStack{
                HStack{
                    Text("Riepilogo Dati")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                        
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        TrendCard(title: "Positivi",
                                  value: "\(lastAndNaz.totalePositivi)",
                            color: Color(hex: "#eb4d4b"))

                        TrendCard(title: "Nuovi Casi",
                                  value: "\(lastAndNaz.nuoviPositivi)",
                            color: Color(hex: "#22a6b3"))

                        TrendCard(title: "Deceduti",
                                  value: "\(lastAndNaz.deceduti)",
                            color: Color(hex: "#b71540"))

                        TrendCard(title: "Guariti",
                                  value: "\(lastAndNaz.dimessiGuariti)",
                            color: Color(hex: "#27ae60"))

                        TrendCard(title: "Intubati",
                                  value: "\(lastAndNaz.terapiaIntensiva)",
                            color: Color(hex: "#f6b93b"))

                        TrendCard(title: "A Casa",
                                  value: "\(lastAndNaz.isolamentoDomiciliare)",
                            color: Color(hex: "#3c40c6"))
                    }
                    .frame(height: 120, alignment: .leading)
                    .padding(.trailing, 20)
                }
            }
        }
    }
