//
//  PageControl.swift
//  Pipipipopopo WatchKit Extension
//
//  Created by Palloma Ramos on 01/06/21.
//

import SwiftUI
import WatchKit


struct PagerManager<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    //Set the initial values for the variables
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }

    @GestureState private var translation: CGFloat = 0

    //Set the animation
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.linear)
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
    }
}

struct PageControlView: View {
        @State private var currentPage = 0
    
        var body: some View {
    
            //Pager Manager
            VStack{
                PagerManager(pageCount: 2, currentIndex: $currentPage) {
                    WorkoutView(exerciseName: "Polichinelo", ExerciseSeconds : 10 , ExerciseMinutes: 0)
                    PauseView()
//                    Text("dois")
                }
    
                Spacer()
    
                //Page Control
                HStack{
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(currentPage==1 ? Color.gray:Color.white)
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(currentPage==1 ? Color.white:Color.gray)
                } .padding(.top, 180)
            }
        }
    }

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView()
    }
}
