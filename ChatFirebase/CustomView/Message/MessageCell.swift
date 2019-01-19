//
//  MessageCell.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/19/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

class MessageCell: UITableViewCell {
    // MARK: - UI Property
    @IBOutlet weak var bubleView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    // Constaints
    @IBOutlet weak var trailingMessageConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingMessageConstraint: NSLayoutConstraint!
    
    // Colors
    static let blueColor = UIColor(r: 0, g: 137, b: 249)
    static let grayColor = UIColor(r: 220, g: 220, b: 220)
    
    // MARK: - Property
    static let IDENTIFIER = String(describing: MessageCell.self)

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initViews()
    }
    
    // MARK: - Config
    private func initViews() {
        setupBubleView()
    }
    
    private func setupBubleView() {
        bubleView.layer.cornerRadius = 16
        bubleView.layer.masksToBounds = true
    }
    
    // MARK: - UI Action
    
    // MARK: - Handler
    fileprivate func initConstraintIfNeeded() {
        if leadingMessageConstraint == nil {
            leadingMessageConstraint = self.messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        }
        
        if trailingMessageConstraint == nil {
            trailingMessageConstraint = self.messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        }
    }
    
    func handleUpdateLayoutMessage(isUserSend: Bool) {
        initConstraintIfNeeded()
        
        if isUserSend {
            bubleView.backgroundColor = MessageCell.grayColor
            
            leadingMessageConstraint.isActive = true
            trailingMessageConstraint.isActive = false
        } else {
            bubleView.backgroundColor = MessageCell.blueColor
            
            leadingMessageConstraint.isActive = false
            trailingMessageConstraint.isActive = true
        }
        
        self.layoutIfNeeded()
    }
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils
    
}
