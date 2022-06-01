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
    
    private lazy var separator: UIView = {
        let view = UIView()
        
        view.backgroundColor = Color.separatorColor
        
        return view
    }()
    
    private lazy var parentStackView = createStackView(axis: .vertical, alignment: .fill)
    private lazy var headerStackView = createStackView(axis: .horizontal, alignment: .center)
    private lazy var statusStackView = createStackView(axis: .vertical, alignment: .leading)
    private lazy var statusLabelStackView = createStackView(axis: .horizontal, alignment: .fill)
    private lazy var buttonsWithTopImageStackView = createStackView(axis: .horizontal, alignment: .fill)
    private lazy var buttonWithLeftImageStackView = createStackView(axis: .vertical, alignment: .leading)
    
    private lazy var nameLabel = createLabel(text: "Имя Фамилия", textColor: .white, fontSize: 22, weight: .medium)
    private lazy var statusLabel = createLabel(text: "online", textColor: .systemGray, fontSize: 16, weight: .regular)
    
    private lazy var statusButton = createButton(title: "Установить статус", titleColor: Color.blueColor, fontSize: 18, weight: .light)
    private lazy var editButton = createButton(title: "Редактировать", titleColor: .white, fontSize: 18, weight: .medium)
    
    private lazy var historyButton = createButtonWithTopImage(imageName: "camera", title: "История", color: Color.blueColor)
    private lazy var recordButton = createButtonWithTopImage(imageName: "square.and.pencil", title: "Запись", color: Color.blueColor)
    private lazy var photoButton = createButtonWithTopImage(imageName: "photo", title: "Фото", color: Color.blueColor)
    private lazy var clipButton = createButtonWithTopImage(imageName: "play", title: "Клип", color: Color.blueColor)
    
    private lazy var cityButton = createButtonWithLeftImage(imageName: "house", title: "Город: Москва", color: Color.grayColor)
    private lazy var subscribersButton = createButtonWithLeftImage(imageName: "dot.radiowaves.up.forward", title: "35 подписчиков", color: Color.grayColor)
    private lazy var placeOfWorkButton = createButtonWithLeftImage(imageName: "briefcase", title: "Указать место работы",color: Color.blueColor)
    private lazy var giftButton = createButtonWithLeftImage(imageName: "snowflake", title: "Получить подарок", color: Color.purpleColor)
    private lazy var infoButton = createButtonWithLeftImage(imageName: "info.circle.fill", title: "Подробная информация", color: .white)
    
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
        parentStackView.addArrangedSubview(buttonsWithTopImageStackView)
        parentStackView.addArrangedSubview(separator)
        parentStackView.addArrangedSubview(buttonWithLeftImageStackView)
        
        headerStackView.addArrangedSubview(logo)
        headerStackView.addArrangedSubview(statusStackView)
        
        statusStackView.addArrangedSubview(nameLabel)
        statusStackView.addArrangedSubview(statusButton)
        statusStackView.addArrangedSubview(statusLabelStackView)
        
        statusLabelStackView.addArrangedSubview(statusLabel)
        statusLabelStackView.addArrangedSubview(phoneImage)
        
        buttonsWithTopImageStackView.addArrangedSubview(historyButton)
        buttonsWithTopImageStackView.addArrangedSubview(recordButton)
        buttonsWithTopImageStackView.addArrangedSubview(photoButton)
        buttonsWithTopImageStackView.addArrangedSubview(clipButton)
        
        buttonWithLeftImageStackView.addArrangedSubview(cityButton)
        buttonWithLeftImageStackView.addArrangedSubview(subscribersButton)
        buttonWithLeftImageStackView.addArrangedSubview(placeOfWorkButton)
        buttonWithLeftImageStackView.addArrangedSubview(giftButton)
        buttonWithLeftImageStackView.addArrangedSubview(infoButton)
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
        
        buttonsWithTopImageStackView.leftAnchor.constraint(equalTo: parentStackView.leftAnchor).isActive = true
        buttonsWithTopImageStackView.trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor).isActive = true
        
        separator.heightAnchor.constraint(equalToConstant: Metric.separatorHeight).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupStackView() {
        parentStackView.spacing = 10
        buttonWithLeftImageStackView.spacing = 10
    }
    
    private func setupImageView() {
        logo.layer.masksToBounds = true
        logo.layer.cornerRadius = 50
    }
    
    private func setupButton() {
        editButton.backgroundColor = Color.editButtonBackgroundColor
        editButton.layer.cornerRadius = 10
        
        infoButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
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
    
    private func createButtonWithTopImage(imageName: String, title: String, color: UIColor) -> UIButton {
        var configuration = UIButton.Configuration.plain()
        
        configuration.title = title
        configuration.baseForegroundColor = color
        
        configuration.image = UIImage(systemName: imageName)
        configuration.imagePlacement = .top
        configuration.imagePadding = 8
        
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let button = UIButton(configuration: configuration)
        
        return button
    }
    
    private func createButtonWithLeftImage(imageName: String, title: String, color: UIColor) -> UIButton {
        
        let button = UIButton(type: .system)
        
        let image = NSTextAttachment()
        image.image = UIImage(systemName: imageName)?.withTintColor(color)
        image.bounds = CGRect(x: 0, y: -6, width: 25, height: 25)
        
        let resultString = NSMutableAttributedString(attachment: image)
        resultString.append(NSAttributedString(string: "    "))
        resultString.append(NSAttributedString(string: title))
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(color, for: .normal)
        button.setAttributedTitle(resultString, for: .normal)
        
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
        
        static let separatorHeight: CGFloat = 1
    }
    
    enum Color {
        static let blueColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        static let editButtonBackgroundColor = #colorLiteral(red: 0.1415808797, green: 0.1537714303, blue: 0.1702026427, alpha: 1)
        static let grayColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        static let purpleColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        static let separatorColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 0.7)
    }
}

