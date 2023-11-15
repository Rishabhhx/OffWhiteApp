//
//  ContactBrandView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 11/09/23.
//

import SwiftUI

struct ContactBrandView: View {
    
    let contactInfoArray: [CompanyInfo] = [
        CompanyInfo(
            title: "CALL EU",
            description: "+44 808 196 1114"
        ),
        CompanyInfo(
            title: "CALL USA",
            description: "+1 855-944-1216"
        ),
        CompanyInfo(
            title: "EMAIL",
            description: "Send us a message below or email ecommerce@off---white.com. We’ll reply within 24 hours."
        ),
        CompanyInfo(
            title: "WORKING HOURS",
            description: "Available Mon-Sat 9am-6.30pm"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("get in touch".uppercased())
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 30)
            Text("Customer service support, inquiries related to: prices and currency, order and preorder payment, order status, shipment info, return and exchange.")
                .font(.custom("Helvetica", size: 12))
                .fontWeight(.regular)
                .foregroundColor(.white)
            Text("Infos")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 30)
            ForEach(0..<4) { i in
                ContactInfoView(text1: contactInfoArray[i].title, text2: contactInfoArray[i].description)
            }
            Image("brandLogo")
                .padding(.top, 30)
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    ContactBrandView()
}

struct ContactInfoView: View {
    var text1: String = ""
    var text2: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text1)
                .font(.custom("Helvetica", size: 12))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(text2)
                .font(.custom("Helvetica", size: 12))
                .fontWeight(.regular)
                .foregroundColor(.white)
            Rectangle()
                .fill(.gray)
                .frame(height: 1)
                .padding(.top, 10)
        }
        .padding(.top, 18)
    }
}

