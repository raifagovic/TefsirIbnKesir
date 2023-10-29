//
//  ChapterTableViewCell.swift
//  TefsirIbnKesir
//
//  Created by Raif on 7. 8. 2023..
//
    
import UIKit

class ChapterTableViewCell: UITableViewCell {

    let chapterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 33
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let chapterNumberView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()

    let chapterNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()

    let chapterInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    let chapterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let chapterDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        chapterNumberView.addSubview(chapterNumberLabel)

        chapterInfoStackView.addArrangedSubview(chapterNameLabel)
        chapterInfoStackView.addArrangedSubview(chapterDetailLabel)
        
        chapterStackView.addArrangedSubview(chapterNumberView)
        chapterStackView.addArrangedSubview(chapterInfoStackView)

        contentView.addSubview(chapterStackView)
                
        NSLayoutConstraint.activate([
            
            chapterStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            chapterStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            chapterStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            chapterStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33),
            
            chapterNumberLabel.centerXAnchor.constraint(equalTo: chapterNumberView.centerXAnchor),
            chapterNumberLabel.centerYAnchor.constraint(equalTo: chapterNumberView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    



