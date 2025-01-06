import 'package:flutter/material.dart';
import 'package:spotyland/helpers/preferences.dart';
import 'package:spotyland/providers/theme_provider.dart';
import 'package:spotyland/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar las variables de entorno solo si no estamos en Web
  // if (!Foundation.kIsWeb) {
  //   await dotenv.load(); // Cargar el archivo .env
  //   // Verificar si la variable 'API_URL' se cargó correctamente
  //   print(dotenv.env['API_URL'] ?? 'API_URL no cargada'); // Imprime la URL o el mensaje de error
  // }

  // Inicializar preferencias
  await Preferences.initShared();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        theme: tema.temaActual,
        routes: {
          'home': (context) => const HomeScreen(),
          'artistas_screen': (context) => ArtistasScreen(),
          'artistas_screen_item': (context) => ArtistasScreenItem(),
          'configuracion': (context) => const ConfiguracionScreen(),
          'canciones': (context) => CancionesScreen(),
          'canciones_screen_item': (context) => CancionesScreenItem(),
          'playlist_item_card': (context) => PlaylistScreenItem(),
          'playlists': (context) => PlaylistScreen(),
          'albums_screen_item': (context) => AlbumsScreenItem(),
          'albums': (context) => AlbumsScreen(),
        }
        );
  }
}
