//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.
import Foundation

enum Action {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case putInTheTrunk(volume: Decimal)
    case unloadFromTheTrunk(volume: Decimal)
}

//------------SPORTCAR------------------

struct SportCar {
    let brandCar: String
    let yearOfIssue: Int
    let trunkVolume: Decimal
    var engineStarted: Bool
    var windowsAreOpen: Bool
    var filledTrunkVolume: Decimal
    
    init (brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal) {
        self.brandCar = brandCar
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.engineStarted = engineStarted
        self.windowsAreOpen = windowsAreOpen
        self.filledTrunkVolume = filledTrunkVolume
    }
    
    mutating func doAction (action: Action) {
        switch action {
        case .startEngine:
            engineStarted = true
            print("Двигатель запущен")
        case .stopEngine:
            engineStarted = false
            print("Двигатель остановлен")
        case .openWindows:
            windowsAreOpen = true
            print("Окна открыты")
        case .closeWindows:
            windowsAreOpen = false
            print("Окна закрыты")
        case .putInTheTrunk(volume: let volume):
            if volume <= (trunkVolume - filledTrunkVolume) {
                filledTrunkVolume += volume
                print("В багажнк загружен объём \(volume). Общая загруженность: \(filledTrunkVolume) из \(trunkVolume)")
            } else {
                print("В багажник объём \(volume) не вместится. Доступный свободный объём: \(trunkVolume - filledTrunkVolume)")
            }
        case .unloadFromTheTrunk(volume: let volume):
            if volume > filledTrunkVolume {
                print("Из багажника нельзя выгрузить объём \(volume)! Доступно: \(filledTrunkVolume) из \(trunkVolume)")
            } else {
                filledTrunkVolume -= volume
                print("Объём \(volume) выгружен из багажника. Осталось: \(filledTrunkVolume) из \(trunkVolume)")
            }
        }
    }
    
    func printInfo() {
        print("=======================================")
        print("Марка авто: \(self.brandCar)")
        print("Год выпуска: \(self.yearOfIssue)")
        print("Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")")
        print("Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")")
        print("=======================================")
    }
}

var ferrari = SportCar.init(
    brandCar: "Ferrari",
    yearOfIssue: 2018,
    trunkVolume: 50,
    engineStarted: true,
    windowsAreOpen: false,
    filledTrunkVolume: 10
)

ferrari.printInfo()
ferrari.doAction(action: .stopEngine)
ferrari.doAction(action: .unloadFromTheTrunk(volume: 15))
ferrari.doAction(action: .putInTheTrunk(volume: 40))
ferrari.doAction(action: .putInTheTrunk(volume: 10))
ferrari.doAction(action: .unloadFromTheTrunk(volume: 35.5))
ferrari.doAction(action: .openWindows)
ferrari.printInfo()


//------------TRUNKCAR------------------

struct TrunkCar {
    let brandCar: String
    let yearOfIssue: Int
    let trunkVolume: Decimal
    var engineStarted: Bool
    var windowsAreOpen: Bool
    var filledTrunkVolume: Decimal
    
    init (brandCar: String, yearOfIssue: Int, trunkVolume: Decimal, engineStarted: Bool, windowsAreOpen: Bool, filledTrunkVolume: Decimal) {
        self.brandCar = brandCar
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.engineStarted = engineStarted
        self.windowsAreOpen = windowsAreOpen
        self.filledTrunkVolume = filledTrunkVolume
    }
    
    mutating func doAction (action: Action) {
        switch action {
        case .startEngine:
            engineStarted = true
            print("Двигатель запущен")
        case .stopEngine:
            engineStarted = false
            print("Двигатель остановлен")
        case .openWindows:
            windowsAreOpen = true
            print("Окна открыты")
        case .closeWindows:
            windowsAreOpen = false
            print("Окна закрыты")
        case .putInTheTrunk(volume: let volume):
            if volume <= (trunkVolume - filledTrunkVolume) {
                filledTrunkVolume += volume
                print("В багажнк загружен объём \(volume). Общая загруженность: \(filledTrunkVolume) из \(trunkVolume)")
            } else {
                print("В багажник объём \(volume) не вместится. Доступный свободный объём: \(trunkVolume - filledTrunkVolume)")
            }
        case .unloadFromTheTrunk(volume: let volume):
            if volume > filledTrunkVolume {
                print("Из багажника нельзя выгрузить объём \(volume)! Доступно: \(filledTrunkVolume) из \(trunkVolume)")
            } else {
                filledTrunkVolume -= volume
                print("Объём \(volume) выгружен из багажника. Осталось: \(filledTrunkVolume) из \(trunkVolume)")
            }
        }
    }
    
    func printInfo() {
        print("=======================================")
        print("Марка авто: \(self.brandCar)")
        print("Год выпуска: \(self.yearOfIssue)")
        print("Загрузка багажника: \(self.filledTrunkVolume) из \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineStarted ? "Запущен" : "Остановлен")")
        print("Положение окон: \(self.windowsAreOpen ? "Открыты" : "Закрыты")")
        print("=======================================")
    }
}

var truck = TrunkCar.init(
    brandCar: "Volvo",
    yearOfIssue: 2020,
    trunkVolume: 20000,
    engineStarted: false,
    windowsAreOpen: true,
    filledTrunkVolume: 1000
)


truck.printInfo()
truck.doAction(action: .startEngine)
truck.doAction(action: .unloadFromTheTrunk(volume: 15000))
truck.doAction(action: .putInTheTrunk(volume: 17000))
truck.doAction(action: .putInTheTrunk(volume: 150000))
truck.doAction(action: .unloadFromTheTrunk(volume: 3500.5))
truck.doAction(action: .closeWindows)
truck.printInfo()
