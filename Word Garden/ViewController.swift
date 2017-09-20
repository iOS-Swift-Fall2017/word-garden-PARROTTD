//
//  ViewController.swift
//  Word Garden
//
//  Created by Duncan Parrott on 9/18/17.
//  Copyright © 2017 Parrott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var guessedLetterButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordToGuess = "SWIFT"
    var letterGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var numberOfGuessesLeft = 8
    var guessCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessedLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        letterGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if letterGuessed.contains(letter){
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord = revealedWord + " _"
            }
        }
        
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    
    
    func guessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            numberOfGuessesLeft = numberOfGuessesLeft - 1
            flowerImageView.image = UIImage(named: "flower" + "\(numberOfGuessesLeft)")
    }
        let revealedWord = userGuessLabel.text!
        if numberOfGuessesLeft == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterButton.isEnabled = false
            guessCountLabel.text = "FAILURE"
            
            } else if !revealedWord.contains("_") {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterButton.isEnabled = false
            guessCountLabel.text = "You Win, it took you \(guessCount) guesses"
            
        } else {
            let guess = (guessCount == 1 ? "guess" : "guesses")
            //var guess = "guesses"
            //if guessCount == 1{
              //  guess = "guess"
            
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
        }
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        print("guessed letter field changed")
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessedLetterButton.isEnabled = true
        }else {guessedLetterButton.isEnabled = false}
    }
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
       
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
       guessALetter()
       updateUIAfterGuess()
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessedLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        numberOfGuessesLeft = maxNumberOfWrongGuesses
        letterGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've made 0 Guesses"
        guessCount = 0
    }
    
    
}




