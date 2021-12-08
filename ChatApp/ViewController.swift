//
//  ViewController.swift
//  ChatApp
//
//  Created by Areej Mohammad on 03/05/1443 AH.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var sendidUser : String?
    var sendnameUser : String?
    
    var arrUsers : [Users] = [] //empty array for uosers
    
    let fireStoreURL = Firestore.firestore()

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        getUsersfromfirstore()
    }
    func getUsersfromfirstore(){
        fireStoreURL.collection("Users").getDocuments { SnapShot, error in
            for user in SnapShot!.documents {
                print("==============")
                print(user.data())
                self.arrUsers.append(Users(name: user.get("Name") as! String, id: user.get("ID") as! String))
            }
            self.myTable.reloadData()
        }
    }
    
    @IBAction func signout(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }catch{
            print(error.localizedDescription)
        }
    }
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "firstcell", for: indexPath) as! FirstCell
        cell.nameLable.text = arrUsers[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "chat", sender: self )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chat" {
            let vc = ChatPage()
            vc.idUser = sendidUser
            vc.nameUser = sendnameUser
        }
    }
    
    
}
struct Users {
    var name : String?
    var id : String?
}
