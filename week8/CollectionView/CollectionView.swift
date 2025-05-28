//
//  CollectionView.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//

import UIKit
import SnapKit

class CollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // data
    private let data = [["시간","시작시간","마감시간"], // section1
                        ["아침","8:00","9:30",     // section2
                         "점심","11:30","13:30"],
                        ["저녁","17:30","18:30"]] // section3
    
    // component
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    
    // initializer
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(collectionView)
        collectionView.backgroundColor = .yellow // <<<<<<<<<<< collectionView는 보이고, cell이 안쌓이는 상태
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .blue
        addSubview(collectionView)
        collectionView.backgroundColor = .yellow // <<<<<<<<<<< collectionView는 보이고, cell이 안쌓이는 상태
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 6
        case 2: return 3
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        else { return UICollectionViewCell() }
        
        //cell.dataBind()
        //cell.setStyle()
        return cell
    }
    
}

extension CollectionView {
    
    private func setLayout(){
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register(){
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    private func setDelegateDatasource() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
