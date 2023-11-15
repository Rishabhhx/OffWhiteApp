//
//  SideMenuView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 10/09/23.
//

import SwiftUI

enum MenuOptions: String, CaseIterable, Hashable {
    case home = "“HOME”"
    case orders = "“ORDERS”"
    case favourites = "“FAVORITES”"
    case cart = "“CART”"
    case options = "“OPTIONS”"
}

struct SideMenuView: View {
    
    @Binding var showSideMenu: Bool
    @Binding var selectedMenu: MenuOptions

    var menuOptionsArr = MenuOptions.allCases
    
    var body: some View {
        VStack {
            HomeHeader(showSideMenu: $showSideMenu, image: "cross")
                .foregroundColor(.white)
            VStack(spacing: 26) {
                ForEach(Array(menuOptionsArr.enumerated()), id: \.element) { index, menu in
                    Button {
                        selectedMenu = menu
                        showSideMenu.toggle()
                    } label: {
                        MenuOptionView(number: "\(index + 1)", title: menu.rawValue)
                    }
                }
            }
            .padding(30)
            Spacer()
            HomeFooterView(light: false)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .offset(x: showSideMenu ? 0 : UIScreen.main.bounds.width)
        .modifier(BaseCustomModifier())
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showSideMenu: .constant(true), selectedMenu: .constant(.home))
    }
}

struct MenuOptionView: View {
    var number: String = "01"
    var title: String = "home"
    
    var body: some View {
        HStack {
            Text("0\(number)")
                .font(.custom("Helvetica", size: 13))
                .fontWeight(.regular)
                .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
            Text(title)
                .font(.custom("Helvetica", size: 45))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
    }
}
