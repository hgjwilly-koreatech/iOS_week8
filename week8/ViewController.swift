//
//  ViewController.swift
//  week8
//
//  Created by 홍기정 on 5/27/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let headers = ["24-2학기 학생식당 운영시간","평일 운영시간", "주말 운영시간", ""]
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let heightForHeaderCell: CGFloat = 104
    let heightForCVCell: CGFloat = 144
    let heightForFooterCell: CGFloat = 51
    
    let heightForHeaderForHeaderCell: CGFloat = 32
    let heightForHeaderForCVCell: CGFloat = 49
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        // register header
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: TableViewHeader.identifier)

        // register cell
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(CollectionViewContainerCell.self, forCellReuseIdentifier: CollectionViewContainerCell.identifier)
        tableView.register(FooterCell.self, forCellReuseIdentifier: FooterCell.identifier)

        // delegate, dataSource
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainViewController { // sections
    
    // numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return headers.count
    }
    
    // viewForHeader
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeader.identifier) as? TableViewHeader
        else { return UITableViewHeaderFooterView() }
        
        header.dataBind(headers[section])
        
        return header
    }
    
    // heightForHeader InSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0 : return heightForHeaderForHeaderCell
        case 1,2 : return heightForHeaderForCVCell
        default: return 0
        }
    }
}

extension MainViewController { // rows
        
    // numberOfRows InSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    // cellForRowAt
    func tableView  (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell
            else { return UITableViewCell() }
            return cell
        case 1,2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewContainerCell.identifier, for: indexPath) as? CollectionViewContainerCell
            else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FooterCell.identifier, for: indexPath) as? FooterCell
            else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return heightForHeaderCell
        case 1,2 : return heightForCVCell
        case 3 : return heightForFooterCell
        default: return 0
        }
    }
    
}
