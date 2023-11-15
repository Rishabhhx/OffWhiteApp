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
    var imageArr: [String]
    var sizeArr: [String]
}

var shoesObj: [ShoesModel] = [ShoesModel(image: "shoe1", title1: "White", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike", subTitle2: "Oregon © 2022", price: "580",imageArr: ["shoe1detail1","shoe1detail2","shoe1detail3","shoe1detail4"], sizeArr: ["37","38","39","40"]),
                              ShoesModel(image: "shoe2", title1: "Kiger 5", title2: "“ZOOM TERRA”", subTitle1: "Off-White x Nike, ", subTitle2: "Off-White x Nike,", price: "543",imageArr: ["shoe2detail1","shoe2detail2","shoe2detail3","shoe2detail4"], sizeArr: ["37","38","39","40"]),
                              ShoesModel(image: "shoe3", title1: "MCA", title2: "“AIRFORCE 1”", subTitle1: "Off-White x Nike,", subTitle2: "Oregon © 2022", price: "230",imageArr: ["shoe3detail1","shoe3detail2","shoe3detail3","shoe3detail4"], sizeArr: ["37","38","39","40"]),
                              ShoesModel(image: "shoe4", title1: "Chuck Taylor", title2: "“ALL STAR”", subTitle1: "Off-White x Converse,", subTitle2: "Oregon © 2022", price: "1234",imageArr: ["shoe4detail1","shoe4detail2","shoe4detail3","shoe4detail4"], sizeArr: ["37","38","39","40"]),
                              ShoesModel(image: "shoe5", title1: "Black Royal", title2: "“LOW SP”", subTitle1: "Off-White x Air Jordan,", subTitle2: "Oregon © 2022", price: "2331",imageArr: ["shoe5detail1","shoe5detail2","shoe5detail3","shoe5detail4"], sizeArr: ["37","38","39","40"])]
