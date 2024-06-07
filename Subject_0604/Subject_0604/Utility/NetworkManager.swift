//
//  NetworkManager.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import Alamofire

struct NetworkManager {
    static func requestLotteryResult(url: String, success: @escaping (_ value: LotteryEntity) -> Void, failure: @escaping (_ error: Error) -> Void = { error in print(error) }) {

        AF.request(url).responseDecodable(of: LotteryEntity.self) { res in
            switch res.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    static func requestDailyBoxOfficeList(url: String, success: @escaping (_ value: MovieEntity) -> Void, failure: @escaping (_ error: Error) -> Void = { error in print(error) }) {
        
        AF.request(url).responseDecodable(of: MovieEntity.self) { res in
            switch res.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
//        AF.request(url).responseString { res in
//            print(res)
//        }
    }
}
