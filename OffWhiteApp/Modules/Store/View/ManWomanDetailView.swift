//
//  ManWomanDetailView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 17/09/23.
//

import SwiftUI

struct ManWomanDetailView: View {
    @Environment(\.dismiss) var dismiss
    var manObj: ManWomanModel = ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0",imageArr: ["man1detail1","man1detail2","man1detail3","man1detail4"], colorArr: [.white,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Long sleeves hooded sweatshirt in white featuring the blue Monalisa on the front and black diagonals on the sleeves. ")
    var shoeObj: ShoesModel = ShoesModel(image: "shoe1", title1: "White", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike", subTitle2: "Oregon © 2022", price: "580",imageArr: ["shoe1detail1","shoe1detail2","shoe1detail3","shoe1detail4"], sizeArr: ["37","38","39","40"])

    @State var selectedColor: Color = .white
    @State var selectedSize: String = "M"
    @State var pageIndex = 0
    @State var isExpanded : Bool = true
    @State var isShoe: Bool = false
    @State var showCartAnimation : Bool = false
    
    var body: some View {
        ZStack {
            TabView(selection: $pageIndex) {
                ForEach(0..<4, id: \.self) { i in
                    if isShoe {
                        Image(shoeObj.imageArr[i])
                            .offset(y: -160)
                    } else {
                        Image(manObj.imageArr[i])
                            .resizable()
                            .ignoresSafeArea()
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onAppear() {
                selectedColor = manObj.colorArr.first ?? .black
                selectedSize = isShoe ? shoeObj.sizeArr.first ?? "30" : manObj.sizeArr.first ?? "S"
            }
            .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("cross")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                    })
                    Spacer()
                }
                .padding(.horizontal, 32)
                Spacer()
            }
            VStack {
                Spacer()
                InfoBarView(pageIndex: $pageIndex, selectedColor: $selectedColor,selectedSize: $selectedSize, isExpanded: $isExpanded, isShoe: $isShoe, colorArr: manObj.colorArr, sizeArr: isShoe ? shoeObj.sizeArr : manObj.sizeArr,manObj: manObj,shoeObj: shoeObj)
                BottomButtons(isShoe: $isShoe, manObj: manObj, shoeObj: shoeObj, selectedColor: $selectedColor, selectedSize: $selectedSize, showCartAnimation: $showCartAnimation)
            }
                ZStack {
                    Rectangle()
                        .opacity(showCartAnimation ? 0.7 : 0)
                        .ignoresSafeArea()
                    if showCartAnimation {
                        LottieView(lottieFile: "addCart", loopMode: .playOnce)
                            .ignoresSafeArea()
                    }
                }
                .animation(.linear, value: showCartAnimation)
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
    @Binding var isShoe: Bool

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
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black, lineWidth: isShoe ? 1 : 0)
        )
    }
}

struct InfoBarView: View {
    @Binding var pageIndex: Int
    @Binding var selectedColor: Color
    @Binding var selectedSize: String
    @Binding var isExpanded: Bool
    @Binding var isShoe: Bool

    var colorArr: [Color] = []
    var sizeArr: [String] = []
    var manObj: ManWomanModel = ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0",imageArr: ["man1detail1","man1detail2","man1detail3","man1detail4"], colorArr: [.white,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Long sleeves hooded sweatshirt in white featuring the blue Monalisa on the front and black diagonals on the sleeves. ")
    var shoeObj: ShoesModel = ShoesModel(image: "shoe1", title1: "White", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike", subTitle2: "Oregon © 2022", price: "580",imageArr: ["shoe1detail1","shoe1detail2","shoe1detail3","shoe1detail4"], sizeArr: ["37","38","39","40"])

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
                    if isShoe {
                        Rectangle()
                            .foregroundStyle(pageIndex == i ? Color.black : Color(red: 208/255, green: 196/255, blue: 196/255))
                            .frame(height: 2)
                    } else {
                        Rectangle()
                            .foregroundStyle(pageIndex == i ? Color.white : Color(red: 63/255, green: 61/255, blue: 62/255))
                            .frame(height: 2)
                    }
                }
            }
            .animation(.easeIn(duration: 0.2), value: pageIndex)
            DetailActionButtons(isExpanded: $isExpanded, isShoe: $isShoe, pageIndex: $pageIndex)
            CardInfoView(selectedColor: $selectedColor, selectedSize: $selectedSize, isExpanded: $isExpanded,colorArr: colorArr, sizeArr: sizeArr, manObj: manObj,shoeObj:shoeObj, isShoe: $isShoe)
        }
        .padding(.horizontal, 30)
    }
}

struct DetailActionButtons: View {
    @Binding var isExpanded : Bool
    @Binding var isShoe: Bool
    @Binding var pageIndex: Int

