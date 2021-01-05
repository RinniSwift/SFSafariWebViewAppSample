import UIKit
import SafariServices

class ViewController: UIViewController, ButtonsPageDelegate, SFSafariViewControllerDelegate {

    var page: ButtonsPage! {
        view as? ButtonsPage
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        page.configure()
        page.delegate = self
    }

    override func loadView() {
        view = ButtonsPage()
    }

    // MARK: ButtonsPageDelegate

    func userDidSelectOpenWebView(_ order: Int) {
        var pathStr: String?
        switch order {
        case 0..<2:
            pathStr = PDFFile.pdfFilePaths[order]
        default:
            break
        }

        guard let path = pathStr else {
            // optional todo:  add metric logging
            displayGenericAlert()
            return
        }

        guard let pdfUrl = URL(string: path) else {
            // optional todo: add metric logging
            displayGenericAlert()
            return
        }

        let sfConfig = SFSafariViewController.Configuration()
        sfConfig.entersReaderIfAvailable = true

        let sfViewController = SFSafariViewController(url: pdfUrl,
                                                      configuration: sfConfig)
        sfViewController.delegate = self
        sfViewController.modalPresentationStyle = .overCurrentContext
        sfViewController.dismissButtonStyle = .close

        present(sfViewController, animated: true) {
            print("presented")
        }
    }

    // MARK: SFSafariViewControllerDelegate

    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
        // do something
    }
}

