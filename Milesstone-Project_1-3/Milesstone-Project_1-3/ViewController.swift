//
//  ViewController.swift
//  Milesstone-Project_1-3
//
//  Created by Marc Moxey on 5/19/22.
//

import UIKit

class ViewController: UITableViewController {

    var  countries = [String]()
   
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        title = "Milestone Project"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        //loop through items in bundle and append to array
        for item in items {
            if item.description.hasSuffix("png") {
                countries.append(item)
                countries.sort()
               
            }
        }
        //print( countries)
    }
    
    //return number of rows from array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        //check if there a text label if not return row number
        cell.textLabel?.text =  countries[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
        
            //load image that selected by the user 
            vc.selectedImage = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = countries.count
        }
    }

}

