//
//  ManWomanView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 09/09/23.
//

import SwiftUI

struct ManWomanList: View {
    @State var section: StoreSections = .man
    var columns: [GridItem] = [GridItem(.flexible(), spacing: 20), GridItem(.flexible())]
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(section == .man ? manObj.indices : womanObj.indices , id: \.self) { item in
                    ManWomanCell(object: section == .man ? manObj[item] : womanObj[item])
                }
            }
//            .padding(.top, 10)
            .padding(.horizontal, 30)
        }
    }
}

struct ManWomanCollection: View {
    let manWomanObj = manObj + womanObj
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("“MAIN”")
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                Text("Our principal outfit for your life, only hype contented included here. So please be careful.")
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.regular)
            }
            .padding(.horizontal, 30)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 18) {
                    ForEach(manWomanObj.shuffled(), id: \.self) { obj in
                        ManWomanCell(object: obj)
                    }
                }
                .padding(.horizontal, 30)
            }
        }
        .padding(.top, 10)
    }
}

struct ManWomanCollection_Previews: PreviewProvider {
    static var previews: some View {
        ManWomanList()
    }
}

struct ManWomanCell: View {
    var object: ManWomanModel = ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Image(object.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack {
                    HStack {
                        HStack(spacing: 6) {
                            Image("star")
                            Text(object.rating)
                                .font(.custom("Helvetica", size: 8))
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                        }
                        .frame(width: 42, height: 18)
                        .background(.ultraThinMaterial)
                        .background(.black.opacity(0.1))
                        .cornerRadius(10)
                        Spacer()
                    }
                    .padding(.top,14)
                    .padding(.horizontal, 12)
                    Spacer()
                }
            }
            .cornerRadius(15)
            .frame(width: 150, height: 270)
            HStack {
                VStack(alignment: .leading,spacing: 0) {
                    Text(object.title)
                        .font(.custom("Helvetica", size: 12))
                        .fontWeight(.bold)
                    Text("$\(object.price)")
                        .font(.custom("Helvetica", size: 12))
                        .fontWeight(.regular)
                }
                Spacer()
                Text("Open")
                    .font(.custom("Helvetica", size: 9))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 20)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(.black))
            }
        }
        .frame(width: 150)
    }
}
