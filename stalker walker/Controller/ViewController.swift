//
//  ViewController.swift
//  stalker walker
//
//  Created by nato on 09/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UIButton!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var profilePictureButton: UIButton!
    @IBOutlet weak var biographyButton: UIButton!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var privateButton: UIButton!
    @IBOutlet weak var followersButton: UIButton!
    @IBOutlet weak var followingButton: UIButton!
    
    
    var instagramManager = InstagramManager()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        instagramManager.delegate = self
        searchField.delegate = self
    }

    
    
}

//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchField.endEditing(true)
        print(searchField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        print(searchField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchField.text {
           // instagramManager.fetchWeather(cityName: city)
            print(city)
        }
        //use searchTextField.text to get the weather for the city
        searchField.text = ""
    }

    
}


//MARK: - InstagramManagerDelegate

extension ViewController: InstagramManagerDelegate {
    
    func didUpdateInstagram(_ instagramManager: InstagramManager, instagram: InstagramModel) {
        DispatchQueue.main.async {
            self.nameField.setTitle(instagram.fullName, for: .normal)
            //self.nameField.titleLabel = instagram.fullName
            self.profilePictureButton.setTitle(instagram.profilePicture, for: .normal)
            //self.profilePictureButton.titleLabel = instagram.profilePicture
            self.biographyButton.setTitle(instagram.bio, for: .normal)
            //self.biographyButton.titleLabel = instagram.bio
            self.postButton.setTitle(instagram.postString, for: .normal)
            //self.postButton.titleLabel = instagram.post
            self.privateButton.setTitle(instagram.lockedbool, for: .normal)
            //self.privateButton.titleLabel = instagram.locked
            self.followersButton.setTitle(instagram.followersString, for: .normal)
            //self.followersButton.titleLabel = instagram.followers
            self.followingButton.setTitle(instagram.followingString, for: .normal)
            //self.followingButton.titleLabel = instagram.following
            
        }
    }
    
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
