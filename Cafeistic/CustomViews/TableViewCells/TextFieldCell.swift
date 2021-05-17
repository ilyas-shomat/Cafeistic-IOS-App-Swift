//
//  TextFieldCell.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 17.05.2021.
//

import Foundation
import UIKit
import SnapKit

final class TableViewTextFieldCell: UITableViewCell {
    
    var style: MainTextFieldStyle? {
        didSet {
            textField.style = style ?? .regular
        }
    }
    
    var title: String? {
        didSet {
            textField.text = title
        }
    }
    
    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    var textFont: UIFont? {
        didSet {
            textField.font = textFont
        }
    }
    
    var color: UIColor? {
        didSet {
            textField.tintColor = color
        }
    }

    private lazy var textField: MaintextField = {
        let textField = MaintextField(style: .regular)
        textField.backgroundColor = .white
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        contentView.addSubview(textField)
    }
    
    private func configureConstraints() {
        textField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
//            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.height.equalTo(45)
        }
    }
}
