//
//  LotteryRootView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/5/24.
//

import UIKit
import SnapKit

final class LotteryRootView: UIView {
    
    private let lottoRoundTextField: UITextField = {
        let textField = UITextField()
        let round = UserDefaults.standard.integer(forKey: UserDefaults.lottoRoundKey)
        
        textField.text = "\(round)"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.inputView = LottoryRoundPickerView()
        
        return textField
    }()
    
    private let lottoResutView = LotteryResultView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        self.addSubview(lottoRoundTextField)
        self.addSubview(lottoResutView)
    }
    
    private func configureLayout() {
        lottoRoundTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(40)
            make.horizontalEdges.equalToSuperview().inset(50)
        }
        
        lottoResutView.snp.makeConstraints { make in
            make.top.equalTo(lottoRoundTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
    }
}

extension LotteryRootView {
    func update(data: LotteryEntity?) {
        print(data)
    }
}
