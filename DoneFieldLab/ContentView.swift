//
//  ContentView.swift
//  DoneFieldLab
//
//  Created by Danilo Campos on 4/24/20.
//  Copyright © 2020 Danilo Campos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var fieldText: String = "1337"
    
    var body: some View {
        VStack {
        Text("Input: \(fieldText)")
            .foregroundColor(.secondary)
            DoneButtonFieldView(text: $fieldText, keyboardType: .numberPad)
                .frame(height: 44.0)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
