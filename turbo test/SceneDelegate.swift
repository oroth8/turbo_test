import UIKit
import WebKit
import Turbo

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private lazy var navigationController = ViewController()
    let viewController = WebViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        window!.rootViewController = navigationController
        navigationController.tabBar.delegate = self
        navigationController.pushViewController(viewController, animated: true)
        visit(url: URL(string: "https://lplexhibitflow.ngrok.io")!)
    }
    
    private func visit(url: URL) {
        viewController.visitableURL = url
        session.visit(viewController)
    }
    
    private lazy var session: Session = {
        let configuration = WKWebViewConfiguration()
        configuration.applicationNameForUserAgent = "MyApplication"
        
        let session = Session(webViewConfiguration: configuration)
        session.delegate = self
        return session
    }()
}

extension SceneDelegate: SessionDelegate {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
        visit(url: proposal.url)
    }
    
    func session(_ session: Session, didFailRequestForVisitable visitable: Visitable, error: Error) {
        print("didFailRequestForVisitable: \(error)")
    }
    
    func sessionWebViewProcessDidTerminate(_ session: Session) {
        session.reload()
    }
}

extension SceneDelegate: UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch(item.tag){
        case 0:
            visit(url: URL(string: "https://lplexhibitflow.ngrok.io")!)
        case 1:
            visit(url: URL(string: "https://lplexhibitflow.ngrok.io/quotes")!)
        default:
            break
        }
    }
}

