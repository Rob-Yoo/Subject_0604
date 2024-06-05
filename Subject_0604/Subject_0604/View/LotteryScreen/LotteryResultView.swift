//
//  LotteryResultView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import UIKit
import SnapKit

final class LotteryResultView: UIView {
    
    private let titleLabel = {
        let label = UILabel()
        
        label.text = "당첨번호 안내"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let dateLabel = {
        let label = UILabel()
        
        label.text = "2020-05-30 추첨"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let lineView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let roundLabel = {
        let label = UILabel()
        
        label.text = "913회"
        label.textColor = .systemYellow
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let resultLabel = {
        let label = UILabel()
        
        label.text = "당첨결과"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let lottoNumberStackView = LottoNumberStackView(numbers: Array(repeating: 0, count: 7))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure Subviews
extension LotteryResultView {
    private func configureHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
        self.addSubview(lineView)
        self.addSubview(roundLabel)
        self.addSubview(resultLabel)
        self.addSubview(lottoNumberStackView)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(20)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview()
        }
        
        roundLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView).offset(40)
            make.centerX.equalToSuperview().offset(-40)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(roundLabel)
            make.centerX.equalToSuperview().offset(25)
        }
        
        lottoNumberStackView.snp.makeConstraints { make in
            make.top.equalTo(roundLabel).offset(60)
            make.height.equalTo(60)
            make.horizontalEdges.equalToSuperview()
        }
    }
}
