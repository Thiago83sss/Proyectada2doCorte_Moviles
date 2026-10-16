import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const YoNuncaApp());

const Color fondo = Color(0xFF140D20);
const Color morado = Color(0xFF9B51E0);
const Color rosado = Color(0xFFFF4F87);
const Color naranja = Color(0xFFFFA63D);
const Color tarjeta = Color(0xFF251936);

class YoNuncaApp extends StatelessWidget {
  const YoNuncaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yo Nunca Nunca...',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: fondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: morado,
          brightness: Brightness.dark,
          primary: morado,
          secondary: rosado,
          surface: tarjeta,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: fondo,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const JuegoPage(),
    );
  }
}

const Map<String, List<String>> frasesPorCategoria = {
  'Suavemente': [
    '...he llegado tarde a un examen.',
    '...me he quedado dormido en clase.',
    '...he mentido para no ir a una reunión.',
    '...he fingido que me gusta una canción para quedar bien.',
    '...he enviado un mensaje a la persona equivocada.',
    '...he comido algo que se cayó al piso.',
    '...me he reído en un momento muy serio.',
    '...he dejado una tarea para el último minuto.',
    '...he buscado mi propio nombre en Google.',
    '...he cantado en la ducha a todo pulmón.',
  ],
  'Más entretenido': [
    '...me he tropezado frente a mucha gente.',
    '...he saludado a alguien que no me estaba saludando a mí.',
    '...he dicho "igualmente" cuando no correspondía.',
    '...he llamado "mamá" o "profe" a quien no era.',
    '...he fingido estar al teléfono para evitar a alguien.',
    '...he stalkeado a un ex en redes sociales.',
    '...he dado like sin querer a una foto muy antigua.',
    '...me he dormido en el transporte y pasé mi parada.',
    '...he copiado en un examen.',
    '...he insultado a la gente a sus espaldas',
  ],
  'Hot(ni tanto, no se si me dejan)': [
    '...me he enamorado de alguien de este grupo.',
    '...he dañado la propiedad de otra persona a propósito como venganza.',
    '...he tenido una cita que terminó fatal.',
    '...he enviado un mensaje estando pasado de copas.',
    '...he guardado un secreto que no debía.',
    '...he fingido estar enfermo para no ir a una fiesta.',
    '...he hablado mal de un amigo a sus espaldas.',
    '...he ignorado a propósito una llamada importante.',
    '...me he despertado sin recordar la noche anterior.',
    '...he tenido un crush con alguien de mi grupo de amigos.',
    '...he besado a alguien y después he fingido que no significó nada.',
    '...he tenido fantasías con alguien que está en esta habitación.',
    '...he sentido tensión sexual con alguien con quien no debería.',
    '...he enviado una foto provocativa a alguien.',
    '...he borrado un chat para que mi pareja no lo encontrara.',
    '...he tenido ganas de besar a la pareja de un amigo.',
    '...he besado a dos personas en la misma noche.',
    '...he tenido un amigo con derechos.',
    '...he tenido un sueño subido de tono con alguien que conozco.',
    '...he coqueteado con alguien solo para darle celos a otra persona.',
    '...he tenido algo con alguien y me he arrepentido al día siguiente.',
    '...he besado a alguien cuyo nombre acababa de aprender.',
    '...he tenido ganas de repetir un beso que supuestamente no me gustó.',
    '...he stalkeado a alguien porque me parecía demasiado atractivo.',
    '...he tenido una conversación que se volvió bastante subida de tono.',
    '...he "besado" a alguien en un lugar donde podían descubrirnos.',
    '...he sentido atracción por alguien mucho mayor que yo.',
    '...he tenido un crush secreto con alguien de mi grupo de amigos.',
    '...he sido la tentación de alguien que tenía pareja.',
    '...he tenido una aventura que nadie de mi círculo conoce.',
    '...he querido besar a alguien mientras me hablaba muy cerca.',
    '...he tenido un casi algo que terminó por falta de valentía.',
    '...he vuelto con alguien sabiendo que era una pésima idea.',
    '...he sentido celos de alguien con quien ni siquiera tenía una relación.',
    '...he tenido una cita en la que ambos sabíamos lo que podía pasar.',
    '...he recibido un mensaje de madrugada que me dejó pensando.',
    '...he tenido química con alguien desde el primer contacto visual.',
    '...he ocultado que alguien me gusta porque también le gusta a un amigo.',
  ],
};

