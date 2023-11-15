//
//  ContentView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 07/09/23.
//

import SwiftUI

struct LoginView: View {
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var showToast: Bool = false
    
    var defaultEmail: String = "dev@gmail.com"
    var defaultPassword: String = "rishabh"
    
    var body: some View {
        ZStack {
            LoginBackView()
            VStack(spacing: 20) {
                TextfieldLoginView(text: $emailText,showText: true, showEye: false)
                TextfieldLoginView(text: $passwordText,showText: false, placeHolderText: "Enter your Password")
                Button {
                    if emailText == defaultEmail && passwordText == defaultPassword {
                        
                    } else {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showToast = true
                        }
                    }
                } label: {
                    Text("CONTINUE")
                        .font(.custom("Helvetica", size: 23))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.white))
                }
                .disabled(!emailText.isValidEmail || passwordText.isEmpty)
                .buttonStyle(.plain)
                .padding(.top, 20)

            }
            .padding(.bottom, 180)
            .padding(.horizontal, 15)
            ToastMessage(req: $showToast, text: "Please enter correct email and password.")
        }
        .modifier(BaseCustomModifier())
        .animation(.linear, value: emailText)
        .animation(.linear, value: passwordText)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct LoginBackView: View {
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Text("Off-White")
                    .font(.custom("Helvetica", size: 34))
                    .fontWeight(.bold)
                Text("“PROVE YOUR HUMANITY”")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .padding(.top,80)
            Spacer()
            Image("barras")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 118)
                .padding(.bottom, 80)
            Text("Put in your feet things that really matters. Walk in cloud with the force of Nike and others brands. Our principal outfit for your life, only hype contented included here")
                .font(.custom("Helvetica", size: 10))
                .underline()
                .foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct TextfieldLoginView: View {
    @Binding var text: String
    @State var showText : Bool = false

    var showEye: Bool = true
    
    var placeHolderText : String = "Login by Email"
    var body: some View {
        VStack(spacing: 6) {
            if !text.isEmpty {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 18)
            }
            
            ZStack(alignment: .leading) {
                Text(placeHolderText).foregroundColor(Color.init(red: 153/255, green: 153/255, blue: 153/255))
                    .padding(.leading,text.isEmpty ? 20 : 0)
                    .offset(y: text.isEmpty ? 0 : -40)
                    .font(.custom("Helvetica", size: 14))
                    .fontWeight(.bold)
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(Color.init(red: 78/255, green: 78/255, blue: 78/255,opacity: 0.3))
                        .cornerRadius(10)
                    HStack(spacing: 0) {
                        if showText || !showEye{
                            TextField("", text: $text)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .font(.custom("Helvetica", size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading,20)
                                .tint(.white)
                        } else {
                            SecureField("", text: $text)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .font(.custom("Helvetica", size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading,20)
                                .tint(.white)
                        }
                        if showEye {
                            Button(action: {
                                showText.toggle()
                            }) {
                                if showText {
                                    Image("icEyeOpen")
                                } else {
                                    Image("icEyeClose")
                                }
                            }
                            .frame(width: 16)
                            .padding(.horizontal,16)
                        }
                    }
                }
            }
        }
    }
}
