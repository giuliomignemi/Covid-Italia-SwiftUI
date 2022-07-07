//
//  HelpUserView.swift
//  TestCOV19
//

import SwiftUI

struct HelpUserView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Principali Sintomi")
                    .fontWeight(.semibold)
                .font(.system(size: 20))
                Spacer()
            }
            GeometryReader{ geo in
                HStack{
                    HelpSingleCell(geo: geo, imageName: "3", text: "Febbre Alta")
                    HelpSingleCell(geo: geo, imageName: "2", text: "Tosse Secca")
                    HelpSingleCell(geo: geo, imageName: "1", text: "Respiro Corto")
                }
            }.frame(height: (UIScreen.main.bounds.width-40)/3)
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
}


struct HelpUserView_Previews: PreviewProvider {
    static var previews: some View {
        HelpUserView()
            .previewLayout(.sizeThatFits)
    }
}

struct HelpSingleCell : View{
    var geo : GeometryProxy
    var imageName : String
    var text : String
    var body: some View{
        VStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: (geo.size.width/3)-20, height: (geo.size.width/3)-20, alignment: .center)
                .background(Color.red)
                .cornerRadius(geo.size.width/2)
                .shadow(color: Color.gray.opacity(0.5), radius: 4, x: 1, y: 0)
            Text(text)
            .fontWeight(.semibold)
            .font(.system(size: 15))
            .fixedSize(horizontal: true, vertical: false)
            .padding(.top, 10)
        }.padding(.trailing, 20)
    }
}
