
import Foundation

//Действия с авто
enum windowState: CustomStringConvertible {
    case open, close;
    var description: String{
        switch self {
        case .open:
            return "Окна открыты";
        case .close:
            return "Окна закрыты";
        }
    }
}


enum enginState: CustomStringConvertible {
    case started, off;
    var description: String{
        switch self {
        case .started:
            return "Двигатель запущен";
        case .off:
            return "Двигатель выключен";
        }
    }
}
    
enum loadBody: CustomStringConvertible{
        case full,half,empty;
    var description: String{
        switch self {
        case .empty:
            return "Прицеп пуст";
        case .half:
            return "Прицеп заполнен наполовину";
        case .full:
            return "Прицеп полон";
        }
    }
}
    
enum hatchState: CustomStringConvertible{
    case open,close;
    var description: String{
        switch self {
        case .open:
            return "Люк открыт";
        case .close:
            return "Люк закрыт";
        }
    }
}
enum headlightsState: CustomStringConvertible {
    case on, off;
    var description: String{
        switch self {
        case .on:
            return "Фары включены";
        case .off:
            return "Фары выключены";
        }
    }
}


// Протокол машина 
protocol car {
    var model: String{get};
    var relese: Int {get};
    var color: String {get};
    var engine: enginState {get set};
    var window: windowState {get set};
    var headlights: headlightsState {get set};
    func headlightsOn(status:headlightsState);
}

//Расширение протокола машина и добавление функций открытия и закрытия дверей
extension car{
    mutating func windowOpen(status: windowState) {
        switch status{
        case.close:
            window = .close;
        case.open:
            window = .open;
        }
    }
   mutating func enginStart(status: enginState) {
        switch status{
            case.off:
                engine = .off;
            case.started:
                engine = .started;
        }
    }
}

// Класс спортивная машина с функцией открытия люка
class sportCar: car{
    var model: String;
    var relese: Int;
    var color: String;
    var engine: enginState;
    var window: windowState;
    var hatch: hatchState;
    var headlights: headlightsState;
    init(model: String, relese: Int, color: String, engine: enginState, window: windowState, hatch: hatchState, headlights: headlightsState) {
        self.model = model;
        self.relese = relese;
        self.color = color;
        self.engine = engine;
        self.window = window;
        self.hatch = hatch;
        self.headlights = headlights;
    }
    func hatchStatus(status: hatchState){
           switch status {
                case .open:
                    hatch = .open;
                case .close:
                    hatch = .close;
               }
       }
    func headlightsOn(status:headlightsState){
        switch status {
            case.on:
                headlights = .on;
            case.off:
                headlights = .off;
        }
    }
}


// класс Грузовой автомобиль с функцией загрузки прицепа
class tunkCar: car{
    var model: String;
    var relese: Int;
    var color: String;
    var engine: enginState;
    var window: windowState;
    var bodyVolume: Double;
    var loadBody: loadBody;
    var headlights: headlightsState;
    init(model: String, relese: Int, color: String, engine: enginState, window: windowState, bodyVolume: Double, loadBody: loadBody, headlights: headlightsState) {
        self.model = model;
        self.relese = relese;
        self.color = color;
        self.engine = engine;
        self.window = window;
        self.bodyVolume = bodyVolume;
        self.loadBody = loadBody;
        self.headlights = headlights;
    }
    func bodyState(status: loadBody){
        switch status {
        case .full:
            loadBody = .full;
        case .half:
            loadBody = .half;
        case.empty:
            loadBody = .empty;
        }
    }
    func headlightsOn(status:headlightsState){
        switch status {
            case.on:
                headlights = .on;
            case.off:
                headlights = .off;
        }
    }
}
// расширение класса грузовой автомобиль, добавлена функция вывода описания в консоль
extension tunkCar: CustomStringConvertible{
    func InfoCar() {
        print(description);
    }
    var description:String{
        return "Модель: \(model), Год выпуска: \(relese), Цвет: \(color), \(engine), \(window), Объем прицепа: \(bodyVolume), \(loadBody), \(headlights)";
    }
}
// расширение класса спортивный автомобиль, добавлена функция вывода описания в консоль
extension sportCar: CustomStringConvertible{
    func InfoCar() {
        print(description);
    }
    var description:String{
        return "Модель: \(model), Год выпуска: \(relese), Цвет: \(color), \(engine), \(window), \(hatch), \(headlights)";
    }
}

// рубрика: Эксперементы
var car1 = tunkCar(model: "Opel", relese: 2018, color: "Black", engine: .off, window: .close, bodyVolume: 100, loadBody: .empty, headlights: .off)
car1.InfoCar()
car1.bodyState(status: .full)
car1.windowOpen(status: .open)
car1.enginStart(status: .started)
car1.headlightsOn(status: .on)
car1.InfoCar()
var car2 = sportCar(model: "BMW", relese: 2020, color: "Red", engine: .started, window: .open, hatch: .close, headlights: .on)
car2.InfoCar()
car2.hatchStatus(status: .open)
car2.enginStart(status: .off)
car2.windowOpen(status: .close)
car2.headlightsOn(status: .off)
car2.InfoCar()
