//
//  ContentView.swift
//  SwiftUi_MyCalculator
//
//  Created by Chuljin Hwang on 2022/01/31.
//

import SwiftUI
struct CalButton: View{
    var buttonName = ""
    var body: some View {
        Circle()
            .foregroundColor(.orange)
            .overlay(
                Text(buttonName).font(.largeTitle)).foregroundColor(.black)
    }
}

struct ContentView: View {
    @State private var display : String = "0"
    @State private var isInthetype : Bool = false
    var core = Callogic()
    let data = [ //이중 포문으로 가져오기 위해
    ["AC","+-","%","⌘"],
    ["7","8","9","x"],
    ["4","5","6","-"],
    ["1","2","3","+"],
    ["0",".","="]
    ]
    var body: some View {
        VStack(spacing:0) {
            Spacer(minLength: 50)//위에 50만큼은 확보하기 위해
            Text(display)
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width:UIScreen.main.bounds.size.width, alignment:.trailing)
                
            
            //화면을 기준으로 가장 오른쪽으로 이동
            
            ForEach(0..<4) {indexi in
                HStack(spacing : 0) {
                    ForEach(0..<4)  {indexj in
                        Button(action: {
                            calAction(symbol: data[indexi][indexj])// data는 지금 strinf
                        }, label: {
                            CalButton(buttonName: data[indexi][indexj])
                                .aspectRatio(1, contentMode: .fit)//넘어가지 않게
                            //aspect 사용시 cottentmode만도 사용가능해
                                
                        })
                    
                    }
                }
                .padding(.horizontal, 10)
            }
            HStack(spacing:0) {
                Capsule()
                    .foregroundColor(.orange)
                    .aspectRatio(2, contentMode: .fit)
                    .overlay(
                        Text(data[4][0]).font(.largeTitle))
                    .onTapGesture(count:1, perform: {
                        calAction(symbol: data[4][0])
                    })
                CalButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture(count:1, perform: {
                        calAction(symbol: data[4][1])
                    })
                CalButton(buttonName: data[4][2])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture(count:1, perform: {
                        calAction(symbol: data[4][2])
                    })
            }
            .aspectRatio(4, contentMode: .fit) //마지막 줄 표현하기위해 이렇게 한다
            .padding(.horizontal, 10)
            
        }
        .padding(.bottom, 10)
        
    }
    func calAction(symbol: String){
        print(symbol)
        if Int(symbol) != nil { //숫자인 경우만 Int로 변경된다
            if isInthetype{ // isInthetype가 트루면 실행
                display = display + symbol
            }else{
                isInthetype = true
                display = symbol
            }
            if core.rememberSymbol == nil {
                core.digit1 = Double(display)
            }else{
                core.digit2 = Double(display)
            }
           
          
            
            }else{//심볼을 입력하게 되는경우
                if symbol != "="{
                    core.rememberSymbol = symbol
                }
                if symbol == "AC"{
                    core.digit1 = nil
                    core.digit2 = nil
                    core.rememberSymbol = nil
                    core.calResult = nil
                    display = "0"
                }
//                if symbol == "%"{
//                 //   display = "\(String(describing : core.logic()!))"
//                    core.digit1 = Double(display)
//                }
                isInthetype = false
                if symbol == "="{
                    display = "\(String(describing : core.logic()!))"  // 코어는 더불이니까 이걸 스트링으로 하려면
                }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
