import UIKit
import PlaygroundSupport
import Foundation

var lvl1 = false
var lvl2 = false
var lvl3 = false

class StartViewController: UIViewController {
    override func loadView() {
        navigationController?.navigationBar.isHidden = true
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let backgroundImage = UIImage(named: "tela-inicial.png")!
        let background = UIImageView(image: backgroundImage)
        background.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        
        let startButtonImage = UIImage(named: "botao-start.png")!
        let startButton = UIButton()
        startButton.setImage(startButtonImage, for: .normal)
        startButton.frame = CGRect(x: 362, y: 533, width: 300, height: 300)
        startButton.addTarget(nil, action: #selector(startGame), for: .touchUpInside)
        
        view.addSubview(background)
        view.addSubview(startButton)
        self.view = view
    }
    @IBAction func startGame(){
        navigationController?.show(menu, sender: nil)
        navigationController?.navigationBar.isHidden = true
    }
}
class MenuViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        let title = UILabel()
        title.text = "Menu"
        title.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        title.font.withSize(30)
        
        let level1Button = UIButton()
        level1Button.setTitle("level 1", for: .normal)
        if (lvl1) {
             level1Button.setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: .normal)
        } else{
             level1Button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        level1Button.frame = CGRect(x: 362, y: 300, width: 300, height: 300)
        level1Button.addTarget(nil, action: #selector(level1Select), for: .touchUpInside)
        
        let level2Button = UIButton()
        level2Button.setTitle("level 2", for: .normal)
        if (lvl2) {
             level2Button.setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: .normal)
        } else{
             level2Button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        level2Button.frame = CGRect(x: 362, y: 533, width: 300, height: 300)
        level2Button.addTarget(nil, action: #selector(level2Select), for: .touchUpInside)
        
        let level3Button = UIButton()
        level3Button.setTitle("level 3", for: .normal)
        if (lvl3) {
             level3Button.setTitleColor(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), for: .normal)
        } else{
             level3Button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        level3Button.frame = CGRect(x: 362, y: 800, width: 300, height: 300)
        level3Button.addTarget(nil, action: #selector(level3Select), for: .touchUpInside)
        
        view.addSubview(level1Button)
        view.addSubview(level2Button)
        view.addSubview(level3Button)
        self.view = view
    }
    override func viewWillAppear(_ animated: Bool) {
        loadView()
    }
    @IBAction func level1Select() {
            navigationController?.show(level1, sender: nil)
            navigationController?.navigationBar.isHidden = true
    }
    @IBAction func level2Select() {
            navigationController?.show(level2, sender: nil)
            navigationController?.navigationBar.isHidden = true
    }
    @IBAction func level3Select() {
            navigationController?.show(level3, sender: nil)
            navigationController?.navigationBar.isHidden = true
    }
}
class LevelOneViewController: UIViewController {
    override func loadView() {
        lvl1 = true
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        let nextLevelButton = UIButton()
        nextLevelButton.setTitle("parabéns bença", for: .normal)
        nextLevelButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        nextLevelButton.frame = CGRect(x: 362, y: 533, width: 300, height: 300)
        nextLevelButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        let menuButton = UIButton()
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        menuButton.frame = CGRect(x: 362, y: 250, width: 300, height: 300)
        menuButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        view.addSubview(nextLevelButton)
        view.addSubview(menuButton)
        self.view = view
    }
    @IBAction func goToMenu() {
            navigationController?.popToViewController(menu, animated: true)
            navigationController?.navigationBar.isHidden = true
    }
}
class LevelTwoViewController: UIViewController {
    override func loadView() {
        lvl2 = true
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)

        let nextLevelButton = UIButton()
        nextLevelButton.setTitle("parabéns bença", for: .normal)
        nextLevelButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        nextLevelButton.frame = CGRect(x: 362, y: 533, width: 300, height: 300)
        nextLevelButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        let menuButton = UIButton()
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        menuButton.frame = CGRect(x: 362, y: 250, width: 300, height: 300)
        menuButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        view.addSubview(nextLevelButton)
        view.addSubview(menuButton)
        self.view = view
    }
    @IBAction func goToMenu() {
            navigationController?.popToViewController(menu, animated: true)
            navigationController?.navigationBar.isHidden = true
    }
}
class LevelThreeViewController: UIViewController {
    override func loadView() {
        lvl3 = true
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)

        let nextLevelButton = UIButton()
        nextLevelButton.setTitle("parabens vc zerou", for: .normal)
        nextLevelButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        nextLevelButton.frame = CGRect(x: 362, y: 533, width: 300, height: 300)
        nextLevelButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        let menuButton = UIButton()
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        menuButton.frame = CGRect(x: 362, y: 250, width: 300, height: 300)
        menuButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        view.addSubview(nextLevelButton)
        view.addSubview(menuButton)
        self.view = view
    }
    @IBAction func goToMenu() {
            navigationController?.popToViewController(menu, animated: true)
            navigationController?.navigationBar.isHidden = true
    }
}
let start = StartViewController()
let menu = MenuViewController()
let level1 = LevelOneViewController()
let level2 = LevelTwoViewController()
let level3 = LevelThreeViewController()

let navigation = UINavigationController(screenType: .ipadPro12_9, isPortrait: true)
navigation.pushViewController(start, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
