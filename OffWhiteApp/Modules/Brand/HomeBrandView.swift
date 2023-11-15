//
//  HomeBrandView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 10/09/23.
//

import SwiftUI

struct HomeBrandView: View {
    @Binding var selectedBrandSection: BrandSections
    var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text("We design and ship products that transform LIFES AND STYLES.")
                    .font(.custom("Helvetica", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("An Virgil Abloh “TRIBUTE”")
                    .font(.custom("Helvetica", size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image("brandRect")
                    .resizable()
                    .frame(height: 78)
                Image("brandLogo")
                    .resizable()
                    .frame(height: 312)
                HStack {
                    Text("//STORE")
                        .font(.custom("Helvetica", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Text("“BRAND”")
                        .font(.custom("Helvetica", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Text("Brand Guide")
                    .font(.custom("Helvetica", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                VStack(spacing: 26) {
                    ForEach(Array(BrandSections.allCases.enumerated()), id: \.element) {                         index, menu in
                        if index > 0 {
                            Button {
                                selectedBrandSection = menu
                            } label: {
                                MenuOptionView(number: "\(index)", title: menu.rawValue.uppercased())
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
    }
}

struct HomeBrandView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBrandView(selectedBrandSection: .constant(.home))
    }
}
