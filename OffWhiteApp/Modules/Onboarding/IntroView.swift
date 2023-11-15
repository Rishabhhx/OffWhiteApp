//
//  IntroView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 08/09/23.
//

import SwiftUI

struct IntroView: View {
    var iphoneBig: Bool = false
    @State var pushToHome: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Text("Off-White\u{2122}")
                    .font(.custom("Helvetica", size: 34))
                    .fontWeight(.bold)
                Text("“PROVE YOUR HUMANITY”")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.bold)
                Text("AN VIRGIL ABLOH “TRIBUTE”")
                    .font(.custom("Helvetica", size: 30))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .padding(.top, 28)
            }
            .padding(.top, 34)
            .foregroundColor(.white)
            HStack(spacing: 8) {
                Text("//STORE")
                    .font(.custom("Helvetica", size: 24))
                    .fontWeight(.bold)
                Text("“BRAND”")
                    .font(.custom("Helvetica", size: 24))
                    .fontWeight(.bold)
            }
            .padding(.top, 170)
            .foregroundColor(.white)
            Spacer()
            Button {
                pushToHome.toggle()
            } label: {
                Text("get started".uppercased())
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.regular)
                    .frame(width: 146, height: 34)
                    .background(.white)
                    .cornerRadius(6)
            }
            .navigationDestination(isPresented: $pushToHome) {
                MainView()
            }
            .buttonStyle(.plain)
            Text("Put in your feet things that really matters. Walk in cloud with the force of Nike and others brands. Our principal outfit for your life, only hype contented included here")
                .font(.custom("Helvetica", size: 10))
                .underline()
                .foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("intro")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
        .modifier(BaseCustomModifier())
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
