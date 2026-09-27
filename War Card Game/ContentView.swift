//
//  ContentView.swift
//  War Card Game
//
//  Created by Harikrishnan V B on 27/09/26.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard: String = "card11"
    @State var cpuCard: String = "card3"
    @State var playerScore: Int = 0
    @State var cpuScore: Int = 0
    
    func dealCards() {
        // Randomize card values
        var playerValue = Int.random(in: 2...14)
        var cpuValue = Int.random(in: 2...14)
        
        // Update the card image
        playerCard = "card" + String(playerValue)
        cpuCard = "card" + String(cpuValue)
        
        // Calculate and update the score
        if playerValue > cpuValue {
            playerScore += 1
        } else if cpuValue > playerValue {
            cpuScore += 1
        } else {
            playerScore += 1
            cpuScore += 1
        }
    }
    
    var body: some View {
        ZStack {
            Image("background-cloth")
            
            VStack {
                Spacer()
                
                // Logo
                Image("logo")
                Spacer()
                
                // Cards
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                // Button
                Button {
                    dealCards()
                } label: {
                    Image("button")
                }
                Spacer()
                
                // Score
                HStack() {
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
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
