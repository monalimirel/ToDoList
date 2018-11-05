import UIKit

class EditItemViewController: UIViewController {
    
    var listIndex: Int?
    var originalText: String?
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func editItemAction(_ sender: Any) {
        if (inputTextField.text != originalText){
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
