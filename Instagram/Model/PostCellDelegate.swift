//
//  PostCellDelegate.swift
//  Instagram
//
//  Created by Philippe Yu on 2017-12-12.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import UIKit

protocol PostCellDelegate {
    func willOpenProfile(named: String, profilePicture: URL)
    func reloadTableViewData()
}
