describe('test_risa', () => {
  beforeEach(() => {
    cy.visit('https://shop.mirlachev.ru/')
  })
  it ('find',()=>{
      cy.get('[data-link="/catalog/part/14/korpusnaya_mebel"]').click({ multiple: true })
      cy.get('.articleslist_item a[href="/catalog/part/127/shkafi"]').click({ multiple: true , force: true})
      cy.get('[class="articleslist"]').each(($div) => {
        let testtext = 'Шкаф'
        cy.wrap($div).should('contain.text', testtext)
      })
  })
})
