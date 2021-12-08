//
//  ChatPage.swift
//  ChatApp
//
//  Created by Areej Mohammad on 03/05/1443 AH.
//

import UIKit
import Firebase

class ChatPage: UIViewController  {
    
    var myId : String?
    var idUser : String?
    var nameUser : String?
    let fireStoreURL = Firestore.firestore()

    
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var chatTable: UITableView!
    @IBOutlet weak var textMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTable.delegate = self
        chatTable.dataSource = self
        myId = "\(Auth.auth().currentUser!.uid)"

    }
    
    @IBAction func SendMessage(_ sender: Any) {
    }
    
    func sendMSg (){
        let msgPost = ["content":textMessage.text!]
        fireStoreURL.collection("Users").document(myId!).collection("Messages").document(self.idUser!).setData(msgPost)
        fireStoreURL.collection("Users").document(self.idUser!).collection("Messages").document(myId!).collection("msg").document().setData(msgPost)
    }
}
extension ChatPage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTable.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! chatCell
        return cell
    }
    
    
}
