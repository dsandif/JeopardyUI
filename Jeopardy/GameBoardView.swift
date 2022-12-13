//
//  GameBoardView.swift
//  Jeopardy
//
//  Created by Darien Sandifer on 12/13/22.
//

import SwiftUI

struct ColorSquare: View {
    let color: Color
    let text: String
    let textColor: Color
    let textSize: CGFloat
  
    var body: some View {
      color
        .overlay(
          VStack{
            if(text.isEmpty == true ){Text(" ")}
            else{
              Text(text.uppercased())
              .multilineTextAlignment(.center)
              .shadow(color: .black, radius: 0, x: 4, y: 4)
            }
          }
          .padding(.horizontal, 20)
          .font(.custom("Impact", size: textSize))
          .foregroundColor(textColor)
        )
    }
}

struct GridDemo: View {
    let categories = ["national monuments","nba teams", "wearable tech","peak my interest", "famous freddies", "name games"]
    let values = [200,400,600,800,1000]
  
    var body: some View {
        Grid {
            GridRow {
              ForEach(categories, id: \.self) {
                ColorSquare(color: .royal, text: $0, textColor: .white, textSize: 30)
                }
            }
          
          ForEach(values, id: \.self) { item in
            GridRow {
              ForEach(0..<categories.count) { square in
                  ColorSquare(color: .royal, text: item.description, textColor: .lightGold, textSize: 65)
                }
            }
          }
            //without foreach you would need this format
//            GridRow {
//                ForEach(0..<COLS) { _ in
//                  ColorSquare(color: .royal, text: "400", textColor: .lightGold, textSize: 65)
//                }
//            }
//          GridRow {
//              ForEach(0..<COLS) { _ in
//                ColorSquare(color: .royal, text: "600", textColor: .lightGold, textSize: 65)
//              }
//          }
//
//          GridRow {
//              ForEach(0..<COLS) { _ in
//                ColorSquare(color: .royal, text: "800", textColor: .lightGold, textSize: 65)
//              }
//          }
//
//          GridRow {
//              ForEach(0..<COLS) { _ in
//                ColorSquare(color: .royal, text: "1000", textColor: .lightGold, textSize: 65)
//              }
//          }
        }
        .padding(.all, 5)
        .background(.black)
    }
}
extension Color {
    static let royal = Color(red: 0.0314, green: 0.0784, blue: 0.4627)
    static let lightGold = Color(red: 0.9843, green: 0.651, blue: 0.1098)
    static let darkGold = Color(red: 0.8588, green: 0.5373, blue: 0.0157)
}

struct GameBoardView: View {
    var body: some View {
        GridDemo()
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
