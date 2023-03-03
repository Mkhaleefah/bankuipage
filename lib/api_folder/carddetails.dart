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


// class CardDetails {
// String status;
// CardData data;

// CardDetails({required this.status, required this.data});

// CardDetails.fromJson(Map&lt;String, dynamic&gt; json) {
// status = json[&#39;status&#39;];
// data = json[&#39;data&#39;] != null ? new CardData.fromJson(json[&#39;data&#39;]) : null;
// }
// }


// class CardData {
// CardInfo card;
// List&lt;Transaction&gt; statement;

// CardData({this.card, this.statement});

// CardData.fromJson(Map&lt;String, dynamic&gt; json) {
// card = json[&#39;card&#39;] != null ? new CardInfo.fromJson(json[&#39;card&#39;]) : null;
// if (json[&#39;statment&#39;] != null) {
// statement = new List&lt;Transaction&gt;();
// json[&#39;statment&#39;].forEach((v) {
// statement.add(new Transaction.fromJson(v));
// });
// }

// }
// }

// class CardInfo {
// String name;
// String cardnumber;
// String availableBalance;
// String cardType;

// CardInfo({this.name, this.cardnumber, this.availableBalance, this.cardType});

// CardInfo.fromJson(Map&lt;String, dynamic&gt; json) {
// name = json[&#39;name&#39;];
// cardnumber = json[&#39;cardnumber&#39;];
// availableBalance = json[&#39;avl_balancce&#39;];
// cardType = json[&#39;card_type&#39;];
// }
// }

// class Transaction {
// String name;
// String txnDate;
// String amount;
// String type;

// Transaction({this.name, this.txnDate, this.amount, this.type});

// Transaction.fromJson(Map&lt;String, dynamic&gt; json) {
// name = json[&#39;name&#39;];

// txnDate = json[txn_date&];
// amount = json[amount]; type = json[type]; }}