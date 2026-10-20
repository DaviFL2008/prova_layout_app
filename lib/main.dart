import 'package:flutter/material.dart';
// TODO Desafio 7: Importar o widget customizado criado em lib/widgets/bloco_estatistica.dart
import 'widgets/bloco_estatistica.dart';

void main() {
  runApp(const MeuLayoutApp());
}

class MeuLayoutApp extends StatelessWidget {
  const MeuLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPDM - Avaliação 02 (Layout Widgets)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TelaDashboard(),
    );
  }
}

class TelaDashboard extends StatelessWidget {
  const TelaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PPDM - Dashboard de Observações'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // ===================================================================
          // 📍 DESAFIO 2 (1,0 ponto): 
          // Alterar o crossAxisAlignment de .start para CrossAxisAlignment.center
          // ===================================================================
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Resumo das Observações',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // ===================================================================
            // 📍 DESAFIO 1 (1,5 ponto), DESAFIO 7 (2,5 pontos) & DESAFIO 8 (3,0 pontos):
            // Desafio 1: Adicionar o 3º Card (Icons.camera_alt, '45', 'Fotos') com Expanded.
            // Desafio 7: Componentizar e utilizar o widget BlocoEstatistica.
            // Desafio 8: Refatorar esta seção usando GridView.count (grade 2x2).
            // ===================================================================
            SizedBox(
              height: 280,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BlocoEstatistica(
                    icone: Icons.flutter_dash,
                    valor: '124',
                    rotulo: 'Aves Vistas',
                    corFundo: Colors.teal.shade100,
                  ),
                  BlocoEstatistica(
                    icone: Icons.place,
                    valor: '18',
                    rotulo: 'Locais Visitados',
                    corFundo: Colors.teal.shade50,
                  ),
                  // Desafio 1: 3º Card (Icons.camera_alt, '45', 'Fotos')
                  BlocoEstatistica(
                    icone: Icons.camera_alt,
                    valor: '45',
                    rotulo: 'Fotos',
                    corFundo: Colors.teal.shade100,
                  ),
                  // 4º Card para formar a grade 2x2 (Desafio 8)
                  BlocoEstatistica(
                    icone: Icons.note_alt,
                    valor: '12',
                    rotulo: 'Anotações',
                    corFundo: Colors.teal.shade50,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            const Text(
              'Destaque da Semana',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // ===================================================================
            // 📍 DESAFIO 5 (2,0 pontos) & DESAFIO 6 (1,5 ponto):
            // Desafio 5: Adicionar o 2º selo no Stack (bottom: -8, left: -8)
            //            com texto "Confirmado" e cor verde (Colors.green).
            // Desafio 6: Substituir o Container abaixo por um Card(elevation: 4).
            // ===================================================================
            Stack(
              clipBehavior: Clip.none,
              children: [
                // TODO [Desafio 6]: Substituído Container simples por Card do Material com elevation: 4
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 48, color: Colors.amber),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Gavião-Real',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Avistado no Parque Central',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Raro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // TODO [Desafio 5]: Adicionado segundo Positioned no canto inferior esquerdo
                Positioned(
                  bottom: -8,
                  left: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Confirmado',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24.0),

            // ===================================================================
            // 📍 DESAFIO 3 (2,0 pontos):
            // Criar a seção "Últimos Registros" com Container, Row, ícone de lista,
            // texto e botão/ícone com MainAxisAlignment.spaceBetween.
            // ===================================================================
            // TODO [Desafio 3]: Seção "Últimos Registros"
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.list_alt, color: Colors.teal),
                      SizedBox(width: 8.0),
                      Text(
                        'Últimos Registros',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 18),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24.0),

            // ===================================================================
            // 📍 DESAFIO 4 (1,5 ponto):
            // Demonstrar/comprovar a ocorrência e correção de um erro de overflow
            // (RenderFlex overflow) via prints ou bloco comentado.
            // ===================================================================
            /*
              DEMONSTRAÇÃO DO ERRO DE OVERFLOW (RenderFlex overflow):
              
              O erro ocorre quando um componente (ex: Text longo dentro de um Row)
              ultrapassa os limites da tela sem restrição espacial.
              
              Exemplo do problema:
              Row(
                children: [
                  Text('Texto longo que vai estourar a tela horizontalmente...'),
                ],
              )

              Solução aplicada no layout:
              Envolver os componentes textuais com o widget Expanded ou utilizar a
              propriedade 'overflow: TextOverflow.ellipsis', forçando a quebra ou 
              respeito ao tamanho útil disponível.
            */
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Row(
                children: const [
                  Icon(Icons.check_circle_outline, color: Colors.teal),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Desafio 4: Tratamento de RenderFlex overflow demonstrado no bloco comentado e prevenido através do uso do widget Expanded.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