    var body: some View {
        HStack(alignment: .center) {
            if isExpanded {
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    DetailActionButtonView(title: "reduce",image: "expand",next: false, isShoe: $isShoe)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    DetailActionButtonView(title: "share",image: "share",next: false, isShoe: $isShoe)
                })
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    DetailActionButtonView(title: "save",image: "saveBlack",next: false, isShoe: $isShoe)
                })
                Spacer()
                Button(action: {
                    pageIndex = (pageIndex < 3) ? (pageIndex + 1) : 0
                }, label: {
                    DetailActionButtonView(title: "next",image: "expand",next: true, isShoe: $isShoe)
                })
            } else {
                Spacer()
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    DetailActionButtonView(title: "expand",image: "expand",next: false, isShoe: $isShoe)
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
        .animation(nil, value: true)
    }
}

struct BottomButtons: View {
    @Binding var isShoe: Bool
    var manObj: ManWomanModel = ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0",imageArr: ["man1detail1","man1detail2","man1detail3","man1detail4"], colorArr: [.white,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Long sleeves hooded sweatshirt in white featuring the blue Monalisa on the front and black diagonals on the sleeves. ")
    var shoeObj: ShoesModel = ShoesModel(image: "shoe1", title1: "White", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike", subTitle2: "Oregon © 2022", price: "580",imageArr: ["shoe1detail1","shoe1detail2","shoe1detail3","shoe1detail4"], sizeArr: ["37","38","39","40"])
    @Binding var selectedColor: Color
    @Binding var selectedSize: String
    @Binding var showCartAnimation: Bool
    
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
            Button(action: {
                if isShoe {
                    cartObj.append(ManWomanModel(image: shoeObj.image, title: shoeObj.title1, price: shoeObj.price, rating: "", imageArr: shoeObj.imageArr, colorArr: [], sizeArr: shoeObj.sizeArr, descritption: shoeObj.title2, selectedSize: selectedSize, selectedColor: selectedColor))
                } else {
                    var obj = manObj
                    obj.selectedSize = self.selectedSize
                    obj.selectedColor = self.selectedColor
                    withAnimation() {
                        showCartAnimation = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                            showCartAnimation = false
                        }
                    }
                    cartObj.append(obj)
                }
            }, label: {
                Text("add to cart")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .frame(height: 34)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(6)
            })
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: isShoe ? 1 : 0)
            )
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
    var manObj: ManWomanModel = ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0",imageArr: ["man1detail1","man1detail2","man1detail3","man1detail4"], colorArr: [.white,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Long sleeves hooded sweatshirt in white featuring the blue Monalisa on the front and black diagonals on the sleeves. ")
    var shoeObj: ShoesModel = ShoesModel(image: "shoe1", title1: "White", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike", subTitle2: "Oregon © 2022", price: "580",imageArr: ["shoe1detail1","shoe1detail2","shoe1detail3","shoe1detail4"], sizeArr: ["37","38","39","40"])
    @Binding var isShoe: Bool

    var body: some View {
        ZStack {
            if !isShoe {
                VStack(alignment:.trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("cardBar")
                    }
                }
            }
            VStack(alignment: .leading) {
                Spacer()
                if !isShoe {
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
                }
                if isShoe {
                    Spacer()
                }
                if isShoe {
                    Spacer()
                }
                VStack(alignment: .leading) {
                    if isShoe {
                        HStack {
                            Text(shoeObj.title1)
                                .font(.custom("Helvetica", size: 26))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text(shoeObj.title2)
                                .font(.custom("Helvetica", size: 26))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    } else {
                        Text(manObj.title)
                            .font(.custom("Helvetica", size: 26))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    if isExpanded {
                        if isShoe {
                            Text(shoeObj.subTitle1)
                                .font(.custom("Helvetica", size: 9))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text(shoeObj.subTitle2)
                                .font(.custom("Helvetica", size: 9))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        } else {
                            Text(manObj.descritption)
                                .font(.custom("Helvetica", size: 9))
                                .fontWeight(.regular)
                                .foregroundColor(Color(red: 72/255, green: 72/255, blue: 72/255))
                        }
                    }
                    if isShoe {
                        Spacer()
                    }
                    Text("$\(isShoe ? shoeObj.price : manObj.price)")
                        .font(.custom("Helvetica", size: 25))
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 72/255, green: 72/255, blue: 72/255))
                        .padding(.top, 6)
                    if isShoe {
                        Spacer()
                    }
                    if isExpanded {
                        if !isShoe {
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
                        if isShoe {
                            Spacer()
                        }
                    }
                }
                .padding(.trailing, 40)
                Spacer()
            }
            .padding(.leading, 30)
        }
        .frame(height: isExpanded ? (isShoe ? 220 : 273) : 120)
        .animation(.linear, value: isExpanded)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background()
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: isShoe ? 1 : 0)
        )
    }
}
