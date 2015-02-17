// Playground - noun: a place where people can play

import UIKit


var data = [
    ["category": "World","headline": "Climate change protests, divestments meet fossil fuels realities"],
    ["category":"Europe","headline":"Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"],
    ["category": "Middle East", "headline":"Airstrikes boost Islamic State, FBI director warns more hostages possible"],
    ["category": "Africa","headline":"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"],
    ["category": "Asia Pacific","headline":"Despite UN ruling, Japan seeks backing for whale hunting"],
    ["category": "Americas","headline":"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"],
    ["category": "World","headline":"South Africa in $40 billion deal for Russian nuclear reactors"],
    ["category": "Europe","headline":"One million babies' created by EU student exchanges"]
]

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

var article1 = NewsItem(headline: "Climate change protests, divestments meet fossil fuels realities", category: .World)



//var article2 = NewsItem(headline: data[1].0, category: data[1].1)

article1.category.simpleDescription()

var news = [NewsItem]()

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

for item in data {
    var headline = item["headline"]!
    var category = item["category"]!
    var categoryEnum = stringToCategory(category)
    var article = NewsItem(headline: headline, category: categoryEnum)
    news.append(article)
}

news.count
var article = news[2]
article.headline
article.category.simpleDescription()





