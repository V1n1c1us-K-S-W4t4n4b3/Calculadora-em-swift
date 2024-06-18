//
//  ContentView.swift
//  calculator
//
//  Created by Usuario on 15/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var values = "0"
    @State var previus = 0.0
    @State var result = 0.0
    @State var decimal = 0.0
    @State var operation = 0
    @State var previusOperation = 0
    
    func removeZeroFromEnd(value: Double) -> String {
        let f = NumberFormatter()
        let number = NSNumber(value: value)
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 16
       return f.string(from: number) ?? ""
    }
    
    func process(digit: Int){
        if operation > 0 {
            result = 0
            previusOperation = operation
            operation = -1
        }
        
        if decimal > 0.0 {
            result = result + Double(truncating : NSNumber(value : (Double(digit) / decimal)))
            decimal = decimal * 10
            values  = "\(values)\(digit)"
        }else{
            result = (result * 10) + Double(digit)
            values = removeZeroFromEnd(value: result)
        }
    }
    
    func reset(){
        previus = 0
        result = 0
        operation = 0
        previusOperation = 0
        decimal = 0
        values = "0"
    }
    
    func calculate(){
        
        if previusOperation == 1 {
            result = previus + result
            previusOperation = 0
            
        }else if previusOperation == 2 {
            result = previus - result
            previusOperation = 0
            
        }else if previusOperation == 3 {
            result = previus * result
            previusOperation = 0
            
        }else if previusOperation == 4 {
            result = previus / result
            previusOperation = 0
            
        }
        decimal = 0.0
        previus = result
        values = removeZeroFromEnd(value: result)
    }
    
    var body: some View {
        //
        VStack(alignment: .trailing, spacing: 0) {
            Spacer()
            HStack {
                Text(values)
                    .padding()
                    .lineLimit(1)
                    .font(.system(size: CGFloat(80 / Int((Double(String(result).count + 10) / 8.0)))))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: true, vertical: false)
            }
        
            HStack(spacing: 0){
                Button("AC"){
                    reset()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("+/-"){
                    result = result * -1
                    calculate()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("%"){
                    result = result / 100
                    calculate()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("/"){
                    calculate()
                    operation = 4
                }
                .padding(.vertical,40)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            
            HStack(spacing: 0){
                Button("7"){
                    process (digit: 7)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("8"){
                    process (digit: 8)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("9"){
                    process (digit: 9)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("X"){
                    calculate()
                    operation = 3
                }
                .padding(.vertical,40)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            
            HStack(spacing: 0){
                Button("4"){
                    process (digit: 4)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("5"){
                    process (digit: 5)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("6"){
                    process (digit: 6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("-"){
                    calculate()
                    operation = 2
                }
                .padding(.vertical,40)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
           
            HStack(spacing: 0){
                Button("1"){
                    process (digit: 1)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("2"){
                    process (digit: 2)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("3"){
                    process (digit: 3)
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Button("+"){
                    calculate()
                    operation = 1
                }
                .padding(.vertical,40)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
            }.foregroundColor(Color.white)
            
            GeometryReader{geometry in
                HStack(spacing: 0){
                    Button("0"){
                        process (digit: 0)
                    }
                    .padding()
                    .frame(minWidth:geometry.size.width/2)
                    
                    Button("."){
                        if decimal == 0.0{
                            decimal = 10.0
                            values = values + "."
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    Button("="){
                        calculate()
                        previusOperation = 999
                        operation = 999
                    }
                    .padding(.vertical,40)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    
                }.foregroundColor(Color.white)
            }.frame(maxHeight: 92)
        }
         .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
