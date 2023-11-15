//
//  ShoesModel.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 09/09/23.
//

import SwiftUI

struct ShoesModel: Hashable {
    var id: UUID?
    var image: String
    var title1: String
    var title2: String
    var subTitle1: String
    var subTitle2: String
    var price: String
}

var shoesObj: [ShoesModel] = [ShoesModel(image: "shoe1", title1: "White", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike", subTitle2: "Oregon © 2022", price: "580"),ShoesModel(image: "shoe2", title1: "Kiger 5", title2: "“ZOOM TERRA”", subTitle1: "Off-White x Nike, ", subTitle2: "Off-White x Nike,", price: "543"),ShoesModel(image: "shoe3", title1: "MCA", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike,", subTitle2: "Oregon © 2022", price: "230"),ShoesModel(image: "shoe4", title1: "Chuck Taylor", title2: "“ALL STAR”", subTitle1: "Off-White x Converse,", subTitle2: "Oregon © 2022", price: "1234"),ShoesModel(image: "shoe5", title1: "Black Royal", title2: "“LOW SP”", subTitle1: "Off-White x Air Jordan,", subTitle2: "Oregon © 2022", price: "2331")]
