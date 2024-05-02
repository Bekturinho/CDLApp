//
//  ViewController.swift
//  CDLApp
//
//  Created by fortune cookie on 4/30/24.
//

import UIKit

class ViewController: UIViewController {
    let englishData: [QuestionModel] = [
        QuestionModel(
            num: "1",
            question: "What do all air brake equipped vehicles have?",
            a: "A. An air usage gauge",
            b: "B. A supply pressure",
            c: "C. A backup hydraulic system"
        ),
        QuestionModel(
            num: "2",
            question: "If you must make an emergency stop, you should brake so you:",
            a: "C. Can steer and so your vehicle stay straight line",
            b: "B. Do not need worry about steering",
            c: "A. Use the hand brake before the brake pedal"
        ),
        QuestionModel(
            num: "3",
            question: "The air loss rate for a straight truck or bus with the engine off and the brakes on should not be more than:",
            a: "A. 1 PSI in 30 seconds",
            b: "B. 1 PSI in one minute",
            c: "C. 2 PSI in 45 seconds"
        ),
        QuestionModel(
            num: "4",
            question: "Your brakes are fading when:",
            a: "A. You have to push harder on the brake pedal to control your speed on a downgrade",
            b: "B. The brake pedal feels spongy when you apply pressure",
            c: "C. You release pressure on the brake pedal and speed increases"
        ),
        QuestionModel(
            num: "5",
            question: "The supply pressure gauge shows how much pressure:",
            a: "B. Is in the air tanks",
            b: "A. You have used in this trip",
            c: "C. Is going to the brake chamber"
        ),
        QuestionModel(
            num: "6",
            question: "The brake system that applies and releases the brakes when the driver uses the brake pedal is the _________ brake system.",
            a: "B. Service",
            b: "A. Emergency",
            c: "C. Parking"
        ),
        QuestionModel(
            num: "7",
            question: "If your vehicle has an alcohol evaporator every day during cold weather you should:",
            a: "A. Check and fill the alcohol level",
            b: "B. Change the alcohol from the new bottle",
            c: "C. Clean the air filter with alcohol"
        )
    ]

    // Вопросы и ответы на русском
    let russianData: [QuestionModel] = [
        QuestionModel(
            num: "1",
            question: "Что имеют все машины, оборудованные воздушными тормозами?",
            a: "A. Манометр давления изпользoванного воздуха",
            b: "B. Манометр давления подаваемого воздуха",
            c: "C. Запасные гидравличeские тормоза"
        ),
        QuestionModel(
            num: "2",
            question: "Если вы должны сделать экстренную остановку, надо тормозить так что б:",
            a: "C. Вы могли управлять и удерживать ее по прямой линии",
            b: "B. Не надо было беспокоится про управлении",
            c: "A. Включить ручной клапан перед нажатием педали тормоза"
        ),
        QuestionModel(
            num: "3",
            question: "Утечка воздуха у прямого трака или автобуса при выключенном двигателе и нажатом тормoзе не должна превышать:",
            a: "A. 1 PSI за 30 секунд",
            b: "B. 1 PSI за одну минуту",
            c: "C. 2 PSI за 45 секунд"
        ),
        QuestionModel(
            num: "4",
            question: "Ваши тормоза износились:",
            a: "A. Вы вынуждены сильнее чем обычно жать на педаль для контроля скорoсти на спуске",
            b: "B. Педаль тормoза чуствуется пружинной при нажатии на нее",
            c: "C. Вы уменьшаете давление на педаль тормoза и скорость увеличивается"
        ),
        QuestionModel(
            num: "5",
            question: "Манометр давление подаваемого воздуха показывает, какое давление:",
            a: "B. В воздушном резервуаре",
            b: "A. Вы использовали во время поездки",
            c: "C. Поступает в тормозное отделение"
        ),
        QuestionModel(
            num: "6",
            question: "Тормoзная система работающая при нажатие водителем педали тормoза, называется:",
            a: "B. Сервисной",
            b: "A. Аварийной",
            c: "C. Стояночной"
        ),
        QuestionModel(
            num: "7",
            question: "Если ваш автомобиль имеет спиртовoй испаритель, то каждый день при плохой погоде вы должны:",
            a: "A. Проверить и поддержать уровень алкоголя",
            b: "B. Подливать спирт с новой бутылки",
            c: "C. Чистить спиртом воздушный фильтр"
        )
    ]
    
    private lazy var questionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 380, height: 300)
        layout.minimumLineSpacing = 30
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(QuestionsCollectionViewCell.self, forCellWithReuseIdentifier: ViewController.id)
        view.dataSource = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addAllSubs()
        addAllConstraints()
    }
    
    private func addAllSubs(){
        let uiElements = [questionsCollectionView]
        uiElements.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        uiElements.forEach({view.addSubview($0)})
    }

    private func addAllConstraints(){
        NSLayoutConstraint.activate([
            questionsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            questionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}


extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        englishData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = questionsCollectionView.dequeueReusableCell(withReuseIdentifier: ViewController.id, for: indexPath) as? QuestionsCollectionViewCell else{
            return UICollectionViewCell()
        }
        let cellNum = englishData.map({$0.num})
        let cellQuestion = englishData.map({$0.question})
        let cellA = englishData.map({$0.a})
        let cellB = englishData.map({$0.b})
        let cellC = englishData.map({$0.c})

        cell.customizeAllData(number: cellNum[indexPath.item], question: cellQuestion[indexPath.item], a: cellA[indexPath.item], b: cellB[indexPath.item], c: cellC[indexPath.item])
        cell.backgroundColor = .red
        
        questionsCollectionView.reloadData()
        return cell
    }
    
    
}
