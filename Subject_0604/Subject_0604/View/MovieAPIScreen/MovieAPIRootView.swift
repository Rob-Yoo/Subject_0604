//
//  File.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/7/24.
//

import UIKit
import SnapKit
import Then

protocol MovieAPIRootViewDelegate: AnyObject {
    func searchButtonTapped(date: String)
}

class MovieAPIRootView: UIView {
    
    private let backgroundView = MovieAPIBackgroundView()
    private let searchView = MovieAPISearchView()
    private let movieChartTableView = MovieChartTableView()
    
    weak var movieAPIRootViewDelegate: MovieAPIRootViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieAPIRootView {
    private func configureHierarchy() {
        self.addSubview(backgroundView)
        self.addSubview(searchView)
        self.addSubview(movieChartTableView)
    }
    
    private func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(50)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        movieChartTableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: - Communicate with Controller
extension MovieAPIRootView {
    
    func addUserAction() {
        guard let delegate = self.movieAPIRootViewDelegate else {
            fatalError("MovieAPIRootViewDelegate 지정 후 사용")
        }
        
        self.searchView.movieAPIRootViewDelegate = delegate
    }
    
    func update(data: BoxOfficeResult?) {
        guard let viewData = data else { return }
    
        self.movieChartTableView.movieChart = viewData.dailyBoxOfficeList
    }
}
