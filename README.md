# PropineTask -> Question 2 - Programming

This README would normally document whatever steps are necessary to get the output.

## Getting Started

Used the language Ruby. Ruby version >= 2.5.1

### Follow the steps
  * Clone/Download this Repo.
  * Go to folder Question_2_Programming.
  * Then execute ``` bundle install ```
  * Given no parameters, return the latest portfolio value per token in USD
      * Eg: run ``` ruby main_app.rb ```
      * Output Eg: 
        ```
          Latest Portfolio value of token BTC in USD 2448.8985092000003
          Latest Portfolio value of token ETH in USD 121.4691552
          Latest Portfolio value of token XRP in USD 0.1758831064
        ```
  * Given a token, return the latest portfolio value for that token in USD
      * Eg: run ``` ruby main_app.rb BTC ```
      * Output Eg:
        ```
          Latest Portfolio value of token BTC in USD 2448.698407
        ```
  * Given a date, return the portfolio value per token in USD on that date
      * Eg: run ``` ruby main_app.rb 2019-10-25 ```
      * Output Eg:
        ```
          Portfolio value of token BTC in  2019-10-25 in USD 2448.9283751999997
          Portfolio value of token ETH in  2019-10-25 in USD 121.4759916
          Portfolio value of token XRP in  2019-10-25 in USD 0.1758831064
        ```
  * Given a date and a token, return the portfolio value of that token in USD on that date
      * Eg: run ``` ruby main_app.rb 2019-10-25 BTC ```
      * Output Eg:
        ```
          Portfolio value of token BTC in  2019-10-25 in USD 2449.086665
        ```
  * For running test 
      * run ``` rspec ```
