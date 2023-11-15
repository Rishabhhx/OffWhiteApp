//
//  AboutBrandView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 11/09/23.
//

import SwiftUI

struct AboutBrandView: View {
    
    var columns: [GridItem] = [GridItem(.flexible(), spacing: 20), GridItem(.flexible())]
    var object: [AboutData] = [AboutData(image: "about1", text1: "Store", text2: "Vancouver, Canada"),AboutData(image: "about2", text1: "Store", text2: "Hong Kong"),AboutData(image: "about3", text1: "Store", text2: "Tokyo, Japan"),AboutData(image: "about4", text1: "Store", text2: "Miami, USA")]
    let companyInfoArray: [CompanyInfo] = [
        CompanyInfo(
            title: "Vision",
            description: "To organize the world‘s information and make it universally accessible and useful."
        ),
        CompanyInfo(
            title: "Values",
            description: "Company values don’t have to be unique; they should be what your company wants to see in itself and its employees."
        ),
        CompanyInfo(
            title: "Mission",
            description: "To provide superior quality style services that: USERS recommend to family and friends, STYLISTS prefer for their patients, PURCHASERS select for their clients, EMPLOYEES are proud of, and INVESTORS seek for long-term returns."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("WHERE WE ARE?")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
            LazyVGrid(columns: columns, content: {
                ForEach(object, id: \.self) { item in
                    AboutTopGridView(image: item.image, text1: item.text1, text2: item.text2)
                }
            })
            Text("FROM WE WORK")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 42)
            Image("about5")
                .resizable()
                .frame(height: 328)
            Text("Headquarters")
                .font(.custom("Helvetica", size: 15))
                .fontWeight(.regular)
                .foregroundColor(.white)
            Text("Milan, Italy")
                .font(.custom("Helvetica", size: 33))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("WHO WE ARE?")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 30)
            ForEach(0..<3) { i in
                WhoAreWeDescText(text1: companyInfoArray[i].title, text2: companyInfoArray[i].description)
            }
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    AboutBrandView()
}

struct AboutTopGridView: View {
    
    var image: String = ""
    var text1: String = ""
    var text2: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 147, height: 157)
            Text(text1)
                .font(.custom("Helvetica", size: 7))
                .fontWeight(.regular)
                .foregroundColor(.white)
            Text(text2)
                .font(.custom("Helvetica", size: 15))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct AboutData: Hashable {
    var image: String
    var text1: String
    var text2: String
}

struct WhoAreWeDescText: View {
    var text1: String = ""
    var text2: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(text1)
                .font(.custom("Helvetica", size: 24))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(text2)
                .font(.custom("Helvetica", size: 12))
                .fontWeight(.regular)
                .foregroundColor(.white)
        }
        .padding(.top, 18)
    }
}

struct CompanyInfo {
    var title: String
    var description: String
}
