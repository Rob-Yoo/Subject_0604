//
//  MovieEntity.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import Foundation

struct MovieEntity: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}
        
struct DailyBoxOffice: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
}
