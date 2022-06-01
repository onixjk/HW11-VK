import UIKit

class ViewController: UIViewController {
    
    private lazy var parentStackView = createStackView(axis: .vertical, alignment: .fill)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
        view.addSubview(parentStackView)
    }
    
    private func setupLayout() {
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: Metric.parentStackViewTopOffset).isActive = true
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: Metric.parentStackViewLeadingOffset).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: Metric.parentStackViewTrailingOffset).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    // MARK: - Privatre Methods
    
    private func createStackView(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = axis
        stackView.alignment = alignment
        
        return stackView
    }
}

// MARK: - Constants

extension ViewController {
    enum Metric {
        static let parentStackViewTopOffset: CGFloat = 15
        static let parentStackViewLeadingOffset: CGFloat = 10
        static let parentStackViewTrailingOffset: CGFloat = -10
    }
}

