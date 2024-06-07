//
//  MovieAPIBackgroundView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/7/24.
//

import UIKit
import SnapKit
import Then

class MovieAPIBackgroundView: UIView {
    
    private let backgroundImageView = UIImageView().then {
        $0.image = .theaterBackground
        $0.contentMode = .scaleAspectFill
    }
    
    private let blackTransparentView = UIView().then {
        $0.backgroundColor = UIColor(white: 0, alpha: 0.6)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        self.addSubview(backgroundImageView)
        self.addSubview(blackTransparentView)
    }
    
    private func configureLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        blackTransparentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
