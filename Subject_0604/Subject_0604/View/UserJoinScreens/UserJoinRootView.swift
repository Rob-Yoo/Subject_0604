//
//  UserJoinRootView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class UserJoinRootView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "JINFLIX"
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        return label
    }()
    
    private let joinFormStackView = JoinFormStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(joinFormStackView)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
        }
        
        joinFormStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
    }
}
