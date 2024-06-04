//
//  JoinFormView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

enum UserInfoFieldType: String, CaseIterable {
    case EmailOrPhoneNumber = "이메일 주소 또는 전화번호"
    case Password = "비밀번호"
    case Nickname = "닉네임"
    case Position = "위치"
    case referralCode = "추천 코드 입력"
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .EmailOrPhoneNumber:
            return .emailAddress
        case .referralCode:
            return .numberPad
        default:
            return .default
        }
    }
}

final class JoinFormStackView: UIStackView {
    
    private let formTextFieldViews: [UIView] = {
        let textFieldViews = UserInfoFieldType.allCases.map { UserInfoTextFieldView(fieldType: $0) }
        return textFieldViews
    }()
    
    private let joinButtonView: UIButton = {
        let button = UIButton()

        button.backgroundColor = .white
        button.setAttributedTitle(NSAttributedString(string: "회원가입", attributes: [.font: UIFont.boldSystemFont(ofSize: 15), .foregroundColor: UIColor.black]), for: .normal)

        button.layer.cornerRadius = 10
        return button
    }()
    
    private let additionalInfoSwitchView = AdditionalInfoSwitchView()
    
    private var formViews: [UIView] {
        return formTextFieldViews + [joinButtonView, additionalInfoSwitchView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 5
        
        self.formViews.forEach { self.addArrangedSubview($0) }
    }
}
