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
    
    func dataBind(_ data:String, _ indexPath : IndexPath){
        
        label.text = data
        
        switch indexPath.section{
        case 0 :
            contentView.backgroundColor = .cvCell
            label.font = UIFont(name: "PretendardGOV-Medium", size: 14)
        default:
            contentView.backgroundColor = .white
            label.font = UIFont(name: "PretendardGOV-Regular", size: 15)
        }
    }
}

