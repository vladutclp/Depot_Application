import React from 'react'

class CashPayType extends React.Component{
	render(){
		return(
			<div>
				<div className="field">
					<label htmlFor="order_cash_adr_recipe">Recipe adress</label>
					<input type="text" id="order_cash_adr_recipe" name="order[cash_adr_recipe]" />
				</div>

				<div className="field">
					<label htmlFor="order_cash_currency">Currency</label>
					<select id="order_cash_currency" name="order[cash_currency]">
						<option value="">Select the currency you wish to use</option>
						<option value="Euro">Euro</option>
						<option value="Dollar">USD</option>
						<option value="Pounds">GBP</option>
					</select>
				</div>
				
			</div>
		);
	}

}

export default CashPayType