//
//  CommentCardApp.swift
//  CommentCard
//
//  Created by Hart, Henry (AGDF) on 07/02/2023.
//

import SwiftUI

@main
struct CommentCardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SharedBindingDataCosIDontKnowHowElseToDoItInSwift())
        }
    }
}
