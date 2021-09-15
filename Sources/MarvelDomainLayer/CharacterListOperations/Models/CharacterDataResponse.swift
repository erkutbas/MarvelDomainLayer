//
//  File.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

// MARK: - CharacterDataResponse
public struct CharacterDataResponse: Codable {
    public let code: Int
    public let status, copyright, attributionText, attributionHTML: String
    public let etag: String
    public let data: CharacterListData
    
    public init(code: Int, status: String, copyright: String, attributionText: String, attributionHTML: String, etag: String, data: CharacterListData) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.etag = etag
        self.data = data
    }
    
}

// MARK: - DataClass
public struct CharacterListData: Codable {
    public let offset, limit, total, count: Int
    public let results: [CharacterData]
    
    public init(offset: Int, limit: Int, total: Int, count: Int, results: [CharacterData]) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

// MARK: - Result
public struct CharacterData: Codable {
    public let id: Int
    public let name, resultDescription: String
    public let modified: Date
    public let thumbnail: Thumbnail
    public let resourceURI: String
    public let comics, series: Comics
    public let stories: Stories
    public let events: Comics
    public let urls: [URLElement]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
    
    public init(id: Int, name: String, resultDescription: String, modified: Date, thumbnail: Thumbnail, resourceURI: String, comics: Comics, series: Comics, stories: Stories, events: Comics, urls: [URLElement]) {
        self.id = id
        self.name = name
        self.resultDescription = resultDescription
        self.modified = modified
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
        self.urls = urls
    }
}

// MARK: - Comics
public struct Comics: Codable {
    public let available: Int
    public let collectionURI: String
    public let items: [ComicsItem]
    public let returned: Int
    
    public init(available: Int, collectionURI: String, items: [ComicsItem], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
    
}

// MARK: - ComicsItem
public struct ComicsItem: Codable {
    public let resourceURI: String
    public let name: String
    
    public init(resourceURI: String, name: String) {
        self.resourceURI = resourceURI
        self.name = name
    }
    
}

public enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
    case unknown = "unknown"
}

extension ItemType {
    public init(from decoder: Decoder) throws {
        self = try ItemType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

// MARK: - Thumbnail
public struct Thumbnail: Codable {
    public let path: String
    public let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

public enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case unknown = "unknown"
}

extension Extension {
    public init(from decoder: Decoder) throws {
        self = try Extension(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

