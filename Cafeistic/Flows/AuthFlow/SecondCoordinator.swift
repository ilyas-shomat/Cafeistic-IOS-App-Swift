//
//  TempSecondCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 20.03.2023.
//

import Foundation


protocol SecondCoordinatorDelegate: CoordinatableDelagate {
    func navigate_From_TempSecondScene_To_TempSecondDetailScene()
    func dismiss_From_TempSecondDetailScene_To_TempSecondScene()
}

final class SecondCoordinator: Coordinator {
    override var root: Presentable { getTempSecondScene() }
    
    var flowCompletion: CompletionHandler?
    
    init(coordinatingType: CoordinatingType, completion: @escaping CompletionHandler) {
        super.init(coordinatingType: coordinatingType)
        flowCompletion = completion
    }
    
    private func getTempSecondScene() -> Presentable {
        let scene = TempSecondScene()
        scene.coordinatorDelegate = self
        return scene
    }
    
    private func getTempSecondDetailScene() -> Presentable {
        let scene = TempSecondDetailScene()
        scene.coordinatorDelegate = self
        return scene
    }
}

extension SecondCoordinator: SecondCoordinatorDelegate {
    func navigate_From_TempSecondScene_To_TempSecondDetailScene() {
        router.present(getTempSecondDetailScene(), animated: true)
//        router.present(getTempSecondDetailScene(), presentationStyle: .overFullScreen, animated: true) // for FullScreen presentation
    }
    
    func dismiss_From_TempSecondDetailScene_To_TempSecondScene() {
        router.dismissScene(animated: true)
    }
}