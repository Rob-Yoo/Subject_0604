//
//  TabBarController.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/7/24.
//

import UIKit
import Then

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTabBarController()
    }
    
    private func configureTabBarController() {
        self.tabBar.backgroundColor = .black
        self.viewControllers = Tab.allCases.map {
            let (title, image, selectedImage) = $0.tabItem

            return UINavigationController(rootViewController: $0.viewController).then {
                $0.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: image), selectedImage: UIImage(systemName: selectedImage))
            }
        }
    }
}

extension TabBarController {
    enum Tab: CaseIterable {
        case movieList
        case profile
        case lottery
        case movieChart
        
        var viewController: UIViewController {
            switch self {
            case .movieList:
                return MovieListViewController()
            case .profile:
                return UserJoinViewController()
            case .lottery:
                return LotteryViewController()
            case .movieChart:
                return MovieAPIViewController()
            }
        }
        
        var tabItem: (title: String, image: String, selectedImage: String) {
            switch self {
            case .movieList:
                return (title: "홈", image: "house", selectedImage: "house.fill")
            case .profile:
                return (title: "내 계정", image: "person", selectedImage: "person.fill")
            case .lottery:
                return (title: "로또 결과", image: "tray.full", selectedImage: "tray.full.fill")
            case .movieChart:
                return (title: "영화 순위", image: "movieclapper", selectedImage: "movieclapper.fill")
            }
        }
    }
}
