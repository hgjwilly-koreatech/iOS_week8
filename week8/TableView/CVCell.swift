//
//  CVCell.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//
import UIKit
import SnapKit

class CVCell: UITableViewCell {
    
    // identifier
    static let identifier = "CVCell"
    
    // component
    let collectionView = CollectionView()
    
    // initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CVCell {
    private func setLayout() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints{ $0.edges.equalToSuperview() }
    }
}
