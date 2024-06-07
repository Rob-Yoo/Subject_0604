//
//  MovieChartTableViewCell.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/7/24.
//

import UIKit
import SnapKit
import Then

class MovieChartTableViewCell: UITableViewCell {
    
    private let rankLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    private lazy var rankView = UIView().then {
        $0.addSubview(rankLabel)
        $0.backgroundColor = .white
        rankLabel.snp.makeConstraints { make in make.center.equalToSuperview() }
    }
    
    private let movieTitleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    
    private let movieOpenDateLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 13)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure Subviews
extension MovieChartTableViewCell {
    private func configureHierarchy() {
        self.contentView.addSubview(rankView)
        self.contentView.addSubview(movieTitleLabel)
        self.contentView.addSubview(movieOpenDateLabel)
    }
    
    private func configureLayout() {
        rankView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.1)
        }
        
        movieTitleLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalTo(rankView.snp.trailing).offset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        movieOpenDateLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
//            make.leading.equalTo(movieTitleLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}

extension MovieChartTableViewCell {
    func update(rank: String, title: String, openDate: String) {
        self.rankLabel.text = String(rank)
        self.movieTitleLabel.text = title
        self.movieOpenDateLabel.text = openDate
    }
}
