//
//  TeleprompterViewModel.swift
//  Teleprompter
//
//  Created by nini on 29/05/2025.
//

import Foundation
import Combine

class TeleprompterViewModel: ObservableObject {
    @Published var scrollSpeed: Double = 0.5
    @Published var script: ScriptModel = ScriptModel.loadSample()
}

