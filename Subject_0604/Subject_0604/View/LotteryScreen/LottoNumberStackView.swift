//
//  LottoNumberStackView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/6/24.
//

import UIKit

final class LottoNumberStackView: UIStackView {
    
    private var lottoNumberBallViews = [LottoNumberBallView]()
    
    private let plusImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "plus")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    private let bonusNumberBallView: LottoNumberBallView
    
    private var lottoNumberViews: [UIView] {
        return lottoNumberBallViews + [plusImageView, bonusNumberBallView]
    }
    
    init(numbers: [Int]) {
        let colors = [UIColor.systemYellow, UIColor.cyan, UIColor.cyan, UIColor.systemPink, UIColor.systemPink, UIColor.lightGray]
        
        for (number, color) in zip(numbers, colors) {
            lottoNumberBallViews.append(LottoNumberBallView(number: number, color: color))
        }
        self.bonusNumberBallView = LottoNumberBallView(number: numbers.last!, color: .lightGray, isBonus: true)
        
        super.init(frame: .zero)
//        self.backgroundColor = .black
        self.configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 5
        
        self.lottoNumberViews.forEach { self.addArrangedSubview($0) }
    }
}
