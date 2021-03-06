//
//  LineCard.swift
//  LineChart
//
//  Created by András Samu on 2019. 08. 31..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct LineChartView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var data:ChartData
    public var title: String
    public var legend: String?
    public var style: ChartStyle
    public var darkModeStyle: ChartStyle
    
    public var formSize:CGSize
    public var frame:CGSize
    public var dropShadow: Bool
    public var valueSpecifier:String
    
    
    @State private var touchLocation:CGPoint = .zero
    @State private var showIndicatorDot: Bool = false
    @State private var currentValue: Double = 2 {
        didSet{
            if (oldValue != self.currentValue && showIndicatorDot) {
                HapticFeedback.playSelection()
            }
            
        }
    }
    
    private var rateValue: Int
    
    public init(data: [Double],
                title: String,
                legend: String? = nil,
                style: ChartStyle = Styles.lineChartStyleOne,
                form: CGSize,
                rateValue: Int? = 14,
                dropShadow: Bool? = true,
                valueSpecifier: String? = "%.0f",
                frame : CGSize) {
        
        self.data = ChartData(points: data)
        self.title = title
        self.legend = legend
        self.style = style
        self.darkModeStyle = style.darkModeStyle != nil ? style.darkModeStyle! : Styles.lineViewDarkMode
        self.formSize = form
        self.rateValue = rateValue!
        self.dropShadow = dropShadow!
        self.valueSpecifier = valueSpecifier!
        self.frame = frame
        
    }
    
    public var body: some View {
        
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 20)
                .fill(self.colorScheme == .dark ? self.darkModeStyle.backgroundColor : self.style.backgroundColor)
                .frame(width: frame.width, height: 240, alignment: .center)
                .shadow(color: self.style.dropShadowColor.opacity(0.7), radius: self.dropShadow ? 4 : 0)
            VStack(alignment: .leading){
                if(!self.showIndicatorDot){
                    VStack(alignment: .leading, spacing: 0){
                        Text(self.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.textColor : self.style.textColor)
                        if (self.legend != nil){
                            Text(self.legend!)
                                .font(.callout)
                                .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.legendTextColor :self.style.legendTextColor)
                        }
                        HStack {
//                            if (self.rateValue >= 0){
//                                Image(systemName: "arrow.up")
//                            }else{
//                                Image(systemName: "arrow.down")
//                            }
                            Text("")
                        }
                        
                    }
                    .transition(.opacity)
                    .animation(.easeIn(duration: 0.1))
                    .padding([.leading, .top])
                }else{
                    HStack{
                        Spacer()
                        Text("\(self.currentValue, specifier: self.valueSpecifier)")
                            .font(.system(size: 41, weight: .bold, design: .default))
                            .offset(x: 0, y: 30)
                        Spacer()
                    }
                    .transition(.scale)
                }
                Spacer()
                GeometryReader{ geometry in
                    Line(data: self.data,
                        frame: .constant(geometry.frame(in: .local)),
                        touchLocation: self.$touchLocation,
                        showIndicator: self.$showIndicatorDot,
                        minDataValue: .constant(nil),
                        maxDataValue: .constant(nil)
                    )
                }
                    .gesture(DragGesture()
                    .onChanged({ value in
                        self.touchLocation = value.location
                        self.showIndicatorDot = true
                        self.getClosestDataPoint(toPoint: value.location, width:self.frame.width, height: self.frame.height)
                    })
                        .onEnded({ value in
                            self.showIndicatorDot = false
                        })
                    )
                .frame(width: frame.width, height: frame.height + 30)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(x: 0, y: 0)
            }.frame(width: self.formSize.width, height: self.formSize.height)
        }
//        .gesture(DragGesture()
//        .onChanged({ value in
//            self.touchLocation = value.location
//            self.showIndicatorDot = true
//            self.getClosestDataPoint(toPoint: value.location, width:self.frame.width, height: self.frame.height)
//        })
//            .onEnded({ value in
//                self.showIndicatorDot = false
//            })
//        )
    }
    
    @discardableResult func getClosestDataPoint(toPoint: CGPoint, width:CGFloat, height: CGFloat) -> CGPoint {
        let points = self.data.onlyPoints()
        let stepWidth: CGFloat = width / CGFloat(points.count-1)
        let stepHeight: CGFloat = height / CGFloat(points.max()! + points.min()!)
        
        let index:Int = Int(round((toPoint.x)/stepWidth))
        if (index >= 0 && index < points.count){
            self.currentValue = points[index]
            return CGPoint(x: CGFloat(index)*stepWidth, y: CGFloat(points[index])*stepHeight)
        }
        return .zero
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Basic", form: CGSize(width: 300, height: 200), frame: CGSize(width: 350, height: 100))
                .environment(\.colorScheme, .light)
        }
    }
}
