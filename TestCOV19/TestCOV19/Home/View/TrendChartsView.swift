//
//  TrendChartsView.swift
//  TestCOV19
//

import SwiftUI

struct TrendChartsView: View {
    var newPosDataChart : [Double]
    var deathDataChart : [Double]
    var healedDataChart : [Double]
    var body: some View {
        VStack{
            HStack{
                Text("Statistiche")
                .fontWeight(.semibold)
                .font(.system(size: 20))
                Spacer()
            }.padding(.leading, 20)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    LineChartView(data: newPosDataChart,
                                  title: "Positivi",
                                  legend: "\(newPosDataChart.last ?? 0)",
                                  form: CGSize(width: UIScreen.main.bounds.width-150, height: 100),
                                  frame: CGSize(width: UIScreen.main.bounds.width-150, height: 100))
                        .padding(.leading, 20)
                    LineChartView(data: healedDataChart, title: "Guariti",
                                  legend: "\(healedDataChart.last ?? 0)",
                                  form: CGSize(width: UIScreen.main.bounds.width-150, height: 100),
                                  frame: CGSize(width: UIScreen.main.bounds.width-150, height: 100))
                        .padding(.leading, 20)
                    LineChartView(data: deathDataChart, title: "Deceduti", legend: "\(deathDataChart.last ?? 0)",
                                  form: CGSize(width: UIScreen.main.bounds.width-150, height: 100),
                                  frame: CGSize(width: UIScreen.main.bounds.width-150, height: 100))
                        .padding(.horizontal, 20)
                }
                .frame(height: 250, alignment: .leading)
            }
            
        }
    }
}

struct TrendChartsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendChartsView(newPosDataChart: [10.0,20.0,30.0,10.0,20.0,30.0],
                        deathDataChart: [10.0,20.0,30.0,10.0,20.0,20],
                        healedDataChart: [10.0,20.0,30.0,10.0,20.0,10])
            .previewLayout(.sizeThatFits)
    }
}
