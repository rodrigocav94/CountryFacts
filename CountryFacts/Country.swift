//
//  Country.swift
//  CountryFacts
//
//  Created by Rodrigo Cavalcanti on 04/06/24.
//

import UIKit

struct Country: Codable {
    let name, capital, size, population, currency, fact: String
}

extension Country {
    static let all: [Country] = {
        let countryFactsURL = Bundle.main.url(forResource: "CountryFacts", withExtension: "json")
        let decoder = JSONDecoder()
        
        guard let countryFactsURL,
              let data = try? Data(contentsOf: countryFactsURL),
              let allCountryFacts = try? decoder.decode([Country].self, from: data) else { return [] }
        
        return allCountryFacts
    }()
}
