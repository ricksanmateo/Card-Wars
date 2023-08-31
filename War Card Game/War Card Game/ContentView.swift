//
//  ContentView.swift
//  War Card Game
//
//  Created by sm on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card3"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            Image("background-cloth")
            VStack(alignment: .center, spacing: 15.0) {
                Image("logo")
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
               
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 5)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 5)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
            }
        }
    }
    
    func deal() {
        // Randomize the players card
        var playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        // Randomize the cpu card
        var cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // Update the score
        if playerCard > cpuCard {
            playerScore += 1
        } else if cpuCard > playerCard {
            cpuScore += 1
        }
        // print the player if wins score to 14
        if playerScore == 14 {
            print("Player wins")
            playerScore = 0
            cpuScore = 0
        } else if cpuScore == 14 {
            print("cpu wins")
            playerScore = 0
            cpuScore = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
