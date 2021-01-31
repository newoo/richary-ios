//
//  MainViewController.swift
//  richary
//
//  Created by newoo on 2021/01/31.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    // MARK: - Properties
    var disposeBag = DisposeBag()
    
    lazy var currentDateLabel: UILabel = {
        let label = UILabel()
        view.addSubview(label)
        
        return label
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        setBindings()
    }
    
    private func setConstraints() {
        currentDateLabel.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        })
    }
    
    private func setBindings() {
        Driver.just(Date().toString(by: DateFormatter().dateFommat()))
            .drive(currentDateLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

