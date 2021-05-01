//
//  Json4Swift_Base.swift
//  CryptocurrencyApp
//
//  Created by Dastan Mambetaliev on 1/5/21.
//

import Foundation
struct Json4Swift_Base : Decodable {
    let status : Status?
    let data : [HeadData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        status = try? values?.decodeIfPresent(Status.self, forKey: .status)
        data = try? values?.decodeIfPresent([HeadData].self, forKey: .data)
    }

}
