//
//  RateVC.swift
//  MoodTracker
//
//  Created by Jason Rybka on 2/15/16.
//  Copyright © 2016 Simplilearn. All rights reserved.
//

import UIKit
import CoreData

class RateVC: UIViewController {

    @IBOutlet weak var status: UILabel!
    
    var newRating : Rating? = nil
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        
        dismissVC()
        
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        
        if status.text != "How are you feeling?" {
            
            addNewRating()
            
            dismissVC()
            
        } else {
            
            dismissVC()
            
        }
        
    }
    
    @IBAction func ratingTapped(sender: UIButton) {
        
        status.text = sender.currentTitle
        saveTapped(self)
        
    }
    
    func dismissVC() {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    func getDate() -> String {
        
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .MediumStyle)
        
        return date
        
    }
    
    func addNewRating() {
        
        let ent = NSEntityDescription.entityForName("Rating", inManagedObjectContext: moc)
        
        newRating = Rating(entity: ent!, insertIntoManagedObjectContext: moc)
        
        newRating!.status = status.text
        newRating!.date = getDate()
        newRating!.dateStamp = NSDate()
        
        do {
            try moc.save()
        } catch {
            print("Could not save.")
        }
        
    }
    
    

}

