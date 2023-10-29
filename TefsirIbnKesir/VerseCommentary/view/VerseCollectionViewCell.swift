//
//  VerseCollectionViewCell.swift
//  TefsirIbnKesir
//
//  Created by Raif on 11. 9. 2023..
//

import UIKit

class VerseCollectionViewCell: UICollectionViewCell {

    var verseScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let verseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let detailChapterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let detailVerseNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    let detailVerseTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let detailOriginalVerseTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let detailCommentaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Komentar:"
        return label
    }()
    
    let detailCommentaryTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(verseScrollView)
        verseScrollView.addSubview(verseView)
        
        verseView.addSubview(detailChapterNameLabel)
        verseView.addSubview(detailVerseNumberLabel)
        verseView.addSubview(detailVerseTextLabel)
        verseView.addSubview(detailOriginalVerseTextLabel)
        verseView.addSubview(detailCommentaryLabel)
        verseView.addSubview(detailCommentaryTextLabel)
        
        NSLayoutConstraint.activate([
            verseScrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verseScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verseScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verseScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verseScrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            verseView.topAnchor.constraint(equalTo: verseScrollView.topAnchor),
            verseView.leadingAnchor.constraint(equalTo: verseScrollView.leadingAnchor),
            verseView.trailingAnchor.constraint(equalTo: verseScrollView.trailingAnchor),
            verseView.bottomAnchor.constraint(equalTo: verseScrollView.bottomAnchor),
            verseView.widthAnchor.constraint(equalTo: verseScrollView.widthAnchor),
            
            detailChapterNameLabel.topAnchor.constraint(equalTo: verseView.topAnchor, constant: 100),
            detailChapterNameLabel.leadingAnchor.constraint(equalTo: verseView.leadingAnchor, constant: 20),
            
            detailVerseNumberLabel.topAnchor.constraint(equalTo: detailChapterNameLabel.topAnchor),
            detailVerseNumberLabel.leadingAnchor.constraint(equalTo: detailChapterNameLabel.trailingAnchor, constant: 5),
            
            detailVerseTextLabel.topAnchor.constraint(equalTo: detailChapterNameLabel.bottomAnchor, constant: 20),
            detailVerseTextLabel.leadingAnchor.constraint(equalTo: verseView.leadingAnchor, constant: 20),
            detailVerseTextLabel.trailingAnchor.constraint(equalTo: verseView.trailingAnchor, constant: -20),
            
            detailOriginalVerseTextLabel.topAnchor.constraint(equalTo: detailVerseTextLabel.bottomAnchor, constant: 10),
            detailOriginalVerseTextLabel.leadingAnchor.constraint(equalTo: verseView.leadingAnchor, constant: 20),
            detailOriginalVerseTextLabel.trailingAnchor.constraint(equalTo: verseView.trailingAnchor, constant: -20),
            
            detailCommentaryLabel.topAnchor.constraint(equalTo: detailOriginalVerseTextLabel.bottomAnchor, constant: 20),
            detailCommentaryLabel.leadingAnchor.constraint(equalTo: verseView.leadingAnchor, constant: 20),
            
            detailCommentaryTextLabel.topAnchor.constraint(equalTo: detailCommentaryLabel.bottomAnchor, constant: 5),
            detailCommentaryTextLabel.leadingAnchor.constraint(equalTo: verseView.leadingAnchor, constant: 20),
            detailCommentaryTextLabel.trailingAnchor.constraint(equalTo: verseView.trailingAnchor, constant: -20),
            detailCommentaryTextLabel.bottomAnchor.constraint(equalTo: verseView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
}


