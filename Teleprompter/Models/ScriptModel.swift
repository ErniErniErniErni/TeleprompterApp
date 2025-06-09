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
        let sampleText: String = {
            guard let url = Bundle.main.url(forResource: "SampleScript", withExtension: "txt"),
                  let content = try? String(contentsOf: url, encoding: .utf8) else {
                return "failed to read"
            }
            return content
        }()
        return ScriptModel(text: sampleText)
    }
}
