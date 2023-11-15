//
//  CommonViews.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 05/04/23.
//

import SwiftUI

struct BaseCustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .ignoresSafeArea(.keyboard)
            .hideKeyboardWhenTappedAround()
            .navigationTitle("")
            .toolbar(.hidden)
    }
}

struct ToastMessage: View {
    @Binding var req : Bool
    var text : String = ""

    var body: some View {
        VStack {
            Text(text)
                .font(.custom("Helvetica", size: 16))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .foregroundColor(.black)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.white))
                .padding(.horizontal, 20)
                .onChange(of: req, perform: { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            self.req = false
                        }
                    }
                })
                .offset(y: req ? UIScreen.main.bounds.height/2 - 100 : UIScreen.main.bounds.height)
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HomeFooterView: View {
    var light : Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 9) {
                Text("Off-White\u{2122}")
                    .font(.custom("Helvetica", size: 23))
                    .fontWeight(.bold)
                    .foregroundColor(light ? .black : .white)
                Text("Defining the grey area between black and white as the color Off-White™")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Helvetica", size: 8))
                    .fontWeight(.regular)
                    .foregroundColor(light ? Color(red: 35/255, green: 35/255, blue: 35/255) : Color(red: 135/255, green: 135/255, blue: 135/255))
            }
            .frame(maxWidth: .infinity)
            Spacer()
            Spacer()
            VStack(alignment: .trailing, spacing: 9) {
                HStack {
                    Image("Facebook")
                        .renderingMode(.template)
                        .foregroundColor(light ? .black : .white)
                    Image("Twitter")
                        .renderingMode(.template)
                        .foregroundColor(light ? .black : .white)
                    Image("Insta")
                        .renderingMode(.template)
                        .foregroundColor(light ? .black : .white)
                    Image("TikTok")
                        .renderingMode(.template)
                        .foregroundColor(light ? .black : .white)
                }
                Text("© 2021 Off-White. All rights reserved")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Helvetica", size: 8))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 40)
    }
}

struct HomeHeader: View {
    @Binding var showSideMenu: Bool
    var title: String = "Off-White\u{2122}"
    var image: String = "menu"
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Helvetica", size: 34))
                .fontWeight(.bold)
            Spacer()
            Button {
                showSideMenu.toggle()
            } label: {
                Image(image)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 30)
        .padding(.top, 18)
    }
}
