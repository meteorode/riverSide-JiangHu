//
//  JiangHuApp.swift
//  JiangHu
//
//  Created by 宋歌 on 2022/12/6.
//

import SwiftUI
import Foundation

@main
struct JiangHuApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                MidJourneyView()
                CoverView()
            }
        }
    }
}
