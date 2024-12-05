//
//  NoDeadlinesView.swift
//  AituMoodle
//
//  Created by Эвелина Пенькова on 05.12.2024.
//

import SwiftUI
import SwiftyGif

struct GifView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        do {
            let gif = try UIImage(gifName: gifName)
            imageView.setGifImage(gif, loopCount: 10)
        } catch {
            print(error)
        }
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        // No update required for static GIF
    }
}


struct NoDeadlinesView: View {
    var body: some View {
        ZStack{

            VStack{
               
                    
                    GifView(gifName: "cat.gif")
                        .frame(maxWidth: 400, maxHeight: 400)
                
                Text("You don't have any dealdlines")
                    .font(.customFont(size: 40))
                    .foregroundColor(Color("fontColor"))
              
            }

        }
    }
}

#Preview {
    NoDeadlinesView()
}
