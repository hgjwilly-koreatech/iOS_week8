//
//  CollectionViewCell.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//
import UIKit
import SnapKit

class CollectionViewContainerCell: UITableViewCell {
    
    // identifier
    static let identifier = "CollectionViewContainerCell"
    
    // component
    let collectionView = {
        let collectionView = MyCollectionView()
        return collectionView
    }()
    
    // life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
