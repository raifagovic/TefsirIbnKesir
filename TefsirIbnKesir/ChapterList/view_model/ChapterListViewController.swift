//
//  ChapterListViewController.swift
//  TefsirIbnKesir
//
//  Created by Raif on 10. 7. 2023..
//

import UIKit

class ChapterListViewController: UITableViewController {
    
    var chapters: [Chapter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sure"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChapterTableViewCell.self, forCellReuseIdentifier: "ChapterCell")
        
        // Fetch chapters from the database
        let databaseManager = DatabaseManager.shared
        chapters = databaseManager.fetchAllData()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterCell", for: indexPath) as! ChapterTableViewCell
        let chapter = chapters[indexPath.row]
        cell.chapterNumberLabel.text = "\(chapter.number)"
        cell.chapterNameLabel.text = chapter.name
        cell.chapterDetailLabel.text = "\(chapter.placeOfRevelation) - \(chapter.numberOfVerses)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedChapter = chapters[indexPath.row]
        
        let verseListViewController = VerseListViewController()
        verseListViewController.chapters = chapters
        verseListViewController.currentChapter = selectedChapter
        verseListViewController.verses = selectedChapter.verses
        verseListViewController.chapterName = selectedChapter.name
        navigationController?.pushViewController(verseListViewController, animated: true)
    }
}
