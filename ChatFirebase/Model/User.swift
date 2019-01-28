//
//  User.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/19/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

struct User {
    var id: String
    var name: String
    var email: String
    var password: String?
}

extension User: JSONCompatible {
    func toJson() -> [String : Any] {
        return [
            "id": id,
            "name": name,
            "email": email
        ]
    }
}

extension User: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String else {
                return nil
        }
        
        self.init(id: id, name: name, email: email, password: nil)
     }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }

}
