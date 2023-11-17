class Loan{
  String schemeName;
  String schemeFor;
  int maxLimit;
  int minEMI;
  double interest;
  Loan(this.schemeName,this.schemeFor,this.interest,this.maxLimit,this.minEMI);
  @override
  String toString() {
    // TODO: implement toString
    return "Scheme name $schemeName opt for $schemeFor with minimum EMI duration $minEMI interest of $interest and maximum be sanctioned $maxLimit";
  }
}