import UIKit

class ViewController: UIViewController {
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "swiftImage")
        
        return imageView
    }()
    
    private lazy var parentStackView = createStackView(axis: .vertical, alignment: .fill)
    private lazy var headerStackView = createStackView(axis: .horizontal, alignment: .center)
    private lazy var statusStackView = createStackView(axis: .vertical, alignment: .leading)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
        setupImageView()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
        view.addSubview(parentStackView)
        
        parentStackView.addArrangedSubview(headerStackView)
        
        headerStackView.addArrangedSubview(logo)
        headerStackView.addArrangedSubview(statusStackView)
    }
    
    private func setupLayout() {
        
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: Metric.parentStackViewTopOffset).isActive = true
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: Metric.parentStackViewLeadingOffset).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: Metric.parentStackViewTrailingOffset).isActive = true
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.topAnchor.constraint(equalTo: parentStackView.topAnchor).isActive = true
        headerStackView.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor).isActive = true
        headerStackView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor).isActive = true
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.trailingAnchor.constraint(equalTo: statusStackView.leadingAnchor, constant: Metric.logoTrailingOffset).isActive = true
        logo.heightAnchor.constraint(equalToConstant: Metric.logoHeight).isActive = true
        logo.widthAnchor.constraint(equalToConstant: Metric.logoWidth).isActive = true
        
        statusStackView.translatesAutoresizingMaskIntoConstraints = false
        statusStackView.topAnchor.constraint(equalTo: parentStackView.topAnchor).isActive = true
        statusStackView.leadingAnchor.constraint(equalTo: logo.trailingAnchor).isActive = true
        statusStackView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor).isActive = true
        statusStackView.bottomAnchor.constraint(equalTo: headerStackView.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupImageView() {
        logo.layer.masksToBounds = true
        logo.layer.cornerRadius = 50
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
        
        static let logoTrailingOffset: CGFloat = -10
        static let logoHeight: CGFloat = 100
        static let logoWidth: CGFloat = 100
    }
}

