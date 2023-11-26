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
    var imageArr: [String]
    var colorArr: [Color]
    var sizeArr: [String]
    var descritption: String
    var selectedSize: String?
    var selectedColor: Color?
}
var cartObj: [ManWomanModel] = []


var manObj: [ManWomanModel] = [ManWomanModel(image: "man1", title: "Monalise Hoodie", price: "680", rating: "5.0",imageArr: ["man1detail1","man1detail2","man1detail3","man1detail4"], colorArr: [.white,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Long sleeves hooded sweatshirt in white featuring the blue Monalisa on the front and black diagonals on the sleeves. "), ManWomanModel(image: "man2", title: "Arrows Sweat", price: "620", rating: "4.8",imageArr: ["man2detail1","man2detail2","man2detail3","man2detail4"], colorArr: [.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Black sweatshorts with Off-White™ logo on the front and Caravaggio arrows at back on one side.Elasticized waistband. Side pockets. Raw-edged."),ManWomanModel(image: "man3", title: "Style Hoodie", price: "680", rating: "5.0",imageArr: ["man3detail1","man3detail2","man3detail3","man3detail4"], colorArr: [.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Black sweatshorts with Off-White™ logo on the front and Caravaggio arrows at back on one side.Elasticized waistband. Side pockets. Raw-edged."), ManWomanModel(image: "man4", title: "Active Shirt", price: "500", rating: "3.8",imageArr: ["man4detail1","man4detail2","man4detail3","man4detail4"], colorArr: [.white,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Black sweatshorts with Off-White™ logo on the front and Caravaggio arrows at back on one side.Elasticized waistband. Side pockets. Raw-edged.")]

var womanObj: [ManWomanModel] = [ManWomanModel(image: "woman1", title: "Arrow S/S Shirt", price: "680", rating: "5.0",imageArr: ["woman1detail1","woman1detail2","woman1detail3","woman1detail4"], colorArr: [.gray], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Short sleeves T-Shirt in grey. Crewneck collar. Tonal arrows printed at back."), ManWomanModel(image: "woman2", title: "Logo U Shirt", price: "620", rating: "4.8",imageArr: ["woman2detail1","woman2detail2","woman2detail3","woman2detail4"], colorArr: [.brown,.black], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Short sleeves T-Shirt in grey. Crewneck collar. Tonal arrows printed at back."),ManWomanModel(image: "woman3", title: "Choime Tees", price: "680", rating: "5.0",imageArr: ["woman3detail1","woman3detail2","woman3detail3","woman3detail4"], colorArr: [.blue], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Short sleeves T-Shirt in grey. Crewneck collar. Tonal arrows printed at back."), ManWomanModel(image: "woman4", title: "Loose Top", price: "500", rating: "3.8",imageArr: ["woman4detail1","woman4detail2","woman4detail3","woman4detail4"], colorArr: [.gray], sizeArr: ["XXS","XS","S","L","XL"],descritption: "Short sleeves T-Shirt in grey. Crewneck collar. Tonal arrows printed at back.")]
