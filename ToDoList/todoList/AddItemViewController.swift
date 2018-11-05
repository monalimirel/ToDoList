import UIKit

protocol AddItem {
    func addItem(name: String)
}

class AddItemViewController: UIViewController {
    
    @IBAction func addItemAction(_ sender: Any) {
        if nameTextField.text != "" {
            delegate?.addItem(name: nameTextField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var delegate: AddItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
