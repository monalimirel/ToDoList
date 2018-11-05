import UIKit

class ListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddItem, CheckBox {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var tasks: [Tasks] = []
    
    override func viewDidLoad() {
        tasks.append(Tasks(name:"Study for CSC 690 Midterm"))
        tasks.append(Tasks(name:"CSC 690 Assign 2: To-Do List App"))
        
//        listTableView.dataSource = self
//        listTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControlState.normal)
        } else {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControlState.normal)
        }
        
        cell.delegate = self
        cell.tasks = tasks
        cell.indexP = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "EditItemSegue" {
//            let cell = sender as! UITableViewCell
//            if let indexPath = listTableView.indexPath(for: cell) {
//                let navVC = segue.destination as! UINavigationController
//                let editVC = navVC.viewControllers.first as! EditItemViewController
//
//                editVC.originalText = tasks[indexPath.row][] as! String
//                editVC.listIndex = indexPath.row
//            }
//        }
        
        let vc = segue.destination as! AddItemViewController
        vc.delegate = self
    }

    func addItem(name: String) {
        tasks.append(Tasks(name: name))
        listTableView.reloadData()
    }
    
    func checkBox(state: Bool, index: Int?) {
        tasks[index!].checked = state
        listTableView.reloadRows(at: [IndexPath(row: index!, section: 0)], with: UITableViewRowAnimation.none)
    }
    
}

class Tasks {
    var name = ""
    var checked = false
    
    convenience init (name: String) {
        self.init()
        self.name = name
    }
}

