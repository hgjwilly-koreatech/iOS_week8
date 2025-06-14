//
//  Header.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//

import UIKit
import SnapKit

class TableViewHeader: UITableViewHeaderFooterView {
    
    static let identifier: String = "TableViewHeader"
    
    let headerLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    func dataBind(_ data: String){
        headerLabel.text = data
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        //backgroundColor = .orange
        //contentView.backgroundColor = .yellow
        contentView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
