Public Class ParkLocator{
      Public static string[] country(String country){
      ParkService.ParksImplPort park = new ParkService.ParksImplPort();
      return park.byCountry(country);
      }
}