//
//  ContentView.swift
//  PickerTest1
//
//  Created by 森田晋 on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    let fruits = ["みかん","りんご","かき","バナナ","キウイ"]
    //    配列にすることによって、数字でなくて内容を表示できるようになる
    @State private var selection = 3
    var body: some View {
        VStack {
            Picker(selection: $selection, label: Text("フルーツを選択")) {
                //            一つ一つ指定した方法
                //                Text("みかん").tag(1)//tagで指定した値がselectionに入る
                //                Text("りんご").tag(2)
                //                Text("バナナ").tag(3)
                //                Text("かき").tag(4)
                //                Text("キウイ").tag(5)
                //                ForEach(0..<fruits.count, id: \.self) { num in
                ForEach(fruits.indices, id: \.self) { num in
                    Text(fruits[num])
                    //Non-constant range: argument must be an integer literal
                    //という warning が表示されるため、ForEachにid: \.selfを入れた。
                    //fruits.indices は 0..<fruits.count と同じ
                }
            }
            .pickerStyle(.segmented)//これでPickerのスタイルを変更できる。
            .frame(width: 300)
            Text("選択肢：\(fruits[selection])")
            //            selectionには配列の０からの番号が入っている。
                .foregroundColor(.green)
                .font(.title2)
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
