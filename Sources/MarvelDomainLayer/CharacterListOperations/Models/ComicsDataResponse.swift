//
//  File.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

// MARK: - ComicsDataResponse
public struct ComicsDataResponse: Codable {
    public let code: Int
    public let status, copyright, attributionText, attributionHTML: String
    public let etag: String
    public let data: ComicListData

    public init(code: Int, status: String, copyright: String, attributionText: String, attributionHTML: String, etag: String, data: ComicListData) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.etag = etag
        self.data = data
    }
}

// MARK: - Datapublic struct
public struct ComicListData: Codable {
    public let offset, limit, total, count: Int
    public let results: [ComicData]

    public init(offset: Int, limit: Int, total: Int, count: Int, results: [ComicData]) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

// MARK: - Result
public struct ComicData: Codable {
    public let id, digitalID: Int
    public let title: String
    public let issueNumber: Int
    public let variantDescription: VariantDescription
    public let resultDescription: String?
    public let modified, isbn, upc, diamondCode: String
    public let ean, issn: String
    public let format: Format
    public let pageCount: Int
    public let textObjects: [TextObject]
    public let resourceURI: String
    public let urls: [URLElement]
    public let series: Series
    public let variants: [Series]
    public let dates: [DateElement]
    public let prices: [Price]
    public let thumbnail: Thumbnail
    public let images: [Thumbnail]
    public let creators: Creators
    public let characters: Characters
    public let stories: Stories
    public let events: Characters

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription
        case resultDescription = "description"
        case modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects, resourceURI, urls, series, variants, dates, prices, thumbnail, images, creators, characters, stories, events
    }

    public init(id: Int, digitalID: Int, title: String, issueNumber: Int, variantDescription: VariantDescription, resultDescription: String?, modified: String, isbn: String, upc: String, diamondCode: String, ean: String, issn: String, format: Format, pageCount: Int, textObjects: [TextObject], resourceURI: String, urls: [URLElement], series: Series, variants: [Series], dates: [DateElement], prices: [Price], thumbnail: Thumbnail, images: [Thumbnail], creators: Creators, characters: Characters, stories: Stories, events: Characters) {
        self.id = id
        self.digitalID = digitalID
        self.title = title
        self.issueNumber = issueNumber
        self.variantDescription = variantDescription
        self.resultDescription = resultDescription
        self.modified = modified
        self.isbn = isbn
        self.upc = upc
        self.diamondCode = diamondCode
        self.ean = ean
        self.issn = issn
        self.format = format
        self.pageCount = pageCount
        self.textObjects = textObjects
        self.resourceURI = resourceURI
        self.urls = urls
        self.series = series
        self.variants = variants
        self.dates = dates
        self.prices = prices
        self.thumbnail = thumbnail
        self.images = images
        self.creators = creators
        self.characters = characters
        self.stories = stories
        self.events = events
    }
}

// MARK: - Characters
public struct Characters: Codable {
    public let available: Int
    public let collectionURI: String
    public let items: [Series]
    public let returned: Int

    public init(available: Int, collectionURI: String, items: [Series], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

// MARK: - Series
public struct Series: Codable {
    public let resourceURI: String
    public let name: String

    public init(resourceURI: String, name: String) {
        self.resourceURI = resourceURI
        self.name = name
    }
}

// MARK: - Creators
public struct Creators: Codable {
    public let available: Int
    public let collectionURI: String
    public let items: [CreatorsItem]
    public let returned: Int

    public init(available: Int, collectionURI: String, items: [CreatorsItem], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

// MARK: - CreatorsItem
public struct CreatorsItem: Codable {
    public let resourceURI: String
    public let name: String
    public let role: Role

    public init(resourceURI: String, name: String, role: Role) {
        self.resourceURI = resourceURI
        self.name = name
        self.role = role
    }
}

public enum Role: String, Codable {
    case colorist = "colorist"
    case editor = "editor"
    case inker = "inker"
    case letterer = "letterer"
    case penciler = "penciler"
    case penciller = "penciller"
    case pencillerCover = "penciller (cover)"
    case writer = "writer"
    case unknown = "unknown"
}

extension Role {
    public init(from decoder: Decoder) throws {
        self = try Role(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
    
// MARK: - DateElement
public struct DateElement: Codable {
    public let type: DateType
    public let date: String

    public init(type: DateType, date: String) {
        self.type = type
        self.date = date
    }
}

public enum DateType: String, Codable {
    case digitalPurchaseDate = "digitalPurchaseDate"
    case focDate = "focDate"
    case onsaleDate = "onsaleDate"
    case unlimitedDate = "unlimitedDate"
    case unknown = "unknown"
}

extension DateType {
    public init(from decoder: Decoder) throws {
        self = try DateType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

public enum Format: String, Codable {
    case comic = "Comic"
    case unknown = "unknown"
}

extension Format {
    public init(from decoder: Decoder) throws {
        self = try Format(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

// MARK: - Price
public struct Price: Codable {
    public let type: PriceType
    public let price: Double

    public init(type: PriceType, price: Double) {
        self.type = type
        self.price = price
    }
}

public enum PriceType: String, Codable {
    case digitalPurchasePrice = "digitalPurchasePrice"
    case printPrice = "printPrice"
    case unknown = "unknown"
}

extension PriceType {
    public init(from decoder: Decoder) throws {
        self = try PriceType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

// MARK: - Stories
public struct Stories: Codable {
    public let available: Int
    public let collectionURI: String
    public let items: [StoriesItem]
    public let returned: Int

    public init(available: Int, collectionURI: String, items: [StoriesItem], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

// MARK: - StoriesItem
public struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType

    init(resourceURI: String, name: String, type: ItemType) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}


// MARK: - TextObject
public struct TextObject: Codable {
    public let type: TextObjectType
    public let language: Language
    public let text: String

    public init(type: TextObjectType, language: Language, text: String) {
        self.type = type
        self.language = language
        self.text = text
    }
}

public enum Language: String, Codable {
    case enUs = "en-us"
    case unknown = "unknown"
}

extension Language {
    public init(from decoder: Decoder) throws {
        self = try Language(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

public enum TextObjectType: String, Codable {
    case issuePreviewText = "issue_preview_text"
    case issueSolicitText = "issue_solicit_text"
    case unknown = "unknown"
}

extension TextObjectType {
    public init(from decoder: Decoder) throws {
        self = try TextObjectType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

// MARK: - URLElement
public struct URLElement: Codable {
    public let type: URLType
    public let url: String

    public init(type: URLType, url: String) {
        self.type = type
        self.url = url
    }
}

public enum URLType: String, Codable {
    case detail = "detail"
    case inAppLink = "inAppLink"
    case purchase = "purchase"
    case reader = "reader"
    case unknown = "unknown"
}

extension URLType {
    public init(from decoder: Decoder) throws {
        self = try URLType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

public enum VariantDescription: String, Codable {
    case empty = ""
    case spotlightVariant = "SPOTLIGHT VARIANT"
    case zombieVariant = "ZOMBIE VARIANT"
    case unknown = "unknown"
}

extension VariantDescription {
    public init(from decoder: Decoder) throws {
        self = try VariantDescription(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
