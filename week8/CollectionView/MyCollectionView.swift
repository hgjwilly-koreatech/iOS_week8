//
//  CollectionViewController.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//

import UIKit
import SnapKit


class MyCollectionView: UIView {
    
    // lines
    static let boldLine: CGFloat = 2
    static let lightLine: CGFloat = 1
    
    // item size
    let sizeForItem: CGSize = CGSize(width: 114, height: 36)
    // data
    private let data = ["시간","시작시간","마감시간",
                        "아침","8:00","9:30",
                        "점심","11:30","13:30",
                        "저녁","17:30","18:30"]
    
    // component
    let collectionView = {
        let layout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            layout.minimumLineSpacing = lightLine
            layout.minimumInteritemSpacing = 0

            return layout
        }()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray3
        return collectionView
    }()
    
    // life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray3
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(MyCollectionView.boldLine)
        }
        
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MyCollectionView: UICollectionViewDataSource {
    
    // numberOfSections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // numberOfItems InSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    // cellForItem At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.dataBind(data[indexPath.row], indexPath.row)
        return cell
    }
}

extension MyCollectionView: UICollectionViewDelegateFlowLayout{
    
    // sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = collectionView.bounds.width/3
        let cellHeight = collectionView.bounds.height/4
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
