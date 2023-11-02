//
//  HomeView.swift
//  TicTacTeco
//
//  Created by Felipe Campelo on 02/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            PlayerAISegmentedPicker()
            GridStepper()
            // TODO button("Play Game")
            // TODO button("Previous Games")
        }
    }
}

struct PlayerAISegmentedPicker: View {
    @State private var selectedOption = 0
    @State private var player1Name = ""
    @State private var player2Name = ""
    
    var body: some View {
        VStack {
            Picker(selection: $selectedOption, label: Text("Select Option")) {
                Text("Player").tag(0)
                Text("AI").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TextField("Enter Player 1 Name", text: $player1Name)
                .padding()
                .foregroundColor(.blue)

            TextField("Enter Player 2 Name", text: selectedOption == 0 ? $player2Name : .constant("AI Challenger Master"))
                .foregroundColor(.red)

                .disabled(selectedOption == 1)
                .padding()
        }
        .padding(.vertical)
    }
}

struct GridStepper: View {
    @State private var stepperValue: Int = 3
    let minGridSize: Int = 3
    let maxGridSize: Int = 10
    
    var body: some View {
        VStack {
            Text("VS")
                .font(.title2)
            Text("\(stepperValue)x\(stepperValue)")
                .padding(10)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)

            Stepper("",
                    value: $stepperValue,
                    in: minGridSize...maxGridSize
            )
            .frame(width: 0)
        }
        .padding(.vertical)
    }
}


#Preview {
    HomeView()
}
