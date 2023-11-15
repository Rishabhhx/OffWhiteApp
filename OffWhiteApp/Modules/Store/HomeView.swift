//
//  HomeView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 08/09/23.
//

import SwiftUI

enum Sections: String, CaseIterable {
    case home = "home"
    case man = "man"
    case woman = "woman"
    case shoes = "shoes"
    case styleKits = "style kits"
}

enum HomeType {
    case store
    case brand
}

struct HomeView: View {
    
    @State private var favoriteColor = 0
    @State var selectedSection : Sections = .home
    @State var homeType: HomeType = .store
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    HomeHeader()
                    SectionsView(selectedSection: $selectedSection)
                    ScrollView(.vertical, showsIndicators: false) {
                        switch selectedSection {
                        case .home:
                            StyleKitHomeCollection()
                            MainCollection()
                            ShoesCollection()
                        case .man:
                            MainCollection()

                        case .woman:
                            MainCollection()

                        case .shoes:
                            ShoesCollection()

                        case .styleKits:
                            StyleKitHomeCollection()

                        }
                        HomeFooterView()
                    }
                    .padding(.top, 10)
                    Spacer()
                }
                HomeSwitchView(homeType: $homeType)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all, edges: .bottom)
            .modifier(BaseCustomModifier())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeHeader: View {
    var body: some View {
        HStack {
            Text("Off-White\u{2122}")
                .font(.custom("Helvetica", size: 34))
                .fontWeight(.bold)
            Spacer()
            Button {
                
            } label: {
                Image("menu")
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 30)
        .padding(.top, 18)
    }
}

struct SectionsView: View {
    @Binding var selectedSection: Sections
    var sectionsArr = Sections.allCases
    
    var body: some View {
        HStack {
            ForEach(0..<sectionsArr.count, id: \.self) { index in
                Button {
                    self.selectedSection = sectionsArr[index]
                } label: {
                    Text(sectionsArr[index].rawValue)
                        .font(.custom("Helvetica", size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(selectedSection == sectionsArr[index] ? .black : Color(red: 187/255, green: 184/255, blue: 184/255))
                }
                .buttonStyle(.plain)
                if !(index == sectionsArr.count-1) {
                    Spacer()
                }
            }
        }
        .padding(.top, 14)
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity)
    }
}

struct StyleKitCell: View {
    var object: StyleKitModel = StyleKitModel(image: "stylekit2", title: "Hold Stylish", subTitle: "Ok, this one is for who that really can hold style.", clothingCount: "2", saved: false)
    var body: some View {
        ZStack {
            Image(object.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
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
        .padding(.top, 10)
    }
}

struct MainCollection: View {
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

struct HomeSwitchButtonView: View {
    var text: String = "//STORE"
    var isSelected: Bool = false
    
    var body: some View {
        Text(text)
            .font(.custom("Helvetica", size: 12))
            .foregroundColor(.white)
            .fontWeight(.regular)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
    }
}

struct HomeSwitchView: View {
    
    @Binding var homeType: HomeType
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .frame(width: 138)
                .cornerRadius(40)
                .cornerRadius(40)
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .offset(x: homeType == .store ? -76 : 76)
            HStack {
                ForEach([(HomeType.store, "//STORE"), (HomeType.brand, "“BRAND”")], id: \.0) { type, title in
                    Button(action: {
                        self.homeType = type
                    }) {
                        HomeSwitchButtonView(text: title, isSelected: homeType == type)
                            .background(.black.opacity(0.0000001))
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }
            }
        }
        .frame(width: 300, height: 60)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .offset(y: UIScreen.main.bounds.height/3 - 40)
        .animation(.linear(duration: 0.2), value: homeType)
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

struct HomeFooterView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 9) {
                Text("Off-White\u{2122}")
                    .font(.custom("Helvetica", size: 23))
                    .fontWeight(.bold)
                Text("Defining the grey area between black and white as the color Off-White™")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Helvetica", size: 8))
                    .fontWeight(.regular)
            }
            .frame(maxWidth: .infinity)
            Spacer()
            Spacer()
            VStack(alignment: .trailing, spacing: 9) {
                HStack {
                    Image("Facebook")
                    Image("Twitter")
                    Image("Insta")
                    Image("TikTok")
                }
                Text("© 2021 Off-White. All rights reserved")
                    .multilineTextAlignment(.leading)
                    .font(.custom("Helvetica", size: 8))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 40)
    }
}
