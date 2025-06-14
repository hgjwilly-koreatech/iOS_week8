//
//  CollectionViewController.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//

import UIKit
import SnapKit


class MyCollectionView: UIView {
    
    // item size
    //let sizeForItem: CGSize = CGSize(width: 114, height: 36)
    // data
    private let data = [["시간","시작시간","마감시간"],
                        ["아침","8:00","9:30",
                         "점심","11:30","13:30",
                         "저녁","17:30","18:30"]]
    
    // component
    let collectionView = {
        let layout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 0

            return layout
        }()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .cvSeparator
        return collectionView
    }()
    
    // life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cvSeparator
        
        addSubview(collectionView)
        
        setLayout()
        register()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MyCollectionView: UICollectionViewDataSource {
    
    // numberOfSections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    // numberOfItems InSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    
    // cellForItem At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as? MyCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.dataBind(data[indexPath.section][indexPath.row], indexPath)
        return cell
    }
    
    
}

extension MyCollectionView: UICollectionViewDelegateFlowLayout{
    
    // sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = collectionView.bounds.width/3
        let cellHeight = (collectionView.bounds.height-8)/4
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // inset for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if (section == 0) { return UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0) }
        else { return UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0) }
    }
}

extension MyCollectionView {
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func register() {
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
