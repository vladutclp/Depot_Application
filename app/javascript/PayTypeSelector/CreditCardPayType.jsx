import React from 'react'

class CreditCardPayType extends React.Component{
	render(){
		return(
			<div>
				<div className="field">
					<label htmlFor="order_credit_card_number">CC #</label>
					<input type="password" name="order[credit_card_number]" id="order_credit_card_number" />
				</div>

				<div className="field">
					<label htmlFor="order_credit_card_ccv">CCV <i>(The number on the back of your card)</i></label>
					<input type="text" name="order[credit_card_ccv]" id="order_credit_card_ccv" 
					placeholder="e.g 888"
					/>
				</div>

				<div className="field">
					<label htmlFor="order_expiration_date">Expiry</label>
					<input type="text" name="order[expiration_date]" id="order_expiration_date" 
								 size="9" placeholder="e.g. 03/19"/>
					
				</div>
			</div>
		);
	}
}

export default CreditCardPayType