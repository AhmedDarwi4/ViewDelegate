//
//  ViewController.swift
//  ViewDelegate
//
//  Created by Ahmed Darwish on 19/08/2023.
//

import UIKit

class ViewController: UIViewController,NotificationSettingViewDelegate {
    
    func didTabEnableButton() {
        let alert = UIAlertController(title: "EnableNotifications", message: "Telling user to do stuff", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    
    private let notificationsView = NotificationSettingView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationsView.delegate = self
        view.addSubview(notificationsView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        notificationsView.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width-20, height: view.frame.size.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
    }
    
}

protocol NotificationSettingViewDelegate: AnyObject{
    func didTabEnableButton()
}

    class NotificationSettingView: UIView{
        
     weak var delegate: NotificationSettingViewDelegate?
        
        private let imageView :UIImageView = {
            
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "bell")
            imageView.tintColor = .systemBlue
            
            return imageView
            
        }()
        
        private let label: UILabel = {
            let label = UILabel()
            label.text = "To stay up-to-date enable push notifications!"
            label.textAlignment = .center
            return label
        }()
        
        private let button: UIButton = {
            let button = UIButton()
            button.setTitle("Enable Notifications", for: .normal)
            button.backgroundColor = .systemGreen
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            return button
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(imageView)
            addSubview(label)
            addSubview(button)
        }
        required init(coder: NSCoder) {
            fatalError()
        }
        
        //Notify ViewController Of Tap
        @objc func didTapButton(){
            delegate?.didTabEnableButton()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            let imageSize  = bounds.size.width/2
            imageView.frame = CGRect(x: (bounds.size.width - imageSize)/2, y: 30, width: imageSize, height: imageSize)
            label.frame = CGRect(x:10 , y: imageSize+20, width: bounds.size.width-20, height: 100)
            
            button.frame = CGRect(x:10 , y: 140+imageSize, width: bounds.size.width-20, height: 50)

        }
    }
    
    



