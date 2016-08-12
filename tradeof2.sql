-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 12 2016 г., 00:12
-- Версия сервера: 5.7.13
-- Версия PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tradeof2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `hTitle` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(200) NOT NULL,
  `img` varchar(300) DEFAULT NULL,
  `create_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `hTitle`, `description`, `content`, `url`, `img`, `create_at`) VALUES
(11, 'Фильтры и фильтрующие элементы для очистки воды', 'Фильтры и фильтрующие элементы для очистки воды', 'Производство и продажа качественных и надежных фильтрующих элементов для очистки воды – это одно из приоритетных направлений деятельности группы компаний ООО «Тех ОФ» - ООО «Трейд ОФ». Мы предлагаем широкий спектр фильтроэлементов...', 'Фильтры и фильтрующие элементы для очистки воды\r\nПроизводство и продажа качественных и надежных фильтрующих элементов для очистки воды – это одно из приоритетных направлений деятельности группы компаний ООО «Тех ОФ» - ООО «Трейд ОФ». Мы предлагаем широкий спектр фильтроэлементов, среди которых представлены стандартные фильтрационные картриджи(патроны), а также карманные (мешочные) фильтры.\r\nПроизводство фильтрующих элементов: виды и особенности\r\nСистемы очистки воды способны эффективно очищать и обеззараживать воду, а также удалять различные примеси, опасные для здоровья и бытовой техники. \r\nСамым популярным решением для очистки являются картриджные фильтры, среди которых выделяют модели из пористого волокнистого полипропилена изготовленного способом раздува из расплава полипропилена (технология «melt blown»), гофрированные и намотанные структурированного волокна.\r\nПо способу удержания частиц картриджные фильтроэлементы подразделяются на следующие виды: \r\n•	глубинные – имеют пористую структуру, состоящую из волокнистых слоев, на которых адсорбируются частицы;\r\n•	сетчатые – выполнены на основе полимерной сетки или сетки из нержавеющей стали;\r\n•	ионообменные – выполняют функцию смягчения воды за счет удаления из воды ионов магния и кальция и замены их на ионы натрия;\r\n•	сорбционные – на основе сорбентов, которые обеззараживает воду и избавляет ее от постороннего запаха и привкуса.\r\n•	Пленочные микропористые – задерживают примеси и частицы в глубине тонкого фильтрующего слоя;\r\n•	мембранные нано-, ультра- и микрофильтрационные – используют экранный механизм фильтрации и удерживают частицы загрязнений на поверхности мембраны, пропуская воду через специальную мембрану под давлением;\r\n•	мембранные обратноосмотические – используют механизм обратного осмоса, пропуская воду через под давлением и удерживая соли и высокомолекулярные соединения.\r\nВ нашем ассортименте представлены модели фильтрующих элементов для поверхностной и глубинной очистки, а также специальные гофрированные картриджи, которые сочетают в себе обе функции. Технология гофрирования позволяет увеличить фильтрующую поверхность, тем самым повышая производительность фильтра и эффективность очистки. \r\nНаши преимущества\r\nНаша компания ООО «Тех ОФ» – производитель фильтрующих элементов, поэтому мы предлагаем своим клиентам самые доступные цены без посреднических наценок.\r\nВ нашем ассортименте представлены мембранные, пленочные и глубинные фильтроэлементы различной высоты и рейтинга фильтрации. Все изделия соответствуют техническим, токсикологическим и медицинским требованиям, что подтверждено соответствующими сертификатами.\r\nУспешная деятельность группы компаний ООО «Тех ОФ» - ООО «Трейд ОФ» основана на следующих факторах:\r\n•	штат опытных профессионалов;\r\n•	высокотехнологичная производственная база;\r\n•	создание качественных, долговечных и эффективных продуктов;\r\n•	формирование гибкой ценовой политики для наших клиентов.\r\n\r\n\r\n\r\n', 'filtri', 'articles.jpg', 111);

-- --------------------------------------------------------

--
-- Структура таблицы `catalog_categories`
--

CREATE TABLE IF NOT EXISTS `catalog_categories` (
  `id` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `img` text,
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `catalog_categories`
--

INSERT INTO `catalog_categories` (`id`, `id_parent`, `name`, `img`, `url`) VALUES
(1, 0, 'Фильтроэлементы', 'filtroelementy.jpg', 'filtroelementy'),
(2, 1, 'Собственное производство', 'tradeof.png', 'sobstvennoye-proizvodstvo'),
(3, 1, 'Аналоги', 'analogi.jpg', 'analogi'),
(4, 0, 'Фильтрационные установки', 'filtratsionnnyye-ustanovki.jpg', 'filtratsionnnyye-ustanovki'),
(5, 0, 'Фильтродержатели', 'filtroderzhateli.png', 'filtroderzhateli'),
(6, 0, 'Дополнительное оборудование', 'dopolnitelnoe-oborudovanie.png', 'dopolnitelnoye-oborudovaniye'),
(8, 6, 'Фитинг', 'fiting.jpg', 'fiting'),
(12, 6, 'Насосы', 'nasosi.jpg', 'nasosi'),
(14, 6, 'Адаптеры', 'adapteri.jpg', 'adapteri'),
(15, 5, 'Для воды', 'for_water.jpg', 'dlya-vodi'),
(16, 5, 'Для газа', 'for_gas.jpg', 'dlya-gasa');

-- --------------------------------------------------------

--
-- Структура таблицы `catalog_products`
--

CREATE TABLE IF NOT EXISTS `catalog_products` (
  `id` int(11) NOT NULL,
  `id_categories` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` text,
  `text` text,
  `url` varchar(300) NOT NULL,
  `img` varchar(400) DEFAULT NULL,
  `coast` double NOT NULL,
  `sale` int(11) NOT NULL DEFAULT '0',
  `created_at` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `catalog_products`
