//
//  User.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/19/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var email: String
    var password: String
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name &&
            lhs.email == rhs.email &&
            lhs.password == rhs.password
    }

}
