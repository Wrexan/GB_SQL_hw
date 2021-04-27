-- 2. Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.

USE shop;

CREATE OR REPLACE VIEW prod_cat (nam, cat) AS
SELECT products.name nam, ifnull(catalogs.name, 'Нет категории') cat FROM products
JOIN catalogs ON products.catalog_id = catalogs.id;