--

INSERT INTO `catalog_products` (`id`, `id_categories`, `name`, `description`, `text`, `url`, `img`, `coast`, `sale`, `created_at`) VALUES
(1, 2, ' картридж серии FC MBP', 'картридж глубинного типа из полипропилена. картридж глубинного типа из полипропилена.', NULL, 'filter-serii-fc-mbp', '1.jpg', 4000, 0, '1470916228'),
(2, 2, ' Фильтрующий картридж серии FC PPP', 'Гофрированная пористая пленка в полипропиленовом', NULL, 'filter-serii-fc-ppp', '1.jpg', 2950, 25, '1470916228'),
(3, 2, 'Фильтрующий картридж серии FC PGF', 'гофрированной пористой пленкой из стекловолокна.', NULL, 'filter-serii-fc-pgf', '1.jpg', 3500, 0, '1470916228'),
(4, 2, 'Фильтрующий картридж серии FC PFE', 'гидрофобной мембранной из политетрафторэтилена.', '<div class="production-texttitle">Серия FC PFE:</div>\n\n                        <p>Фильтрующий картридж c гидрофобной мембранной из политетрафторэтилена. Мембранный фильтроэлемент FC PFE имеет уникальную гидрофобность фильтровального материала. Картридж обладает высокой термохимической стойкостью фильтровального материала и фильтрующего элемента. Высокая механическая прочность фильтровального материала, не зависящая от выдержки в любом растворителе. Высокая химическая совместимость.</p>\n\n                        <div class="production-texttitle">Фильтровальный материал:</div>\n\n                        <p>Гидрофобная высокоселективная мембрана из политетрафторэтилена</p>\n\n                        <div class="production-texttitle">Применение:</div>\n\n                        <p>В биофармацевтической отрасли: Стерилизующая очистка сжатого воздуха, азота и других технол-ких газов,\n\nдыхательные фильтры для емкостей, задержание и возврат водных аэрозолей, содержащих субкультуры из воздуха ферментеров и реакторов\n\nВ пищевой промышленности: тонкая и стерилизующая очистка CO2, сжатого воздуха, техно-ого пара, \n\nиспользуемого для обработки оборудования, дыхательные фильтры для емкостей, в спиртовом про-ве - очистка отходящего воздуха из ферментеров В электро-, радио- и химической промышленности: очистка газообразных высоко агрессивных сред\n\nпри нормальной и повышенной температуре, удержание жидких аэрозолей, очистка компрессорного воздуха.\n\n</p>', 'filter-serii-fc-pfe', '1.jpg,2.jpg,3.jpg', 1500, 0, '1470916228'),
(7, 2, 'Фильтрующий картридж серии FC PES', 'гидрофильной мембраной из полиэфирсульфона.', NULL, 'filter-serii-fc-pes', '1.jpg', 5666, 0, '1470916228'),
(8, 2, 'Фильтрующий картридж серии FC CELL', 'Пластины из целлюлозы. (полный аналог', NULL, 'filter-serii-fc-cell', '1.jpg', 1111, 0, '1470916228'),
(12, 4, 'asdas', 'dasdasdas', 'asdasd', 'yyttre', '1.jpg,2.jpg,3.jpg', 12262, 0, '1470916228');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'login', 'Login privileges, granted after account confirmation'),
(2, 'admin', 'Administrative user, has access to everything.');

