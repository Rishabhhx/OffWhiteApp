//
//  ShoesView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 09/09/23.
//

import SwiftUI

struct ShoesList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            LazyVStack(spacing: 18) {
                ForEach(shoesObj.indices, id: \.self) { item in
                    ShoesCell(object: shoesObj[item])
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
        }
    }
}
    
    
    struct ShoesCollection: View {
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading) {
                    Text("“SHOES”")
                        .font(.custom("Helvetica", size: 18))
                        .fontWeight(.bold)
                    Text("Our premium footwear selection for your lifestyle, featuring only the most stylish and high-quality options. Browse with confidence.")
                        .font(.custom("Helvetica", size: 10))
                        .fontWeight(.regular)
                }
                .padding(.horizontal, 30)
                LazyVStack(spacing: 18) {
                    ForEach(0..<3, id: \.self) { item in
                        ShoesCell(object: shoesObj[item])
                    }
                }
                .padding(.horizontal, 30)
            }
            .padding(.top, 10)
        }
    }
    struct ShoesCollection_Previews: PreviewProvider {
        static var previews: some View {
            ShoesCollection()
        }
    }
    struct ShoesCell: View {
        var object: ShoesModel = ShoesModel(image: "shoe1", title1: "White", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike", subTitle2: "Oregon © 2022", price: "580")
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(object.title1)
                        .font(.custom("Helvetica", size: 22))
                        .fontWeight(.bold)
                    Text(object.title2)
                        .font(.custom("Helvetica", size: 19))
                        .fontWeight(.regular)
                }
                Text(object.subTitle1)
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.bold)
                Text(object.subTitle2)
                    .font(.custom("Helvetica", size: 10))
                    .fontWeight(.bold)
                Image(object.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                HStack {
                    Text("$\(object.price)")
                        .font(.custom("Helvetica", size: 16))
                        .fontWeight(.regular)
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
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
        }
    }
