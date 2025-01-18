
describe('test_risa', () => {
  beforeEach(() => {
    cy.visit('https://shop.mirlachev.ru//')
    cy.viewport(1280,720)
  })
  it ('тест поисковой системы',()=>{

    let test = 'стол'
      cy.get('[class="search_but"]').click({ multiple: true })
      cy.get('[name="search"]').type(`${test}`)
      cy.get('[data-class="searchbut"]').click({ multiple: true })
      cy.get('[class="articleslist_item"]').find('a').should('have.attr', 'href').and('include', 'stol')
  })
  it ('Проверка возможности заказа',()=>{

    let name = 'ваня'
    let phone = '9999999999'
    let email = 'qwe@gmail.com'
    let adress = 'Москва'
    let comment = 'Тест'

    cy.get('[href="/catalog/item/2491/divan_italmas_1400"]').click({ multiple: true })
    cy.get('[class="item-amount--plus"]').click()
    cy.get('[id="collection-buy"]').click({ multiple: true })
    cy.get('[id="cart-amount"]').should('have.text','2')
    cy.get('[class="article_buy_but"]').click()
    cy.get('[data-hash="so__tA8pj2HIbopLUtc"]').type(`${name}`)
    cy.get('[data-hash="so__6s3CsiFTMpDKAaY"]').type(`${phone}`)
    cy.get('[data-hash="so__BWSXuJ8hUT1ajKd"]').type(`${email}`)
    cy.get('[data-hash="so__Fq1eLHZQQbtxfCh"]').type(`${adress}`)
    cy.get('[data-hash="so__ycUygIPmSeajHZM"]').type(`${comment}`)
    cy.get('[data-hash="so__fBbIqQ1ceichwo3"]').click()
    cy.get('[data-hash="so__VYABxTT6UY1GRDo"]').click()
    cy.get('[data-hash="so__uwpYoaQOjdFgyRJ"]').find('h1').should('have.text','СПАСИБО ЗА ЗАКАЗ!')
  })
  it ('проверка котегории - диваны',()=>{
    cy.get('[src="/images/catalog/flTNfGcU97gVaLJrkrXW.svg"]').click()
    cy.get('[src="/images/catalog/zNO50ohKyk5RqyqcMWEG.svg"]').click()
    cy.get('[class="articleslist_item"]').find('a').should('have.attr', 'href').and('include', 'divan')
  })
  it ('проверка вкладки контакты',()=>{
    cy.get('[href="/content/contacts"]').click({ multiple: true })
    cy.get('[href="https://mirlachev.ru/kontaktyi/"]').should('have.text','посмотреть для своего города')
    cy.get('[href="tel:+73412913016"').should('have.text','(3412) 913-016')
    cy.get('[href="tel:+73412913034"').should('have.text','(3412) 913-034')
    cy.get('[data-hash="so__TorOiX2WDDL8Thu"').find('a').should('have.attr', 'href').and('include', 'www.instagram.com/mirlachev/')
    cy.get('[data-hash="so__2AOR1DUUYZsOprL"').find('a').should('have.attr', 'href').and('include', 'www.facebook.com/fabrikamirlacheva')
    cy.get('[data-hash="so__IfkSOyXCcxjh6GB"').find('a').should('have.attr', 'href').and('include', 'https://vk.com/mirlachev')
  })
  it('Проверка подвала(наличее текста и ссылок)',()=>{
    cy.get('[data-hash="so__YNR5Ngeqv4cZlQg"').should('have.text', '\n\nФабрика Мирлачева\nБольшой выбор диванов, кроватей и спальных гарнитуров, мебель для детской и аксессуары для дома.\n ')
    cy.get('[data-hash="so__80VtxDkO2fUyY24"').find('a').should('have.attr', 'href').and('include', 'www.instagram.com/mirlachev/')
    cy.get('[data-hash="so__oHnf2f7SfszphHf"').find('a').should('have.attr', 'href').and('include', 'www.facebook.com/fabrikamirlacheva')
    cy.get('[data-hash="so__Vyz3yLDYhZewOwg"').find('a').should('have.attr', 'href').and('include', 'https://vk.com/mirlachev')
    cy.get('[class="smart-object--menu__item "').find('a').should('have.attr', 'href')
  })
})
