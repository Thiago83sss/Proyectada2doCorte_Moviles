import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const YoNuncaApp());

class YoNuncaApp extends StatelessWidget {
  const YoNuncaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yo Nunca Nunca...',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 151, 0, 252),
        brightness: Brightness.dark,
      ),
      home: const JuegoPage(),
    );
  }
}

const Map<String, List<String>> frasesPorCategoria = {
  'Suavitel': [
    'Yo nunca nunca he llegado tarde a un examen.',
    'Yo nunca nunca me he quedado dormido en clase.',
    'Yo nunca nunca he mentido para no ir a una reunión.',
    'Yo nunca nunca he fingido que me gusta una canción para quedar bien.',
    'Yo nunca nunca he enviado un mensaje a la persona equivocada.',
    'Yo nunca nunca he comido algo que se cayó al piso.',
    'Yo nunca nunca me he reído en un momento muy serio.',
    'Yo nunca nunca he dejado una tarea para el último minuto.',
    'Yo nunca nunca he buscado mi propio nombre en Google.',
    'Yo nunca nunca he cantado en la ducha a todo pulmón.',
  ],
  'Más entretenido': [
    'Yo nunca nunca me he tropezado frente a mucha gente.',
    'Yo nunca nunca he saludado a alguien que no me estaba saludando a mí.',
    'Yo nunca nunca he dicho "igualmente" cuando no correspondía.',
    'Yo nunca nunca he llamado "mamá" o "profe" a quien no era.',
    'Yo nunca nunca he fingido estar al teléfono para evitar a alguien.',
    'Yo nunca nunca he bailado solo en mi cuarto.',
    'Yo nunca nunca he stalkeado a un ex en redes sociales.',
    'Yo nunca nunca he dado like sin querer a una foto muy antigua.',
    'Yo nunca nunca me he dormido en el transporte y pasé mi parada.',
    'Yo nunca nunca he copiado en un examen.',
  ],
  'Hot(ni tanto, no se si me dejan)': [
    'Yo nunca nunca me he enamorado de alguien prohibido.',
    'Yo nunca nunca he borrado un mensaje para que nadie lo viera.',
    'Yo nunca nunca he tenido una cita que terminó fatal.',
    'Yo nunca nunca he enviado un mensaje estando pasado de copas.',
    'Yo nunca nunca he guardado un secreto que no debía.',
    'Yo nunca nunca he fingido estar enfermo para no ir a una fiesta.',
    'Yo nunca nunca he hablado mal de un amigo a sus espaldas.',
    'Yo nunca nunca he ignorado a propósito una llamada importante.',
    'Yo nunca nunca me he despertado sin recordar la noche anterior.',
    'Yo nunca nunca he tenido un crush con alguien de mi grupo de amigos.',
  ],
};

class JuegoPage extends StatefulWidget {
  const JuegoPage({super.key});

  @override
  State<JuegoPage> createState() => _JuegoPageState();
}

class _JuegoPageState extends State<JuegoPage> {
  final Random _random = Random();
  String _categoria = 'Suavitel';
  late List<String> _mazo;
  int _indice = 0;
  bool _iniciado = false;

  @override
  void initState() {
    super.initState();
    _barajar();
  }

  void _barajar() {
    _mazo = List<String>.from(frasesPorCategoria[_categoria]!)..shuffle(_random);
    _indice = 0;
  }

  void _cambiarCategoria(String categoria) {
    setState(() {
      _categoria = categoria;
      _iniciado = false;
      _barajar();
    });
  }

  void _siguiente() {
    setState(() {
      if (!_iniciado) {
        _iniciado = true;
        return;
      }
      if (_indice < _mazo.length - 1) {
        _indice++;
      } else {
        _barajar();
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _iniciado = false;
      _barajar();
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final fraseActual = _iniciado
        ? _mazo[_indice]
        : '¿Listones?\nSi no, pa que abres esta app?\ndale pue, dale pue, dale pue, dale pue, dale pue';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yo nunca nunca'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Reiniciar',
            icon: const Icon(Icons.refresh),
            onPressed: _reiniciar,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Wrap(
                spacing: 8,
                children: frasesPorCategoria.keys.map((cat) {
                  return ChoiceChip(
                    label: Text(cat),
                    selected: _categoria == cat,
                    onSelected: (_) => _cambiarCategoria(cat),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: _iniciado ? (_indice + 1) / _mazo.length : 0,
                minHeight: 6,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(height: 6),
              Text(
                _iniciado
                    ? 'Carta ${_indice + 1} de ${_mazo.length}'
                    : 'Categoría: $_categoria',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    ),
                    child: Container(
                      key: ValueKey('$_categoria-$_iniciado-$_indice'),
                      width: double.infinity,
                      constraints: const BoxConstraints(minHeight: 280),
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [scheme.primaryContainer, scheme.tertiaryContainer],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 18,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          fraseActual,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                'Quien lo haya hecho, bebe, toma, se echa un shot o cumple un reto.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.icon(
                  onPressed: _siguiente,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(_iniciado ? 'Vamo BaBoni' : 'Dale pue'),
                  style: FilledButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
