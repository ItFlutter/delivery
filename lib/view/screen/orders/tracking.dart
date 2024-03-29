import 'package:delivery/core/shared/custombutton.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/tracking_controller.dart';
import '../../../core/class/handlingdataview.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("===================================");
    print(Get.currentRoute);
    return Scaffold(
      appBar: AppBar(title: Text("157".tr)),
      body:
          //  WillPopScope(
          //   onWillPop: () {
          //     Get.delete<TrackingController>();
          //     return Future.value(true);
          //   },
          //   child:
          Container(
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GetBuilder<TrackingController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              GoogleMap(
                polylines: controller.polylineSet,
                markers: controller.markers,
                mapType: MapType.normal,
                initialCameraPosition: controller.cameraPosition!,
                onMapCreated: (GoogleMapController controllermap) {
                  controller.gmc = controllermap;
                },
              ),
              Positioned(
                bottom: 0,
                left: Get.width / 3,
                child: CustomButton(
                  text: "Done",
                  onPressed: () {
                    controller.donedelivery();
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
