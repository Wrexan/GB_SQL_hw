-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

-- Solution without join
SELECT name, ifnull((SELECT name FROM catalogs WHERE catalogs.id = products.catalog_id), 'Нет категории') category FROM products
-- Solution with join
SELECT products.name, ifnull(catalogs.name, 'Нет категории') from products LEFT JOIN catalogs ON products.catalog_id = catalogs.id
