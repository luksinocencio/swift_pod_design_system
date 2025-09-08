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
            onboardingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium)
        ])
    }
    
    @objc private func didTapOnboardingButton() {
        didTapOnboarding?()
    }
}
