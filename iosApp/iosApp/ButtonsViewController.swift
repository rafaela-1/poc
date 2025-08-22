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
        
        // Setup notification observer for React Native data
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleJSDataReceived),
            name: NSNotification.Name("JSDataReceived"),
            object: nil
        )
            
    
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
                
                // Position below the buttons and label with custom height
                NSLayoutConstraint.activate([
                    reactNativeVC.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 260),
                    reactNativeVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    reactNativeVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    reactNativeVC.view.heightAnchor.constraint(equalToConstant: 200) 
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
            

            
            // 4. Add data display section
            let dataDisplayView = createDataDisplayView()
            stackView.addArrangedSubview(dataDisplayView)
            
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
    
    // MARK: - Cleanup
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func createDataDisplayView() -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.systemGray6
        containerView.layer.cornerRadius = 12
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Title label
        let titleLabel = UILabel()
        titleLabel.text = "📱 Data from React Native"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .systemBlue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleLabel)
        
        // Message label for data display
        let messageLabel = UILabel()
        messageLabel.text = "⏳ Waiting for data..."
        messageLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        messageLabel.textColor = .systemGray
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.messageLabel = messageLabel
        containerView.addSubview(messageLabel)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
        
        return containerView
    }
    
    @objc private func handleJSDataReceived(notification: Notification) {
        guard let data = notification.object as? [String: Any] else {
            print("Failed to extract data from notification")
            return
        }
        
        DispatchQueue.main.async {
            // Format the received data for display
            var displayText = ""
            
            if let message = data["message"] as? String {
                displayText += "📨 Message: \(message)\n"
            }
            
//            if let timestamp = data["timestamp"] as? String {
//                displayText += "⏰ Timestamp: \(timestamp)\n"
//            }
//            
//            if let userId = data["userId"] as? String {
//                displayText += "👤 User ID: \(userId)\n"
//            }
            
            // Add any other fields
            for (key, value) in data {
                if !["message", "timestamp", "userId"].contains(key) {
                    displayText += "🔧 \(key): \(value)\n"
                }
            }
            
            self.messageLabel?.text = displayText.isEmpty ? "No data received" : displayText
            print("Updated message label with: \(displayText)")
        }
    }
    

    
}
