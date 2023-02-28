//
//  haredBindingDataCosIDontKnowHowElseToDoItInSwift.swift
//  CommentCard
//
//  Created by Hart, Henry (AGDF) on 24/02/2023.
//

import Foundation
import SwiftUI

class SharedBindingDataCosIDontKnowHowElseToDoItInSwift: ObservableObject {
    @Published var selection = [-1, -1, -1]
    @Published var buttonsOn = [
        [false, false, false, false],
        [false, false, false, false],
        [false, false, false, false]
    ]
    @Published var outputBindingVal = ""
    @Published var subjBindingVal = ""
    
    
    func optbndgs(_ low: Int, _ high: Int, _ selectionIndex: Int) -> [Binding<Bool>] {
        var funcs : [Binding<Bool>] = []
        
        for i in low..<high {
            funcs.append(Binding<Bool> (
                get: {
                    if self.buttonsOn[selectionIndex][i]
                    {
                        return true
                    }
                    //print(terminator:"Updated:")
                    print(self.buttonsOn[selectionIndex][i])
                    return false
                },
                set: {
                    _ in
                    //{
                        self.selection[selectionIndex] = i
                    for j in 0..<self.buttonsOn[selectionIndex].count {
                            self.buttonsOn[selectionIndex][j] = false
                        }
                        self.buttonsOn[selectionIndex][i].toggle()
                        print(self.buttonsOn)
                        self.checkGenComment()
                    //}
                }
            ))
        }
        
        return funcs
    }

    func optbndg(_ index: Int, _ selectionIndex: Int) -> Binding<Bool> {
        return Binding<Bool> (
            get: {
                if self.buttonsOn[selectionIndex][index]
                {
                    return true
                }
                return false
            },
            set: {
                _ in
                //{
                    self.selection[selectionIndex] = index
                    self.buttonsOn[selectionIndex][index].toggle()
                //}
            }
        )
    }
    
    func checkGenComment() {
        if self.selection[0] != -1 &&
            self.selection[1] != -1 &&
            self.selection[2] != -1 && self.subjBindingVal != "" {
            //print("GENERATING>>>")
            self.outputBindingVal = genComment(
                self.selection[0],
                self.selection[1],
                self.selection[2],
                self.subjBindingVal)
            print(self.outputBindingVal)
        }
    }
}
