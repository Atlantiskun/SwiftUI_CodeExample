//
//  ContentView.swift
//  SwiftUI_Examples
//
//  Created by Дмитрий Болучевских on 25.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//@State var show = false

//Button {
//    withAnimation {
//        self.show.toggle()
//    }
//} label: {
//    VStack {
//        Text("Learn SwiftUI")
//            .foregroundColor(.white)
//            .fontWeight(.bold)
//            .font(.largeTitle)
//            .padding(.top, show ? 100 : 20)
//
//        Text("A course on UI and animations")
//            .foregroundColor(Color(hue: 0.567, saturation: 0.158, brightness: 0.943))
//            .lineLimit(-1)
//
//        Spacer()
//
//        Text("Card Animation")
//            .foregroundColor(Color(hue: 0.498, saturation: 0.609, brightness: 1))
//            .fontWeight(.bold)
//            .font(.title)
//            .padding(.bottom, show ? 100 : 20)
//    }
//    .padding()
//    .frame(width: show ? 350 : 300, height: show ? 600 : 300)
//    .background(Color.blue)
//}
//.cornerRadius(30)
//.animation(.spring())
//.shadow(radius: 30)
