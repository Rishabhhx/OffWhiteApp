//
//  HomeView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 10/09/23.
//

import SwiftUI
import Shimmer
struct StoreBrandView: View {
    @Binding var homeType: HomeType
    @Binding var selectedSection : StoreSections
    @Binding var selectedBrandSection : BrandSections
    @Binding var hideMainButtons: Bool
    @State var startingOffset: CGFloat = 0
    @State private var viewDidLoad = false

    var body: some View {
        VStack(spacing: 0) {
            SectionsView(selectedSection: $selectedSection, selectedBrandSection: $selectedBrandSection, homeType: $homeType, hideMainButtons: $hideMainButtons)
            ScrollViewReader { reader in
                ScrollView(.vertical, showsIndicators: false) {
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: 0, height: 0)
                            .onChange(of: geo.frame(in: .global).midY) { oldValue, newValue in
                                print("old\(oldValue)new\(newValue)")
                                if ((oldValue >= newValue && newValue < startingOffset)) {
                                    hideMainButtons = true
                                } else {
                                    hideMainButtons = false
                                }
                            }
                            .id(0)
                            .onAppear() {
                                if viewDidLoad == false {
                                    viewDidLoad = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        startingOffset = geo.frame(in: .global).midY
                                    }
                                    print("viewDidLoad")
                                }
                            }
                    }
                    switch homeType {
                    case .store:
                        switch selectedSection {
                        case .home:
                            StyleKitHomeCollection()
                            ManWomanCollection()
                            ShoesCollection()
                        case .man:
                            ManWomanList(section: .man)
                        case .woman:
                            ManWomanList(section: .woman)
                        case .shoes:
                            ShoesList()
                        case .styleKits:
                            StyleKitList()
                        }
                    case .brand:
                        switch selectedBrandSection {
                        case .home:
                            HomeBrandView(selectedBrandSection: $selectedBrandSection)
                        case .stories:
                            StoriesBrandView()
                        case .careers:
                            CareersBrandView()
                        case .about:
                            AboutBrandView()
                        case .contact:
                            ContactBrandView()
                        }
                    }
                    HomeFooterView(light: homeType == .store ? true : false)
                        .foregroundColor( homeType == .store ? .black : .white)
                }
                .onChange(of: selectedSection, perform: { newValue in
                    reader.scrollTo(0, anchor: .top)
                })
                .onChange(of: selectedBrandSection, perform: { newValue in
                    reader.scrollTo(0, anchor: .top)
                })
                .padding(.top, 10)
            }
        }
    }
}

struct SectionsView: View {
    @Binding var selectedSection: StoreSections
    @Binding var selectedBrandSection: BrandSections
    @Binding var homeType: HomeType
    @Binding var hideMainButtons: Bool

    var sectionsArr = StoreSections.allCases
    var sectionsBrandArr = BrandSections.allCases
    
    var body: some View {
        HStack {
            ForEach(0..<(sectionsArr.count), id: \.self) { index in
                Button {
                    switch homeType {
                    case .store:
                        self.selectedSection = sectionsArr[index]
                    case .brand:
                        self.selectedBrandSection = sectionsBrandArr[index]
                    }
                } label: {
                    switch homeType {
                    case .store:
                        Text(sectionsArr[index].rawValue)
                            .font(.custom("Helvetica", size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(selectedSection == sectionsArr[index] ? .black : Color(red: 187/255, green: 184/255, blue: 184/255))
                    case .brand:
                        Text(sectionsBrandArr[index].rawValue)
                            .font(.custom("Helvetica", size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(selectedBrandSection == sectionsBrandArr[index] ? .white : Color(red: 102/255, green: 102/255, blue: 102/255))
                    }
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

#Preview {
    StoreBrandView(homeType: .constant(.store), selectedSection: .constant(.home), selectedBrandSection: .constant(.home), hideMainButtons: .constant(false))

}
