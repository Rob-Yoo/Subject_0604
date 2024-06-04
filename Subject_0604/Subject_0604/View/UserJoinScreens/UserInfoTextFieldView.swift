//
//  UserInfoTextFieldView.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/4/24.
//

import UIKit
import SnapKit

final class UserInfoTextFieldView: UIView {
    private var fieldType: UserInfoFieldType

    private lazy var userInfoTextField: UITextField = { fieldType in
        let textField = UITextField()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        
        centeredParagraphStyle.alignment = .center
        textField.backgroundColor = .darkGray
        textField.attributedPlaceholder = NSAttributedString(string: fieldType.rawValue, attributes: [.foregroundColor : UIColor.white, .paragraphStyle: centeredParagraphStyle, .font: UIFont.systemFont(ofSize: 15)])
        textField.textColor = .white
        textField.layer.cornerRadius = 5
        
        if (fieldType == .Password) { textField.isSecureTextEntry = true }
        return textField
    }(self.fieldType)

    init(fieldType: UserInfoFieldType) {
        self.fieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .clear
        self.configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        self.addSubview(userInfoTextField)
        
        userInfoTextField.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(5)
            make.horizontalEdges.equalToSuperview()
        }
    }
}
