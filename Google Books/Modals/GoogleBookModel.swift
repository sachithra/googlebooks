//
//  GoogleBookModel.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import Foundation

// MARK: - Welcome
struct GoogleBookModel: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [BookItem]?
}

// MARK: - Item
struct BookItem: Codable {
    let kind: String?
    let id, etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
    let accessInfo: AccessInfo?
    let searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: String?
    let embeddable, publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub, pdf: Epub?
    let webReaderLink: String?
    let accessViewStatus: String?
    let quoteSharingAllowed: Bool?
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool
    let downloadLink: String?
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country: String?
    let isEbook: Bool
    let buyLink: String?
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String?
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let readingModes: ReadingModes?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let panelizationSummary: PanelizationSummary?
    let imageLinks: ImageLinks?
    let previewLink: String?
    let infoLink: String?
    let canonicalVolumeLink: String?
    let pageCount: Int?
    let categories: [String]?
    let subtitle: String?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type: String?
    let identifier: String?
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool?
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool?
}
