import '../models/piece.dart';

const List<Piece> pieces = [
  Piece(
    id: '1',
    title: 'Sofá Velvet Noir',
    description:
        'Sofá de três lugares revestido em veludo premium italiano com base em latão escovado. Conforto excepcional aliado a um design contemporâneo atemporal.',
    category: 'Sofás',
    imagePath: 'assets/images/image1.png',
    dimensions: '240 x 100 x 85 cm',
    price: 12500.00,
    tags: ['luxo', 'veludo', 'sala de estar'],
  ),
  Piece(
    id: '2',
    title: 'Poltrona Origem',
    description:
        'Ícone do design brasileiro, esta poltrona utiliza madeira maciça de manejo sustentável e couro legítimo envelhecido artesanalmente.',
    category: 'Poltronas',
    imagePath: 'assets/images/image2.png',
    dimensions: '85 x 90 x 80 cm',
    price: 4800.00,
    tags: ['design', 'couro', 'conforto'],
  ),
  Piece(
    id: '3',
    title: 'Mesa de Jantar Ápice',
    description:
        'Mesa esculpida em mármore Carrara com estrutura interna de aço. Uma peça central que redefine o ambiente de jantar com sofisticação.',
    category: 'Mesas',
    imagePath: 'assets/images/image3.png',
    dimensions: '200 x 110 x 75 cm',
    price: 18900.00,
    tags: ['mármore', 'jantar', 'exclusivo'],
  ),
  Piece(
    id: '4',
    title: 'Luminária Eclipse',
    description:
        'Luminária de chão com design minimalista. Proporciona iluminação indireta suave, ideal para criar atmosferas acolhedoras.',
    category: 'Iluminação',
    imagePath: 'assets/images/image4.png',
    dimensions: '180 cm altura',
    price: 3200.00,
    tags: ['minimalista', 'preto fosco', 'quarto'],
  ),
  Piece(
    id: '5',
    title: 'Aparador Horizonte',
    description:
        'Aparador em laca alto brilho com detalhes em nogueira. Linhas horizontais que trazem leveza e fluidez ao corredor ou sala de estar.',
    category: 'Complementos',
    imagePath: 'assets/images/image5.png',
    dimensions: '160 x 45 x 75 cm',
    price: 6500.00,
    tags: ['moderno', 'laca', 'organização'],
  ),
];

List<String> get allCategories {
  final cats = pieces.map((p) => p.category).toSet().toList();
  cats.sort();
  return cats;
}
