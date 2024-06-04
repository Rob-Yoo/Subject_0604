//
//  MovieListRootView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class MovieListRootView: UIView {

    let mainMovieView = MainMovieView()
    let hotMovieView = HotContentsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure Subviews
extension MovieListRootView {
    private func configureHierarchy() {
        self.addSubview(mainMovieView)
        self.addSubview(hotMovieView)
    }
    
    private func configureLayout() {
        mainMovieView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(self.snp.height).multipliedBy(0.55)
        }
        
        hotMovieView.snp.makeConstraints { make in
            make.top.equalTo(self.mainMovieView.snp.bottom)
            make.horizontalEdges.equalTo(self.snp.horizontalEdges)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(5)
        }
    }
}
