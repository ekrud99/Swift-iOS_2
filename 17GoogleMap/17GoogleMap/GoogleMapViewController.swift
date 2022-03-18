//
//  GoogleMapViewController.swift
//  17GoogleMap


import UIKit
import GoogleMaps //구글 맵
import CoreLocation //애블 SDK - GPS에서 좌표를 가져오는 라이브러리

//개발자 콘솔
//https://console.cloud.google.com/
//API key: AIzaSyBtW3cWqeKO5Hrgz_5ncqtKBzn3lg9VdDA
//cocoa pod 사용 google library 사용

class GoogleMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    //구글 맵 뷰
    var mapView: GMSMapView!//확정적으로 넣어주기때문에 !
    //GPS 좌표 객체
    var locationManager = CLLocationManager()
    //위도, 경도 값에서 행정주소(ex. 서울시 종로구 종각1동)변환 클래스
    var geocoder = GMSGeocoder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
        initLocationManager()
        
    }
    func initMapView(){
        mapView = GMSMapView()
        //카메라 설정: 전체 맵의 일부화면을 의미
        //서울 시청역: 37.56645185314796, 126.97796549181369
        let camera = GMSCameraPosition.camera(withLatitude: 37.56645, longitude: 126.97796, zoom: 15)
        mapView.camera = camera
        //현재 위치를 표현하는 파란 원 아이콘
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        //최상위 뷰를 구글맵 뷰로 교체해줌
        self.view = mapView
    }
    func initLocationManager(){
        //GPS좌표 얻어오기 활성화
        //GPS좌표 오차범위: 10미터~100미터
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        //위치정보 사용 시 팝업 알람 사용
        locationManager.requestWhenInUseAuthorization()
        //위치정보 가져오기 시작 -> 약간의 딜레이 시간 소요됨. 5초
        locationManager.startUpdatingLocation()
    }

    //위치가 업데이트 될 떄마다 호출되는 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordi = manager.location?.coordinate{
            print("위도:", String(coordi.latitude))
            print("경도:", String(coordi.longitude))
            
            //위치가 바뀌면 센터 변경
            let camera = GMSCameraPosition.camera(withLatitude: coordi.latitude, longitude: coordi.longitude, zoom: 15)
            mapView.camera = camera
            //구글맵을 부드럽게 이동시켜 줌
            mapView?.animate(to: camera)
        }
    }
    //구글맵에 핀 표시
    var marker = GMSMarker()
    
    //구글맵을 이동하면, 기존에 있던 마커들을 한번 지워줌
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        //마커를 지움
        mapView.clear()
    }
    //구글맵이 이동하고 나서(드래그) 정지된 후에 호출되는 함수
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        //지오코더를 이용하여, 위도, 경도 값을 행정주소로 변환할 수 있음
        geocoder.reverseGeocodeCoordinate(position.target){
            //후행클로저로 코드블럭을 넣어줌
            (response, error) in
            guard error == nil else{
                return
            }
            //정상 호출 됨
            if let result = response?.firstResult(){
                let marker = GMSMarker()
                marker.position = position.target
                marker.title = "종로맛집"
                marker.snippet = result.lines?[0]//행정주소를 부가정보로 추가함
                marker.map = mapView
            }
        }
    }
  

}
