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
        let sampleText = """
            大家好!
            啥啥啥.
            大家好！
            """
        return ScriptModel(text: sampleText)
    }
}
