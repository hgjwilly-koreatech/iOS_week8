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
        //label.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    let locationTitleLabel = {
        let label = UILabel()
        label.text = "위치"
        label.textColor = .red
        //label.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    let locationDetailLabel = {
        let label = UILabel()
        label.text = "학생회관 2층"
        label.textColor = .blue
        //label.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    let phonenumberTitleLabel = {
        let label = UILabel()
        label.text = "전화번호"
        label.textColor = .red
        //label.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    let phonenumberDetailLabel = {
        let label = UILabel()
        label.text = "041-560-1278"
        label.textColor = .blue
        //label.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    // 이니셜라이저 재정의
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HeaderCell {
    
    private func setLayout(){
        [titleLabel, locationTitleLabel, locationDetailLabel, phonenumberTitleLabel, phonenumberDetailLabel].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(24)
        }
        locationTitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(24)
        }
        locationDetailLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(locationTitleLabel.snp.trailing).offset(8)
        }
        phonenumberTitleLabel.snp.makeConstraints{
            $0.top.equalTo(locationTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(24)
        }
        phonenumberDetailLabel.snp.makeConstraints{
            $0.top.equalTo(locationTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(phonenumberTitleLabel.snp.trailing).offset(8)
        }
    }
}
