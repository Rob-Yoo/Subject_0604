//
//  MovieChartTableView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/7/24.
//

import UIKit
import SnapKit
import Then

class MovieChartTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var movieChart: [DailyBoxOffice] = [] {
        didSet {
            self.reloadData()
        }
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.allowsSelection = false
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
        self.register(MovieChartTableViewCell.self, forCellReuseIdentifier: MovieChartTableViewCell.reusableIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieChart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movieChart[indexPath.row]
        
        guard let movieChartCell = tableView.dequeueReusableCell(withIdentifier: MovieChartTableViewCell.reusableIdentifier, for: indexPath) as? MovieChartTableViewCell else {
            return UITableViewCell()
        }
        
        movieChartCell.update(rank: movie.rank, title: movie.movieNm, openDate: movie.openDt)
        return movieChartCell
    }
}
