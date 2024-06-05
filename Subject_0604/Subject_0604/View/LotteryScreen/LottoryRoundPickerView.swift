//
//  LottoryRoundPickerView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import UIKit

protocol LottoryRoundPickerViewDelegate {
    func roundPickerDidSelect(round: String)
}

final class LottoryRoundPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let latestRound = UserDefaults.standard.integer(forKey: UserDefaults.lottoRoundKey)
    private lazy var rounds = Array(1...latestRound)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
    }
}
