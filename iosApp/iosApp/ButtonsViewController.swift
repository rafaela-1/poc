//
//  LinksViewController.swift
//  UIKitiOSApp
//
//  Created by Rafaela Manta on 5/8/25.
//

import UIKit
import rnReactApp

class ButtonsViewController: UIViewController {
    
    private var currentReactNativeVC: ReactNativeViewController?
    private var messageLabel: UILabel?
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        self.title = "iOS app"

    
            // 1. Create a stack view to hold the buttons
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 12
            stackView.translatesAutoresizingMaskIntoConstraints = false

            // module 1 
            let module1Button = createButton(title: "Module 1") { [weak self] in
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

            // module 2 
            let module2Button = createButton(title: "Module 2") { [weak self] in
                guard let self = self else { return }
                
                // Remove existing React Native view if any
                self.removeCurrentReactNativeView()
                
                let initialProps: [String: Any] = ["gameCode": "module-2-params"]
                let reactNativeVC = ReactNativeViewController(moduleName: "rnAppModule2", initialProperties: initialProps)
                
                // Store reference
                self.currentReactNativeVC = reactNativeVC
                
                // Add as child view controller
                self.addChild(reactNativeVC)
                self.view.addSubview(reactNativeVC.view)
                reactNativeVC.view.translatesAutoresizingMaskIntoConstraints = false
                
                // Position below the buttons and label
                NSLayoutConstraint.activate([
                    reactNativeVC.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 260),
                    reactNativeVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    reactNativeVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    reactNativeVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                ])
                
                reactNativeVC.didMove(toParent: self)
            }
            stackView.addArrangedSubview(module2Button)
            
            // module 3
            let module3Button = createButton(title: "Module 3 (Modal)") { [weak self] in
                guard let self = self else { return }
                
                let initialProps: [String: Any] = ["gameCode": "module-3-params"]
                let reactNativeVC = ReactNativeViewController(moduleName: "rnAppModule3", initialProperties: initialProps)
                
                // Present as modal
                reactNativeVC.modalPresentationStyle = .formSheet
                reactNativeVC.modalTransitionStyle = .coverVertical
                
                self.present(reactNativeVC, animated: true, completion: nil)
            }
            stackView.addArrangedSubview(module3Button)
            
            // 4. Add text label under button 3
            let messageLabel = UILabel()
            messageLabel.text = "Receive Message from rn"
            messageLabel.textAlignment = .left
            messageLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            messageLabel.textColor = .systemGray
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            self.messageLabel = messageLabel
            
            stackView.addArrangedSubview(messageLabel)
            
            // 4. add stackView in view
            self.view.addSubview(stackView)
                        
        
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }
    
    
    
    
    func createButton(title: String, action: @escaping () -> Void) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Add height constraint to make button smaller
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let uiAction = UIAction { _ in
            action()
        }
        button.addAction(uiAction, for: .touchUpInside)
        
        return button
    }
    
    // MARK: - React Native View Management
    
    private func removeCurrentReactNativeView() {
        if let reactNativeVC = currentReactNativeVC {
            reactNativeVC.willMove(toParent: nil)
            reactNativeVC.view.removeFromSuperview()
            reactNativeVC.removeFromParent()
            currentReactNativeVC = nil
        }
    }
    

    
    
}
