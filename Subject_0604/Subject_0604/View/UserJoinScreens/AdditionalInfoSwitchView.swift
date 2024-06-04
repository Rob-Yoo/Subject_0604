//
//  AdditionalInfoSwitchView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class AdditionalInfoSwitchView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "추가 정보 입력"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let additionalInfoSwitch: UISwitch = {
        let sw = UISwitch()
        
        sw.onTintColor = .orange
        return sw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(additionalInfoSwitch)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        additionalInfoSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
