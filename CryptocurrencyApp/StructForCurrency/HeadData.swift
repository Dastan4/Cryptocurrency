//
//  File.swift
//  CryptocurrencyApp
//
//  Created by Dastan Mambetaliev on 1/5/21.
//

import Foundation
struct HeadData : Decodable {
    let id : Int?
    let name : String?
    let symbol : String?
    let slug : String?
    let num_market_pairs : Int?
    let date_added : String?
    let tags : [String]?
    let max_supply : Int?
    let circulating_supply : Int?
    let total_supply : Int?
    let platform : String?
    let cmc_rank : Int?
    let last_updated : String?
    let quote : Quote?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case symbol = "symbol"
        case slug = "slug"
        case num_market_pairs = "num_market_pairs"
        case date_added = "date_added"
        case tags = "tags"
        case max_supply = "max_supply"
        case circulating_supply = "circulating_supply"
        case total_supply = "total_supply"
        case platform = "platform"
        case cmc_rank = "cmc_rank"
        case last_updated = "last_updated"
        case quote = "quote"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        id = try? values?.decodeIfPresent(Int.self, forKey: .id)
        name = try? values?.decodeIfPresent(String.self, forKey: .name)
        symbol = try? values?.decodeIfPresent(String.self, forKey: .symbol)
        slug = try? values?.decodeIfPresent(String.self, forKey: .slug)
        num_market_pairs = try? values?.decodeIfPresent(Int.self, forKey: .num_market_pairs)
        date_added = try? values?.decodeIfPresent(String.self, forKey: .date_added)
        tags = try? values?.decodeIfPresent([String].self, forKey: .tags)
        max_supply = try? values?.decodeIfPresent(Int.self, forKey: .max_supply)
        circulating_supply = try? values?.decodeIfPresent(Int.self, forKey: .circulating_supply)
        total_supply = try? values?.decodeIfPresent(Int.self, forKey: .total_supply)
        platform = try? values?.decodeIfPresent(String.self, forKey: .platform)
        cmc_rank = try? values?.decodeIfPresent(Int.self, forKey: .cmc_rank)
        last_updated = try? values?.decodeIfPresent(String.self, forKey: .last_updated)
        quote = try? values?.decodeIfPresent(Quote.self, forKey: .quote)
    }

}