-- --------------------------------------------------------

--
-- Структура таблицы `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(18, 1),
(18, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `static_pages`
--

CREATE TABLE IF NOT EXISTS `static_pages` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` varchar(350) NOT NULL,
  `hTitle` varchar(300) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `static_pages`
--

INSERT INTO `static_pages` (`id`, `title`, `description`, `hTitle`, `content`, `url`) VALUES
(1, 'О НАС', 'О НАС', 'О НАС', '                            <section class="about">\n            <div class="about__wrapper">\n                <div class="about__title">\n                    <h2>о нас</h2>\n                </div>\n<div class="about__title-description">\n	<p>\n		ООО «Трейд ОФ» - Российский производитель современных, качественных фильтроэлементов, фильтродержателей и фильтрационных установок, для решения различных задач фильтрации и микрофильтрации.\n	</p>\n</div>\n<div class="about__text">\n	<p>\n		Беспрецедентное качество, не уступает зарубежными производителями. Так же в линейке товаров присутствуют ПОЛНЫЕ аналоги таких зарубежных фирм как: PALL, Sartorious, Millipore и множество других фирм. Наша компания гарантирует Вам качество и соответствие всем техническим требованиям нашего продукта. Товар сертифицирован. Любой, правильно подобранный фильтроэлемент, фильтродержатель или фильтрационная установка решит вашу задачу на 110%. Более 100 компаний партнеров, которые возложили на нас решение своих фильтрационных задач, остались довольны нашими товарами и услугами и стали постоянными клиентами. Дорожа своей репутацией ООО «Трейд ОФ» точно выполняет обязательства перед клиентами.\n	</p>\n	<p>\n		Зачем переплачивать, если можно экономить до 40% Вашего бюджета с нами, получая фильтроэлементы, фильтродержатели, фильтрационные установки и комплектующие отличного качества, для решения Ваших фильтрационных задач?\n	</p>\n	<p>\n		ООО «Трейд ОФ» и производственно-инжиниринговая компания ООО «Тех ОФ» - молодые компании, основанные в 2015 году, но не смотря на юный возраст, наши знания и производство основываются на опыте известного российского производителя фильтрационного оборудования ООО «Экспресс-Эко», основанного в 1991 года. Основатели компании - соавторы уникальных разработок в технологии производства фильтрующих элементов и фильтрационного оборудования.\n	</p>\n	<p>\n		Наша продукция применяется в различных отраслях промышленности:<br>\n		В фармацевтической промышленности;<br>\n		В пищевой промышленности;<br>\n		В нефтегазовой промышленности;<br>\n		В химической промышленности и машиностроении;<br>\n		В парфюмерно-косметической промышленности;<br>\n		В микроэлектронике.\n	</p>\n	<p>\n		Линейка нашей продукции включает в себя множество типов фильтроэлементов, решающие различные задачи фильтрации и микрофильтрации.\n	</p>\n</div></div></section>', 'o-nas'),
(2, 'Доставка и оплата', 'Доставка и оплата', 'Доставка и оплата', 'Ljcnfd', 'dostavka-i-oplata'),
(3, 'Сертификаты', 'Сертификаты', 'Сертификаты', '            <section class="certificate">\n                <div class="certificate__title">\n                    <h2>Сертификаты</h2>\n                </div>\n                <div class="certificate__text">\n                    <p>\n                        Наша продукция прошла строгую сертификацию.\n                    </p>\n                </div>\n <div class="certificate__item">\n                    <a rel="cerImg" href="/public/img/app/certificate_img/certificate-img-1-big.jpg"><img rel="cer" src="/public/img/app/certificate_img/certificate-img-1.jpg" class="cer_img" alt="#" /></a>                    <div class="certificate__item-text">\n                        <p>\n                            Сертификат соответствия № 0776940\n                        </p>\n                    </div>\n                </div>\n                <div class="certificate__item">\n                    <a rel="cerImg" href="/public/img/app/certificate_img/certificate-img-2-big.jpg"><img src="/public/img/app/certificate_img/certificate-img-2.jpg" class="cer_img" alt="Сертификат ООО &quot;Трейд ОФ&quot; #1" /></a>                    <div class="certificate__item-text">\n                        <p>\n                            Приложение № 01\n                        </p>\n                    </div>\n                </div>\n                <div class="certificate__item">\n                    <a rel="cerImg" href="/public/img/app/certificate_img/certificate-img-3-big.jpg"><img src="/public/img/app/certificate_img/certificate-img-3.jpg" class="cer_img" alt="Сертификат ООО &quot;Трейд ОФ&quot; #2" /></a>                    <div class="certificate__item-text">\n                        <p>\n                            Приложение № 02\n                        </p>\n                    </div>\n                </div>\n                <div class="certificate__item">\n                    <a rel="cerImg" href="/public/img/app/certificate_img/certificate-img-4-big.jpg"><img src="/public/img/app/certificate_img/certificate-img-4.jpg" class="cer_img" alt="Сертификат ООО &quot;Трейд ОФ&quot; #3" /></a>                    <div class="certificate__item-text">\n                        <p>\n                            Приложение № 03\n                        </p>\n                    </div>\n                </div>\n                <div class="certificate__item">\n                    <a rel="cerImg" href="/public/img/app/certificate_img/certificate-img-5-big.jpg"><img src="/public/img/app/certificate_img/certificate-img-5.jpg" class="cer_img" alt="Сертификат ООО &quot;Трейд ОФ&quot; #4" /></a>                    <div class="certificate__item-text">\n                        <p>\n                            Приложение № 04\n                        </p>\n                    </div>\n                </div>\n            </section>\n        </div>', 'certificate'),
(4, 'Контакты', 'Контакты', 'Контакты', 'contact Контакты', 'contact');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`) VALUES
(18, 'hitlowww@gmail.com', 'hitlow', '85df1e8be2cc1472ea3369ac21c2c056', 33, 1470317304);

-- --------------------------------------------------------

--
-- Структура таблицы `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `user_agent`, `token`, `created`, `expires`) VALUES
(1, 18, '9145c2ef5a5f8615696b28a66a4bf138917064fa', 'de752a712260ac425194358deae291e8a70fb2b3', 1467638787, 1468848387);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalog_categories`
--
ALTER TABLE `catalog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalog_products`
--
ALTER TABLE `catalog_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categories` (`id_categories`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_name` (`name`);

--
-- Индексы таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `fk_role_id` (`role_id`);

--
-- Индексы таблицы `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_username` (`username`),
  ADD UNIQUE KEY `uniq_email` (`email`);

--
-- Индексы таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_token` (`token`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `expires` (`expires`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `catalog_categories`
--
ALTER TABLE `catalog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `catalog_products`
--
ALTER TABLE `catalog_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `catalog_products`
--
ALTER TABLE `catalog_products`
  ADD CONSTRAINT `catalog_products_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `catalog_categories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
