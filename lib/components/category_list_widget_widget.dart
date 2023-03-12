import '/components/subcategory_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_list_widget_model.dart';
export 'category_list_widget_model.dart';

class CategoryListWidgetWidget extends StatefulWidget {
  const CategoryListWidgetWidget({Key? key}) : super(key: key);

  @override
  _CategoryListWidgetWidgetState createState() =>
      _CategoryListWidgetWidgetState();
}

class _CategoryListWidgetWidgetState extends State<CategoryListWidgetWidget> {
  late CategoryListWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryListWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: 190.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    '6lptp015' /* Чистка */,
                  ),
                  style: FlutterFlowTheme.of(context).subtitle2,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'pppczika' /* Больше */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Container(
                        width: 44.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: 148.0,
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  final subcategoryListView = List.generate(
                      random_data.randomInteger(3, 3),
                      (index) => random_data.randomName(true, false)).toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: subcategoryListView.length,
                    itemBuilder: (context, subcategoryListViewIndex) {
                      final subcategoryListViewItem =
                          subcategoryListView[subcategoryListViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: SubcategoryCardWidget(
                          key: Key(
                              'Keyrrm_${subcategoryListViewIndex}_of_${subcategoryListView.length}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
