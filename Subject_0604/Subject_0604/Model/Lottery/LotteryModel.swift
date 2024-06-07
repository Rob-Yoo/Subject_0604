//
//  LotteryModel.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/5/24.
//

import Combine
import Alamofire
import Foundation

final class LotteryModel {
    @Published var lottery: LotteryEntity?
    
    init() {
        let latestLotteryRound = UserDefaults.standard.integer(forKey: UserDefaults.lottoRoundKey)
        self.fetchLotteryResult(round: String(latestLotteryRound))
    }
    
    func fetchLotteryResult(round: String) {
        let url = APIKey.lotteryURL + round
        
        NetworkManager.requestLotteryResult(url: url) { [weak self] value in
            self?.lottery = value
        }
    }
}
