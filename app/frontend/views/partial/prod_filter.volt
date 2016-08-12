				<form class="filter">
					<div class="production-prise">
                    	{{ productArray[0]['coast'] }} <span>руб.</span>
                    </div>
                    <div class="line"></div>
					<div class="filter__type">
						<span class="filter__type-title">Адаптер:</span>
						<label>
							<select name="type">
								<option value="1">P(222)</option>
								<option value="1">P(222)</option>
								<option value="1">P(222)</option>
							</select>
						</label>
					</div>
					<div class="filter__substance">
						<span class="filter__substance-title">Высота (дюймы):</span>
						<label>
							<select name="type">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</label>
					</div>
					<div class="filter__header">
						<span class="filter__header-title">Рейтинг фильтрации:</span>
						<label>
							<select name="type">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</label>
					</div>
                    <div class="production-quantity">
                    	<div class="quantity-text">Кол-во:</div>
                    	<div class="number">
                            <span class="minus">-</span>
                            <input type="text" value="1" size="5"/>
                            <span class="plus">+</span>
                        </div>
                    </div>
                    <div class="line"></div>
                    <a href="#" class="equipment__item-button production-button">
						<span class="equipment__item-button-text">Купить</span>
						<span class="equipment__item-button-icon"><i></i></span>
					</a>
                    <div class="production-note" style="text-align: center;">* Цена без учета НДС</div><br>
                    <div class="production-note" style="text-align: center;">* Под заказ, предоплата 50%</div>
				</form>