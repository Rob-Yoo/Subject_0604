//
//  NetworkManager.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import Alamofire

struct NetworkManager {
    static func requestLotteryResult(url: String, success: @escaping (_ value: LotteryEntity) -> Void, failure: @escaping (_ error: Error) -> Void = { _ in }) {

        AF.request(url).responseDecodable(of: LotteryEntity.self) { res in
            switch res.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
