//
//  MidJourneyView.swift
//  JiangHu
//
//  Created by 宋歌 on 2022/12/8.
//

import SwiftUI


struct MidJourneyView: View {
    @State private var height: CGFloat = 320
    @State private var width: CGFloat = 480
    
    /* There're four round corner icons in the up middle:
    
     Sword, flower, River and City, indicated that:
     
     1. Sword is for battle
     2. Flower is for emotional relationships
     3. River is for travel/wandering along
     4. City is for urban life
     
     */
    
    let icons = [ "sword", "flower", "river", "urban"]
    
    /*
     Define the background Image, which name was loaded in a controller.
     */
    var image = Image("defaultStory")
    
    // Define Three Rich Texts
    var choice1 = Text("新的故事")
    var choice2 = Text("旧的回忆")
    var storyLine = Text("夜，雨夜，江南的细雨密如离愁。你独自走在幽深的小巷，巷道的尽头透出一点微光；")
    
    // Define the current tilt and swipe offsets
    @State var tilt: CGFloat = 0
    @State var swipe: CGFloat = 0
    
    var body: some View {
        VStack {
            // Show the icons
            HStack {
                ForEach(0..<icons.count, id: \.self) { index in
                    Image(self.icons[index])
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 12, idealWidth: 32, maxWidth: 32, minHeight: 12, idealHeight: 32, maxHeight: 32, alignment: .center)
                        .position(x: 24.0+Double(index)*12.0, y: 64.0)
                }
            }
            .padding()
            
            // Show the two text fields
            HStack {
              // Text field 1
              if abs(tilt) < 90 {
                choice1
                  .padding()
                  .frame(width: 200, alignment: .topLeading)
                  .position(x: 96.0, y: -(self.height + 128.0))
                  
              }

              // Text field 2
              if abs(tilt) > 90 {
                choice2
                  .padding()
                  .frame(width: 200)
              }
            }
            
            // Show the Image
            image.resizable().aspectRatio(contentMode: .fill)
            
        }
        
    }
}

struct MidJourneyView_Previews: PreviewProvider {
    static var previews: some View {
        MidJourneyView()
    }
}

/* Code suggestion by ChatGPT
 
 struct MyView: View {
   // Define the four round corner icons
   let icons = [    "icon1",    "icon2",    "icon3",    "icon4"  ]

   // Define the two text fields
   @State var textField1 = ""
   @State var textField2 = ""

   // Define the Image
   let image = Image("myImage")

   // Define the RichText
   let richText = Text("Some rich text")

   // Define the current tilt and swipe offsets
   @State var tilt: CGFloat = 0
   @State var swipe: CGFloat = 0

   var body: some View {
     VStack {
       // Show the icons
       HStack {
         ForEach(0..<icons.count, id: \.self) { index in
           Image(self.icons[index])
             .cornerRadius(8)
         }
       }
       .padding()

       // Show the two text fields
       HStack {
         // Text field 1
         if abs(tilt) < 90 {
           TextField("Text field 1", text: $textField1)
             .padding()
             .frame(width: 200)
         }

         // Text field 2
         if abs(tilt) > 90 {
           TextField("Text field 2", text: $textField2)
             .padding()
             .frame(width: 200)
         }
       }

       // Show the Image
       image
         .resizable()
         .aspectRatio(contentMode: .fit)

       // Show the RichText
       richText
         .padding()
     }
     .rotation3DEffect(.degrees(Double(tilt)), axis: (x: 0, y: 1, z: 0))
     .offset(x: swipe, y: 0)
     .gesture(
       DragGesture()
         .onChanged { gesture in
           // Update the tilt and swipe offsets
           self.tilt = gesture.translation.width
           self.swipe = gesture.translation.width
         }
         .onEnded { gesture in
           // Reset the tilt and swipe offsets
           self.tilt = 0
           self.swipe = 0
         }
     )
   }
 }

 
 */
