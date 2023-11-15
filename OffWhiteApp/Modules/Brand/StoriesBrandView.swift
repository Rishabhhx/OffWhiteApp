//
//  StoriesBrandView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 10/09/23.
//

import SwiftUI

struct StoriesBrandView: View {
    var body: some View {
        VStack {
            LazyVStack {
                ForEach(storiesObj.indices, id: \.self) { item in
                    StoriesCell(object: storiesObj[item])
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct StoriesBrandView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesBrandView()
    }
}

struct StoriesCell: View {
    var object: StoriesModel = StoriesModel(image: "story1", title: "BROWN POWER", subTitle: "Only for those who knows how to be brown.", timeRead: "4")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(object.title)
                .font(.custom("Helvetica", size: 24))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(object.subTitle)
                .font(.custom("Helvetica", size: 10))
                .fontWeight(.regular)
                .foregroundColor(.white)
            Image(object.image)
                .resizable()
                .frame(height: 214)
            HStack {
                Text("\(object.timeRead) min read")
                    .font(.custom("Helvetica", size: 9))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                Spacer()
                Text("open")
                    .font(.custom("Helvetica", size: 9))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 20)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(.white))
            }
        }
    }
}
