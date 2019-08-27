var historyPoints = [
  HistoryPoint(
    id: "history-point-1",
    name: "history-point-1-name",
    description : "history-point-1-description",
    year: "1930",
    source: "",

    latitude: 54.354536779416,
    longitude: 18.661871552467,

    before: "assets/before-after/1/before.jpg",
    after: "assets/before-after/1/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-2",
    name: "history-point-2-name",
    description : "history-point-2-description",
    year: "1941",
    source: "",

    latitude: 54.3464739782,
    longitude: 18.6635989394,

    before: "assets/before-after/2/before.jpg",
    after: "assets/before-after/2/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-3",
    name: "history-point-3-name",
    description : "history-point-3-description",
    year: "1951",
    source: "",

    latitude: 54.344393304767,
    longitude: 18.649436879762,

    before: "assets/before-after/3/before.jpg",
    after: "assets/before-after/3/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-4",
    name: "history-point-4-name",
    description : "history-point-4-description",
    year: "1919",
    source: "",

    latitude: 54.354208690907,
    longitude: 18.643019718455,

    before: "assets/before-after/4/before.jpg",
    after: "assets/before-after/4/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-5",
    name: "history-point-5-name",
    description : "history-point-5-description",
    year: "1939",
    source: "",

    latitude: 54.402259938381,
    longitude: 18.669215684686,

    before: "assets/before-after/5/before.jpg",
    after: "assets/before-after/5/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-6",
    name: "history-point-6-name",
    description : "history-point-6-description",
    year: "1895",
    source: "",

    latitude: 54.35117090175,
    longitude: 18.645864582699,

    before: "assets/before-after/6/before.jpg",
    after: "assets/before-after/6/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-7",
    name: "history-point-7-name",
    description : "history-point-7-description",
    year: "1936",
    source: "",

    latitude: 54.40671446672,
    longitude: 18.67219532537,

    before: "assets/before-after/7/before.jpg",
    after: "assets/before-after/7/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-8",
    name: "history-point-8-name",
    description : "history-point-8-description",
    year: "1945",
    source: "",

    latitude: 54.348501,
    longitude: 18.653342,

    before: "assets/before-after/8/before.jpg",
    after: "assets/before-after/8/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-9",
    name: "history-point-9-name",
    description : "history-point-9-description",
    year: "1930?",
    source: "",

    latitude: 54.3478280257,
    longitude: 18.6562891223,

    before: "assets/before-after/9/before.jpg",
    after: "assets/before-after/9/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-10",
    name: "history-point-10-name",
    description : "history-point-10-description",
    year: "1945",
    source: "",

    latitude: 54.347871286198,
    longitude: 18.656324404824,

    before: "assets/before-after/10/before.jpg",
    after: "assets/before-after/10/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-11",
    name: "history-point-11-name",
    description : "history-point-11-description",
    year: "1945",
    source: "",

    latitude: 54.347739,
    longitude: 18.664238,

    before: "assets/before-after/11/before.jpg",
    after: "assets/before-after/11/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-12",
    name: "history-point-12-name",
    description : "history-point-12-description",
    year: "1939",
    source: "",

    latitude: 54.3467832704,
    longitude: 18.6550221048,

    before: "assets/before-after/12/before.jpg",
    after: "assets/before-after/12/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-13",
    name: "history-point-13-name",
    description : "history-point-13-description",
    year: "1946",
    source: "",

    latitude: 54.351592852125,
    longitude: 18.652639560119,

    before: "assets/before-after/13/before.jpg",
    after: "assets/before-after/13/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-14",
    name: "history-point-14-name",
    description : "history-point-14-description",
    year: "1945",
    source: "",

    latitude: 54.350203132,
    longitude: 18.650624182,

    before: "assets/before-after/14/before.jpg",
    after: "assets/before-after/14/after.jpg"
  ),
  HistoryPoint(
    id: "history-point-15",
    name: "history-point-15-name",
    description : "history-point-15-description",
    year: "1939",
    source: "",

    latitude: 54.354957168,
    longitude: 18.6444838049,

    before: "assets/before-after/15/before.jpg",
    after: "assets/before-after/15/after.jpg"
  )
].asMap().map((index, point) => MapEntry(point.id, point));

class HistoryPoint {
  String id;
  String name;
  String description;
  String year;
  String source;

  double latitude;
  double longitude;

  String before;
  String after;

  HistoryPoint({
    this.id,
    this.name,
    this.description,
    this.year,
    this.source,

    this.latitude,
    this.longitude,

    this.before,
    this.after
  });
}