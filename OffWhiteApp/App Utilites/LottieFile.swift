//
//  LottieFile.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Personal) on 26/11/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var lottieFile: String = "emptyCart"
    var loopMode: LottieLoopMode = .repeatBackwards(1)
    var animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
}
