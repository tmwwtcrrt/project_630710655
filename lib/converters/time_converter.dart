class TimeConverter {
  static double H2M(double value){
    return (value * 60);
  }

  static double M2H(double value){
    return (value / 60);
  }

  static double H2D(double value){
    return (value / 24);
  }

  static double D2H(double value){
    return (value * 24);
  }

  static double M2D(double value){
    return (value / 1440);
  }

  static double D2M(double value){
    return (value * 1440);
  }
}