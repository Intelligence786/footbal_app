import 'package:flutter/material.dart';
import 'package:footbal_app/presentation/news_page/widgets/news_large_item_widget.dart';
import 'package:footbal_app/widgets/app_bar/custom_app_bar.dart';

import '../../core/app_export.dart';
import '../../data/models/news_model.dart';
import 'news_bloc/news_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('News', style: theme.textTheme.titleLarge,),
        centerTitle: true,
      ),
      body:BlocProvider<NewsBloc>(
        create: (context) => NewsBloc(NewsState(
          newsModelObj: [],
        ))
          ..add(NewsInitialEvent()),
        child: Container(
          //padding: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [

              _buildNewsLargeContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsLargeContainer(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
        child: BlocSelector<NewsBloc, NewsState, List<NewsModel>?>(
          selector: (state) => state.newsModelObj,
          builder: (context, newsModelObj) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 10.v,
                );
              },
              itemCount: newsModelObj?.length ?? 0,
              itemBuilder: (context, index) {
                NewsModel model = newsModelObj?[index] ?? NewsModel();
                return NewsLargeItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
