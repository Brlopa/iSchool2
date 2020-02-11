//
//  CurrentDate.swift
//  iSchool
//
//  Created by Bruno on 09.02.20.
//  Copyright © 2020 Thomas. All rights reserved.
//

import Foundation


var dateFormatter = DateFormatter()
dateFormatter = MediumStyle

var timeString = "The time is: \(dateFormatter.string(from: NSDate() as Date))"
