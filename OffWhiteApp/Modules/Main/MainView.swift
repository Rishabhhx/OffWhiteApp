//
//  MainView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 08/09/23.
//

import SwiftUI

enum StoreSections: String, CaseIterable {
    case home = "home"
    case man = "man"
    case woman = "woman"
    case shoes = "shoes"
    case styleKits = "style kits"
}

enum BrandSections: String, CaseIterable {
    case home = "home"
    case stories = "stories"
    case careers = "careers"
    case about = "about"
    case contact = "contact"
}

enum HomeType {
    case store
    case brand
}

struct MainView: View {
    
    @State private var favoriteColor = 0
    @State var homeType: HomeType = .store
    @State var showSideMenu: Bool = false
    @State var selectedMenu: MenuOptions = .home
    @State var selectedSection : StoreSections = .home
    @State var selectedBrandSection : BrandSections = .home
    @State var hideMainButtons: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    HomeHeader(showSideMenu: $showSideMenu, image: (selectedMenu == .options || homeType == .brand) ? "menuWhite" : "menu")
                        .foregroundColor((selectedMenu == .options || homeType == .brand) ? .white : .black)
                    switch selectedMenu {
                    case .home:
                        StoreBrandView(homeType: $homeType,selectedSection: $selectedSection, selectedBrandSection: $selectedBrandSection, hideMainButtons: $hideMainButtons)
                        Spacer()
                    case .orders:
                        EmptyView()
                        Spacer()
                    case .favourites:
                        EmptyView()
                        Spacer()
                    case .cart:
                        EmptyView()
                        Spacer()
                    case .options:
                        OptionsView()
                    }
                }
                .animation(nil, value: UUID())
                if !(selectedMenu == .options) {
                        MainSwitchView(homeType: $homeType,selectedSection: $selectedSection, selectedBrandSection: $selectedBrandSection)
                        .offset(y: hideMainButtons ? UIScreen.main.bounds.height : UIScreen.main.bounds.height/3 - 40)
                }
                SideMenuView(showSideMenu: $showSideMenu, selectedMenu: $selectedMenu)
            }
            .animation(.linear(duration: 0.3), value: showSideMenu)
            .animation(.linear(duration: 0.5), value: hideMainButtons)
            .background((selectedMenu == .options || homeType == .brand) ? .black : .white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all, edges: .bottom)
            .modifier(BaseCustomModifier())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct MainSwitchButtonView: View {
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

struct MainSwitchView: View {
    @Binding var homeType: HomeType
    @Binding var selectedSection : StoreSections
    @Binding var selectedBrandSection : BrandSections
    
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
                        selectedSection = .home
                        selectedBrandSection = .home
                    }) {
                        MainSwitchButtonView(text: title, isSelected: homeType == type)
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
//        .offset(y: UIScreen.main.bounds.height/3 - 40)
        .animation(.linear(duration: 0.2), value: homeType)
    }
}



