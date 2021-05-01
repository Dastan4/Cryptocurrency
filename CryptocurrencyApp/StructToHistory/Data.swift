//
//  Data1.swift
//  CryptocurrencyApp
//
//  Created by Dastan Mambetaliev on 1/5/21.
//

import Foundation
struct TimeData: Decodable{
    let high: Double?
    
    enum CodingKeys: String, CodingKey {
        case high
        
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        high = try? values?.decodeIfPresent(Double.self, forKey: .high)
    
    }

}
