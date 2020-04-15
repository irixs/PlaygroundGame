//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import UIKit
import Foundation

//pra bloquear os níveis subsequentes
var lvl1 = false
var lvl2 = false
var lvl3 = false

//tela de start
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
//tela de menu
class MenuViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let backgroundImage = UIImage(named: "menu.png")!
        let background = UIImageView(image: backgroundImage)
        background.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        
        let tutorialButtonImage = UIImage(named: "tutorial.png")
        let tutorialButton = UIButton()
        tutorialButton.setImage(tutorialButtonImage, for: .normal)
        tutorialButton.frame = CGRect(x: 402.44, y: 231.17, width: 207.33, height: 42.48)
        tutorialButton.addTarget(nil, action: #selector(tutorialSelect), for: .touchUpInside)
        
        let level1ButtonImage = UIImage(named: "nivel-1.png")
        let level1Button = UIButton()
        level1Button.setImage(level1ButtonImage, for: .normal)
        level1Button.frame = CGRect(x: 421, y: 497, width: 166.08, height: 42.41)
        level1Button.addTarget(nil, action: #selector(level1Select), for: .touchUpInside)
        
        let level2ButtonImage = UIImage(named: "nivel-2.png")
        let level2Button = UIButton()
        level2Button.setImage(level2ButtonImage, for: .normal)
        level2Button.frame = CGRect(x: 419, y: 787, width: 177.75, height: 42.41)
        level2Button.addTarget(nil, action: #selector(level2Select), for: .touchUpInside)
        if (!lvl1) {
            level2Button.isUserInteractionEnabled = false
            level2Button.alpha = 0.3
        }
        
        let level3ButtonImage = UIImage(named: "nivel-3.png")
        let level3Button = UIButton()
        level3Button.setImage(level3ButtonImage, for: .normal)
        level3Button.frame = CGRect(x: 419, y: 1077, width: 178.32, height: 42.55)
        level3Button.addTarget(nil, action: #selector(level3Select), for: .touchUpInside)
        if (!lvl2) {
            level3Button.isUserInteractionEnabled = false
            level3Button.alpha = 0.3
        }
        
        view.addSubview(background)
        view.addSubview(tutorialButton)
        view.addSubview(level1Button)
        view.addSubview(level2Button)
        view.addSubview(level3Button)
        self.view = view
    }
    override func viewWillAppear(_ animated: Bool) {
        loadView()
    }
    @IBAction func tutorialSelect() {
        navigationController?.show(tutorial, sender: nil)
        navigationController?.navigationBar.isHidden = true
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
//tutorial
class TutorialViewController: UIViewController {
override func loadView() {
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
    view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    
    let menuButton = UIButton()
    menuButton.setTitle("Menu", for: .normal)
    menuButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    menuButton.frame = CGRect(x: 362, y: 250, width: 300, height: 300)
    menuButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
    view.addSubview(menuButton)
    self.view = view
    }
    @IBAction func goToMenu() {
        navigationController?.popToViewController(menu, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
//nivel 1
class LevelOneViewController: UIViewController {
    override func loadView() {
        lvl1 = true
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        let menuButton = UIButton()
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        menuButton.frame = CGRect(x: 362, y: 250, width: 300, height: 300)
        menuButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        view.addSubview(menuButton)
        self.view = view
    }
    @IBAction func goToMenu() {
        navigationController?.popToViewController(menu, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
//nivel 2
class LevelTwoViewController: UIViewController {
    override func loadView() {
        lvl2 = true
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        let menuButton = UIButton()
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        menuButton.frame = CGRect(x: 362, y: 250, width: 300, height: 300)
        menuButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
        view.addSubview(menuButton)
        self.view = view
    }
    @IBAction func goToMenu() {
        navigationController?.popToViewController(menu, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
//nivel 3
class LevelThreeViewController: UIViewController {
    override func loadView() {
        lvl3 = true
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        let menuButton = UIButton()
        menuButton.setTitle("Menu", for: .normal)
        menuButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        menuButton.frame = CGRect(x: 362, y: 250, width: 300, height: 300)
        menuButton.addTarget(nil, action: #selector(goToMenu), for: .touchUpInside)
        
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
let tutorial = TutorialViewController()
let level1 = LevelOneViewController()
let level2 = LevelTwoViewController()
let level3 = LevelThreeViewController()

let navigation = UINavigationController(screenType: .ipadPro12_9, isPortrait: true)
navigation.pushViewController(start, animated: true)
PlaygroundPage.current.liveView = navigation.scale(to: 0.5)
