* See https://github.com/se38/abapFaker

********************************************************************************
* The MIT License (MIT)
*
* Copyright (c) 2018 abapFaker Contributors
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
********************************************************************************

CLASS zcl_faker_person_pt_br DEFINITION
  PUBLIC
  INHERITING FROM zcl_faker_person_default
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_faker TYPE REF TO zcl_faker.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_faker_person_pt_br IMPLEMENTATION.
  METHOD constructor.

    super->constructor( i_faker ).

    _first_names_male = VALUE #(
        ( |Alexandre| ) ( |André| ) ( |Anthony| ) ( |Antônio| ) ( |Arthur| ) ( |Augusto| )
        ( |Benjamin| ) ( |Benício| ) ( |Bernardo| ) ( |Breno| ) ( |Bruno| ) ( |Bryan| ) ( |Caio| )
        ( |Calebe| ) ( |Carlos Eduardo| ) ( |Cauã| ) ( |Cauê| ) ( |Daniel| ) ( |Danilo| )
        ( |Davi Lucas| ) ( |Davi Lucca| ) ( |Davi Luiz| ) ( |Davi| ) ( |Diego| ) ( |Diogo| )
        ( |Eduardo| ) ( |Emanuel| ) ( |Enrico| ) ( |Enzo Gabriel| ) ( |Enzo| ) ( |Erick| )
        ( |Felipe| ) ( |Fernando| ) ( |Francisco| ) ( |Gabriel| ) ( |Guilherme| )
        ( |Gustavo Henrique| ) ( |Gustavo| ) ( |Heitor| ) ( |Henrique| ) ( |Ian| ) ( |Igor| )
        ( |Isaac| ) ( |Joaquim| ) ( |João Felipe| ) ( |João Gabriel| ) ( |João Guilherme| )
        ( |João Lucas| ) ( |João Miguel| ) ( |João Pedro| ) ( |João Vitor| ) ( |João| )
        ( |Juan| ) ( |Kaique| ) ( |Kevin| ) ( |Leandro| ) ( |Leonardo| ) ( |Levi| ) ( |Lorenzo| )
        ( |Lucas Gabriel| ) ( |Lucas| ) ( |Lucca| ) ( |Luigi| ) ( |Luiz Felipe| )
        ( |Luiz Fernando| ) ( |Luiz Gustavo| ) ( |Luiz Henrique| ) ( |Luiz Miguel| )
        ( |Luiz Otávio| ) ( |Marcelo| ) ( |Marcos Vinicius| ) ( |Matheus| ) ( |Miguel| )
        ( |Murilo| ) ( |Nathan| ) ( |Nicolas| ) ( |Noah| ) ( |Otávio| ) ( |Paulo| )
        ( |Pedro Henrique| ) ( |Pedro Lucas| ) ( |Pedro Miguel| ) ( |Pedro| ) ( |Pietro| )
        ( |Rafael| ) ( |Raphael| ) ( |Raul| ) ( |Renan| ) ( |Rodrigo| ) ( |Ryan| ) ( |Samuel| ) ( |Thales| )
        ( |Theo| ) ( |Thiago| ) ( |Thomas| ) ( |Vicente| ) ( |Vinicius| ) ( |Vitor Gabriel| )
        ( |Vitor Hugo| ) ( |Vitor| ) ( |Yago| ) ( |Yuri| )
    ).

    _first_names_female = VALUE #(
        ( |Agatha| ) ( |Alana| ) ( |Alexia| ) ( |Alice| ) ( |Alícia| ) ( |Amanda| )
        ( |Ana Beatriz| ) ( |Ana Carolina| ) ( |Ana Clara| ) ( |Ana Julia| ) ( |Ana Júlia| )
        ( |Ana Laura| ) ( |Ana Luiza| ) ( |Ana Lívia| ) ( |Ana Sophia| ) ( |Ana Vitória| )
        ( |Ana| ) ( |Beatriz| ) ( |Bianca| ) ( |Brenda| ) ( |Bruna| ) ( |Bárbara| ) ( |Camila| )
        ( |Carolina| ) ( |Caroline| ) ( |Catarina| ) ( |Cecília| ) ( |Clara| ) ( |Clarice| )
        ( |Daniela| ) ( |Eduarda| ) ( |Elisa| ) ( |Eloah| ) ( |Emanuella| ) ( |Emanuelly| )
        ( |Emilly| ) ( |Esther| ) ( |Evelyn| ) ( |Fernanda| ) ( |Gabriela| ) ( |Gabrielly| )
        ( |Giovanna| ) ( |Helena| ) ( |Heloísa| ) ( |Isabel| ) ( |Isabella| ) ( |Isabelly| )
        ( |Isadora| ) ( |Isis| ) ( |Joana| ) ( |Julia| ) ( |Juliana| ) ( |Júlia| ) ( |Kamilly| )
        ( |Lara| ) ( |Larissa| ) ( |Laura| ) ( |Lavínia| ) ( |Laís| ) ( |Letícia| ) ( |Lorena| )
        ( |Luana| ) ( |Luiza| ) ( |Luna| ) ( |Lívia| ) ( |Maitê| ) ( |Manuela| ) ( |Marcela| )
        ( |Maria Alice| ) ( |Maria Cecília| ) ( |Maria Clara| ) ( |Maria Eduarda| )
        ( |Maria Fernanda| ) ( |Maria Julia| ) ( |Maria Luiza| ) ( |Maria Sophia| )
        ( |Maria Vitória| ) ( |Maria| ) ( |Mariana| ) ( |Mariane| ) ( |Marina| ) ( |Maysa| )
        ( |Melissa| ) ( |Milena| ) ( |Mirella| ) ( |Natália| ) ( |Nicole| ) ( |Nina| ) ( |Olivia| )
        ( |Pietra| ) ( |Rafaela| ) ( |Raphaela| ) ( |Raquel| ) ( |Rebeca| ) ( |Sabrina| ) ( |Sarah| )
        ( |Sofia| ) ( |Sophia| ) ( |Sophie| ) ( |Stella| ) ( |Stephany| ) ( |Valentina| ) ( |Vitória| )
        ( |Yasmin| )
    ).

    _last_names = VALUE #(
        ( |Almeida| ) ( |Alves| ) ( |Aragão| ) ( |Araújo| ) ( |Azevedo| ) ( |Barbosa| ) ( |Barros| )
        ( |Caldeira| ) ( |Campos| ) ( |Cardoso| ) ( |Cardoso| ) ( |Carvalho| ) ( |Castro| )
        ( |Cavalcanti| ) ( |Correia| ) ( |Costa| ) ( |Costela| ) ( |Cunha| ) ( |da Conceição| )
        ( |da Costa| ) ( |da Cruz| ) ( |da Cunha| ) ( |da Luz| ) ( |da Mata| ) ( |da Mota| )
        ( |da Paz| ) ( |da Rocha| ) ( |da Rosa| ) ( |das Neves| ) ( |Dias| ) ( |Duarte| )
        ( |Farias| ) ( |Fernandes| ) ( |Ferreira| ) ( |Fogaça| ) ( |Freitas| ) ( |Gomes| )
        ( |Gonçalves| ) ( |Jesus| ) ( |Lima| ) ( |Lopes| ) ( |Martins| ) ( |Melo| ) ( |Mendes| )
        ( |Monteiro| ) ( |Moraes| ) ( |Moreira| ) ( |Moura| ) ( |Nascimento| ) ( |Nogueira| )
        ( |Novaes| ) ( |Nunes| ) ( |Oliveira| ) ( |Peixoto| ) ( |Pereira| ) ( |Pinto| ) ( |Pires| )
        ( |Porto| ) ( |Ramos| ) ( |Rezende| ) ( |Ribeiro| ) ( |Rocha| ) ( |Rodrigues| ) ( |Sales| )
        ( |Santos| ) ( |Silva| ) ( |Silveira| ) ( |Souza| ) ( |Teixeira| ) ( |Viana| ) ( |Vieira| )
    ).

*    _prefixes_female = VALUE #( ( |Srta.| ) ( |Sra.| ) ( |Dra.| ) ).
*
*    _prefixes_male = VALUE #( ( |Sr.| ) ( |Dr.| ) ).

    _name_formats = value #(
      ( `{{person-first_name}} {{person-last_name}}` )
      ( `{{person-first_name}} {{person-last_name}}` )
    ).

  ENDMETHOD.

ENDCLASS.
