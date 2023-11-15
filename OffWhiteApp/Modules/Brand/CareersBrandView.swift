//
//  CareersBrandView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 10/09/23.
//

import SwiftUI

struct CareersBrandView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("WE LOOK COOL OUTSIDE?")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 30)
            Image("story2")
                .resizable()
                .frame(height: 249)
            Text("IT’S BECAUSE YOU DIDN’T SEE US INSIDE.")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 30)
            BenifitsView()
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(.black)
    }
}

struct CareersBrandView_Previews: PreviewProvider {
    static var previews: some View {
        CareersBrandView()
    }
}

struct BenifitsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Benefits")
                .font(.custom("Helvetica", size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
            HStack(spacing: 22) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("30")
                        .font(.custom("Helvetica", size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("days of vacancy")
                        .font(.custom("Helvetica", size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("We want you to use all of them. We are also closed for one week during the holidays.")
                        .font(.custom("Helvetica", size: 9))
                        .fontWeight(.regular)
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("100%")
                        .font(.custom("Helvetica", size: 48))
                        .fontWeight(.bold)
                    Text("health care")
                        .font(.custom("Helvetica", size: 15))
                        .fontWeight(.bold)
                    Text("We pay your entire monthly premium and cover 70% for spouses, partners, and dependents.")
                        .font(.custom("Helvetica", size: 9))
                        .fontWeight(.regular)
                }
            }
            HStack(spacing: 22) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("126k")
                        .font(.custom("Helvetica", size: 48))
                        .fontWeight(.bold)
                    Text("nonelective 3% match")
                        .font(.custom("Helvetica", size: 15))
                        .fontWeight(.bold)
                    Text("We contribute to every person’s retirement account regardless of their own contribution.")
                        .font(.custom("Helvetica", size: 9))
                        .fontWeight(.regular)
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("Zero".uppercased())
                        .font(.custom("Helvetica", size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("reports")
                        .font(.custom("Helvetica", size: 15))
                        .fontWeight(.bold)
                    Text("People here are trusted to get their work done and spend money responsibly.")
                        .font(.custom("Helvetica", size: 9))
                        .fontWeight(.regular)
                }
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 30)
        .frame(maxHeight: .infinity)
    }
}
