import UIKit

extension UIViewController {

    func displayGenericAlert() {
        let alertController = UIAlertController(title: "Oops!",
                                                message: "Something went wrong.",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
