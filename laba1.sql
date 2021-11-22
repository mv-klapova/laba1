
-- Структура таблицы `Адрес`
CREATE TABLE `Адрес` (
  `ID` int(5) NOT NULL,
  `Улица` varchar(100) NOT NULL,
  `Дом` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Структура таблицы `Вид услуг`
CREATE TABLE `Вид услуг` (
  `ID` int(5) NOT NULL,
  `Наименование` varchar(30) NOT NULL,
  `Единица измерения` varchar(10) NOT NULL,
  `Цена за 1 ед` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Структура таблицы `Владельцы`
CREATE TABLE `Владельцы` (
  `ID` int(5) NOT NULL,
  `ФИО` varchar(255) NOT NULL,
  `Адрес` int(150) NOT NULL,
  `Телефон` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Структура таблицы `Журнал регистрации`
CREATE TABLE `Журнал регистрации` (
  `ID` int(5) NOT NULL,
  `Вид услуги` int(30) NOT NULL,
  `Владелец` int(100) NOT NULL,
  `Статус` varchar(10) NOT NULL,
  `Сотрудник` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Структура таблицы `Сотрудники`
CREATE TABLE `Сотрудники` (
  `ID` int(5) NOT NULL,
  `ФИО` varchar(100) NOT NULL,
  `Должность` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Индексы таблицы `Адрес`
ALTER TABLE `Адрес`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);
-- Индексы таблицы `Вид услуг`
ALTER TABLE `Вид услуг`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);
-- Индексы таблицы `Владельцы`
ALTER TABLE `Владельцы`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Адрес` (`Адрес`),
  ADD KEY `ID` (`ID`);
-- Индексы таблицы `Журнал регистрации`
ALTER TABLE `Журнал регистрации`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Вид услуги` (`Вид услуги`),
  ADD KEY `Владелец` (`Владелец`),
  ADD KEY `Сотрудник` (`Сотрудник`);
-- Индексы таблицы `Сотрудники`
ALTER TABLE `Сотрудники`
  ADD PRIMARY KEY (`ID`);

-- AUTO_INCREMENT для таблицы `Адрес`
ALTER TABLE `Адрес`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;
-- AUTO_INCREMENT для таблицы `Вид услуг`
ALTER TABLE `Вид услуг`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;
-- AUTO_INCREMENT для таблицы `Владельцы`
ALTER TABLE `Владельцы`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;
-- AUTO_INCREMENT для таблицы `Журнал регистрации`
ALTER TABLE `Журнал регистрации`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;
-- AUTO_INCREMENT для таблицы `Сотрудники`
ALTER TABLE `Сотрудники`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT;

-- Ограничения внешнего ключа таблицы `Владельцы`
ALTER TABLE `Владельцы`
  ADD CONSTRAINT `Владельцы_ibfk_1` FOREIGN KEY (`Адрес`) REFERENCES `Адрес` (`ID`);
-- Ограничения внешнего ключа таблицы `Журнал регистрации`
ALTER TABLE `Журнал регистрации`
  ADD CONSTRAINT `Журнал регистрации_ibfk_1` FOREIGN KEY (`Сотрудник`) REFERENCES `Сотрудники` (`ID`),
  ADD CONSTRAINT `Журнал регистрации_ibfk_2` FOREIGN KEY (`Владелец`) REFERENCES `Владельцы` (`ID`),
  ADD CONSTRAINT `Журнал регистрации_ibfk_3` FOREIGN KEY (`Вид услуги`) REFERENCES `Вид услуг` (`ID`);
COMMIT;


