//
//  CollectionViewCell.swift
//  week8
//
//  Created by 홍기정 on 5/27/25.
//

import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let cellHeight = 34
    
    // identifier
    static let identifier = "CollectionViewCell"
    
    // component
    let label = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //addSeparator(width: 10)
        contentView.backgroundColor = .blue
        contentView.addSubview(label)
        
        label.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyCollectionViewCell {
    
    func dataBind(_ data:String,_ row: Int){
        
        label.text = data
        
        switch row{
            case 0,1,2 : contentView.backgroundColor = .red
            default: contentView.backgroundColor = .brown
        }
    }
    
    /*
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
     */
}

