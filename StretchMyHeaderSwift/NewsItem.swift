//
//  NewsItem.swift
//  StretchMyHeaderSwift
//
//  Created by Michael Reining on 2/17/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

enum NewsCategory {
    case World, Americas, Europe, MiddleEast, Africa, AsiaPacific
    func simpleDescription() -> String {
        switch self {
        case .World: return "World"
        case .Americas: return "Americas"
        case .Europe: return "Europe"
        case .MiddleEast: return "Middle East"
        case .Africa: return "Africa"
        case .AsiaPacific: return "Asia Pacific"
        }
    }
    func setColor() -> UIColor {
        switch self {
        case .World: return UIColor.blueColor()
        case .Americas: return UIColor.yellowColor()
        case .Europe: return UIColor.redColor()
        case .MiddleEast: return UIColor.greenColor()
        case .Africa: return UIColor.orangeColor()
        case .AsiaPacific: return UIColor.purpleColor()
        }
    }
}


class NewsItem {
    var headline: String
    var category: NewsCategory
    init(headline: String, category: NewsCategory) {
        self.headline = headline
        self.category = category
    }
}
