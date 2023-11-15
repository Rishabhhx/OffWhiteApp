//
//  ManWomanDetailView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 17/09/23.
//

import SwiftUI

struct ManWomanDetailView: View {
    var colorArr : [Color] = [.white,.black]
    var sizeArr : [String] = ["XXS","XS","S","L","XL"]
    @State var selectedColor: Color = .white
    @State var selectedSize: String = "M"
    @State var pageIndex = 0
    @State var isExpanded : Bool = true
    
    var body: some View {
        ZStack {
            TabView(selection: $pageIndex) {
                ForEach(0..<4, id: \.self) { i in
                    Image("man\(i+1)")
                        .resizable()
                        .ignoresSafeArea()
                }
            }
            .onAppear() {
                selectedColor = colorArr.first ?? .black
                selectedSize = sizeArr.first ?? "S"
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            VStack {
                Spacer()
                InfoBarView(pageIndex: $pageIndex, selectedColor: $selectedColor,selectedSize: $selectedSize, isExpanded: $isExpanded, colorArr: colorArr, sizeArr: sizeArr)
                BottomButtons()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(BaseCustomModifier())
    }
}

#Preview {
    ManWomanDetailView()
}
/*HStack {
 ForEach(0..<4) { i in
     ProgressView(value: progressAmount[i], total: 100)
         .tint(.white)
         .background(.black)
         .progressViewStyle(.linear)
         .onReceive(timer) { _ in
             if progressComplete == i {
                 if progressAmount[i] < 100 {
                     progressAmount[i] += 1
                 } else {
                     progressComplete += 1
                     progressAmount[i] = 0
//                                        pageIndex += 1
                 }
             }
         }
 }
}*/

struct DetailActionButtonView: View {
    var title: String = ""
    var image: String = ""
    var next: Bool = false
    
    var body: some View {
        HStack(spacing : 6) {
            if !next {
                Image(image)
            }
            Text(title)
                .font(.custom("Helvetica", size: 10))
                .fontWeight(.bold)
                .foregroundColor(.black)
            if next {
                Image("next")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
        .cornerRadius(4)
    }
}

struct InfoBarView: View {
    @Binding var pageIndex: Int
    @Binding var selectedColor: Color
    @Binding var selectedSize: String
    @Binding var isExpanded: Bool
    var colorArr: [Color] = []
    var sizeArr: [String] = []

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom, spacing: 1) {
                Text("\(pageIndex+1)")
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .offset(CGSize(width: 0, height: 4))
                Text("/4")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .offset(CGSize(width: 0, height: 2))
            }
            HStack {
                ForEach(0..<4, id: \.self) { i in
                    Rectangle()
                        .foregroundStyle(pageIndex == i ? Color.white : Color(red: 63/255, green: 61/255, blue: 62/255))
                        .frame(height: 2)
                }
            }
            .animation(.easeIn(duration: 0.2), value: pageIndex)
            DetailActionButtons(isExpanded: $isExpanded)
            CardInfoView(selectedColor: $selectedColor, selectedSize: $selectedSize, isExpanded: $isExpanded,colorArr: colorArr, sizeArr: sizeArr)
        }
        .padding(.horizontal, 30)
    }
}

struct DetailActionButtons: View {
    @Binding var isExpanded : Bool

    var body: some View {
        HStack(alignment: .center) {
            if isExpanded {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    DetailActionButtonView(title: "reduce",image: "expand",next: false)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    DetailActionButtonView(title: "share",image: "share",next: false)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    DetailActionButtonView(title: "save",image: "saveBlack",next: false)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    DetailActionButtonView(title: "next",image: "expand",next: true)
                })
            } else {
                Spacer()
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    DetailActionButtonView(title: "expand",image: "expand",next: false)
                        .frame(width: 80)
                })
                Spacer()
            }
        }
        .buttonStyle(.plain)
        .frame(height: 22)
    }
}

struct ColorSelectButtonView: View {
    
    var color : Color = .black
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(color)
            .frame(width: 24,height: 24)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

struct SizeSelectButtonView: View {
    @Binding var selectedSize: String
    var size : String = "M"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill((selectedSize == size ? .black : .white))
                .frame(width: 24,height: 24)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.black, lineWidth: 1)
                )
            Text(size)
                .font(.custom("Helvetica", size: 9))
                .fontWeight(.regular)
                .foregroundColor(selectedSize == size ? .white : .black)
        }
        .animation(nil)
    }
}

struct BottomButtons: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("buy piece")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(height: 34)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .cornerRadius(6)
            })
            .buttonStyle(.plain)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("add to cart")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .frame(height: 34)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(6)
            })
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 54)
    }
}

struct CardInfoView: View {
    @Binding var selectedColor: Color
    @Binding var selectedSize: String
    @Binding var isExpanded : Bool

    var colorArr: [Color] = []
    var sizeArr: [String] = []
    var body: some View {
        ZStack {
            VStack(alignment:.trailing) {
                Spacer()
                HStack {
                    Spacer()
                    Image("cardBar")
                }
            }
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text("© 2022")
                        .font(.custom("Helvetica", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    Text("TM")
                        .font(.custom("Helvetica", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .offset(x : isExpanded ? 0 : -40)
                }
                .padding(.bottom, isExpanded ? 18 : 4)
                VStack(alignment: .leading) {
                    Text("Monalise Hoodie")
                        .font(.custom("Helvetica", size: 26))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    if isExpanded {
                        Text("Long sleeves hooded sweatshirt in white featuring the blue Monalisa on the front and black diagonals on the sleeves. ")
                            .font(.custom("Helvetica", size: 9))
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 72/255, green: 72/255, blue: 72/255))
                    }
                    Text("$680")
                        .font(.custom("Helvetica", size: 25))
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 72/255, green: 72/255, blue: 72/255))
                        .padding(.top, 6)
                    if isExpanded {
                        Text("“Colors”".uppercased())
                            .font(.custom("Helvetica", size: 9))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 2)
                        HStack(spacing: 10) {
                            ForEach(colorArr, id: \.self) { color in
                                Button(action: {
                                    selectedColor = color
                                }, label: {
                                    ColorSelectButtonView(color: color)
                                })
                                .buttonStyle(.plain)
                            }
                        }
                        Text("“SIZES”".uppercased())
                            .font(.custom("Helvetica", size: 9))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, 2)
                        HStack(spacing: 10) {
                            ForEach(sizeArr, id: \.self) { size in
                                Button(action: {
                                    selectedSize = size
                                }, label: {
                                    SizeSelectButtonView(selectedSize: $selectedSize, size: size)
                                })
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding(.trailing, 40)
                Spacer()
            }
            .padding(.horizontal, 30)
        }
        .frame(height: isExpanded ? 273 : 120)
        .animation(.linear, value: isExpanded)
        .frame(maxWidth: .infinity)
        .background()
        .cornerRadius(15)
    }
}
