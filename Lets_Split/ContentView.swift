//
//  ContentView.swift
//  Lets_Split
//
//  Created by Dev Patel on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalCost = ""
    @State private var people :Int = 2
    @State private var tipIdex :Int = 4
    let tippercentages = [5,10,15,20]
    
    func calculateTotal() -> Double {
        let tip = Double(tippercentages[tipIdex])
        let ordertotal = Double(totalCost) ?? 0
        let finalamount = ((ordertotal/100 * tip)+ordertotal)
        
        return finalamount/Double(people)
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header:Text("Please enter the amount")){
                    TextField("Amount",text: $totalCost).keyboardType(.decimalPad)
                }
                Section(header:Text("Please select a tip amount")){
                    Picker("Tip percent",selection: $tipIdex){
                        ForEach(0..<tippercentages.count){
                            Text("\(tippercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("How many Peopple?")){
                    Picker("How many People",selection: $people){
                        ForEach(0 ..< 25){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header:Text("Total per person")){
                    Text("RS\(calculateTotal(),specifier: "$2f")")
                }
            }.navigationTitle("Let's Split It Up")
        }

    }
}

#Preview {
    ContentView()
}
