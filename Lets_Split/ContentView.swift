//
//  ContentView.swift
//  Lets_Split
//
//  Created by Dev Patel on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Amount = 0.0
    @State private var numberofpeople = 2
    @State private var tippercent = 10
    
    let tippercentages = [0,5,10,15,20]
    
    func totalperperson() -> Double{
        let peopleCount = Double(numberofpeople + 2)
        let tipselection = Double(tippercent)
        
        let tipvalue = Amount/100 * tipselection
        let grandtotal = Amount + tipvalue
        let amountperperson = grandtotal / peopleCount
        
        return amountperperson
    }
    var body: some View {
        ZStack {
            NavigationView{
                Form{
                    Section{
                        TextField("Amount",value: $Amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                        Picker("Number of People",selection: $numberofpeople){
                            ForEach(2 ..< 100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section{
                        Picker("Tip percent",selection: $tippercent){
                            ForEach(tippercentages , id: \.self){
                                Text($0,format: .percent)
                            }
                        }.pickerStyle(.segmented)
                    }
                    Section(header:Text("Total per person")){
                    Text(totalperperson(), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .navigationTitle("Let's Split")
                .navigationBarTitleDisplayMode(.inline)
                .navigationViewStyle(.stack)
            }
            
        }
    }
}

    


#Preview {
    ContentView()
}
