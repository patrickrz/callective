//
//  ViewController.swift
//  MDBProject1
//
//  Created by Kanu Grover on 9/19/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var game = TriviaGame()
    
    var countCorrect: Int = 0 {
        didSet {
            countRight.text = "Score: \(countCorrect)"
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.countRight.textColor = #colorLiteral(red: 0.2052621273, green: 1, blue: 0.2044371174, alpha: 1)
                self.countRight.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
            }, completion: { _ in
                UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
                    self.countRight.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    self.countRight.transform = CGAffineTransform.identity
                })
            })
        }
    }
    
    var streakCount: Int = 0
    
    var maxStreakCount: Int = 0
    
    var lastThreeSelectedNames = [String]()

    var timer: Timer?

    @IBOutlet weak var pauseButton: UIImageView! {
        didSet {
            pauseButton.isUserInteractionEnabled = true
            pauseButton.image = UIImage(systemName: "pause.rectangle.fill")
            let pauseGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pauseGame))
            pauseButton.addGestureRecognizer(pauseGestureRecognizer)
        }
    }
    
    @IBOutlet var nameChoices: [UIButton]!
    
    @IBOutlet weak var countRight: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func nextImageButton(_ sender: UIButton) {
        self.resetTimer()
        if lastThreeSelectedNames.count < 3 {
            lastThreeSelectedNames.append((sender.titleLabel?.text!)!)
        } else {
            lastThreeSelectedNames.remove(at: 0)
            lastThreeSelectedNames.append((sender.titleLabel?.text!)!)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.updateViewFromModel()
        }
        if sender.titleLabel?.text == game.correctName {
            streakCount += 1
            countCorrect += 1
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                sender.alpha = 0.0
                sender.backgroundColor = #colorLiteral(red: 0.2052621273, green: 1, blue: 0.2044371174, alpha: 1)
            }, completion: {if $0 == .end {
                sender.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
                sender.alpha = 1.0
                }})
        } else {
            streakCount = 0
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                sender.alpha = 0.0
            }, completion: {if $0 == .end {
                sender.alpha = 1.0
                sender.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
                }})
        }
        
        if streakCount > maxStreakCount {
            maxStreakCount = streakCount
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(updateViewFromModel), userInfo: nil, repeats: false)
        print("hello")
    }
    
    func resetTimer() {
        timer!.invalidate()
    }
    
    @objc func pauseGame() {
        pauseButton.image = UIImage(systemName: "play.rectangle.fill")
        if timer != nil {
            self.resetTimer()
        } else {
            pauseButton.image = UIImage(systemName: "pause.rectangle.fill")
            self.startTimer()
        }
    }
    
    @objc private func updateViewFromModel() {
        game.resetNames()
//        print("\(game.selectedNames)")
        for index in nameChoices.indices {
            let button = nameChoices[index]
            button.layer.cornerRadius = 20
            button.clipsToBounds = true
            button.layer.borderWidth = 1.0;
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);
            button.setTitle(game.selectedNames[index], for: UIControl.State.normal)
        }
        imageView.image = game.getImage()
        imageView.layer.cornerRadius = 45.0;
        imageView.layer.masksToBounds = true;
        imageView.layer.borderWidth = 5.0;
        imageView.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1);
        self.startTimer()
    }
    
    @objc func statisticsPressed(_ sender: Any) {
        performSegue(withIdentifier: "Statistics", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Statistics" {
            if let svc = segue.destination as? StatisticsViewController {
                svc.streak = maxStreakCount
                svc.lastThreeNames = lastThreeSelectedNames
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Statistics", style: .plain, target: self, action: #selector(statisticsPressed(_:)))

    }


}

