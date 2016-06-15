//
//  Rating+CoreDataProperties.swift
//  MoodTracker
//
//  Created by Jason Rybka on 2/15/16.
//  Copyright © 2016 Simplilearn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Rating {

    @NSManaged var date: String?
    @NSManaged var dateStamp: NSDate?
    @NSManaged var status: String?

}
