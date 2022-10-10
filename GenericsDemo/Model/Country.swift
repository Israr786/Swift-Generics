//
//  Country.swift
//  GenericsDemo
//
//  Created by Israrul on 10/8/22.
//

import Foundation

struct Country: Codable, Identifiable, Hashable {
    var capital: String
    var code: String
    var currency: Currency
    var flag: String
    var language: Language
    var name: String
    var region: String

    // provide id: for identifiable (for List)
    var id: String { name }

    // provide for hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    // provide for equatable, only care about the name
    // to be complete this "should" compare every component
    // that is an implemention detail for later/improvement
    //
    static func == (lhs: Country, rhs: Country) -> Bool {
        return lhs.name == rhs.name
    }

    // provide an init -- to populate CountryView
    init(_ name: String,
         _ region: String,
         _ code: String,
         _ capital: String
    ) {
        self.capital = capital
        self.code = code
        self.currency = Currency(code: "", name: "", symbol: "")
        self.flag = ""
        self.language = Language(code: "", name: "")
        self.name = name
        self.region = region
    }
}

struct Currency: Codable {
    var code: String
    var name: String
    var symbol: String?
}

struct Language: Codable {
    var code: String?
    var name: String?
}


