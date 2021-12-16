
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
  
    @IBOutlet weak var score: UILabel!

    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!

    var QuizBrain = quizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
       
       
        let userresponse = sender.currentTitle!
        let boolanswer = QuizBrain.checkAnswer(userresponse)
     
        if boolanswer         {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }

        QuizBrain.nextQusetion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI()
    {
       
        progressBar.progress = QuizBrain.getprogress();
        questionLabel.text = QuizBrain.getQuestionText();
//        QuizBrain.getOptionText();
        trueButton.backgroundColor=UIColor.clear
        falseButton.backgroundColor=UIColor.clear
       
        score.text="Score:\(QuizBrain.score())"
       
     
       
    }
}

