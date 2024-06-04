//
//  HotMovieView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class HotContentsView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "지금 뜨는 콘텐츠"
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let hotMovieStackView = HotMovieStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure Subviews
extension HotContentsView {
    private func configureHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(hotMovieStackView)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        hotMovieStackView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.top).offset(25)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(5)
        }
    }
}
