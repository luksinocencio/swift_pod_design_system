import UIKit
import CoreFramework

class MenuViewController: UIViewController {
    private let contentView = MenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupActions() {
        contentView.didTapOnboarding = { [weak self] in
            self?.showOnboarding()
        }
    }
    
    private func showOnboarding() {
        let onboardingView = OnboardingView()
        let steps = [
            (UIImage(named: "onboarding1"), "Bem vindo ao Onboarding do Reminder"),
            (UIImage(named: "onboarding1"), "Para cadastrar seus remedios é super simples"),
            (UIImage(named: "onboarding1"), "Selecione o horario da primeira dose, e as subsequentes"),
            (UIImage(named: "onboarding1"), "Iremos te lembrar de tomar no horario correto."),
        ]
        
        onboardingView.presentOnboarding(on: view, with: steps)
    }
}

