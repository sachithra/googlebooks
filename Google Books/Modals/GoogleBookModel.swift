//
//  GoogleBookModel.swift
//  Google Books
//
//  Created by Sachithra Udayanga on 2021-02-11.
//

import Foundation

// MARK: - Welcome
struct GoogleBookModel: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind: Kind
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: Country
    let viewability: Viewability
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: TextToSpeechPermission
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: AccessViewStatus
    let quoteSharingAllowed: Bool
}

enum AccessViewStatus: String, Codable {
    case fullPublicDomain = "FULL_PUBLIC_DOMAIN"
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case lk = "LK"
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool
    let downloadLink: String?
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
}

enum Viewability: String, Codable {
    case allPages = "ALL_PAGES"
    case partial = "PARTIAL"
}

enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country: Country
    let saleability: Saleability
    let isEbook: Bool
    let buyLink: String?
}

enum Saleability: String, Codable {
    case free = "FREE"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]?
    let publisher: String?
    let publishedDate: String
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let printType: PrintType
    let maturityRating: MaturityRating
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary
    let imageLinks: ImageLinks
    let language: Language
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let pageCount: Int?
    let categories: [String]?
    let subtitle: String?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type: TypeEnum
    let identifier: String
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
    case other = "OTHER"
}

enum Language: String, Codable {
    case en = "en"
}

enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool
}
