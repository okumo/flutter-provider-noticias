import 'package:flutter/material.dart';
import 'package:newapp/src/pages/tab1_page.dart';
import 'package:newapp/src/pages/tab2_page.dart';
import 'package:newapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Accedemos al provider
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    final newsService = Provider.of<NewsService>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Para ti"),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: "Encabezados"),
      ],
    );
  }
}

class Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      //physics: BouncingScrollPhysics(), Esto hace que se pueda mover los widgets
      physics:
          NeverScrollableScrollPhysics(), //Esto hace que no se puedan mover los widgets
      children: <Widget>[Tab1Page(), Tab2Page()],
    );
  }
}

//El changenotifier se usa para alertar a los demás de cambios de estado en el provider
class _NavegacionModel with ChangeNotifier {
  //Propiedades
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    //Notificamos a los listeners para que los widgets se actualicen
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
