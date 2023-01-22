//
//  CoverView.swift
//  JiangHu
//
//  Created by 宋歌 on 2022/12/6.
//

import SwiftUI
import Foundation

struct CoverView: View {
    
    @State private var changeToMainMapView = false
    
    var body: some View {
        ZStack{
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 200, idealWidth: 600, maxWidth: 1024, minHeight: 300, idealHeight: 900, maxHeight: 1536, alignment: .center)
            Button(action: {
                withAnimation{
                    self.changeToMainMapView.toggle()
                }
            }) {
                Text("Who\n am\n I?")
                    .position(x: 180, y: 500)
                    .frame(width: 300, height: 600, alignment: .center)
            }
            
        }
        .padding()
        .transition(.opacity)
        
        if changeToMainMapView {
            MidJourneyView()
        }
        
    }
    
}

struct mainMapView: View {
    var body: some View {
        ZStack {
            Image("map")
                .resizable()
                .aspectRatio(contentMode: .fill)

        }
    }
}


struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
    }
}
