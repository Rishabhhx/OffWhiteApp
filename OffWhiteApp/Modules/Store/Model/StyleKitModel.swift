//
//  StyleKitModel.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 09/09/23.
//

import SwiftUI

struct StyleKitModel: Hashable {
    var id: UUID?
    var image: String
    var title: String
    var subTitle: String
    var clothingCount: String
    var saved: Bool
}

var styleKitObj: [StyleKitModel] = [StyleKitModel(image: "stylekit1", title: "BROWN POWER", subTitle: "Only for those who knows how to be brown.", clothingCount: "4", saved: false),StyleKitModel(image: "stylekit2", title: "NIGHT FEATURES", subTitle: "Waking up at night meaning some style too.", clothingCount: "3", saved: false),StyleKitModel(image: "stylekit4", title: "Frozen white", subTitle: "Be cold and freeze the ones that you want.", clothingCount: "2", saved: false),StyleKitModel(image: "stylekit3", title: "Hold Stylish", subTitle: "Ok, this one is for who that really can hold style.", clothingCount: "2", saved: false)]
