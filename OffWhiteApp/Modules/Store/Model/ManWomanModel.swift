//
//  ManWomanModel.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 09/09/23.
//

import SwiftUI

struct ManWomanModel: Hashable {
    var id: UUID?
    var image: String
    var title: String
    var price: String
    var rating: String
}

var manObj: [ManWomanModel] = [ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0"), ManWomanModel(image: "man2", title: "Arrows Sweat", price: "620", rating: "4.8"),ManWomanModel(image: "man3", title: "Style Hoodie", price: "680", rating: "5.0"), ManWomanModel(image: "man4", title: "Active Shirt", price: "500", rating: "3.8")]

var womanObj: [ManWomanModel] = [ManWomanModel(image: "woman1", title: "Arrow S/S Shirt", price: "680", rating: "5.0"), ManWomanModel(image: "woman2", title: "Logo U Shirt", price: "620", rating: "4.8"),ManWomanModel(image: "woman3", title: "Choime Tees", price: "680", rating: "5.0"), ManWomanModel(image: "woman4", title: "Loose Top", price: "500", rating: "3.8")]
