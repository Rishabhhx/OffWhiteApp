//
//  OptionsView.swift
//  OffWhiteApp
//
//  Created by Rishabh Sharma(Work) on 10/09/23.
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("noOptions")
                Spacer()
                Spacer()
            }
            VStack {
                Spacer()
                HomeFooterView(light: false)
                    .foregroundColor(.white)
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
