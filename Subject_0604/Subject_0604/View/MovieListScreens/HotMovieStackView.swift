//
//  HotMovieStackView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class HotMovieStackView: UIStackView {
    
    private let firstMovieView = HotMovieView(image: .부산행)
    private let secondMovieView = HotMovieView(image: .베테랑)
    private let thirdMovieView = HotMovieView(image: .도둑들)
    
    private var movieViews: [UIView] {
        return [firstMovieView, secondMovieView, thirdMovieView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 10
        self.movieViews.forEach { self.addArrangedSubview($0) }
    }
}

final class HotMovieView: UIView {
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(image: UIImage) {
        super.init(frame: .zero)

        self.backgroundColor = .clear
        self.movieImageView.image = image
        self.addSubview(movieImageView)
        movieImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
