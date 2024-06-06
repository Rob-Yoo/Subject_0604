//
//  LottoryRoundPickerView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import UIKit

final class LotteryRoundPickerView: UIPickerView {
    
    private let latestRound = UserDefaults.standard.integer(forKey: UserDefaults.lottoRoundKey)
    private lazy var rounds = Array(1...latestRound)
    
    weak var lottoryRootViewDelegate: LotteryRootViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveLottoryRootViewDelegate), name: .LotteryRootViewUserAction, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .LotteryRootViewUserAction, object: nil)
    }
    
    @objc private func receiveLottoryRootViewDelegate(notification: Notification) {
        guard let delegate = notification.object as? LotteryRootViewDelegate else {
            fatalError("LottoryRoundPickerView: 잘못된 Delegate가 Post 되었음")
        }
        
        self.lottoryRootViewDelegate = delegate
    }
}

extension LotteryRoundPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.latestRound
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let round = self.rounds[row]
        return String(round)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let round = self.rounds[row]
        
        guard let delegate = self.lottoryRootViewDelegate else {
            fatalError("LottoryRoundPickerView: Delegate 수신에 문제가 생김")
        }
        
        delegate.roundPickerDidSelect(round: String(round))
    }
}
