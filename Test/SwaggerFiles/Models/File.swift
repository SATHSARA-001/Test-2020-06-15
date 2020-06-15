//
// File.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct File: Codable {

    public var _id: Int?
    public var uuid: String?
    public var key: String?
    public var category: String?
    public var name: String?
    public var _description: String?
    public var allowPublicAccess: Bool?
    public var originalFilename: String?
    public var filePath: String?
    public var fileDisk: String?
    public var fileUrl: String?
    public var fileSizeBytes: String?
    public var uploadedByUserId: Int?
    public var deletedAt: String?
    public var createdAt: String?
    public var updatedAt: String?

    public init(_id: Int?, uuid: String?, key: String?, category: String?, name: String?, _description: String?, allowPublicAccess: Bool?, originalFilename: String?, filePath: String?, fileDisk: String?, fileUrl: String?, fileSizeBytes: String?, uploadedByUserId: Int?, deletedAt: String?, createdAt: String?, updatedAt: String?) {
        self._id = _id
        self.uuid = uuid
        self.key = key
        self.category = category
        self.name = name
        self._description = _description
        self.allowPublicAccess = allowPublicAccess
        self.originalFilename = originalFilename
        self.filePath = filePath
        self.fileDisk = fileDisk
        self.fileUrl = fileUrl
        self.fileSizeBytes = fileSizeBytes
        self.uploadedByUserId = uploadedByUserId
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case uuid
        case key
        case category
        case name
        case _description = "description"
        case allowPublicAccess = "allow_public_access"
        case originalFilename = "original_filename"
        case filePath = "file_path"
        case fileDisk = "file_disk"
        case fileUrl = "file_url"
        case fileSizeBytes = "file_size_bytes"
        case uploadedByUserId = "uploaded_by_user_id"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }


}
