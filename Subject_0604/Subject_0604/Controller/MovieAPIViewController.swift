//
//  MovieAPIViewController.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import UIKit
import Combine

class MovieAPIViewController: UIViewController {

    private let rootView = MovieAPIRootView()
    private let model = MovieModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView.movieAPIRootViewDelegate = self
        self.rootView.addUserAction()
        self.observingModel()
    }
}

//MARK: - User Action Handling
extension MovieAPIViewController: MovieAPIRootViewDelegate {
    func searchButtonTapped(date: String) {
        self.model.fetchDailyBoxOffice(date: date)
    }
}

//MARK: - Observing Model
extension MovieAPIViewController {
    private func observingModel() {
        self.model.$boxOfficeResult
            .receive(on: RunLoop.main)
            .sink { [weak self] new in
                self?.rootView.update(data: new)
            }
            .store(in: &cancellables)
    }
}


#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_MAVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        MovieAPIViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_MAVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_MAVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
