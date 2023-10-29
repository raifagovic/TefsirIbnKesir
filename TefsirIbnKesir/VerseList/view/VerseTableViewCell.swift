//
//  VerseTableViewCell.swift
//  TefsirIbnKesir
//
//  Created by Raif on 26. 8. 2023..
//

import UIKit

class VerseTableViewCell: UITableViewCell {
    
    let verseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 33
        return stackView
    }()

    let verseNumberView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let verseNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    let verseTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let verseTextView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        verseNumberView.addSubview(verseNumberLabel)
        verseTextView.addSubview(verseTextLabel)
        
        verseStackView.addArrangedSubview(verseNumberView)
        verseStackView.addArrangedSubview(verseTextView)

        contentView.addSubview(verseStackView)
        
        NSLayoutConstraint.activate([
            verseStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            verseStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            
            verseNumberLabel.centerXAnchor.constraint(equalTo: verseNumberView.centerXAnchor),
            verseNumberLabel.centerYAnchor.constraint(equalTo: verseNumberView.centerYAnchor),
            
            verseTextLabel.centerYAnchor.constraint(equalTo: verseTextView.centerYAnchor),
            verseTextLabel.leadingAnchor.constraint(equalTo: verseTextView.leadingAnchor),
            verseTextLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
