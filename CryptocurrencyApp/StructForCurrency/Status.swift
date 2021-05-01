//
//  Status.swift
//  CryptocurrencyApp
//
//  Created by Dastan Mambetaliev on 1/5/21.
//


import Foundation
struct Status : Decodable {
    let timestamp : String?
    let error_code : Int?
    let error_message : String?
    let elapsed : Int?
    let credit_count : Int?
    let notice : String?
    let total_count : Int?

    enum CodingKeys: String, CodingKey {

        case timestamp = "timestamp"
        case error_code = "error_code"
        case error_message = "error_message"
        case elapsed = "elapsed"
        case credit_count = "credit_count"
        case notice = "notice"
        case total_count = "total_count"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        timestamp = try? values?.decodeIfPresent(String.self, forKey: .timestamp)
        error_code = try? values?.decodeIfPresent(Int.self, forKey: .error_code)
        error_message = try? values?.decodeIfPresent(String.self, forKey: .error_message)
        elapsed = try? values?.decodeIfPresent(Int.self, forKey: .elapsed)
        credit_count = try? values?.decodeIfPresent(Int.self, forKey: .credit_count)
        notice = try? values?.decodeIfPresent(String.self, forKey: .notice)
        total_count = try? values?.decodeIfPresent(Int.self, forKey: .total_count)
    }

}
