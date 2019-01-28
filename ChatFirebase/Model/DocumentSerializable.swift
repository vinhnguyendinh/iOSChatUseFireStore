//
//  DocumentSerializable.swift
//  ChatFirebase
//
//  Created by Nguyen Vinh on 1/20/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import Foundation

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}
