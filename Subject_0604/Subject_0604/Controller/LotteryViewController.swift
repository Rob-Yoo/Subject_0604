//
//  LotteryViewController.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/5/24.
//

import UIKit
import Combine

class LotteryViewController: UIViewController {

    private let lotteryRootView = LotteryRootView()
    private let model = LotteryModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        self.view = lotteryRootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.observeModel()
    }
}

extension LotteryViewController: LottoryRoundPickerViewDelegate {
    func roundPickerDidSelect(round: String) {
        self.model.fetchLotteryResult(round: round)
    }
}

//MARK: - Observing Model
extension LotteryViewController {
    func observeModel() {
        self.model.$lottery
            .receive(on: RunLoop.main)
            .sink { [weak self] new in
                self?.lotteryRootView.update(data: new)
            }
            .store(in: &cancellables)
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_LVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        LotteryViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_LVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_LVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
