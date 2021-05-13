//
//  ViewController.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-03-19.
//

import UIKit
import SideMenu
import FirebaseAuth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MenuControllerDelegate {
    var db: OpaquePointer?

    private var sideMenu: SideMenuNavigationController?
    @IBOutlet weak var tableView: UITableView!
    let userDefaults = UserDefaults()
 
    var cells: [Cell] = []
    
    func createArray() -> [Cell] {
        var homeCells: [Cell] = []
        
        let health = Cell(image: UIImage(named: "healthcare1.jpg")!, title: "Healthcare Tips")
        let news = Cell(image: UIImage(named: "pet_news.jpg")!, title: "Latest News")
        let media = Cell(image: UIImage(named: "media.png")!, title: "Media")
        let shop = Cell(image: UIImage(named: "toys1.png")!, title: "Shop")
        let recommened = Cell(image: UIImage(named: "dog_house.jpg")!, title: "Recommended")

        homeCells.append(health)
        homeCells.append(news)
        homeCells.append(media)
        homeCells.append(shop)
        homeCells.append(recommened)
        
        return homeCells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellRows = cells[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        cell.setCell(cell: cellRows)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let index = indexPath.row
        if index == 0 {
            let healthView = self.storyboard?.instantiateViewController(withIdentifier: "HealthViewController") as! HealthViewController
            
            navigationItem.rightBarButtonItem = nil
            self.addChild(healthView)
            self.view.addSubview(healthView.view)
            healthView.didMove(toParent: self)
            self.view.isHidden = false
            healthView.view.isHidden = false
        }
        else if index == 2 {
            let videoView = self.storyboard?.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
            
            navigationItem.rightBarButtonItem = nil
            self.addChild(videoView)
            self.view.addSubview(videoView.view)
            videoView.didMove(toParent: self)
            self.view.isHidden = false
            videoView.view.isHidden = false
        }
        else if index == 3 {
            print("Shop")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340.0;//Choose your custom row height
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let addPetView = storyboard?.instantiateViewController(withIdentifier: "AddPetViewController") as! AddPetViewController
      self.present(addPetView, animated: true, completion: nil)
    }

    @IBOutlet var trailling: NSLayoutConstraint!
    @IBOutlet var leading: NSLayoutConstraint!
 
    var menuOut = false
    
    // The link to the various view controllers
    private let aboutController = AboutViewController()
    private let mainPetController = ManagePetViewController()
    private let subscriptionController = SubscriptionViewController()
    private let shopController = ShopViewController()
    private let profileController = ProfileViewController()
    private let settingsController = SettingsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuthenticated()
        // Titles for the various navigation menu selections
        // Applications various presentable screens
        let menu = MenuController(with: ["Home", "Shop", "Subscriptions", "Settings", "Profile", "Manage Pets" , "About" ,"Logout"])
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        cells = createArray()
        tableView?.delegate = self
        tableView?.dataSource = self
        addChildControllers()
    }
    
    // Add our view controllers as children
    private func addChildControllers() {
    
        addChild(aboutController)
        addChild(mainPetController)
        addChild(settingsController)
        addChild(subscriptionController)
        
        view.addSubview(aboutController.view)
      
        view.addSubview(mainPetController.view)
        view.addSubview(settingsController.view)
        view.addSubview(subscriptionController.view)
        
        aboutController.view.frame = view.bounds
        mainPetController.view.frame = view.bounds
        settingsController.view.frame = view.bounds
        subscriptionController.view.frame = view.bounds
 
        aboutController.didMove(toParent: self)
        mainPetController.didMove(toParent: self)
        settingsController.didMove(toParent: self)
        subscriptionController.didMove(toParent: self)
 
        aboutController.view.isHidden = true
        mainPetController.view.isHidden = true
        settingsController.view.isHidden = true
        subscriptionController.view.isHidden = true
    }
    
    // Code concerning menu item selection
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            self?.title = named
            
            if named == "Home"
            {
                let homeView = self?.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! ViewController
                
                self?.navigationItem.rightBarButtonItem = nil
                self?.addChild(homeView)
                self?.view.addSubview(homeView.view)
                homeView.didMove(toParent: self)
                self?.view.isHidden = false
                homeView.view.isHidden = false
            }
            else if named == "Shop"
            {
                self?.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self?.buttonAction)), animated: true)
                
                let shopView = self?.storyboard?.instantiateViewController(withIdentifier: "ShopViewController") as! ShopViewController
                
                self?.addChild(shopView)
                self?.view.addSubview(shopView.view)
                shopView.didMove(toParent: self)
                self?.view.isHidden = false
                shopView.view.isHidden = false
            }
            else if named == "Settings"
            {
                self?.navigationItem.rightBarButtonItem = nil
                self?.view.addSubview((self?.settingsController.view)!)
                self?.settingsController.didMove(toParent: self)
                self?.view.isHidden = false
                self?.settingsController.view.isHidden = false
            }
            else if named == "About"
            {
                
                self?.navigationItem.rightBarButtonItem = nil
                
                let aboutController = self?.storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
                
                self?.addChild(aboutController)
                self?.view.addSubview(aboutController.view)
                aboutController.didMove(toParent: self)
                self?.view.isHidden = false
                aboutController.view.isHidden = false
            }
            else if named == "Profile"
            {
                self?.navigationItem.rightBarButtonItem = nil
                
                let profileView = self?.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                
                self?.addChild(profileView)
                self?.view.addSubview(profileView.view)
                profileView.didMove(toParent: self)
                self?.view.isHidden = false
                profileView.view.isHidden = false
            }
            else if named == "Manage Pets"
            {
                self?.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self?.buttonAction)), animated: true)
                
                let petView = self?.storyboard?.instantiateViewController(withIdentifier: "ManagePetViewController") as! ManagePetViewController
            
                self?.addChild(petView)
                self?.view.addSubview(petView.view)
                petView.didMove(toParent: self)
                self?.view.isHidden = false
                petView.view.isHidden = false
            }
            else if named == "Subscriptions"
            {
                self?.navigationItem.rightBarButtonItem = nil
            
                self?.view.addSubview((self?.subscriptionController.view)!)
                self?.subscriptionController.didMove(toParent: self)
                self?.subscriptionController.view.isHidden = false
  
                self?.navigationItem.rightBarButtonItem = nil
            }
            
            // Logout code
            else if named == "Logout" {
                let actionSheet = UIAlertController(title: "",
                                                    message: "Are you sure you want to log out?",
                                                    preferredStyle: .actionSheet)
                actionSheet.addAction(UIAlertAction(title: "Cancel",
                                                    style: .cancel, handler: nil))
                actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in
                    AuthManager.shared.logOut(completion: { success in
                        DispatchQueue.main.async {
                            if success {
                                self!.userDefaults.removeObject(forKey: "currentUser")
                                // Present log in
                                let loginVC = LoginViewController()
                                // Present as fullscreen
                                loginVC.modalPresentationStyle = .fullScreen
                                self?.present(loginVC, animated: true) {
                                    self?.navigationController?.popToRootViewController(animated: true)
                                    self?.tabBarController?.selectedIndex = 0
                                }
                            }
                            else {
                                // Error occurred
                                fatalError("Could not log out user")
                            }
                        }
                    })
                }))
                self?.present(actionSheet, animated: true)
            }
        })
    }
    
    @IBAction func didTapMenuButton() {
        present(sideMenu!, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //print(Auth.auth().currentUser?.uid)
        let test = userDefaults.value(forKey: "currentUser")
        print(test!)
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("failed to sign out")
        }
    }
    
    private func handleNotAuthenticated() {
        // Check auth status
        let user = userDefaults.value(forKey: "currentUser")
        if user == nil {
            // Show log in
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc, animated: false)
        }
    }
}

