import 'dart:convert';

ETickets eTicketsFromJson(String str) => ETickets.fromJson(json.decode(str));

String eTicketsToJson(ETickets data) => json.encode(data.toJson());

class ETickets {
    String? ticketType;
    dynamic isPassportMandatory;
    String? sourceCode;
    String? fareType;
    String? isRefundable;
    String? type;
    List<Passenger>? passengers;
    List<OriginDestinationOption>? originDestinationOptions;
    FareTotal? fareTotal;
    bool isExpand;
    bool isRound;

    ETickets({
        this.ticketType,
        this.isPassportMandatory,
        this.sourceCode,
        this.fareType,
        this.isRefundable,
        this.type,
        this.passengers,
        this.originDestinationOptions,
        this.fareTotal,
        this.isExpand = false,
        this.isRound = true,
    });

    factory ETickets.fromJson(Map<String, dynamic> json) => ETickets(
        ticketType: json["ticketType"],
        isPassportMandatory: json["IsPassportMandatory"],
        sourceCode: json["sourceCode"],
        fareType: json["FareType"],
        isRefundable: json["IsRefundable"],
        type: json["type"],
        passengers: json["passengers"] == null ? [] : List<Passenger>.from(json["passengers"]!.map((x) => Passenger.fromJson(x))),
        originDestinationOptions: json["originDestinationOptions"] == null ? [] : List<OriginDestinationOption>.from(json["originDestinationOptions"]!.map((x) => OriginDestinationOption.fromJson(x))),
        fareTotal: json["fareTotal"] == null ? null : FareTotal.fromJson(json["fareTotal"]),
    );

    Map<String, dynamic> toJson() => {
        "ticketType": ticketType,
        "IsPassportMandatory": isPassportMandatory,
        "sourceCode": sourceCode,
        "FareType": fareType,
        "IsRefundable": isRefundable,
        "type": type,
        "passengers": passengers == null ? [] : List<dynamic>.from(passengers!.map((x) => x.toJson())),
        "originDestinationOptions": originDestinationOptions == null ? [] : List<dynamic>.from(originDestinationOptions!.map((x) => x.toJson())),
        "fareTotal": fareTotal?.toJson(),
    };
}

class FareTotal {
    BaseFare? baseFare;
    BaseFare? serviceTax;
    BaseFare? totalTax;
    BaseFare? total;

    FareTotal({
        this.baseFare,
        this.serviceTax,
        this.totalTax,
        this.total,
    });

    factory FareTotal.fromJson(Map<String, dynamic> json) => FareTotal(
        baseFare: json["baseFare"] == null ? null : BaseFare.fromJson(json["baseFare"]),
        serviceTax: json["serviceTax"] == null ? null : BaseFare.fromJson(json["serviceTax"]),
        totalTax: json["totalTax"] == null ? null : BaseFare.fromJson(json["totalTax"]),
        total: json["total"] == null ? null : BaseFare.fromJson(json["total"]),
    );

    Map<String, dynamic> toJson() => {
        "baseFare": baseFare?.toJson(),
        "serviceTax": serviceTax?.toJson(),
        "totalTax": totalTax?.toJson(),
        "total": total?.toJson(),
    };
}

class BaseFare {
    String? amount;
    Currency? currencyCode;
    String? decimalPlaces;
    String? taxCode;

    BaseFare({
        this.amount,
        this.currencyCode,
        this.decimalPlaces,
        this.taxCode,
    });

    factory BaseFare.fromJson(Map<String, dynamic> json) => BaseFare(
        amount: json["Amount"],
        currencyCode: currencyValues.map[json["CurrencyCode"]]!,
        decimalPlaces: json["DecimalPlaces"],
        taxCode: json["TaxCode"],
    );

    Map<String, dynamic> toJson() => {
        "Amount": amount,
        "CurrencyCode": currencyValues.reverse[currencyCode],
        "DecimalPlaces": decimalPlaces,
        "TaxCode": taxCode,
    };
}

enum Currency {
    USD
}

final currencyValues = EnumValues({
    "USD": Currency.USD
});

class OriginDestinationOption {
    int? totalStops;
    List<TourSegment>? tourSegments;

    OriginDestinationOption({
        this.totalStops,
        this.tourSegments,
    });

