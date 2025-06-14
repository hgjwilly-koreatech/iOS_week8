//
//  FooterCell.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//

import UIKit
import SnapKit

class FooterCell: UITableViewCell {
    
    static let footerFontSize = 20
    
    // data
    private var updateDate = "2024.03.09"
    
    // identifier
    static let identifier = "FooterCell"
    
    // component
    let updateLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(updateLabel)
        
        updateLabel.text = "\(updateDate) 업데이트"
        setLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        updateLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(24)
        }
    }
    
}
