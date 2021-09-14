//
//  File.swift
//  
//
//  Created by Erkut Bas on 14.09.2021.
//

import Foundation

// MARK: - CharacterDataResponse
public struct CharacterDataResponse: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharacterListData
    
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
    let offset, limit, total, count: Int
    let results: [CharacterData]
    
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
    let id: Int
    let name, resultDescription: String
    let modified: Date
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
    
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
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
    
    public init(available: Int, collectionURI: String, items: [ComicsItem], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
    
}

// MARK: - ComicsItem
public struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
    
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
    let path: String
    let thumbnailExtension: Extension
    
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
