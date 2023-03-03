class CardDetails {
   CardDetails ({
        required this.status,
        required this.data,
    });

    String status;
    Data data;

    factory CardDetails.fromJson(Map<String, dynamic> json) => CardDetails(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.card,
        required this.statment,
    });

    Card card;
    List<Statment> statment;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        card: Card.fromJson(json["card"]),
        statment: List<Statment>.from(json["statment"].map((x) => Statment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "card": card.toJson(),
        "statment": List<dynamic>.from(statment.map((x) => x.toJson())),
    };
}

class Card {
    Card({
        required this.name,
        required this.cardnumber,
        required this.avlBalancce,
        required this.cardType,
    });

    String name;
    String cardnumber;
    String avlBalancce;
    String cardType;

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        name: json["name"],
        cardnumber: json["cardnumber"],
        avlBalancce: json["avl_balancce"],
        cardType: json["card_type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "cardnumber": cardnumber,
        "avl_balancce": avlBalancce,
        "card_type": cardType,
    };
}

class Statment {
    Statment({
        required this.name,
        required this.txnDate,
        required this.amount,
        required this.type,
    });

    String name;
    String txnDate;
    String amount;
    String type;

    factory Statment.fromJson(Map<String, dynamic> json) => Statment(
        name: json["name"],
        txnDate: json["txn_date"],
        amount: json["amount"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "txn_date": txnDate,
        "amount": amount,
        "type": type,
    };
}
