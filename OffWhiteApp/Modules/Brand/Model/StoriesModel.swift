//
//  StoriesModel.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 10/09/23.
//

import SwiftUI
struct StoriesModel: Hashable {
    var id: UUID?
    var image: String
    var title: String
    var subTitle: String
    var timeRead: String
}

var storiesObj: [StoriesModel] = [StoriesModel(image: "story3", title: "Is Off-White’s Popularity Cooling Down?", subTitle: "Once called the “hottest brand on the planet,” Off-White has fallen in popularity over recent years. Can a push into China rekindle its coolness?", timeRead: "4"),StoriesModel(image: "story2", title: "The Legacy of Virgil Abloh", subTitle: "How one man changed and affected the lives of many with his designs. Abloh was a visionary designer who was a leading fashion.", timeRead: "3"),StoriesModel(image: "story1", title: "Power of a Ubiquitous Logo", subTitle: "It is difficult to deny the sheer force that has catapulted Off-White to the forefront of the minds of young, hip, fashion-focused consumers.", timeRead: "2"),StoriesModel(image: "story4", title: "The Success of Off–White Is Anything But Ironic", subTitle: "It is difficult to deny the sheer force that has catapulted Off-White to the forefront of the minds of young, hip, fashion-focused consumers.", timeRead: "2")]
