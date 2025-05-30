//
//  ViewController.swift
//  week8
//
//  Created by 홍기정 on 5/27/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // data
    let headers = ["","평일 운영시간", "주말 운영시간", ""]
    
    // component
    let tableView = UITableView(frame: .zero, style: .plain)
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        register()
        setDelegateDatasource()
    }
}

extension ViewController { // cell
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView  (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: return HeaderCell()
        case 1,2: return CVCell()
            /*
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identifier, for: indexPath) as? TableViewCell2
            else { return UITableViewCell() }
            //cell.dataBind()
            cell.isWeekend(indexPath)
            return cell
             */
        case 3: return FooterCell()
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 104
        case 1,2 : return 120 //CGFloat(TableViewCellCollectionView.collectionViewHegiht())
            
        case 3 : return 51
        default: return 0
        }
    }
}

extension ViewController { // Header
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return MyHeader()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1,2 : return 49
        default: return 0
        }
    }
}

extension ViewController {
    
    private func register() {
        //tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(CVCell.self, forCellReuseIdentifier: CVCell.identifier)
        tableView.register(FooterCell.self, forCellReuseIdentifier: FooterCell.identifier)
        //tableView.register(MyHeader.self, forHeaderFooterViewReuseIdentifier: MyHeader.identifier)
    }
    
    private func setDelegateDatasource() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

