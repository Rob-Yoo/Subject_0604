//
//  MovieAPISearchView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/7/24.
//

import UIKit
import SnapKit
import Then

class MovieAPISearchView: UIView {
    
    private lazy var searchTextField = UITextField().then {
        $0.backgroundColor = .clear
        $0.text = Date().getYesterDayString()
        $0.textColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.white.cgColor
        $0.delegate = self
    }
    
    private lazy var searchButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("검색", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(self.searchButtonTapped), for: .touchUpInside)
    }
    
    weak var movieAPIRootViewDelegate: MovieAPIRootViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureHierarchy()
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        self.addSubview(searchTextField)
        self.addSubview(searchButton)
    }
    
    private func configureLayout() {
        searchTextField.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        searchButton.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
        }
    }
}

extension MovieAPISearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
    }
}

extension MovieAPISearchView {
    @objc func searchButtonTapped() {
        guard let delegate = self.movieAPIRootViewDelegate else {
            fatalError("MovieAPISearchView: Delegate 지정이 안되어있음")
        }

        let date = searchTextField.text ?? ""
        
        delegate.searchButtonTapped(date: date)
        self.endEditing(true)
    }
}
