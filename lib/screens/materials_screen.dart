import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> materials = [
      {
        'name': 'MDF cru 15 mm',
        'icon': Icons.forest,
        'desc': 'Chapa 2,75 x 1,85 m: R\$ 199,90 (R\$ 39,30/m²).',
        'source': 'Leroy Merlin (Fev/2026)',
      },
      {
        'name': 'Compensado naval 15 mm',
        'icon': Icons.layers,
        'desc': 'Chapa 2,20 x 1,60 m: R\$ 286,53 (R\$ 81,40/m²).',
        'source': 'Mercado Livre (Fev/2026)',
      },
      {
        'name': 'Corrediça telescópica 35 cm',
        'icon': Icons.straighten,
        'desc': 'Par com amortecimento: R\$ 49,22.',
        'source': 'Mercado Livre (Fev/2026)',
      },
      {
        'name': 'Dobradiça caneco reta',
        'icon': Icons.architecture,
        'desc': 'Unidade: R\$ 3,30.',
        'source': 'Mercado Livre (Fev/2026)',
      },
      {
        'name': 'Parafuso chipboard 4,0 x 40 mm',
        'icon': Icons.hardware,
        'desc': 'Pacote com 100 un: R\$ 14,79.',
        'source': 'Mercado Livre (Fev/2026)',
      },
      {
        'name': 'Cola branca PVA extra 75 g',
        'icon': Icons.opacity,
        'desc': 'Unidade: R\$ 16,50.',
        'source': 'Leroy Merlin (Fev/2026)',
      },
      {
        'name': 'Verniz marítimo brilhante 3,6 L',
        'icon': Icons.format_paint,
        'desc': 'Galão: R\$ 162,90.',
        'source': 'Telhanorte (Fev/2026)',
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Materiais')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Base de materiais (referência de mercado)',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Valores pesquisados em fevereiro de 2026 para compor orçamentos iniciais. Podem variar por cidade e fornecedor.',
            style: GoogleFonts.inter(color: AppTheme.onSurfaceDim, height: 1.5),
          ),
          const SizedBox(height: 20),
          ...materials.map((m) {
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.divider),
              ),
              child: Row(
                children: [
                  Icon(m['icon'] as IconData, color: AppTheme.accent, size: 30),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m['name'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          m['desc'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppTheme.onSurfaceDim,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          m['source'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.accent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.divider),
            ),
            child: Text(
              'No simulador de orçamento, a mão de obra está fixada em R\$ 200,00/h e o total inclui uma reserva técnica de 8% para ajustes de obra.',
              style: GoogleFonts.inter(
                color: AppTheme.onSurfaceDim,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
