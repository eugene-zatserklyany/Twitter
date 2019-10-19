//
//  RetweetButton.swift
//  TwitterDemo
//
//  Created by Eugene Zatserklyaniy on 5/7/19.
//  Copyright © 2019 Eugene Zatserklyaniy. All rights reserved.
//

import UIKit
import TwitterBusinessLayer

class RetweetButton: UIButton, TweetButtonProtocol {

    var buttonTapped: (() -> ())?
    var defaultColor: DefaultColor = .dark {
        didSet {
            setupButtonAttributes()
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButtonAttributes()
    }

    private func setupButtonAttributes() {
        let font: UIFont = defaultColor == .dark ? .systemFont(ofSize: 12) : .boldSystemFont(ofSize: 14)
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.font = font
        applyColor(forState: false, defaultColor: defaultColor)
    }

    func setupButton(_ retweetCount: Int, _ isRetweeted: Bool) {
        applyColor(forState: isRetweeted, defaultColor: defaultColor)

        self.setTitle(String.likesCount(retweetCount), for: [])
    }

    @objc private func didPressed() {
        buttonTapped?()
    }
}
