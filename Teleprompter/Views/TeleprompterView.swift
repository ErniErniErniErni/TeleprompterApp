//
//  TeleprompterView.swift
//  Teleprompter
//
//  Created by nini on 29/05/2025.
//

import SwiftUI

struct TeleprompterView: View {
    
    // property wrapper. manage and observe data to make a struct mutable
    // how SwiftUI tracks changes and automatically updates the user interface
    @StateObject private var viewModel = TeleprompterViewModel()
    @StateObject private var scroller = ScrollTimer()
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Text(viewModel.script.text)
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.5))
                    .id("ScriptText")
            }
            .onReceive(scroller.$offset) { _ in
                withAnimation(.linear(duration: 0.03)) {
                    proxy.scrollTo("ScriptText", anchor: .top)
                }
            }
            .onAppear {
                scroller.startScrolling()
            }
        }
    }
}
