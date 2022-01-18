import 'package:flutter/material.dart';
import 'package:newapp/src/services/news_service.dart';
import 'package:newapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

//AutomaticKeepAliveClientMixin sirve para mantener el estado de la pagina y tiene que ser usando stalefulwidget y el ovveride wantkeepalive
class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //final newsService = Provider.of<NewsService>(context);

    final headlines = Provider.of<NewsService>(context).headlines;
    return Scaffold(
        body: (headlines.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListaNoticias(headlines)));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>
      true; //Esto sirve para mantener el estado de la pagina
}
