//
//  DataParser.swift
//  JiangHu
//
//  Created by 宋歌 on 2022/12/7.
//

import Foundation
import CoreData
import SwiftUI

// Read datafiles and parse them.

class DataManager {
    struct City: Codable {
        var name: String    // city name like '襄阳' or ‘武汉'
        var iconName: String    // Name defined in the json file.
        var iconWidth: CGFloat = 32 // default = 32
        var iconHeight: CGFloat = 32// default = 32
        var roadConnection: [[Int]] // A square like [R(1,2) , .... R(1, n); ... ; R(n,1), ... R(n, n) ] while R(x, y) = 1 while there's a road between Px and Py, R(x, y) = 0 while there's no road.
        var riverConnection: [[Int]] // Same with R
    }

    struct Character: Codable {
        // ENFP: 楚留香/胡铁花, 骆寒/易敛, 张无忌/赵敏, 令狐冲/任盈盈；天秤座
        // ESTP: 阿飞/林仙儿, 萧秋水/唐方, 李寻欢/林诗音, 陆小凤/牛肉汤；狮子座
        struct Attributes: Codable {
            var name: String = "吴茗"// like '吴茗'
            var portarit: String = "wuming.png" // like 'wuming.png'
            var kind: Int = 23 // 善良, all traits are in [0, 100]
            var royal: Int = 47 // 侠气
            var innocent: Int = 33 // 纯洁, I in 16 Personalities
            var elegant: Int = 66 // 优雅，E in 16 Personalities
            var simple: Int = 33 // 纯粹, S in 16 Personalities
            var nature: Int = 66 // 自然, N in 16 Personalities
            var feel: Int =  33 // 感性, F in 16 Personalities
            var truth: Int = 66 // 理性， T in 16 Personalities
            var judge: Int = 33 // 公正, J in 16 Personalities
            var pretty: Int = 66 // 美丽, P in 16 Personalities
        }
        struct Relationships: Codable {
            var love: Int = 23
            var friendship: Int = 100
        }
    }

    let mainChar: [Character] = {
        let url = Bundle.main.url(forResource: "mainChar", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode([Character].self, from: data)
    }()

    let cities: [City] = {
        let url = Bundle.main.url(forResource: "cities", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try! decoder.decode([City].self, from: data)
    }()
}
