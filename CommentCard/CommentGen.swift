//
//  CommentGen.swift
//  CommentCard
//
//  Created by Hart, Henry (AGDF) on 21/02/2023.
//

import Foundation

func genComment(_ lesson: Int, _ ew: Int, _ like: Int, _ subj: String) -> String {
    var out = ""
    switch(lesson) {
    case 0: out += "I am doing very well in lessons. "
    case 1: out += "I am doing well in lessons. "
    case 2: out += "I am doing ok in lessons. "
    default: out += "I am doing badly in lessons. "
    }
    switch(ew) {
    case 0: out += "I am doing very well in EWs. "
    case 1: out += "I am doing well in EWs. "
    case 2: out += "I am doing ok in EWs. "
    default: out += "I am doing badly in EWs. "
    }
    switch(like) {
    case 0: out += "I like \(subj) a lot."
    case 1: out += "I like \(subj)."
    case 2: out += "I am indifferent about \(subj)."
    default: out += "I am hate \(subj)."
    }
    return out
}
