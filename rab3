describe('example shop app', () => {
    beforeEach(() => {
      cy.visit('https://www.saucedemo.com/')
    })


    it ('Авторизация на сайт',() =>{
        let userName = 'standard_user'
        let userPass = 'secret_sauce'
    
        cy.get('[data-test="username"]').type(`${userName}`)
        cy.get('[data-test="password"]').type(`${userPass}`)
        cy.get('[data-test="login-button"]').click()
    }
    it ('сортировка от дешового к дорогому',() =>{

        //авторизация на сайт
        let userName = 'standard_user'
        let userPass = 'secret_sauce'
    
        cy.get('[data-test="username"]').type(`${userName}`)
        cy.get('[data-test="password"]').type(`${userPass}`)
        cy.get('[data-test="login-button"]').click()

        cy.get('[data-test="product-sort-container"]').select('Price (low to high)')
        const funklowtohigh = (index = 0, priceBefore = 0) => {
            cy.get('[class="inventory_item_price"]').then(($items) => {
              if ($items.length > index) {
                cy.wrap($items.eq(index)).then(($item) => {
                  cy.wrap($item).invoke('text').then((priceText) => {
                    const price = parseFloat(priceText.replace(/[$,]/g, '').trim());
                    if (priceBefore === price || priceBefore < price) {
                        funklowtohigh(index + 1, price);
                    } else {
                      throw new Error(errorMessage);
                    }
                  });
                });
              }
            });
          };
          funklowtohigh();
        }
        it ('сортировка от дешового к дорогому',() =>{

            //авторизация на сайт
            let userName = 'standard_user'
            let userPass = 'secret_sauce'
    
            cy.get('[data-test="username"]').type(`${userName}`)
            cy.get('[data-test="password"]').type(`${userPass}`)
            cy.get('[data-test="login-button"]').click()

            cy.get('[data-test="product-sort-container"]').select('Price (high to low)')
            const funkhightolow = (index = 0, priceBefore = 10000) => {
              cy.get('[class="inventory_item_price"]').then(($items) => {
                if ($items.length > index) {
                  cy.wrap($items.eq(index)).then(($item) => {
                    cy.wrap($item).invoke('text').then((priceText) => {
                      const price = parseFloat(priceText.replace(/[$,]/g, '').trim());
                      if (priceBefore === price || priceBefore > price) {
                        funkhightolow(index + 1, price);
                      } else {
                        throw new Error(errorMessage);
                      }
                    });
                  });
                }
              });
            };
            funkhightolow();
            }
    })
    it ('Добовление в карзину и оформление заказа',() =>{

        //авторизация на сайт
        let userName = 'standard_user'
        let userPass = 'secret_sauce'
    
        cy.get('[data-test="username"]').type(`${userName}`)
        cy.get('[data-test="password"]').type(`${userPass}`)
        cy.get('[data-test="login-button"]').click()

        let test = 'test'
        let code = '123'
        
        cy.get('[data-test="add-to-cart-sauce-labs-backpack"]').click()
        cy.get('[data-test="add-to-cart-sauce-labs-bike-light"]').click()

        cy.get('[data-test="shopping-cart-link"]').click()
        
        cy.get('[data-test="checkout"]').click()

        cy.get('[data-test="firstName"]').type(`${test}`)
        cy.get('[data-test="lastName"]').type(`${test}`)
        cy.get('[data-test="postalCode"]').type(`${code}`)

        cy.get('[data-test="continue"]').click()

        cy.get('[data-test="finish"]').click()
        
        cy.get('[data-test="back-to-products"]').click() 

    })
})
