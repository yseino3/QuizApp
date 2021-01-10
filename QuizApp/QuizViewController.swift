//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Yuto Seino on 2021/01/09.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var quizArry = [Any]()
    
    //正解数を数える変数
    var correctAnswer: Int = 0
    
    //問題を表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //quizArrayに問題文、選択肢、答えの入った配列を追加
        quizArry.append(["一番小さいのは？","土星","冥王星","木星","地球",2])
        quizArry.append(["宇宙へ行かなかったスペースシャトルの名前は？","エンタープライズ","ディスカバリー","ブラン","チャレンジャー",1])
        quizArry.append(["「成功した失敗」と呼ばれたミッションの宇宙船はアポロ何号？","11号","17号","13号","20号",3])
        quizArry.append(["実用化に成功したSpaceXの有人宇宙船は？","H3","スペースシップ","カーゴドラゴン","クルードラゴン",4])
        quizArry.append(["人類の探査機が到達した最遠の場所は？","木星","オールトの雲","隣の恒星","平行宇宙",2])
        quizArry.append(["まだ実現されていないものは？","スペースプレーン","人間の知的営みをコンピューターに行わせる技術","超伝導を使う乗り物","宇宙基地",1])
        
        //問題をシャッフル
        quizArry.shuffle()
        
        choiceQuiz()
    }
    
    func choiceQuiz() {
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArry[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をリセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        choiceButton4.setTitle(tmpArray[4] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    //セグエを準備するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    

    
    @IBAction func choiceAnswer(sender: UIButton) {
        let tmpArray = quizArry[0] as! [Any]
        
        if tmpArray[5] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer += 1
        }
        //解いた問題をquizArrayから取り除く
        quizArry.remove(at: 0)
        //解いた問題の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArry.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
