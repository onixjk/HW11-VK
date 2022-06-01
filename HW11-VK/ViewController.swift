import UIKit

class ViewController: UIViewController {
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "swiftImage")
        
        return imageView
    }()
    
    private lazy var phoneImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "iphone")
        let grayImage = image?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        
        imageView.image = grayImage
        
        return imageView
    }()
    
    private lazy var parentStackView = createStackView(axis: .vertical, alignment: .fill)
    private lazy var headerStackView = createStackView(axis: .horizontal, alignment: .center)
    private lazy var statusStackView = createStackView(axis: .vertical, alignment: .leading)
    private lazy var statusLabelStackView = createStackView(axis: .horizontal, alignment: .fill)
    
    private lazy var nameLabel = createLabel(text: "Имя Фамилия", textColor: .white, fontSize: 22, weight: .medium)
    private lazy var statusLabel = createLabel(text: "online", textColor: .systemGray, fontSize: 16, weight: .regular)
    
    private lazy var statusButton = createButton(title: "Установить статус", titleColor: Color.blueColor, fontSize: 18, weight: .light)
    private lazy var editButton = createButton(title: "Редактировать", titleColor: .white, fontSize: 18, weight: .medium)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
        setupStackView()
        setupImageView()
        setupButton()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
        view.addSubview(parentStackView)
        
        parentStackView.addArrangedSubview(headerStackView)
        parentStackView.addArrangedSubview(editButton)
        
        headerStackView.addArrangedSubview(logo)
        headerStackView.addArrangedSubview(statusStackView)
        
        statusStackView.addArrangedSubview(nameLabel)
        statusStackView.addArrangedSubview(statusButton)
        statusStackView.addArrangedSubview(statusLabelStackView)
        
        statusLabelStackView.addArrangedSubview(statusLabel)
        statusLabelStackView.addArrangedSubview(phoneImage)
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
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor).isActive = true
        editButton.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: Metric.editButtonHeight).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupStackView() {
        parentStackView.spacing = 10
    }
    
    private func setupImageView() {
        logo.layer.masksToBounds = true
        logo.layer.cornerRadius = 50
    }
    
    private func setupButton() {
        editButton.backgroundColor = Color.darkGrayColor
        editButton.layer.cornerRadius = 10
    }

    
    // MARK: - Privatre Methods
    
    private func createStackView(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = axis
        stackView.alignment = alignment
        
        return stackView
    }
    
    private func createLabel(text: String, textColor: UIColor, fontSize: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        
        return label
    }
    
    private func createButton(title: String, titleColor: UIColor, fontSize: CGFloat, weight: UIFont.Weight) -> UIButton {
        let button = UIButton(type: .system)
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: weight)
        
        return button
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
        
        static let editButtonHeight: CGFloat = 40
    }
    
    enum Color {
        static let blueColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        static let darkGrayColor = #colorLiteral(red: 0.1415808797, green: 0.1537714303, blue: 0.1702026427, alpha: 1)
    }
}

