//
//  navigationController.swift
//  week8
//
//  Created by 홍기정 on 6/14/25.
//

import UIKit
import SnapKit

class MyNaviViewController: UIViewController {
    
    let button = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("tap!", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        button.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        
        view.addSubview(button)
        button.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        pushView()
    }
    
    @objc func pushView(){
        
        navigationController?.pushViewController(MyTableViewController(), animated: true)
    }
}
