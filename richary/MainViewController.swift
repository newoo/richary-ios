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
import ReactorKit

class MainViewController: UIViewController, View {
    // MARK: - Properties
    var disposeBag = DisposeBag()
    
    let currentDateLabel = UILabel()
    
    init(reactor: MainReactor = MainReactor()) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(currentDateLabel)
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reactor?.action.on(.next(.refresh))
    }
    
    private func setupConstraints() {
        currentDateLabel.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        })
    }
    
    func bind(reactor: MainReactor) {
        reactor.state.map({ $0.currentDateText })
            .asDriver(onErrorJustReturn: reactor.initialState.currentDateText)
            .drive(currentDateLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
