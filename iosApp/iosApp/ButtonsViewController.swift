//
//  LinksViewController.swift
//  UIKitiOSApp
//
//  Created by Rafaela Manta on 5/8/25.
//

import UIKit
import rnReactApp

class ButtonsViewController: UIViewController {
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        self.title = "iOS app"

    
            // 1. Create a stack view to hold the buttons
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 20
            stackView.translatesAutoresizingMaskIntoConstraints = false

            // 2. create first button
            let module1Button = createNavigationButton(title: "Module 1") { [weak self] in
                guard let self = self else { return }
                let initialProps: [String: Any] = ["gameCode": "module-1-params"]
                let reactNativeVC = ReactNativeViewController(moduleName: "rnAppModule1", initialProperties: initialProps)
                if let navigationController = self.navigationController {
                    navigationController.pushViewController(reactNativeVC, animated: true)
                } else {
                    reactNativeVC.modalPresentationStyle = .fullScreen
                    self.present(reactNativeVC, animated: true, completion: nil)
                }
            }
            stackView.addArrangedSubview(module1Button)

            // 3. create second button
            let module2Button = createNavigationButton(title: "Module 2") { [weak self] in
                guard let self = self else { return }
                let initialProps: [String: Any] = ["gameCode": "module-2-params"]
                let reactNativeVC = ReactNativeViewController(moduleName: "rnAppModule2", initialProperties: initialProps)
                if let navigationController = self.navigationController {
                    navigationController.pushViewController(reactNativeVC, animated: true)
                } else {
                    reactNativeVC.modalPresentationStyle = .fullScreen
                    self.present(reactNativeVC, animated: true, completion: nil)
                }
            }
            stackView.addArrangedSubview(module2Button)

            // 4. add stackView in view
            self.view.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                stackView.heightAnchor.constraint(equalToConstant: 120)
            ])
    }
    
    
    
    
    func createNavigationButton(title: String, action: @escaping () -> Void) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let uiAction = UIAction { _ in
            action()
        }
        button.addAction(uiAction, for: .touchUpInside)
        
        return button
    }
    
    
}
