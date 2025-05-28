//
//  CVCell.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//
import UIKit
import SnapKit

class CVCell: UITableViewCell {
    
    // data
    private let data = [["시간","시작시간","마감시간"], // section1
                        ["아침","8:00","9:30",     // section2
                         "점심","11:30","13:30"],
                        ["저녁","17:30","18:30"]] // section3
    
    // identifier
    static let identifier = "CVCell"
    
    // component
    let collectionView = CollectionView()
    
    // initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setDelegateDatasource()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CVCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // if(section == 0) { return 3 }
        // else { return 9 }
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /*
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
         else { return UICollectionViewCell() }
         */
        //return cell
        
        return CollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 114, height: 34)
    }
}
extension CVCell {
    
    private func setDelegateDatasource(){
        collectionView.delegate = self
    }
}

extension CVCell {
    /*
     static func collectionViewHegiht() -> Int {
     return collectionView.cellHeight*4
     }
     */
    
    private func setLayout() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints{ $0.edges.equalToSuperview() }
    }
    
}
