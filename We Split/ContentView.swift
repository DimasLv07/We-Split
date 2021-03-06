//
//  ContentView.swift
//  We Split
//
//  Created by dimas pendriansyah on 05/04/21.
//

import SwiftUI



struct ContentView: View {
   
  
  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
    
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalPerPerson:Double{
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    
    let tipValue = orderAmount / 100 * tipSelection
    let grandTotal = orderAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    
    return amountPerPerson
  }
  
  var body: some View {
    NavigationView{
      Form{
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          
          Picker("Number of people", selection: $numberOfPeople){
            ForEach(2..<100){
              Text("\($0) people")
            }
          }
        }
        
        Section(header: Text("How Much tip o you want to leave")){
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach(0..<tipPercentages.count){
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
      }
      navigationTitle("WeSplit")
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
