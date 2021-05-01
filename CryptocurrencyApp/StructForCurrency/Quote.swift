//
//  Quote.swift
//  CryptocurrencyApp
//
//  Created by Dastan Mambetaliev on 1/5/21.
//

import Foundation
struct Quote : Decodable {
    let USD : USDPrice?

    enum CodingKeys: String, CodingKey {

        case USD = "USD"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        USD = try? values?.decodeIfPresent(USDPrice.self, forKey: .USD)
    }

}
