// тип данных для коллекции
struct car {
    var model: String;
    var place: Int;
}

extension car: CustomStringConvertible {
    var description : String {
        return "Марка: \(model), Место: \(place)";
    }
}
//реализация коллекции
struct queue<T>{
    var items:[T] = [];
    mutating func push (_ item: T){
        items.append(item);
    }
    mutating func pop() ->T{
        return items.removeLast();
    }
    func printQueue() {
        print(items);
    }
}
// расширение queue с добавлением метода myFilter
extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]();
        for i in items {
            if predicate(i) {
                result.append(i);
            }
        }
        return result;
    }
}

//создание коллекции и эксперементы с ней
var garage = queue<car>();
garage.push(.init(model: "Opel", place: 1));
garage.push(.init(model: "BMW", place: 2));
garage.push(.init(model: "Kamaz", place: 3));
garage.printQueue();
let a = garage.myFilter(predicate: {$0.model.hasPrefix("K")});
print(a);
garage.pop()
garage.printQueue()

