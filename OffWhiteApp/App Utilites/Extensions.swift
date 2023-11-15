//
//  Extensions.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 03/04/23.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboardWhenTappedAround() -> some View  {
        return self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                  to: nil, from: nil, for: nil)
        }
        func isIphoneXandAbove() -> Bool {
    //        return UIApplication.shared.statusBarFrame.size.height == 44 || UIApplication.shared.statusBarFrame.size.height == 47
            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
               let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
               
               return statusBarHeight > 20
        }
        func paddingBasedOnDevice(isSmallDevice: Bool = UIScreen.main.bounds.height < 812) -> some View {
            return self.padding(.top, isSmallDevice ? 10 : 30)
        }
        func isIphoneMaxDevice() -> Bool {
    //        return UIApplication.shared.statusBarFrame.size.width == 428 || UIApplication.shared.statusBarFrame.size.height > 428
            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
            let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            return statusBarHeight > 20 && UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale >= 896
        }
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

extension String {
    
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}").evaluate(with: self)
    }
    
    var numberValidation: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9]).{10}$").evaluate(with: self)
    }
}
