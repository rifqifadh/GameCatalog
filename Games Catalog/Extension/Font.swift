//
//  Font.swift
//  Sticky Header
//
//  Created by Rifqi Fadhlillah on 01/08/20.
//

import SwiftUI

extension Font {
    
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
    }
}
