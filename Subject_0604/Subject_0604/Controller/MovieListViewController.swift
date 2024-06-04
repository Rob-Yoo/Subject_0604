//
//  ViewController.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit

class MovieListViewController: UIViewController {
    
    let rootView = MovieListRootView()
    
    override func loadView() {
        self.view = self.rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureNavigationBar()
    }

}

extension MovieListViewController {
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.title = "지뉴님"
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_MLVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        MovieListViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_MLVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_MLVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
