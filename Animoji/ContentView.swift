//
//  ContentView.swift
//  Animoji
//
//  Created by Syed Mansoor on 28/09/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            FoxViewCard(isAngryFox: false)
            .background(.black)
        }
    }
}

struct FoxViewCard : View {
    @State private var degree = 0.0
    @State var isAngryFox: Bool = false
    
    let aniMojis = ["🦊","🐼","🐨","🐵","🐶"]
    
    @State var baseIndex = 0
    
    var body : some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10)
            if !isAngryFox {
                base.foregroundColor(.blue)
            } else {
                base.fill(.red)
            }
            VStack {
                Text(aniMojis[baseIndex])
                    .font(.custom("AmericanTypewriter", fixedSize: 200))
                    .rotation3DEffect(
                        .degrees(degree), axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .foregroundColor(.red)
                
                Slider(value: $degree, in: 510...580)
                    .padding(20)
                
                HStack{
                    preButton
                    Spacer()
                    nxtButton
                }
                .padding(.top, 100)
                .padding(.leading, 40)
                .padding(.trailing, 40)
            }
        }
        .onTapGesture {
            isAngryFox.toggle()
        }
        .padding(10)
    }
    
    var nxtButton: some View {
        cardCountAdjuster(by: 1, imageName: "arrowshape.turn.up.forward.fill")
    }
    
    var preButton: some View {
        cardCountAdjuster(by: -1, imageName: "arrowshape.turn.up.backward.fill")
    }
    
    func cardCountAdjuster(by offset: Int, imageName name: String) -> some View {
        Button(action: {
            self.baseIndex += offset
            if baseIndex == -1 {
                baseIndex = aniMojis.count - 1
            }
            if baseIndex > aniMojis.count - 1 {
                baseIndex = 0
            }
        }, label: {
            Image(systemName: name)
        })
        .padding()
        .background(.cyan)
        .clipShape(Capsule())
        .foregroundColor(.white)
    }
}


#Preview {
    ContentView()
}
