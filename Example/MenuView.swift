import UIKit
import CoreFramework

class MenuView: UIView {
    var didTapOnboarding: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Example Menu"
        label.font = Typography.heading
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkbox = ToggleCheckbox()
    
    private let testCheckboxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test checkbox", for: .normal)
        button.layer.cornerRadius = Metrics.medium
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapCheckboxButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let testCustomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test custom button", for: .normal)
        button.layer.cornerRadius = Metrics.medium
        button.backgroundColor = .green
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapCustomButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let onboardingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Onboarding", for: .normal)
        button.layer.cornerRadius = Metrics.medium
        button.backgroundColor = .purple
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapOnboardingButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(onboardingButton)
        addSubview(testCheckboxButton)
        addSubview(testCustomButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            onboardingButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            onboardingButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            onboardingButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            onboardingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            onboardingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            testCheckboxButton.topAnchor.constraint(equalTo: onboardingButton.bottomAnchor, constant: Metrics.medium),
            testCheckboxButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            testCheckboxButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            testCheckboxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            
            testCustomButton.topAnchor.constraint(equalTo: testCheckboxButton.bottomAnchor, constant: Metrics.medium),
            testCustomButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            testCustomButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            testCustomButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
        ])
    }
    
    @objc
    private func didTapOnboardingButton() {
        didTapOnboarding?()
    }
    
    @objc
    private func didTapCheckboxButton() {
        let checkBoxViewController = CheckboxViewController()
        if let parentViewController = self.window?.rootViewController {
            parentViewController.present(checkBoxViewController, animated: true)
        }
    }
    
    @objc
    private func didTapCustomButton() {
        let customButtonViewController = ButtonTestViewController()
        if let parentViewController = self.window?.rootViewController {
            parentViewController.present(customButtonViewController, animated: true)
        }
    }
}
