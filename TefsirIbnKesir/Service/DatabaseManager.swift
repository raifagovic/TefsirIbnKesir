//
//  DatabaseManager.swift
//  TefsirIbnKesir
//
//  Created by Raif on 9. 8. 2023..
//

import Foundation
import SQLite

class DatabaseManager {
    static let shared = DatabaseManager()

    private var db: Connection?

    private init() {
        db = createDatabaseConnection()
    }

    private func createDatabaseConnection() -> Connection? {
        if let databaseFilePath = Bundle.main.path(forResource: "tafsir", ofType: "db") {
            do {
                let db = try Connection(databaseFilePath)
                return db
            } catch {
                print("Error creating database connection: \(error)")
                return nil
            }
        } else {
            print("Database file not found in the app bundle.")
            return nil
        }
    }

    func fetchAllData() -> [Chapter] {
        guard let db = db else {
            return []
        }

        var chapters: [Chapter] = []

        do {
            let chapterTable = Table("chapter")
            let verseTable = Table("verse")
            let commentaryTable = Table("commentary")

            let chapterQuery = chapterTable.select(
                Column.chapterId,
                Column.chapterName,
                Column.placeOfRevelation,
                Column.numberOfVerses
            )

            let chapterRows = try db.prepare(chapterQuery)

            for chapterRow in chapterRows {
                let chapterId = chapterRow[Column.chapterId]
                let chapterName = chapterRow[Column.chapterName]
                let placeOfRevelation = chapterRow[Column.placeOfRevelation]
                let numberOfVerses = chapterRow[Column.numberOfVerses]

                let verseQuery = verseTable.select(
                    Column.verseId,
                    Column.verseNumber,
                    Column.verseText,
                    Column.originalVerseText
                ).filter(Column.chapterId == chapterId)

                let verseRows = try db.prepare(verseQuery)
                var verses: [Verse] = []

                for verseRow in verseRows {
                    let verseId = verseRow[Column.verseId]
                    let verseNumber = verseRow[Column.verseNumber]
                    let verseText = verseRow[Column.verseText]
                    let originalVerseText = verseRow[Column.originalVerseText]

                    let commentaryQuery = commentaryTable.select(Column.commentaryText).filter(Column.verseId == verseId)

                    if let commentaryRow = try db.pluck(commentaryQuery) {
                        let commentaryText = commentaryRow[Column.commentaryText]
                        
                        let verse = Verse(number: verseNumber, text: verseText, originalText: originalVerseText, commentary: commentaryText)
                        verses.append(verse)
                    }
                }

                let chapter = Chapter(number: chapterId, name: chapterName, placeOfRevelation: placeOfRevelation, numberOfVerses: numberOfVerses, verses: verses)
                chapters.append(chapter)
            }

        } catch {
            print("Error fetching data: \(error)")
        }

        return chapters
    }
    enum Column {
        static let chapterId = Expression<Int>("chapter_id")
        static let chapterName = Expression<String>("chapter_name")
        static let chapterNumber = Expression<Int>("chapter_number")
        static let placeOfRevelation = Expression<String>("place_of_revelation")
        static let numberOfVerses = Expression<Int>("number_of_verses")
        
        static let verseId = Expression<Int>("verse_id")
        static let verseNumber = Expression<Int>("verse_number")
        static let verseText = Expression<String>("verse_text")
        static let originalVerseText = Expression<String>("original_verse_text")
        
        static let commentaryText = Expression<String>("commentary_text")
    }
}


