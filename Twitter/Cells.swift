//
//  Cells.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/12/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .red
    }
}

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test, test, test"
        label.backgroundColor = .green
        return label
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.backgroundColor = .purple
        return label
    }()
    
    let bioTextView: UITextView = {
        let text = UITextView()
        text.text = "my name is ..."
        text.backgroundColor = .red
        return text
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userName)
        addSubview(followButton)
        addSubview(bioTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 4, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        userName.anchor(nil, left: profileImageView.rightAnchor, bottom: profileImageView.bottomAnchor, right: followButton.leftAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 20)
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 80, heightConstant: 40)
        bioTextView.anchor(userName.bottomAnchor, left: userName.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 12, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        
    }
}
