import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'notifier/inicio_notifier.dart';

class InicioScreen extends ConsumerStatefulWidget {
  const InicioScreen({Key? key})
      : super(
          key: key,
        );

  @override
  InicioScreenState createState() => InicioScreenState();
}

class InicioScreenState extends ConsumerState<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 700.h,
          child: Column(
            children: [
              SizedBox(height: 45.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img12fa4a85e35fafd,
                        height: 350.adaptSize,
                        width: 350.adaptSize,
                      ),
                      SizedBox(height: 38.v),
                      Text(
                        "lbl".tr,
                        style: CustomTextStyles.interOnPrimary,
                      ),
                      SizedBox(height: 26.v),
                      SizedBox(
                        height: 628.v,
                        width: 700.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 100.h,
                                  top: 158.v,
                                  right: 100.h,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomElevatedButton(
                                      height: 86.v,
                                      text: "lbl_empezar".tr,
                                      buttonStyle: CustomButtonStyles.none,
                                      buttonTextStyle:
                                          theme.textTheme.displayMedium,
                                      onPressed: () {
                                        onTapRegistrarse(context);
                                      },
                                    ),
                                    SizedBox(height: 77.v),
                                    CustomElevatedButton(
                                      text: "msg_tengo_una_cuenta".tr,
                                      onPressed: () {
                                        onTapTengoUnaCuenta(context);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "msg_domina_el_idioma".tr,
                                style: CustomTextStyles
                                    .displayMediumJosefinSansGray600,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgLoginWaves1,
                              height: 592.v,
                              width: 700.h,
                              alignment: Alignment.bottomCenter,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

onTapTengoUnaCuenta(BuildContext context){
  NavigatorService.pushNamed(
    AppRoutes.chatScreen
  );
}
onTapRegistrarse(BuildContext context){
  NavigatorService.pushNamed(
    AppRoutes.chatScreen
  );
}