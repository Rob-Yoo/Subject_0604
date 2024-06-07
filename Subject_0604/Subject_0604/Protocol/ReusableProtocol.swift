//
//  ReusableProtocol.swift
//  Subject_0604
//
//  Created by Jinyoung Yoo on 6/7/24.
//

import UIKit

protocol ReusableProtocol {
    static var reusableIdentifier: String { get }
}

extension UITableViewCell: ReusableProtocol {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableProtocol {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
