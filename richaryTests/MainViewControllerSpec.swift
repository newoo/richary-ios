//
//  MainViewControllerSpec.swift
//  MainViewControllerSpec
//
//  Created by newoo on 2021/01/31.
//

import Quick
import Nimble
@testable import richary

class MainViewControllerSpec: QuickSpec {
    override func spec() {
        describe("MainViewController") {
            var mainViewController: MainViewController!

            beforeEach {
                mainViewController = MainViewController()

                let navigationViewController = UINavigationController()
                navigationViewController.addChild(mainViewController)
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.makeKeyAndVisible()
                window.rootViewController = navigationViewController

                mainViewController.beginAppearanceTransition(true, animated: false)
                mainViewController.endAppearanceTransition()
            }

            context("when can interate with user") {
                it("show current date") {
                    let currentDateText = mainViewController.currentDateLabel.text
                    let expected = Date().toString(by: DateFormatter().dateFommat())
                    expect(currentDateText).toEventually(equal(expected))
                }
            }
        }
    }
}
