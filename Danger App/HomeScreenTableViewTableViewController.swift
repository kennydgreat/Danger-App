//
//  HomeScreenTableViewTableViewController.swift
//  Danger App
//
//  Created by Kenneth Uyabeme on 11/9/18.
//  Copyright © 2018 Kenneth Uyabeme. All rights reserved.
//

import UIKit
import CoreData
var chanllenges:[Challenge] = []
var dangerCellClickIndex = 0

class HomeScreenTableViewTableViewController: UITableViewController {
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Setup your CoreData variable
        // ----------------------------------------
        
        // 1. Mandatory - copy and paste this
        // Explanation: try to create/initalize the appDelegate variable.
        // If creation fails, then quit the app
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Mandatory - initialize the context variable
        // This variable gives you access to the CoreData functions
        self.context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<Challenge> = Challenge.fetchRequest()
        
        do {
            // Send the "SELECT *" to the database
            //  results = variable that stores any "rows" that come back from the db
            // Note: The database will send back an array of User objects
            // (this is why I explicilty cast results as [User]
            let results = try self.context.fetch(fetchRequest) as [Challenge]
            
            chanllenges = results
            
            // Loop through the database results and output each "row" to the screen
            print("Number of items in database: \(results.count)")
            
            
            // DEBUG CODE
            for x in results {
                print("Stuff in db: \(x.name!)")
                
            }
            
        }
        catch {
            print("Error when fetching from database")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chanllenges.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dangerList", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = chanllenges[indexPath.row].name
        return cell
    }
    
  
   
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dangerCellClickIndex = indexPath.row
        performSegue(withIdentifier: "homeTabletoWebViewsegue", sender: self)
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        var challenge1 = Challenge(context: context)
        challenge1.name = "Condom snorting"
        challenge1.video = "https://www.youtube.com/watch?v=WQjFHaDG7Qw"
        
        var challenge2 = Challenge(context: context)
        challenge2.name = "Car Surfing"
        challenge2.video = "https://www.youtube.com/watch?v=yKk-YPDIqzU"
        
        var challenge3 = Challenge(context: context)
        challenge3.name = "Duct tape challenge"
        challenge3.video = "https://www.youtube.com/watch?v=BOaTUw9GEfg"
        /*
         Save users to the database
         */
        
        
        // 3.Save object
        do{
            try self.context.save()
            self.tableView.reloadData()
        }catch{
            print("Error occured while saving")
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        self.context.delete(chanllenges[dangerCellClickIndex])
        self.tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
