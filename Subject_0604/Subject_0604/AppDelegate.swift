//
//  AppDelegate.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        var latestLottoRound = UserDefaults.standard.integer(forKey: UserDefaults.lottoRoundKey)
        
        if (latestLottoRound == 0) {
            latestLottoRound = 1122
            UserDefaults.standard.setValue(latestLottoRound, forKey: UserDefaults.lottoRoundKey)
        }
        
        let url = APIKey.lotteryURL + String(latestLottoRound + 1)
        
        NetworkManager.requestLotteryResult(url: url) { value in
            UserDefaults.standard.setValue(latestLottoRound + 1, forKey: UserDefaults.lottoRoundKey)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

