//
//  SwiftUIView.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Mayara Mendonça de Souza on 02/06/21.
//

import SwiftUI

struct SpinningAnimation: View {
    
    @State var isAnimated: Bool = false
    
    let lightGreen = #colorLiteral(red: 0.03137254902, green: 0.5921568627, blue: 0.6156862745, alpha: 1)
    let darkGreen = #colorLiteral(red: 0.01960784314, green: 0.3568627451, blue: 0.3607843137, alpha: 1)
    
    var body: some View {
        VStack {
            Button("") {
                withAnimation(.default){
                    isAnimated.toggle()
                }
            }
            //Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 25 : 12.5)
                .fill(isAnimated ? Color(lightGreen) : Color(darkGreen))
                .frame(width: 75, height: 7)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                //.frame(width: isAnimated ? CGFloat(75) : CGFloat (75), height: isAnimated ? CGFloat(7) : CGFloat (14))
                .offset(y: isAnimated ? 0 : 50)
                .animation(Animation
                            .default
                            .repeatForever(autoreverses: false))
            
        }
    }
}

struct SpinningAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SpinningAnimation()
    }
}
