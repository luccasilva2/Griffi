import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  static const double _laborRatePerHour = 200.0;
  static const String _whatsAppPhone = '5547984873740';

  final _formKey = GlobalKey<FormState>();
  final _widthController = TextEditingController(text: '180');
  final _heightController = TextEditingController(text: '220');
  final _depthController = TextEditingController(text: '55');
  int _doors = 4;
  int _drawers = 3;
  bool _useCompensadoNaval = false;

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    _depthController.dispose();
    super.dispose();
  }

  double _readPositive(TextEditingController controller) {
    final value = double.tryParse(controller.text.replaceAll(',', '.')) ?? 0;
    return value < 0 ? 0 : value;
  }

  double get _widthCm => _readPositive(_widthController);
  double get _heightCm => _readPositive(_heightController);
  double get _depthCm => _readPositive(_depthController);

  double get _externalAreaM2 {
    final w = _widthCm / 100;
    final h = _heightCm / 100;
    final d = _depthCm / 100;
    return (2 * (w * h + w * d + h * d));
  }

  double get _materialBoardRatePerM2 => _useCompensadoNaval ? 81.40 : 39.30;

  double get _boardCost => _externalAreaM2 * _materialBoardRatePerM2;

  double get _hardwareCost {
    final hinges = _doors * 3.30;
    final rails = _drawers * 49.22;
    final parafusos = (_doors + _drawers) * 4.00;
    return hinges + rails + parafusos;
  }

  double get _finishingCost {
    final vernizPorM2 = 6.50;
    final colaFixa = 16.50;
    return (_externalAreaM2 * vernizPorM2) + colaFixa;
  }

  double get _materialsTotal => _boardCost + _hardwareCost + _finishingCost;

  double get _estimatedHours {
    final base = 4.0;
    final corteMontagem = _externalAreaM2 * 1.8;
    final portas = _doors * 0.5;
    final gavetas = _drawers * 0.8;
    final acabamento = _externalAreaM2 * 0.5;
    return base + corteMontagem + portas + gavetas + acabamento;
  }

  double get _laborTotal => _estimatedHours * _laborRatePerHour;

  double get _contingency => (_materialsTotal + _laborTotal) * 0.08;

  double get _quoteTotal => _materialsTotal + _laborTotal + _contingency;

  Future<void> _openWhatsApp() async {
    if (!_formKey.currentState!.validate()) return;

    final message =
        'Olá! Gostaria de um orçamento.\n'
        'Medidas: ${_widthCm.toStringAsFixed(0)}x${_heightCm.toStringAsFixed(0)}x${_depthCm.toStringAsFixed(0)} cm\n'
        'Portas: $_doors | Gavetas: $_drawers\n'
        'Material: ${_useCompensadoNaval ? 'Compensado naval 15mm' : 'MDF cru 15mm'}\n'
        'Valor estimado no app: R\$ ${_quoteTotal.toStringAsFixed(2)}';
    final webUri = Uri.https('wa.me', '/$_whatsAppPhone', {'text': message});
    final appUri = Uri.parse(
      'whatsapp://send?phone=$_whatsAppPhone&text=${Uri.encodeComponent(message)}',
    );

    if (kIsWeb) {
      await launchUrl(webUri, mode: LaunchMode.platformDefault);
      return;
    }

    final openedInApp = await launchUrl(
      appUri,
      mode: LaunchMode.externalApplication,
    );
    if (openedInApp) return;

    if (!await launchUrl(webUri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível abrir o WhatsApp no dispositivo.'),
        ),
      );
    }
  }

  Widget _metricField({
    required String label,
    required TextEditingController controller,
  }) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: AppTheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: GoogleFonts.inter(color: AppTheme.onSurface),
        validator: (value) {
          final parsed = double.tryParse((value ?? '').replaceAll(',', '.'));
          if (parsed == null || parsed <= 0) {
            return 'Inválido';
          }
          return null;
        },
        onChanged: (_) => setState(() {}),
      ),
    );
  }

  Widget _lineItem(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(color: AppTheme.onSurfaceDim),
            ),
          ),
          Text(
            'R\$ ${value.toStringAsFixed(2)}',
            style: GoogleFonts.inter(
              color: AppTheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text('Orçamento')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Orçamento com Medidas',
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Mão de obra fixada em R\$ 200,00 por hora.',
              style: GoogleFonts.inter(color: AppTheme.accent),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _metricField(
                  label: 'Largura (cm)',
                  controller: _widthController,
                ),
                const SizedBox(width: 12),
                _metricField(
                  label: 'Altura (cm)',
                  controller: _heightController,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _metricField(
                  label: 'Profundidade (cm)',
                  controller: _depthController,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              activeThumbColor: AppTheme.accent,
              activeTrackColor: AppTheme.accent.withValues(alpha: 0.35),
              title: Text(
                'Usar compensado naval 15mm',
                style: GoogleFonts.inter(color: AppTheme.onSurface),
              ),
              subtitle: Text(
                _useCompensadoNaval
                    ? 'Material premium (R\$ 81,40/m²)'
                    : 'MDF cru 15mm (R\$ 39,30/m²)',
                style: GoogleFonts.inter(color: AppTheme.onSurfaceDim),
              ),
              value: _useCompensadoNaval,
              onChanged: (v) => setState(() => _useCompensadoNaval = v),
            ),
            const SizedBox(height: 8),
            Text(
              'Portas: $_doors',
              style: GoogleFonts.inter(color: AppTheme.onSurface),
            ),
            Slider(
              value: _doors.toDouble(),
              min: 1,
              max: 8,
              divisions: 7,
              activeColor: AppTheme.accent,
              onChanged: (v) => setState(() => _doors = v.round()),
            ),
            Text(
              'Gavetas: $_drawers',
              style: GoogleFonts.inter(color: AppTheme.onSurface),
            ),
            Slider(
              value: _drawers.toDouble(),
              min: 0,
              max: 8,
              divisions: 8,
              activeColor: AppTheme.accent,
              onChanged: (v) => setState(() => _drawers = v.round()),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.divider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resumo técnico',
                    style: GoogleFonts.inter(
                      color: AppTheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Área externa estimada: ${_externalAreaM2.toStringAsFixed(2)} m²',
                    style: GoogleFonts.inter(color: AppTheme.onSurfaceDim),
                  ),
                  Text(
                    'Horas estimadas: ${_estimatedHours.toStringAsFixed(1)} h',
                    style: GoogleFonts.inter(color: AppTheme.onSurfaceDim),
                  ),
                  Text(
                    'Mão de obra: R\$ ${_laborRatePerHour.toStringAsFixed(2)}/h',
                    style: GoogleFonts.inter(color: AppTheme.onSurfaceDim),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.divider),
              ),
              child: Column(
                children: [
                  _lineItem(
                    'Materiais (chapas + ferragens + acabamento)',
                    _materialsTotal,
                  ),
                  _lineItem('Mão de obra', _laborTotal),
                  _lineItem('Reserva técnica (8%)', _contingency),
                  const Divider(color: AppTheme.divider),
                  _lineItem('TOTAL ESTIMADO', _quoteTotal),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Contato direto via WhatsApp: +55 47 984873740',
              style: GoogleFonts.inter(color: AppTheme.onSurfaceDim),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _openWhatsApp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accent,
                  foregroundColor: AppTheme.background,
                ),
                icon: const Icon(Icons.chat),
                label: const Text('FALAR NO WHATSAPP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