    factory OriginDestinationOption.fromJson(Map<String, dynamic> json) => OriginDestinationOption(
        totalStops: json["TotalStops"],
        tourSegments: json["tourSegments"] == null ? [] : List<TourSegment>.from(json["tourSegments"]!.map((x) => TourSegment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "TotalStops": totalStops,
        "tourSegments": tourSegments == null ? [] : List<dynamic>.from(tourSegments!.map((x) => x.toJson())),
    };
}

class TourSegment {
    int? seatsRemaining;
    String? flightNumber;
    String? airlineCode;
    String? airlineName;
    String? departureAirportCode;
    DateTime? departureDateTime;
    String? arrivalAirportCode;
    DateTime? arrivalDateTime;
    String? cabinClassCode;
    String? journeyDuration;
    String? cabinClassText;

    TourSegment({
        this.seatsRemaining,
        this.flightNumber,
        this.airlineCode,
        this.airlineName,
        this.departureAirportCode,
        this.departureDateTime,
        this.arrivalAirportCode,
        this.arrivalDateTime,
        this.cabinClassCode,
        this.journeyDuration,
        this.cabinClassText,
    });

    factory TourSegment.fromJson(Map<String, dynamic> json) => TourSegment(
        seatsRemaining: json["SeatsRemaining"],
        flightNumber: json["FlightNumber"],
        airlineCode: json["AirlineCode"],
        airlineName: json["AirlineName"],
        departureAirportCode: json["DepartureAirportCode"],
        departureDateTime: json["DepartureDateTime"] == null ? null : DateTime.parse(json["DepartureDateTime"]),
        arrivalAirportCode: json["ArrivalAirportCode"],
        arrivalDateTime: json["ArrivalDateTime"] == null ? null : DateTime.parse(json["ArrivalDateTime"]),
        cabinClassCode: json["CabinClassCode"],
        journeyDuration: json["JourneyDuration"],
        cabinClassText: json["CabinClassText"],
    );

    Map<String, dynamic> toJson() => {
        "SeatsRemaining": seatsRemaining,
        "FlightNumber": flightNumber,
        "AirlineCode": airlineCode,
        "AirlineName": airlineName,
        "DepartureAirportCode": departureAirportCode,
        "DepartureDateTime": departureDateTime?.toIso8601String(),
        "ArrivalAirportCode": arrivalAirportCode,
        "ArrivalDateTime": arrivalDateTime?.toIso8601String(),
        "CabinClassCode": cabinClassCode,
        "JourneyDuration": journeyDuration,
        "CabinClassText": cabinClassText,
    };
}

class Passenger {
    List<String>? baggage;
    List<String>? cabinBaggage;
    String? type;
    int? quantity;
    BaseFare? priceBase;
    BaseFare? priceService;
    BaseFare? priceSurcharges;
    List<BaseFare>? priceTaxes;
    BaseFare? priceTotal;
    PenaltyDetails? penaltyDetails;

    Passenger({
        this.baggage,
        this.cabinBaggage,
        this.type,
        this.quantity,
        this.priceBase,
        this.priceService,
        this.priceSurcharges,
        this.priceTaxes,
        this.priceTotal,
        this.penaltyDetails,
    });

    factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        baggage: json["Baggage"] == null ? [] : List<String>.from(json["Baggage"]!.map((x) => x)),
        cabinBaggage: json["CabinBaggage"] == null ? [] : List<String>.from(json["CabinBaggage"]!.map((x) => x)),
        type: json["Type"],
        quantity: json["Quantity"],
        priceBase: json["price_Base"] == null ? null : BaseFare.fromJson(json["price_Base"]),
        priceService: json["price_Service"] == null ? null : BaseFare.fromJson(json["price_Service"]),
        priceSurcharges: json["price_Surcharges"] == null ? null : BaseFare.fromJson(json["price_Surcharges"]),
        priceTaxes: json["price_Taxes"] == null ? [] : List<BaseFare>.from(json["price_Taxes"]!.map((x) => BaseFare.fromJson(x))),
        priceTotal: json["price_Total"] == null ? null : BaseFare.fromJson(json["price_Total"]),
        penaltyDetails: json["PenaltyDetails"] == null ? null : PenaltyDetails.fromJson(json["PenaltyDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "Baggage": baggage == null ? [] : List<dynamic>.from(baggage!.map((x) => x)),
        "CabinBaggage": cabinBaggage == null ? [] : List<dynamic>.from(cabinBaggage!.map((x) => x)),
        "Type": type,
        "Quantity": quantity,
        "price_Base": priceBase?.toJson(),
        "price_Service": priceService?.toJson(),
        "price_Surcharges": priceSurcharges?.toJson(),
        "price_Taxes": priceTaxes == null ? [] : List<dynamic>.from(priceTaxes!.map((x) => x.toJson())),
        "price_Total": priceTotal?.toJson(),
        "PenaltyDetails": penaltyDetails?.toJson(),
    };
}

class PenaltyDetails {
    Currency? currency;
    bool? refundAllowed;
    String? refundPenaltyAmount;
    bool? changeAllowed;
    String? changePenaltyAmount;

    PenaltyDetails({
        this.currency,
        this.refundAllowed,
        this.refundPenaltyAmount,
        this.changeAllowed,
        this.changePenaltyAmount,
    });

    factory PenaltyDetails.fromJson(Map<String, dynamic> json) => PenaltyDetails(
        currency: currencyValues.map[json["Currency"]]!,
        refundAllowed: json["RefundAllowed"],
        refundPenaltyAmount: json["RefundPenaltyAmount"],
        changeAllowed: json["ChangeAllowed"],
        changePenaltyAmount: json["ChangePenaltyAmount"],
    );

    Map<String, dynamic> toJson() => {
        "Currency": currencyValues.reverse[currency],
        "RefundAllowed": refundAllowed,
        "RefundPenaltyAmount": refundPenaltyAmount,
        "ChangeAllowed": changeAllowed,
        "ChangePenaltyAmount": changePenaltyAmount,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
