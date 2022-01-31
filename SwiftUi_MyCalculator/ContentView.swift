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
                Text(buttonName).font(.largeTitle))
    }
}

struct ContentView: View {
    let data = [ //이중 포문으로 가져오기 위해
    ["AC","+-","%","%"],
    ["7","8","9","x"],
    ["4","5","6","-"],
    ["1","2","3","+"],
    ["0",".","="]
    ]
    var body: some View {
        VStack(spacing:0) {
            Spacer(minLength: 50)//위에 50만큼은 확보하기 위해
            Text("결과값")
                .font(.largeTitle)
                .padding(.trailing, 10)
                .frame(width:UIScreen.main.bounds.size.width, alignment:.trailing)
                
            
            //화면을 기준으로 가장 오른쪽으로 이동
            
            ForEach(0..<4) {indexi in
                HStack(spacing : 0) {
                    ForEach(0..<4)  {indexj in
                        CalButton(buttonName: data[indexi][indexj])
                            .aspectRatio(1, contentMode: .fit)//넘어가지 않게
                        //aspect 사용시 cottentmode만도 사용가능해
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
                CalButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                CalButton(buttonName: data[4][2])
                    .aspectRatio(1, contentMode: .fit)
            }
            .aspectRatio(4, contentMode: .fit) //마지막 줄 표현하기위해 이렇게 한다
            .padding(.horizontal, 10)
            
        }
        .padding(.bottom, 10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
