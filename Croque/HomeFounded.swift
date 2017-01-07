//
//  HomeFounded.swift
//  Croque
//
//  Created by Gauthier de Chezelles on 27/11/2016.
//  Copyright © 2016 Agepoly. All rights reserved.
//

import UIKit

class HomeFounded: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backButton: CRRectangleButton!
    
    var lunch: Lunch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.colors = (dark: CRColor.darkGray, light: CRColor.lightGray)

    }
    
    override func viewDidLayoutSubviews() {
        loadParticipantsToScrollView(participants: lunch.participants)
    }
    
    private func loadParticipantsToScrollView(participants: [User]) {
        var allCards = [ContactCardView]()
        let width = scrollView.frame.width
        for i in 0..<participants.count {
            print(scrollView.frame)
            let oldPosition = i != 0 ? allCards[i-1].frame.origin.y + allCards[i-1].frame.height : -15
            let newCard = ContactCardView(frame: CGRect(x: 0, y: oldPosition + 15, width: width, height: 67))
            newCard.setupWith(user: participants[i])
            newCard.colors = CRColor.allRandoms[i]
            allCards.append(newCard)
            scrollView.addSubview(newCard)
        }
        
        scrollView.contentSize = CGSize(width: 0, height: allCards.reduce(0) {$0 + $1.frame.height + 10})
    }
    
    @IBAction func discussWasPressed() {
        self.performSegue(withIdentifier: "showChat", sender: nil)
    }
    @IBAction func backWasPressed() {
        Home.shared.presentInContainer(viewController: Home.shared.closedVC)
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChat" {
            let chat = segue.destination as! ChatVC
            chat.conversation = Conversation(interlocutors: [User()], date: Date())
        }
    }
}
