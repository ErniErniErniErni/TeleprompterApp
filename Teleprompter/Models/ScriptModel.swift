//
//  ScriptModel.swift
//  Teleprompter
//
//  Created by nini on 29/05/2025.
//
import Foundation

struct ScriptModel {
    var text: String
    
    static func loadSample() -> ScriptModel {
        if let url = Bundle.main.url(forResource: "SampleScript", withExtension: "txt"),
            let sampleText = try? String(contentsOf: url, encoding: .utf8) {
            return ScriptModel(text: sampleText)
        }else {
            return ScriptModel(text:"failed to read")
        }
    }
}
