//
//  ViewController.swift
//  week8
//
//  Created by 홍기정 on 5/27/25.
//

import UIKit
import SnapKit

class MyTableViewController: UIViewController {
    
    let headers = ["", "", "평일 운영시간", "주말 운영시간", ""] // "24-2학기 학생식당 운영시간"
    let tableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        //tableView.sectionHeaderTopPadding = 0
        //tableView.sectionFooter
        return tableView
    }()
    
    //let heightForHeaderCell: CGFloat = 104
    let heightForCollectionViewContainerCell: CGFloat = 144
    let heightForFooterCell: CGFloat = 51
    let heightForHeaderOfCollectionViewContainerCell: CGFloat = 49
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        //tableView.sectionHeaderTopPadding = 10
        setTableView()
    }
}

extension MyTableViewController {
    
    // MARK: Header
    
    // viewForHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 2,3 :
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeader.identifier) as? TableViewHeader
            else { return nil }
            header.dataBind(headers[section])
            return header
        default:
            return nil
        }
    }
    
    // heightForHeader InSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 2,3 : return heightForHeaderOfCollectionViewContainerCell
        default: return .zero
        }
    }
    
    // MARK: Rows
    
    // numberOfRows InSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    // MARK: Footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = .clear
        return footer
    }
    
}

extension MyTableViewController: UITableViewDelegate {
    
    
    
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return UITableView.automaticDimension
        case 1 : return 6
        case 2,3 : return heightForCollectionViewContainerCell
        case 4 : return heightForFooterCell
        default: return .zero
        }
    }
    
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}

extension MyTableViewController: UITableViewDataSource {
    
    // numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return headers.count
    }
    
    
    // cellForRowAt
    func tableView  (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell
            else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SeparatorCell.identifier, for: indexPath) as? SeparatorCell
            else { return UITableViewCell() }
            return cell
        case 2,3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewContainerCell.identifier, for: indexPath) as? CollectionViewContainerCell
            else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FooterCell.identifier, for: indexPath) as? FooterCell
            else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension MyTableViewController {
    
    
    func setTableView() {
        // register header
        tableView.register(TableViewHeader.self, forHeaderFooterViewReuseIdentifier: TableViewHeader.identifier)

        // register cell
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(SeparatorCell.self, forCellReuseIdentifier: SeparatorCell.identifier)
        tableView.register(CollectionViewContainerCell.self, forCellReuseIdentifier: CollectionViewContainerCell.identifier)
        tableView.register(FooterCell.self, forCellReuseIdentifier: FooterCell.identifier)

        // delegate, dataSource
        tableView.delegate = self
        tableView.dataSource = self
    }
}