const List<String> retosAleatorios = [
  'Imita a alguien del grupo y deja que adivinen quién es.',
  'Canta el coro de una canción que el grupo elija.',
  'Habla con acento diferente durante dos rondas.',
  'Haz tu mejor imitación de un famoso.',
  'Deja que el grupo te ponga un apodo para esta ronda.',
  'Intenta hacer reír a alguien en 20 segundos.',
  'Di tres cosas malas de la persona a tu derecha.',
  'Cuenta un chiste. Si nadie se ríe, haces otro reto.',
  'Habla como robot hasta que vuelva a ser tu turno.',
  'Inventa un comercial para el objeto que tengas más cerca.',
  'Haz una pose dramática de telenovela.',
  'Describe tu peor cita sin decir nombres.',
  'Deja que el grupo escoja una palabra que debas usar en cada frase durante una ronda.',
  'Intenta decir un trabalenguas tres veces seguidas.',
  'Cuenta una verdad curiosa sobre ti que pocos conozcan.',
  'Imita el sonido de tres animales para que los demás adivinen.',
  'Haz una entrevista rapida a la persona de tu izquierda.',
  'Inventa un saludo secreto con otro jugador.',
  'Describe a alguien del grupo usando solo tres palabras positivas.',
  'Cuenta cuál fue tu primera impresión de alguien del grupo.',
  'Inventa un nombre de superhéroe para 3 jugadores.',
  'Toma un poco del trago que tengas.',
  'Fondeate el trago que tengas.',
  'Tomate un shot.',
  'Mezcla dos tragos y tomatelo.',
  'Tomate el trago de un jugador.',
  'Dale tu trago a un jugador.',
  'No tomas por 2 rondas.',
  'Tomas por cada turno hasta que te vuelva a tocar.',
];

class JuegoPage extends StatefulWidget {
  const JuegoPage({super.key});

  @override
  State<JuegoPage> createState() => _JuegoPageState();
}

class _JuegoPageState extends State<JuegoPage> {
  final Random _random = Random();

  String _categoria = 'Suavemente';
  late List<String> _mazo;
  int _indice = 0;
  bool _iniciado = false;

  String _modo = 'inicio';
  String _retoActual = '';
  String _fraseRetoAnterior = '';

  @override
  void initState() {
    super.initState();
    _barajar();
  }

  void _barajar() {
    _mazo = List<String>.from(frasesPorCategoria[_categoria]!)
      ..shuffle(_random);
    _indice = 0;
  }

  void _cambiarCategoria(String categoria) {
    setState(() {
      _categoria = categoria;
      _iniciado = false;
      _modo = 'inicio';
      _barajar();
    });
  }

  void _siguiente() {
    setState(() {
      _modo = 'frase';

      if (!_iniciado) {
        _iniciado = true;
        return;
      }

      if (_indice < _mazo.length - 1) {
        _indice++;
      } else {
        _barajar();
        _iniciado = true;
      }
    });
  }

  void _generarReto() {
    setState(() {
      _modo = 'reto';

      List<String> opciones = retosAleatorios
          .where((reto) => reto != _fraseRetoAnterior)
          .toList();

      if (opciones.isEmpty) {
        opciones = List<String>.from(retosAleatorios);
      }

      _retoActual = opciones[_random.nextInt(opciones.length)];
      _fraseRetoAnterior = _retoActual;
    });
  }

