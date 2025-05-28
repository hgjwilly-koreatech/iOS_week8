//
//  CollectionViewCell.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//
import UIKit
import SnapKit

class CollectionViewCell: UITableViewCell {
    
    // data
    private let data = [["시간","시작시간","마감시간"], // section1
                        ["아침","8:00","9:30",     // section2
                         "점심","11:30","13:30"],
                        ["저녁","17:30","18:30"]] // section3
    
    // identifier
    static let identifier = "CollectionViewCell"
    
    /*
    // component
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    */
    // component
    let collectionView = {
        let cv = CollectionView()
        return cv
    }()
    
    // initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(section == 0) { return 3 }
        else { return 9 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 114, height: 34)
    }
}

extension CollectionViewCell {
    /*
    static func collectionViewHegiht() -> Int {
        return collectionView.cellHeight*4
    }
    */
}
