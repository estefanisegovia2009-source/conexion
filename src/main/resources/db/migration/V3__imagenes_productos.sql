-- V3__imagenes_productos.sql
-- Fotos ilustrativas externas; no son necesariamente las fotos exactas
-- de los productos vendidos por los comercios enlazados.

UPDATE productos
SET imagen = CASE nombre
    WHEN 'Bandeja Liam' THEN 'https://finesio.b-cdn.net/product-pim/4/a/e/6/4ae67c287d719a43fca1b2d719fa44f39835dff1_156392_narrow_arrange.jpg?class=public'
    WHEN 'Taza Paraíso' THEN 'https://images.unsplash.com/photo-1643946404043-178456b0e3f8?auto=format&fit=crop&w=800&q=80'
    WHEN 'Set x2 vasos vidrio rayado con puntos 250 ml' THEN 'https://www.webstaurantstore.com/images/products/extra_large/531008/1952746.jpg'
    WHEN 'Set x2 copas champagne rectas vidrio perlado' THEN 'https://images.unsplash.com/photo-1546567075-d7113bee3c4a?auto=format&fit=crop&w=800&q=80'
    WHEN 'Set botella y vaso' THEN 'https://media.fds.fi/product_image/2000/Kimura-glass_SKU12984_002.jpg'
    WHEN 'Copa Shine recta verde set x2' THEN 'https://images.unsplash.com/photo-1546567075-d7113bee3c4a?auto=format&fit=crop&w=800&q=80'
    WHEN 'Set sorbete acero plateado/dorado' THEN 'https://caliwoods.co.nz/cdn/shop/products/Mixed_-_out_of_box_5d3f1f73-6e0f-44fa-88a9-3bf8535993e6_2048x.jpeg?v=1579124942'
    WHEN 'Azucarera' THEN 'https://f.fcdn.app/imgs/0ed46e/www.garageimpo.com.uy/garauy/f5e3/original/catalogo/M0010_BL_1/800x800/azucarero-c-tapa-300ml-porcelana-blanco.jpg'
    WHEN 'Taza labrada' THEN 'https://maisonstoi.com/cdn/shop/files/Tassecoloree-Carre_532b39cb-bdca-40f1-9bee-2b10301c972a_1800x1800.png?v=1769207061'
    WHEN 'Bandeja SeaGrass chica' THEN 'https://d2xjmi1k71iy2m.cloudfront.net/dairyfarm/id/images/909/1390968_PE965631_S5.jpg'
    WHEN 'Lata Vintage Café' THEN 'https://purematcha.com.au/cdn/shop/products/airtight-coffee-canister-375g-matte-black-712814.jpg?v=1675922717'
    WHEN 'Vaso Burbuja 350 ml' THEN 'https://images.unsplash.com/photo-1660303438028-b59af33c618c?auto=format&fit=crop&w=800&q=80'
    WHEN 'Porta taza bambú' THEN 'https://www.bambooswitch.com/cdn/shop/products/bamboo-coffee-cup-holder-tree-174172.jpg?v=1689680491&width=1946'
    WHEN 'Vaso doble vidrio 200 ml' THEN 'https://www.webstaurantstore.com/images/products/extra_large/531008/1952746.jpg'
    WHEN 'Botella tornasolada ámbar 1 L' THEN 'https://s.lightorangebean.com/media/20251217052410/One-Habit-5.jpg'
    WHEN 'Botella de noche ámbar' THEN 'https://s.lightorangebean.com/media/20251217052410/One-Habit-5.jpg'
    WHEN 'Botella de noche transparente' THEN 'https://media.fds.fi/product_image/2000/Kimura-glass_SKU12984_002.jpg'
    WHEN 'Taza Nube 500 ml' THEN 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?auto=format&fit=crop&w=800&q=80'
    WHEN 'Vaso doble vidrio acanalado 450 cc' THEN 'https://images.unsplash.com/photo-1660303438028-b59af33c618c?auto=format&fit=crop&w=800&q=80'
    WHEN 'Vaso doble vidrio 250 cc' THEN 'https://www.webstaurantstore.com/images/products/extra_large/531008/1952746.jpg'
    WHEN 'Vaso doble vidrio 360 cc' THEN 'https://images.unsplash.com/photo-1660303438028-b59af33c618c?auto=format&fit=crop&w=800&q=80'
    WHEN 'Vasos vidrio rayas transparente x6' THEN 'https://seifuucreations.com.au/cdn/shop/files/DSC04274.jpg?crop=center&height=1200&v=1746599572&width=1200'
    WHEN 'Sorbete recto vidrio corazón x2' THEN 'https://glytter.eu/cdn/shop/files/DSC_3807_02.jpg?v=1725280733&width=3000'
    WHEN 'Sorbete vidrio ondas x4' THEN 'https://glytter.eu/cdn/shop/files/DSC_3807_02.jpg?v=1725280733&width=3000'
    WHEN 'Sorbete vidrio frutas x4' THEN 'https://www.centrakor.com/media/catalog/product/l/o/lot-de-4-pailles-verre-et-goupillon_615173_FRN01_WEB_1.jpg'
    WHEN 'Sorbete vidrio verano x4' THEN 'https://www.centrakor.com/media/catalog/product/l/o/lot-de-4-pailles-verre-et-goupillon_615173_FRN01_WEB_1.jpg'
    WHEN 'Sorbete vidrio colores x6' THEN 'https://glytter.eu/cdn/shop/files/DSC_3807_02.jpg?v=1725280733&width=3000'
    WHEN 'Sorbete vidrio limón x4' THEN 'https://www.centrakor.com/media/catalog/product/l/o/lot-de-4-pailles-verre-et-goupillon_615173_FRN01_WEB_1.jpg'
    WHEN 'Sorbete vidrio corazón colores x4' THEN 'https://glytter.eu/cdn/shop/files/DSC_3807_02.jpg?v=1725280733&width=3000'
    WHEN 'Sorbete recto vidrio bambú verde x4' THEN 'https://www.centrakor.com/media/catalog/product/l/o/lot-de-4-pailles-verre-et-goupillon_615173_FRN01_WEB_1.jpg'
    WHEN 'Sorbete recto vidrio colores x4' THEN 'https://caliwoods.co.nz/cdn/shop/products/Mixed_-_out_of_box_5d3f1f73-6e0f-44fa-88a9-3bf8535993e6_2048x.jpeg?v=1579124942'
    WHEN 'Sorbete recto vidrio arcoíris x4' THEN 'https://glytter.eu/cdn/shop/files/DSC_3807_02.jpg?v=1725280733&width=3000'
    WHEN 'Set cucharas Navidad x4' THEN 'https://images.unsplash.com/photo-1619367300942-634bf2339af6?auto=format&fit=crop&w=800&q=80'
    WHEN 'Set cucharas clásica x6' THEN 'https://chakmaksteel.com/cdn/shop/files/CHAKMAKPARKERCUTLERY.jpg?v=1706013143'
    WHEN 'Set cucharas Loto x6' THEN 'https://images.unsplash.com/photo-1619367300942-634bf2339af6?auto=format&fit=crop&w=800&q=80'
    WHEN 'Set cucharas Abeja x6' THEN 'https://chakmaksteel.com/cdn/shop/files/CHAKMAKPARKERCUTLERY.jpg?v=1706013143'
    WHEN 'Set cucharas Margaritas x6' THEN 'https://images.unsplash.com/photo-1619367300942-634bf2339af6?auto=format&fit=crop&w=800&q=80'
    WHEN 'Set cucharas Frutas x4' THEN 'https://chakmaksteel.com/cdn/shop/files/CHAKMAKPARKERCUTLERY.jpg?v=1706013143'
    WHEN 'Set cucharas Corazón x6' THEN 'https://images.unsplash.com/photo-1619367300942-634bf2339af6?auto=format&fit=crop&w=800&q=80'
    WHEN 'Vaso vidrio rayas chico x6' THEN 'https://seifuucreations.com.au/cdn/shop/files/DSC04274.jpg?crop=center&height=1200&v=1746599572&width=1200'
    WHEN 'Botella de vidrio Aqua' THEN 'https://s.lightorangebean.com/media/20251217052410/One-Habit-5.jpg'
    WHEN 'Botella vidrio Marino' THEN 'https://media.fds.fi/product_image/2000/Kimura-glass_SKU12984_002.jpg'
    WHEN 'Jarra cónica con 4 vasos' THEN 'https://images.unsplash.com/photo-1660303438028-b59af33c618c?auto=format&fit=crop&w=800&q=80'
    WHEN 'Taza y plato Corazón' THEN 'https://a-static.mlcdn.com.br/420x420/conjunto-4-xicaras-cafe-com-pires-e-acucareiro-bahamas-hauskraft/mallysstore/kitacro032ejgxc140/397fbdd8036397584986ad0326fc6d10.jpeg'
    WHEN 'Taza y plato Cookies' THEN 'https://a-static.mlcdn.com.br/420x420/conjunto-4-xicaras-cafe-com-pires-e-acucareiro-bahamas-hauskraft/mallysstore/kitacro032ejgxc140/397fbdd8036397584986ad0326fc6d10.jpeg'
    WHEN 'Taza Tulipán Lavanda' THEN 'https://maisonstoi.com/cdn/shop/files/Tassecoloree-Carre_532b39cb-bdca-40f1-9bee-2b10301c972a_1800x1800.png?v=1769207061'
    WHEN 'Taza Corazones Rombo' THEN 'https://images.unsplash.com/photo-1643946404043-178456b0e3f8?auto=format&fit=crop&w=800&q=80'
    WHEN 'Taza asa corazón' THEN 'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?auto=format&fit=crop&w=800&q=80'
    WHEN 'Taza Flores' THEN 'https://maisonstoi.com/cdn/shop/files/Tassecoloree-Carre_532b39cb-bdca-40f1-9bee-2b10301c972a_1800x1800.png?v=1769207061'
    WHEN 'Taza Corazoncitos' THEN 'https://images.unsplash.com/photo-1643946404043-178456b0e3f8?auto=format&fit=crop&w=800&q=80'
    ELSE imagen
