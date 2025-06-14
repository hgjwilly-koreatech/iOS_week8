//
//  SeparatorCell.swift
//  week8
//
//  Created by 홍기정 on 6/15/25.
//

import UIKit

class SeparatorCell: UITableViewCell {
    
    static let identifier = "SeparatorCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .gray
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
