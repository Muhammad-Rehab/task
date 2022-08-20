class Drug {
  final String _disease;

  final String _drugName;

  final String _drugDose;

  final String _drugStrength;

  Drug(this._disease, this._drugName, this._drugDose, this._drugStrength);

  get disease => _disease;

  get drugName => _drugName;

  get drugDose => _drugDose;

  get drugStrength => _drugStrength;
}
