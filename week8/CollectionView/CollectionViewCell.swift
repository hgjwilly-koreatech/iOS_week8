//
//  CollectionViewCell.swift
//  week8
//
//  Created by 홍기정 on 5/27/25.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    static let cellHeight = 34
    
    static let identifier = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSeparator(width: 10)
        contentView.backgroundColor = .blue
        backgroundColor = .black
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CollectionViewCell {
    
    func addSeparator(width: CGFloat) {
        let border: CALayer = {
            let border = CALayer()
            border.borderColor = UIColor.black.cgColor
            border.name = "separator"
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
            return border
        }()
        let index = layer.sublayers?.count ?? 0
        layer.insertSublayer(border, at: UInt32(index))
    }
}
