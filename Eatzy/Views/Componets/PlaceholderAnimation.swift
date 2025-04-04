//
//  PlaceholderAnimation.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 04/04/2025.
//

import SwiftUI
import Lottie

struct PlaceholderAnimation: View {
    
    struct Metrics {
        static let negative: CGFloat = -50
        static let smallFrame: CGFloat = 200
        static let mediumFrame: CGFloat = 380
        static let largeFrame: CGFloat = 400
        static let textPadding: CGFloat = 30
    }

    var text: String
    
    var body: some View {
        VStack {
            VStack(alignment: .center){
                LottieView(animation: .named("PlaceholderAnimation"))
                    .configure({ animationView in
                        animationView.contentMode = .scaleAspectFill
                    })
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .resizable()
                    .frame(width: Metrics.smallFrame, height: Metrics.smallFrame)
                    .clipped()
                
                Text(text)
                    .frame(width: Metrics.mediumFrame)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, Metrics.textPadding)
            }
            .frame(width: Metrics.largeFrame, height: Metrics.largeFrame)
            .offset(y: Metrics.negative)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PlaceholderAnimation_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlaceholderAnimation(text: "Search by postcode or enable location services")
        }
    }
}
