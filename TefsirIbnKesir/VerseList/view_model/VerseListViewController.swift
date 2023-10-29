//
//  VerseListViewController.swift
//  TefsirIbnKesir
//
//  Created by Raif on 26. 8. 2023..
//

import UIKit

class VerseListViewController: UITableViewController {
    
    var chapters: [Chapter] = []
    var currentChapter: Chapter?
    var verses: [Verse] = []
    var chapterName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = chapterName
        navigationItem.largeTitleDisplayMode = .never
        tableView.register(VerseTableViewCell.self, forCellReuseIdentifier: "VerseCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerseCell", for: indexPath) as! VerseTableViewCell
        let verse = verses[indexPath.row]
        cell.verseNumberLabel.text = "\(verse.number)"
        cell.verseTextLabel.text = verse.text
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        
        let detailViewController = VerseCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        detailViewController.chapters = chapters
        detailViewController.currentChapter = currentChapter
        detailViewController.currentVerse = verses[indexPath.row]
        detailViewController.currentVerseIndex = verses[indexPath.row].number - 1

        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
