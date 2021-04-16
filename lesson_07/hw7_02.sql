-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT name, ifnull((SELECT name FROM catalogs WHERE catalogs.id = products.catalog_id), 'Нет категории') category FROM products




