import UIKit

class FiendListViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createFriends()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func createFriends() {
        let nazar = Friend()
        nazar.name = "Nazar"
        nazar.birthday = "April 17"
        nazar.phoneNumber = "347-111-1111"
        nazar.picture = UIImage(named: "Nazar")!
        self.friends.append(nazar)
        
        let alya = Friend()
        alya.name = "Alya"
        alya.birthday = "March 28"
        alya.phoneNumber = "347-222-2222"
        alya.picture = UIImage(named: "Alya")!
        self.friends.append(alya)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: friend)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! FriendDetailViewController
        detailVC.friend = sender as! Friend
    }
}

