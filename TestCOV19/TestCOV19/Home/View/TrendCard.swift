//
//  TrendCard.swift
//  TestCOV19
//

import SwiftUI

struct TrendCard: View {
    let title : String
    let value : String
    let color : Color
    var body: some View{
        ZStack(alignment: .top){
            VStack(alignment: .center, spacing: 15){
                Text(title)
                    .fontWeight(.medium)
                    .padding(.top, 12)
                Text(value)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(color)
                    .padding(.horizontal, 8)
            }
            .frame(width: 120, height: 90, alignment: .top)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 1, y: 0)
        }.padding(.leading, 20)
    }
}

struct TrendCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendCard(title: "prova", value: "prova", color: Color.blue)
            .previewLayout(.sizeThatFits)
    }
}