  void _reiniciar() {
    setState(() {
      _iniciado = false;
      _modo = 'inicio';
      _retoActual = '';
      _barajar();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool mostrandoReto = _modo == 'reto';
    final bool mostrandoFrase = _modo == 'frase';

    final String textoPrincipal = mostrandoReto
        ? _retoActual
        : mostrandoFrase
            ? _mazo[_indice]
            : '¿Listones?\nSi no, ¿pa qué abres esta app?\nDale pue, dale pue, dale pue.';

    final Color colorPrincipal = mostrandoReto ? naranja : morado;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'YO NUNCA NUNCA...',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 19,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              'LA REUNIÓN SE PUSO BUENA',
              style: TextStyle(
                fontSize: 9,
                letterSpacing: 2,
                color: Colors.white54,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Reiniciar juego',
            onPressed: _reiniciar,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
          child: Column(
            children: [
              const SizedBox(height: 8),

              // Encabezado
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_rounded,
                    color: rosado,
                    size: 25,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'ESCOGE TU DIFICULTAD PUE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Categorías
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: frasesPorCategoria.keys.map((cat) {
                    final bool seleccionada = _categoria == cat;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(
                          cat,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: seleccionada
                                ? Colors.white
                                : Colors.white70,
                          ),
                        ),
                        selected: seleccionada,
                        onSelected: (_) => _cambiarCategoria(cat),
                        selectedColor: morado,
                        backgroundColor: tarjeta,
                        side: BorderSide(
                          color: seleccionada
                              ? morado
                              : Colors.white12,
                        ),
                        showCheckmark: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 18),

              // Progreso de frases
              Row(
                children: [
                  const Icon(
                    Icons.style_rounded,
                    size: 16,
                    color: Colors.white54,
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      mostrandoFrase
                          ? 'Carta ${_indice + 1} de ${_mazo.length}'
                          : mostrandoReto
                              ? 'Reto sorpresa'
                              : 'Categoría: $_categoria',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  if (mostrandoFrase)
                    Text(
                      '${((_indice + 1) / _mazo.length * 100).round()}%',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFD7AEFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 8),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: mostrandoFrase
                      ? (_indice + 1) / _mazo.length
                      : 0,
                  minHeight: 5,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    mostrandoReto ? naranja : morado,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Tarjeta principal
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(
                          begin: 0.94,
                          end: 1,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    key: ValueKey(
                      '$_modo-$_categoria-$_indice-$_retoActual',
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: mostrandoReto
                            ? const [
                                Color(0xFF512B16),
                                Color(0xFF302039),
                                Color(0xFF24162F),
                              ]
                            : const [
                                Color(0xFF42205F),
                                Color(0xFF2B1A40),
                                Color(0xFF21152F),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: colorPrincipal.withOpacity(0.6),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colorPrincipal.withOpacity(0.15),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: colorPrincipal.withOpacity(0.18),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            mostrandoReto
                                ? Icons.bolt_rounded
                                : mostrandoFrase
                                    ? Icons.style_rounded
                                    : Icons.celebration_rounded,
                            color: mostrandoReto ? naranja : rosado,
                            size: 38,
                          ),
                        ),

                        const SizedBox(height: 22),

                        Text(
                          mostrandoReto
                              ? 'TU RETO ES...'
                              : mostrandoFrase
                                  ? 'YO NUNCA NUNCA...'
                                  : '¿LISTONES?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mostrandoReto ? naranja : rosado,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 3,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Flexible(
                          child: SingleChildScrollView(
                            child: Center(
                              child: Text(
                                textoPrincipal,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  height: 1.45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            mostrandoReto
                                ? 'ATRÉVETE A CUMPLIRLO'
                                : mostrandoFrase
                                    ? '¿QUIÉN SE IDENTIFICA?'
                                    : 'ELIGE UNA OPCIÓN PARA COMENZAR',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: FilledButton.icon(
                  onPressed: _siguiente,
                  icon: const Icon(Icons.style_rounded),
                  label: Text(
                    mostrandoFrase
                        ? 'SIGUIENTE FRASE'
                        : 'YO NUNCA NUNCA',
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: morado,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  onPressed: _generarReto,
                  icon: const Icon(Icons.bolt_rounded),
                  label: const Text('RETO ALEATORIO'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: naranja,
                    side: const BorderSide(
                      color: naranja,
                      width: 1.5,
                    ),
                    backgroundColor: naranja.withOpacity(0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
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