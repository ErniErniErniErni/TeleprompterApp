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
            青山远
            落日红
            花开早
            云遮月
            水中影
            风吹柳
            梦初醒
            叶落尽
            星如雨
            鸟归林
            
            青山远
            落日红
            花开早
            云遮月
            水中影
            风吹柳
            梦初醒
            叶落尽
            星如雨
            鸟归林
            
            青山远
            落日红
            花开早
            云遮月
            水中影
            风吹柳
            梦初醒
            叶落尽
            星如雨
            鸟归林
            
            青山远
            落日红
            花开早
            云遮月
            水中影
            风吹柳
            梦初醒
            叶落尽
            星如雨
            鸟归林
            """
        return ScriptModel(text: sampleText)
    }
}
