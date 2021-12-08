
import UIKit
import Firebase

class HomePageVC: UIViewController {
    
    let fireStoreURL = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func signIn(_ sender: Any) {
        if Auth.auth().currentUser?.uid == nil {
            Auth.auth().signInAnonymously { user, error in
                if error == nil {
                    let dateUser = ["Name":"User","ID":user?.user.uid]
                    self.fireStoreURL.collection("Users").document((user?.user.uid)!).setData(dateUser)
                    self.performSegue(withIdentifier: "moveHome", sender: self)
                }
            }
        }else{
            self.performSegue(withIdentifier: "moveHome", sender: self)
        }
    }
}

