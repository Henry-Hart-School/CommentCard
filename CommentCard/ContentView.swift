//
//  ContentView.swift
//  CommentCard
//
//  Created by Hart, Henry (AGDF) on 07/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var state: SharedBindingDataCosIDontKnowHowElseToDoItInSwift
    
    @State private var no = false
    @State private var i_s = [
        0, 4,
        0, 4,
        4, 8
    ]
    @State private var headers = [
        "Are you doing well in lessons?",
        "Are you doing well in EWs?",
        "Do you like the subject?"
    ]
    @State private var choice = ["V. well", "well", "ok ish", "terrible", "V. much", "yes", "~", "no"]
    
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    TextField("<subject>", text: Binding<String> (
                        get: {
                            return state.subjBindingVal
                        },
                        set: {
                            v in state.subjBindingVal = v
                            state.checkGenComment()
                        }
                    ))
                }
                ForEach(0..<3) { i in
                    Section {
                        Text(headers[i])
                        ForEach(i_s[i*2]..<i_s[i*2+1]) { j in
                            Toggle(choice[j], isOn: [
                                state.optbndgs(0, 4, 0),
                                state.optbndgs(0, 4, 1),
                                state.optbndgs(0, 4, 2)
                            ][i][j-i_s[i*2]])
                        }
                    }
                }
                Section {
                    TextEditor(text: Binding<String> (
                        get: {
                            return state.outputBindingVal
                        },
                        set: {
                            v in state.outputBindingVal = v
                        }
                    ))
                }
                
            }.navigationBarTitle("! Comment Card !")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
