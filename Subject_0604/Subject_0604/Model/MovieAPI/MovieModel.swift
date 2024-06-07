//
//  MovieModel.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import Combine
import Foundation

class MovieModel {
    @Published var boxOfficeResult: BoxOfficeResult?
    
    init() {
        let yesterday = Date().getYesterDayString()
        
        self.fetchDailyBoxOffice(date: yesterday)
    }
    
    func fetchDailyBoxOffice(date: String) {
        let url = APIKey.movieURL + date

        NetworkManager.requestDailyBoxOfficeList(url: url) { [weak self] value in
            self?.boxOfficeResult = value.boxOfficeResult
        }
    }
}