END
WHERE nombre IN (
    'Bandeja Liam', 'Taza Paraíso', 'Set x2 vasos vidrio rayado con puntos 250 ml',
    'Set x2 copas champagne rectas vidrio perlado', 'Set botella y vaso',
    'Copa Shine recta verde set x2', 'Set sorbete acero plateado/dorado', 'Azucarera',
    'Taza labrada', 'Bandeja SeaGrass chica', 'Lata Vintage Café', 'Vaso Burbuja 350 ml',
    'Porta taza bambú', 'Vaso doble vidrio 200 ml', 'Botella tornasolada ámbar 1 L',
    'Botella de noche ámbar', 'Botella de noche transparente', 'Taza Nube 500 ml',
    'Vaso doble vidrio acanalado 450 cc', 'Vaso doble vidrio 250 cc', 'Vaso doble vidrio 360 cc',
    'Vasos vidrio rayas transparente x6', 'Sorbete recto vidrio corazón x2',
    'Sorbete vidrio ondas x4', 'Sorbete vidrio frutas x4', 'Sorbete vidrio verano x4',
    'Sorbete vidrio colores x6', 'Sorbete vidrio limón x4', 'Sorbete vidrio corazón colores x4',
    'Sorbete recto vidrio bambú verde x4', 'Sorbete recto vidrio colores x4',
    'Sorbete recto vidrio arcoíris x4', 'Set cucharas Navidad x4', 'Set cucharas clásica x6',
    'Set cucharas Loto x6', 'Set cucharas Abeja x6', 'Set cucharas Margaritas x6',
    'Set cucharas Frutas x4', 'Set cucharas Corazón x6', 'Vaso vidrio rayas chico x6',
    'Botella de vidrio Aqua', 'Botella vidrio Marino', 'Jarra cónica con 4 vasos',
    'Taza y plato Corazón', 'Taza y plato Cookies', 'Taza Tulipán Lavanda',
    'Taza Corazones Rombo', 'Taza asa corazón', 'Taza Flores', 'Taza Corazoncitos'
);