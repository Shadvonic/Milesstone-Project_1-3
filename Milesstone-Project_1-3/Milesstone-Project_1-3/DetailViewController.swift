//
//  DetailViewController.swift
//  Milesstone-Project_1-3
//
//  Created by Marc Moxey on 5/19/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load the detail view controller layout from our storyboard.
     
        //Set its selectedImage property to be the correct item from the pictures array.
        
        
        //Show the new view controller.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        

        // Do any additional setup after loading the view.
        
        title = "\(selectedPictureNumber) of \(totalPictures)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

   

}
