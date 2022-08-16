class LocationDonationCites {
  LocationDonationCites({
    required this.status,
    required this.message,
    required this.damascus,
    required this.damascusPeople,
    required this.Dara,
    required this.DaraPeople,
    required this.Aleppo,
    required this.AleppoPeople,
    required this.Kenitra,
    required this.KenitraPeople,
    required this.Suwayda,
    required this.SuwaydaPeople,
    required this.Homs,
    required this.HomsPeople,
    required this.Hama,
    required this.HamaPeople,
    required this.Idlib,
    required this.IdlibPeople,
    required this.Alraka,
    required this.AlrakaPeople,
    required this.derAlzoor,
    required this.derAlzoorPeople,
    required this.Latakia,
    required this.LatakiaPeople,
    required this.Tartous,
    required this.TartousPeople,
    required this.AlHasakah,
    required this.AlHasakahPeople,
    required this.reafDimashk,
    required this.reafDimashkPeople,
  });
  late final String status;
  late final String message;
  late final int damascus;
  late final int damascusPeople;
  late final int Dara;
  late final int DaraPeople;
  late final int Aleppo;
  late final int AleppoPeople;
  late final int Kenitra;
  late final int KenitraPeople;
  late final int Suwayda;
  late final int SuwaydaPeople;
  late final int Homs;
  late final int HomsPeople;
  late final int Hama;
  late final int HamaPeople;
  late final int Idlib;
  late final int IdlibPeople;
  late final int Alraka;
  late final int AlrakaPeople;
  late final int derAlzoor;
  late final int derAlzoorPeople;
  late final int Latakia;
  late final int LatakiaPeople;
  late final int Tartous;
  late final int TartousPeople;
  late final int AlHasakah;
  late final int AlHasakahPeople;
  late final int reafDimashk;
  late final int reafDimashkPeople;

  LocationDonationCites.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    damascus = json['damascus'];
    damascusPeople = json['damascusPeople'];
    Dara = json['Dara'];
    DaraPeople = json['DaraPeople'];
    Aleppo = json['Aleppo'];
    AleppoPeople = json['AleppoPeople'];
    Kenitra = json['Kenitra'];
    KenitraPeople = json['KenitraPeople'];
    Suwayda = json['Suwayda'];
    SuwaydaPeople = json['SuwaydaPeople'];
    Homs = json['Homs'];
    HomsPeople = json['HomsPeople'];
    Hama = json['Hama'];
    HamaPeople = json['HamaPeople'];
    Idlib = json['Idlib'];
    IdlibPeople = json['IdlibPeople'];
    Alraka = json['Alraka'];
    AlrakaPeople = json['AlrakaPeople'];
    derAlzoor = json['der_Alzoor'];
    derAlzoorPeople = json['der_AlzoorPeople'];
    Latakia = json['Latakia'];
    LatakiaPeople = json['LatakiaPeople'];
    Tartous = json['Tartous'];
    TartousPeople = json['TartousPeople'];
    AlHasakah = json['Al_hasakah'];
    AlHasakahPeople = json['Al_hasakahPeople'];
    reafDimashk = json['reaf_Dimashk'];
    reafDimashkPeople = json['reaf_DimashkPeople'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['damascus'] = damascus;
    _data['damascusPeople'] = damascusPeople;
    _data['Dara'] = Dara;
    _data['DaraPeople'] = DaraPeople;
    _data['Aleppo'] = Aleppo;
    _data['AleppoPeople'] = AleppoPeople;
    _data['Kenitra'] = Kenitra;
    _data['KenitraPeople'] = KenitraPeople;
    _data['Suwayda'] = Suwayda;
    _data['SuwaydaPeople'] = SuwaydaPeople;
    _data['Homs'] = Homs;
    _data['HomsPeople'] = HomsPeople;
    _data['Hama'] = Hama;
    _data['HamaPeople'] = HamaPeople;
    _data['Idlib'] = Idlib;
    _data['IdlibPeople'] = IdlibPeople;
    _data['Alraka'] = Alraka;
    _data['AlrakaPeople'] = AlrakaPeople;
    _data['der_Alzoor'] = derAlzoor;
    _data['der_AlzoorPeople'] = derAlzoorPeople;
    _data['Latakia'] = Latakia;
    _data['LatakiaPeople'] = LatakiaPeople;
    _data['Tartous'] = Tartous;
    _data['TartousPeople'] = TartousPeople;
    _data['Al_hasakah'] = AlHasakah;
    _data['Al_hasakahPeople'] = AlHasakahPeople;
    _data['reaf_Dimashk'] = reafDimashk;
    _data['reaf_DimashkPeople'] = reafDimashkPeople;
    return _data;
  }
}