//
//  CartView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Personal) on 26/11/23.
//

import SwiftUI

struct CartView: View {
    @State var total = 0

    var body: some View {
        VStack {
            if cartObj.isEmpty {
                ZStack {
                    LottieView(loopMode: .loop)
                        .frame(height: 200)
                        .ignoresSafeArea()
                        .padding(.top, -200)
                    Text("Your shopping cart is empty.")
                        .font(.custom("Helvetica", size: 30))
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 120)
                        .shadow(color: .gray, radius: 20)
                        .animation(.default)
                }
            } else {
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(cartObj, id: \.self) { item in
                            CartCell(item: item)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 20)
                    CartValue(total: $total)
                    CartBottomButtons()
                }
            }
        }
        .onAppear() {
            calcCartPrice()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(BaseCustomModifier())
    }
    
    func calcCartPrice() {
        var price = cartObj.compactMap {
            $0.price
        }
        for i in price {
            total += Int(i) ?? 0
        }
    }
}

#Preview {
    CartView()
}

struct CartCell: View {
    var item: ManWomanModel = ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0",imageArr: ["man1detail1","man1detail2","man1detail3","man1detail4"], colorArr: [.white,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Long sleeves hooded sweatshirt in white featuring the blue Monalisa on the front and black diagonals on the sleeves. ", selectedSize: "M", selectedColor: .cyan)

    var body: some View {
        HStack {
            Image(item.imageArr[3])
                .resizable()
                .frame(width: 90, height: 96)
            VStack(alignment: .leading) {
                Text("SIZE \(item.selectedSize ?? "")")
                    .font(.custom("Helvetica", size: 8))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 90/255, green: 90/255, blue: 90/255))
                Text(item.title)
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text("$\(item.price)")
                    .font(.custom("Helvetica", size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
            }
            .padding(.leading, 26)
            Spacer()
            Image("checkBox")
        }
    }
}

struct CartValue: View {
    @Binding var total: Int
    
    var body: some View {
        VStack(spacing: 36) {
            HStack {
                Text("sub-total")
                    .font(.custom("Helvetica", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 117/255, green: 112/255, blue: 112/255))
                Spacer()
                Text("$\(total)")
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            HStack {
                Text("shipping")
                    .font(.custom("Helvetica", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 117/255, green: 112/255, blue: 112/255))
                Spacer()
                Text("$15")
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            HStack {
                Text("total")
                    .font(.custom("Helvetica", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 117/255, green: 112/255, blue: 112/255))
                Spacer()
                Text("$\(total + 15)")
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
        .padding(.all, 34)
    }
}

struct CartBottomButtons: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("go back")
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
                    .stroke(Color.black, lineWidth: 1)
            )
            .buttonStyle(.plain)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("pay")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(height: 34)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .cornerRadius(6)
            })
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 54)
    }
}
