//
//  ContentView.swift
//  data_structure
//
//  Created by jsw_cool on 2023/8/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(){
            let btree = BinaryTree(value: 10)
            btree.insert(value: 1)
            btree.insert(value: 12)
            btree.insert(value: 14)
            btree.insert(value: 9)
            btree.insert(value: 7)
            btree.insert(value: 2)
            btree.traverseInOrder{ value in
                print(value,separator: " ")
            }
        }
    }
}
