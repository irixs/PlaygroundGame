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
        
        let backgroundImage = UIImage(named: "start/tela-inicial.png")!
        let background = UIImageView(image: backgroundImage)
        background.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        
        let startButtonImage = UIImage(named: "start/botao-start.png")!
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
        
        let backgroundImage = UIImage(named: "menu/menu.png")!
        let background = UIImageView(image: backgroundImage)
        background.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
        
        let tutorialButtonImage = UIImage(named: "menu/tutorial.png")
        let tutorialButton = UIButton()
        tutorialButton.setImage(tutorialButtonImage, for: .normal)
        tutorialButton.frame = CGRect(x: 402.44, y: 231.17, width: 207.33, height: 42.48)
        tutorialButton.addTarget(nil, action: #selector(tutorialSelect), for: .touchUpInside)
        
        let level1ButtonImage = UIImage(named: "menu/nivel-1.png")
        let level1Button = UIButton()
        level1Button.setImage(level1ButtonImage, for: .normal)
        level1Button.frame = CGRect(x: 421, y: 497, width: 166.08, height: 42.41)
        level1Button.addTarget(nil, action: #selector(level1Select), for: .touchUpInside)
        
        let level2ButtonImage = UIImage(named: "menu/nivel-2.png")
        let level2Button = UIButton()
        level2Button.setImage(level2ButtonImage, for: .normal)
        level2Button.frame = CGRect(x: 419, y: 787, width: 177.75, height: 42.41)
        level2Button.addTarget(nil, action: #selector(level2Select), for: .touchUpInside)
        if (!lvl1) {
            level2Button.isUserInteractionEnabled = false
            level2Button.alpha = 0.3
        }
        
        let level3ButtonImage = UIImage(named: "menu/nivel-3.png")
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
    var player = SKSpriteNode(imageNamed: "sprites/alegria/a.png")
    override func loadView() {
        let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 1366))
        let scene = SKScene(size: CGSize(width: 1024, height: 1366))
        scene.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let background = SKSpriteNode(imageNamed: "alegria-assets/bg-alegria.png")
        background.scale(to: CGSize(width: 1024, height: 1366))
        background.position = CGPoint(x: background.size.width/2, y: background.size.height/2)
        
        let ground = SKSpriteNode(imageNamed: "alegria-assets/ground.png")
        ground.scale(to: CGSize(width: 1024, height: 200))
        ground.position = CGPoint(x: ground.size.width/2, y: ground.size.height/2)
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.allowsRotation = false
        ground.physicsBody?.isDynamic = false
        
        let wallL = SKSpriteNode(imageNamed: "alegria-assets/parede.png")
        wallL.scale(to: CGSize(width: 6, height: 1366))
        wallL.position = CGPoint(x: wallL.size.width/2, y: wallL.size.height/2)
        wallL.physicsBody = SKPhysicsBody(rectangleOf: wallL.size)
        wallL.physicsBody?.affectedByGravity = false
        wallL.physicsBody?.allowsRotation = false
        wallL.physicsBody?.isDynamic = false
        
        let wallR = SKSpriteNode(imageNamed: "alegria-assets/parede.png")
        wallR.scale(to: CGSize(width: 6, height: 1366))
        wallR.position = CGPoint(x: 1022, y: wallR.size.height/2)
        wallR.physicsBody = SKPhysicsBody(rectangleOf: wallR.size)
        wallR.physicsBody?.affectedByGravity = false
        wallR.physicsBody?.allowsRotation = false
        wallR.physicsBody?.isDynamic = false
        
        let block1 = SKSpriteNode(imageNamed: "alegria-assets/bloco.png")
        block1.scale(to: CGSize(width: 128, height: 128))
        block1.position = CGPoint(x: 639, y: 328)
        block1.physicsBody = SKPhysicsBody(rectangleOf: block1.size)
        block1.physicsBody?.affectedByGravity = false
        block1.physicsBody?.allowsRotation = false
        block1.physicsBody?.isDynamic = false

        let block2 = SKSpriteNode(imageNamed: "alegria-assets/bloco.png")
        block2.scale(to: CGSize(width: 128, height: 128))
        block2.position = CGPoint(x: 767, y: 456)
        block2.physicsBody = SKPhysicsBody(rectangleOf: block2.size)
        block2.physicsBody?.affectedByGravity = false
        block2.physicsBody?.allowsRotation = false
        block2.physicsBody?.isDynamic = false
        
        let block3 = SKSpriteNode(imageNamed: "alegria-assets/bloco.png")
        block3.scale(to: CGSize(width: 128, height: 128))
        block3.position = CGPoint(x: 895, y: 584)
        block3.physicsBody = SKPhysicsBody(rectangleOf: block3.size)
        block3.physicsBody?.affectedByGravity = false
        block3.physicsBody?.allowsRotation = false
        block3.physicsBody?.isDynamic = false
        
        player.scale(to: CGSize(width: 102.26, height: 120))
        player.anchorPoint = CGPoint.zero
        player.position = CGPoint(x: 13, y: 500)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size, center: CGPoint(x: player.size.width/2, y: player.size.height/2))
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.allowsRotation = false
        let playerTexture = SKTexture(imageNamed: "sprites/alegria/a-1.png")
        player = SKSpriteNode(texture: playerTexture)
        player.scale(to: CGSize(width: 102.26, height: 120))
        player.position = CGPoint(x: 13, y: 200)
        player.anchorPoint = CGPoint.zero
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size, center: CGPoint(x: player.size.width/2, y: player.size.height/2))
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.allowsRotation = false
        
        var multiplierForDirection: CGFloat = 1.0
        var animationImages: [SKTexture] = []
        for i in 1...7 {
            let oneFrame = SKTexture(imageNamed: "sprites/alegria/a-\(i).png")
            animationImages.append(oneFrame)
        }
        let animation = SKAction.animate(with: animationImages, timePerFrame: 2.0/20.0)
        let animationonLoop = SKAction.repeatForever(animation)
        player.xScale = abs(player.xScale) * multiplierForDirection
        player.run(animationonLoop)
        
        let leftImage = UIImage(named: "alegria-assets/esquerda.png")!
        let leftButton = UIButton()
        leftButton.setImage(leftImage, for: .normal)
        leftButton.frame = CGRect(x: 0, y: 1166, width: 200, height: 200)
        leftButton.addTarget(nil, action: #selector(moveLeft), for: .touchUpInside)
        
        let rightImage = UIImage(named: "alegria-assets/direita.png")!
        let rightButton = UIButton()
        rightButton.setImage(rightImage, for: .normal)
        rightButton.frame = CGRect(x: 824, y: 1166, width: 200, height: 200)
        rightButton.addTarget(nil, action: #selector(moveRight), for: .touchUpInside)
        
        let swapImage = UIImage(named: "alegria-assets/troca-personagem.png")!
        let swapButton = UIButton()
        swapButton.setImage(swapImage, for: .normal)
        swapButton.frame = CGRect(x: 200, y: 1209, width: 115, height: 115)
        swapButton.addTarget(nil, action: #selector(swapAvatar), for: .touchUpInside)
        
        let jumpImage = UIImage(named: "alegria-assets/pula.png")!
        let jumpButton = UIButton()
        jumpButton.setImage(jumpImage, for: .normal)
        jumpButton.frame = CGRect(x: 709, y: 1209, width: 115, height: 115)
        jumpButton.addTarget(nil, action: #selector(jump), for: .touchUpInside)
        
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        view.presentScene(scene)
        scene.addChild(background)
        scene.addChild(ground)
        scene.addChild(wallL)
        scene.addChild(wallR)
        scene.addChild(block1)
        scene.addChild(block2)
        scene.addChild(block3)
        scene.addChild(player)
        view.showsPhysics = true;
        
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(swapButton)
        view.addSubview(jumpButton)
        self.view = view
    }
    @IBAction func moveLeft() {
        if (player.position.x - 120 < 0) {
            player.run(SKAction.moveBy(x: 0 - player.position.x, y: 0, duration: 1.0))
        }
        else{
            player.run(SKAction.moveBy(x: -120, y: 0, duration: 1.0))
        }
    }
    @IBAction func moveRight() {
        if (player.position.x + 120 > 904) {
            player.run(SKAction.moveBy(x: 1024 - player.position.x, y: 0, duration: 1.0))
        }
        else{
            player.run(SKAction.moveBy(x: 120, y: 0, duration: 1.0))
        }
    }
    @IBAction func swapAvatar() {
        print("mudou o avatarr")
    }
    @IBAction func jump() {
        if (player.position.y + 500 > 1366) {
            player.run(SKAction.moveBy(x: 0, y: 1366 - player.position.y, duration: 1.0))
        }
        else{
            player.run(SKAction.moveBy(x: 0, y: 500, duration: 1.0))
        }
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
