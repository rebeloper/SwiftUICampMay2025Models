//
//  Profile.swift
//  SwiftUICampMay2025Models
//
//  Created by Alex Nagy on 14.05.2025.
//

import SwiftUI
import FirebaseFirestore

public struct Profile: Identifiable, Codable {
    
    @DocumentID public var id: String?
    public var uid: String {
        id ?? ""
    }
    
    public var name: String
    
    public init(name: String = "") {
        self.name = name
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(DocumentID<String>.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
    }
}
