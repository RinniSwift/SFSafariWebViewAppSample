import Foundation
import UIKit

protocol ButtonsPageDelegate {
    func userDidSelectOpenWebView(_ order: Int)
}

class ButtonsPage: UIView {

    var delegate: ButtonsPageDelegate?

    func configure() {
        let stackView = UIStackView()

        for tag in 0..<3 {
            let button = UIButton(type: .system)
            button.tag = tag
            button.setTitle("Open url \(tag + 1)", for: .normal)
            button.addTarget(self, action: #selector(selectedButton(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        let stackConstraints = [
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        NSLayoutConstraint.activate(stackConstraints)
    }

    @objc
    func selectedButton(sender: UIButton) {
        delegate?.userDidSelectOpenWebView(sender.tag)
    }
}
