//
//  MainViewController.swift
//  richary
//
//  Created by newoo on 2021/01/31.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    // MARK: - Properties
    lazy var currentDateLabel: UILabel = {
        let label = UILabel()
        view.addSubview(label)
        
        return label
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    // MARK: - Set Constraints
    private func setConstraints() {
        currentDateLabel.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        })
    }
}

