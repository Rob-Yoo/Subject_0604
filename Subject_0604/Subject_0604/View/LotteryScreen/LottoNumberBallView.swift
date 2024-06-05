//
//  LottoNumberBallView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import UIKit
import SnapKit

final class LottoNumberBallView: UIView {
    private let number: Int
    private let color: UIColor

    private lazy var numberLabel = { num in
        let label = UILabel()
        
        label.text = String(num)
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }(self.number)
    
    private lazy var ballView = { color in
        let view = UIView()
        
        view.backgroundColor = color
        view.clipsToBounds = true
        return view
    }(self.color)
    
    private lazy var bonusLabel = {
        let label = UILabel()
        
        label.text = "보너스"
        label.textColor = .black
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    init(number: Int, color: UIColor, isBonus: Bool = false) {
        self.number = number
        self.color = color
        super.init(frame: .zero)

        self.backgroundColor = .clear
        self.configureBallView()
        self.configureNumberLabel()
        if (isBonus) { self.configureBonusLabel() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNumberLabel() {
        self.ballView.addSubview(self.numberLabel)
        
        numberLabel.snp.makeConstraints { make in
            make.center.equalTo(ballView)
        }
    }
    
    private func configureBallView() {
        self.addSubview(ballView)
        
        ballView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        ballView.layer.cornerRadius = ballView.frame.height / 2
    }
    
    private func configureBonusLabel() {
        self.addSubview(bonusLabel)
        
        bonusLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
