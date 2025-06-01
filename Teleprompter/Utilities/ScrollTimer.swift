//
//  ScrollTimer.swift
//  Teleprompter
//
//  Created by nini on 29/05/2025.
//

import Foundation
import Combine

class ScrollTimer: ObservableObject {
    @Published var offset: CGFloat = 0.0
    var timer: Timer?

    func startScrolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
            DispatchQueue.main.async {
                self.offset += 1.0
            }
        }
    }

    func stopScrolling() {
        timer?.invalidate()
        timer = nil
    }
}
