//
//  HeaderCell.swift
//  week8
//
//  Created by 홍기정 on 5/28/25.
//

import UIKit
import SnapKit

class HeaderCell: UITableViewCell {
    
    static let identifier = "HeaderCell"
    
    // component
    let titleLabel = {
        let label = UILabel()
        label.text = "24-2학기 학생식당 운영시간"
        label.textColor = .black
        label.font = UIFont(name: "PretendardGOV-Bold", size: 20)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    let locationLabel = {
        let label = UILabel()
        label.text = "위치"
        label.textColor = .information
        label.font = UIFont(name: "PretendardGOV-Medium", size: 14)
        return label
    }()
    let locationDetailLabel = {
        let label = UILabel()
        label.text = "학생회관 2층"
        label.textColor = .information
        label.font = UIFont(name: "PretendardGOV-Regular", size: 14)
        return label
    }()
    let phonenumberLabel = {
        let label = UILabel()
        label.text = "전화번호"
        label.textColor = .information
        label.font = UIFont(name: "PretendardGOV-Medium", size: 14)
        return label
    }()
    let phonenumberDetailLabel = {
        let label = UILabel()
        label.text = "041-560-1278"
        label.textColor = .information
        label.font = UIFont(name: "PretendardGOV-Regular", size: 14)
        return label
    }()
    
    // 이니셜라이저 재정의
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //backgroundColor = .yellow
        //contentView.backgroundColor = .orange
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HeaderCell {
    
    private func setLayout(){
        
        [titleLabel, locationLabel, locationDetailLabel, phonenumberLabel, phonenumberDetailLabel].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.height.equalTo(32)
            $0.leading.equalToSuperview().inset(24)
        }
        locationLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.height.equalTo(22)
            $0.leading.equalTo(titleLabel)
        }
        locationDetailLabel.snp.makeConstraints{
            $0.top.bottom.equalTo(locationLabel)
            $0.leading.equalTo(locationLabel.snp.trailing).offset(8)
        }
        phonenumberLabel.snp.makeConstraints{
            $0.top.equalTo(locationLabel.snp.bottom)
            $0.height.equalTo(22)
            $0.leading.equalTo(locationLabel)
        }
        phonenumberDetailLabel.snp.makeConstraints{
            $0.top.equalTo(phonenumberLabel)
            $0.height.equalTo(22)
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalTo(phonenumberLabel.snp.trailing).offset(8)
        }
    }
}
