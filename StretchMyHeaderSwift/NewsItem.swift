//
//  NewsItem.swift
//  StretchMyHeaderSwift
//
//  Created by Michael Reining on 2/17/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import Foundation

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
}


class NewsItem {
    var headline: String
    var category: NewsCategory
    init(headline: String, category: NewsCategory) {
        self.headline = headline
        self.category = category
    }
}
