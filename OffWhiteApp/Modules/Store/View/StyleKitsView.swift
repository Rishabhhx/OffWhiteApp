//
//  StyleKitsView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 09/09/23.
//

import SwiftUI

struct StyleKitList: View {
    var columns: [GridItem] = [GridItem(.flexible(), spacing: 20), GridItem(.flexible())]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(styleKitObj.indices, id: \.self) { item in
                    StyleKitCell(object: styleKitObj[item])
                }
            }
            .padding(.horizontal, 30)
        }
        .padding(.top, 10)
    }
}


struct StyleKitCell: View {
    var object: StyleKitModel = StyleKitModel(image: "stylekit2", title: "Hold Stylish", subTitle: "Ok, this one is for who that really can hold style.", clothingCount: "2", saved: false)
    var body: some View {
        ZStack {
            Image(object.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 270)
            VStack {
                Image("upperOpq")
                Spacer()
                Image("lowerOpq")
            }
            VStack {
                HStack {
                    HStack(spacing: 6) {
                        Image("hanger")
                        Text(object.clothingCount)
                            .font(.custom("Helvetica", size: 8))
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                    }
                    .frame(width: 42, height: 18)
                    .background(Rectangle()
                        .fill(Color(red: 12/255, green: 12/255, blue: 12/255).opacity(0.5)))
                    .cornerRadius(10)
                    Spacer()
                    HStack(spacing: 6) {
                        Button {
                            //                            saved.toggle()
                        } label: {
                            if object.saved {
                                Image(systemName: "bookmark.fill")
                            } else {
                                Image("save")
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .frame(width: 42, height: 18)
                    .background(Rectangle()
                        .fill(Color(red: 12/255, green: 12/255, blue: 12/255).opacity(0.5)))
                    .cornerRadius(10)
                    
                }
                .padding(.top,18)
                .padding(.horizontal, 14)
                Spacer()
            }
            VStack(alignment: .leading) {
                Spacer()
                Text(object.title.uppercased())
                    .font(.custom("Helvetica", size: 16))
                    .fontWeight(.bold)
                Text(object.subTitle)
                    .font(.custom("Helvetica", size: 7))
                    .fontWeight(.regular)
            }
            .multilineTextAlignment(.leading)
            .padding(.leading, 12)
            .padding(.bottom, 18)
            .padding(.trailing, 40)
            .foregroundColor(.white)
        }
        .cornerRadius(15)
        .frame(width: 150, height: 270)
    }
}
struct StyleKitHomeCollection_Previews: PreviewProvider {
    static var previews: some View {
        StyleKitList()
    }
}
struct StyleKitHomeCollection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("“STYLE KITS”")
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                Text("The own name speaks for it self.")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.regular)
            }
            .padding(.horizontal, 30)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 18) {
                    ForEach(styleKitObj, id: \.self) { obj in
                        StyleKitCell(object: obj)
                    }
                }
                .padding(.horizontal, 30)
            }
            .frame(height: 270)
        }
    }
}
