//
//  SampleData.swift
//  StretchMyHeader
//
//  Created by Michael Reining on 2/17/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import Foundation

var data = [
    ["category": "World","headline": "Test really short headline"],
    ["category":"Europe","headline":"Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"],
    ["category": "Middle East", "headline":"Airstrikes boost Islamic State, FBI director warns more hostages possible"],
    ["category": "Africa","headline":"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"],
    ["category": "Asia Pacific","headline":"Despite UN ruling, Japan seeks backing for whale hunting"],
    ["category": "Americas","headline":"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"],
    ["category": "World","headline":"South Africa in $40 billion deal for Russian nuclear reactors"],
    ["category": "Europe","headline":"One million babies' created by EU student exchanges"]
]

func stringToCategory(category: String) -> NewsCategory {
    switch category {
    case "World": return .World
    case "Africa": return .Africa
    case "Asia Pacific": return .AsiaPacific
    case "Europe": return .Europe
    case "Middle East": return .MiddleEast
    case "Americas": return .Americas
    default: return .World
    }
}

func newsFromData(data: [[String:String]]) -> [NewsItem] {
    var news = [NewsItem]()
    for item in data {
        var headline = item["headline"]!
        var category = item["category"]!
        var categoryEnum = stringToCategory(category)
        var article = NewsItem(headline: headline, category: categoryEnum)
        news.append(article)
        
    }
    return news
}
