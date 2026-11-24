import '../models/product_model.dart';

const List<Product> products = [
  Product(
    id: 1,
    name: 'Birthday Decoration Kit',
    category: 'Decoration',
    image: 'https://images.unsplash.com/photo-1530103862676-de8c9debad1d?w=500',
    price: 499,
    oldPrice: 699,
  ),
  Product(
    id: 2,
    name: 'Golden Birthday Balloons',
    category: 'Balloons',
    image: 'https://images.unsplash.com/photo-1504196606672-aef5c9cefc92?w=500',
    price: 199,
    oldPrice: 299,
  ),
  Product(
    id: 3,
    name: 'Birthday Party Caps',
    category: 'Accessories',
    image: 'https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?w=500',
    price: 149,
    oldPrice: 199,
  ),
  Product(
    id: 4,
    name: 'Party Decoration Set',
    category: 'Decoration',
    image: 'https://images.unsplash.com/photo-1464349153735-7db50ed83c84?w=500',
    price: 799,
    oldPrice: 999,
  ),
  Product(
    id: 5,
    name: 'Birthday Gift Box',
    category: 'Gifts',
    image: 'https://images.unsplash.com/photo-1513201099705-a9746e1e201f?w=500',
    price: 599,
    oldPrice: 799,
  ),
  Product(
    id: 6,
    name: 'Party Candles',
    category: 'Candles',
    image: 'https://images.unsplash.com/photo-1602631985686-1bb0e6a8696e?w=500',
    price: 99,
    oldPrice: 149,
  ),
];

const List<Map<String, String>> categories = [
  {'name': 'Balloons', 'emoji': '🎈'},
  {'name': 'Decoration', 'emoji': '🎊'},
  {'name': 'Gifts', 'emoji': '🎁'},
  {'name': 'Candles', 'emoji': '🕯️'},
  {'name': 'Accessories', 'emoji': '🥳'},
  {'name': 'Anniversary', 'emoji': '💝'},
];
