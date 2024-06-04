//
//  MainMovieButtonsStackView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class MainMovieButtonsStackView: UIStackView {
    private let playButton: UIButton = {
        let button = UIButton()
        
        button.setImage(.playNormal, for: .normal)
        button.setImage(.playHighlighted, for: .highlighted)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        button.setTitle("", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let addFavoriteListButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setAttributedTitle(NSAttributedString(string: " 내가 찜한 리스트", attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.white]), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var buttons: [UIButton] {
        return [playButton, addFavoriteListButton]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainMovieButtonsStackView {
    private func configureStackView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 15
        self.buttons.forEach { self.addArrangedSubview($0) }
    }
}
