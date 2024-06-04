//
//  MainMovieView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class MainMovieView: UIView {
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = .명량
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "응원하고픈 • 흥미진진 • 사극 • 전투 • 한국 작품"
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    let buttonsStackView = MainMovieButtonsStackView()
    
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
extension MainMovieView {
    private func configureHierarchy() {
        self.addSubview(mainImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(buttonsStackView)
    }
    
    private func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        buttonsStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalToSuperview().multipliedBy(0.085)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.buttonsStackView.snp.top).offset(-10)
        }
    }
}
