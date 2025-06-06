//
//  TeleprompterView.swift
//  Teleprompter
//
//  Created by nini on 29/05/2025.
//

import SwiftUI

struct TeleprompterView: View {
    
    @StateObject private var viewModel = TeleprompterViewModel()
    @StateObject private var scroller = ScrollTimer()
    
    @State private var scrollOffset: CGFloat = 0
    @State private var timer: Timer?
    @State private var isScrolling: Bool = false
    @State private var scrollSpeed: Double = 30 // pixels per second

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    Text(viewModel.script.text)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .foregroundColor(.white)
                        .id("teleprompterText")
                }
                .background(alignment: .center) {
                    Color.black
                        .opacity(0.5)
                }
                .onAppear {
                    startScrolling(proxy: proxy)
                }
                .onDisappear {
                    stopScrolling()
                }
            }
            //Pause/Play & Speed controls
            HStack {
                Button(action: {
                    isScrolling.toggle()
                }) {
                    Image(systemName: isScrolling ? "pause.circle.fill" : "play.circle.fill")
                        .font(.largeTitle)
                        .padding()
                }

                Slider(value: $scrollSpeed, in: 10...100, step: 5) {
                    Text("Speed")
                }
                .padding()
            }
        }
    }

    private func startScrolling(proxy: ScrollViewProxy) {
        isScrolling = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            if isScrolling {
                withAnimation(.linear(duration: 0.02)) {
                    scrollOffset += scrollSpeed * 0.02
                    proxy.scrollTo("teleprompterText", anchor: .top)
                }
            }
        }
    }

    private func stopScrolling() {
        timer?.invalidate()
        timer = nil
    }
    
    // property wrapper. manage and observe data to make a struct mutable
    // how SwiftUI tracks changes and automatically updates the user interface
//    @StateObject private var viewModel = TeleprompterViewModel()
//    @StateObject private var scroller = ScrollTimer()
//    
//    var body: some View {
//        ScrollViewReader { proxy in
//            ScrollView {
//                Text(viewModel.script.text)
//                    .font(.title2)
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.black.opacity(0.5))
//                    .id("ScriptText")
//            }
//            .onReceive(scroller.$offset) { _ in
//                withAnimation(.linear(duration: 0.03)) {
//                    proxy.scrollTo("ScriptText", anchor: .top)
//                }
//            }
//            .onAppear {
//                scroller.startScrolling()
//            }
//        }
//    }
}
