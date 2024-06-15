//
//  ContentView.swift
//  calculator
//
//  Created by Usuario on 15/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 0){
            
            HStack{
                Button("7"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("8"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("9"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("X"){
                }.padding()
                    .frame(maxWidth: .infinity).background(Color.orange)
                
            }.foregroundColor(Color.white)
            
            HStack{
                Button("4"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("5"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("6"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("-"){
                }.padding()
                    .frame(maxWidth: .infinity).background(Color.orange)
                
            }.foregroundColor(Color.white)
            
            HStack{
                Button("3"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("2"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("1"){
                }.padding()
                .frame(maxWidth: .infinity)
                
                Button("+"){
                }.padding()
                    .frame(maxWidth: .infinity).background(Color.orange)
                
            }.foregroundColor(Color.white)
            
        }.frame(maxWidth: .infinity)
            .background(Color.black)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
