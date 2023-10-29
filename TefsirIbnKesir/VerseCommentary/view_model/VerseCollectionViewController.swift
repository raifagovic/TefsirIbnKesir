//
//  VerseCollectionViewController.swift
//  TefsirIbnKesir
//
//  Created by Raif on 12. 9. 2023..
//



import UIKit

class VerseCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var chapters: [Chapter] = []
    var currentChapter: Chapter?
    var currentVerse: Verse?
    var currentVerseIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(VerseCollectionViewCell.self, forCellWithReuseIdentifier: "VerseCell")
        collectionView.isPagingEnabled = true

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeft.direction = .left
        collectionView.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRight.direction = .right
        collectionView.addGestureRecognizer(swipeRight)

        updateBackButton()
    }

    func updateBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle(" " + currentChapter!.name, for: .normal)
        backButton.setTitleColor(UIColor.systemBlue, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        let customBackButton = UIBarButtonItem(customView: backButton)

        navigationItem.leftBarButtonItem = customBackButton
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerseCell", for: indexPath) as! VerseCollectionViewCell
        if let currentChapter = currentChapter, let currentVerse = currentVerse {
            print("Current Chapter Name: \(currentChapter.name)")
            print("Current Verse Number: \(currentVerse.number)")
            cell.detailChapterNameLabel.text = currentChapter.name
            cell.detailVerseNumberLabel.text = ", \(currentVerse.number)"
            cell.detailVerseTextLabel.text = currentVerse.text
            cell.detailOriginalVerseTextLabel.text = currentVerse.originalText
            cell.detailCommentaryTextLabel.text = currentVerse.commentary
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }

    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            navigateToNextVerse()
        case .right:
            navigateToPreviousVerse()
        default:
            break
        }
    }

    func navigateToNextVerse() {
        guard let currentChapter = currentChapter else {
            return
        }
        currentVerseIndex += 1

        if currentVerseIndex > currentChapter.verses.count - 1 {
            if let currentChapterIndex = chapters.firstIndex(where: { $0.number == currentChapter.number }), currentChapterIndex < chapters.count - 1 {

                self.currentChapter = chapters[currentChapterIndex + 1]
                currentVerseIndex = 0
                currentVerse = self.currentChapter?.verses[currentVerseIndex]
                
                let nextVerseListViewController = VerseListViewController()
                nextVerseListViewController.chapters = self.chapters
                nextVerseListViewController.currentChapter = self.currentChapter
                nextVerseListViewController.verses = self.currentChapter!.verses
                nextVerseListViewController.chapterName = self.currentChapter!.name
                
                var viewControllers = navigationController?.viewControllers ?? []
                if viewControllers.count >= 2 {
                    viewControllers[viewControllers.count - 2] = nextVerseListViewController
                }
                navigationController?.setViewControllers(viewControllers, animated: false)

                updateBackButton()
                collectionView?.reloadData()
            } else {
                return
            }
        } else {
            currentVerse = currentChapter.verses[currentVerseIndex]
            collectionView?.reloadData()
        }
    }

    func navigateToPreviousVerse() {
        guard let currentChapter = currentChapter else {
            return
        }
        currentVerseIndex -= 1

        if currentVerseIndex < 0 {
            if let currentChapterIndex = chapters.firstIndex(where: { $0.number == currentChapter.number }), currentChapterIndex > 0 {
                self.currentChapter = chapters[currentChapterIndex - 1]
                currentVerseIndex = (self.currentChapter?.verses.count)! - 1
                currentVerse = self.currentChapter?.verses[currentVerseIndex]
                
                let nextVerseListViewController = VerseListViewController()
                nextVerseListViewController.chapters = self.chapters
                nextVerseListViewController.currentChapter = self.currentChapter
                nextVerseListViewController.verses = self.currentChapter!.verses
                nextVerseListViewController.chapterName = self.currentChapter!.name
                
                var viewControllers = navigationController?.viewControllers ?? []
                if viewControllers.count >= 2 {
                    viewControllers[viewControllers.count - 2] = nextVerseListViewController
                }
                navigationController?.setViewControllers(viewControllers, animated: false)

                updateBackButton()
                collectionView?.reloadData()
            } else {
                return
            }
        } else {
            currentVerse = currentChapter.verses[currentVerseIndex]
            collectionView?.reloadData()
        }
    }

    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}


/*
 
 (1). sredit ui bugove sa tekstom koji nije skracen
 (2). sredit naslove sure da idu u vise redova
  3. sredit foldere da izgledaju po primjeru amerove aplikacije (poslace mi)
 (4). sredit sve constraints bugove
 (5). sredit imena varijabli npr. chapterUnitStackView
 
 
 */
