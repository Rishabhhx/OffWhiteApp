//
//  StyleKitsDetailView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Personal) on 28/11/23.
//

import SwiftUI

struct StyleKitsDetailView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("stylekit1")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HomeHeader(showSideMenu: .constant(true), title: "Off-White\u{2122}", image: "cross")
                        .foregroundColor(.white)
                    Spacer()
                    VStack(spacing: 12) {
                        HStack(spacing: 6) {
                            Image("hanger")
                            Text("3")
                                .font(.custom("Helvetica", size: 12))
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                        }
                        .frame(width: 60, height: 24)
                        .background(Rectangle()
                            .fill(Color(red: 12/255, green: 12/255, blue: 12/255).opacity(0.5)))
                        .cornerRadius(10)
                        HStack {
                            ForEach(0..<4) {_ in
                                Text("hello")
                                    .font(.custom("Helvetica", size: 10))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(width: 60, height: 24)
                                    .background(Rectangle()
                                        .fill(Color(red: 12/255, green: 12/255, blue: 12/255).opacity(0.5)))
                                    .cornerRadius(10)
                            }
                        }
                        VStack(spacing: 2) {
                            Text("“NIGHT FEATURES”")
                                .font(.custom("Helvetica", size: 26))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Waking up at night meaning some style too.")
                                .font(.custom("Helvetica", size: 14))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.bottom,22)
                }
            }
            .frame(height: 487)
            Spacer()
            
        }
        .frame(width: .infinity, height: .infinity)
        
        .modifier(BaseCustomModifier())
    }
}

#Preview {
    StyleKitsDetailView()
}
