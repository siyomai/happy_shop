**Happy Shop Products API**
----
  Here is the available APIs for Happy Shop's products.

* **Base URL**

  `https://agt-happy-shop.herokuapp.com`

* **URL**

  `/api/products?per_page=5&page=2&filter[category]=lipstick&sort=price`

* **Method:**

  `GET`
  
*  **URL Params**

   **Optional:**
 
   - `per_page=[integer]`
   - `page=[integer]`
   - `filter[category | price]=[string]`
   - `sort=[string]`

* **Success Response:**
 
  * **Code:** 200 <br />
    **Content:**
    ```
      {
        "data": [
          {
            "id": "1",
            "type": "products",
            "attributes": {
              "name": "Maybelline lipstick",
              "sold-out": false,
              "category": "lipstick",
              "under-sale": false,
              "price": 1000,
              "sale-price": 0
            }
          }
        ],
        "links": {}
      }
    ```
   
* **URL**

  `/api/products/:id`

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `id=[id]`

* **Success Response:**
 
  * **Code:** 200 <br />
    **Content:**
    ```
      {
        "data": {
          "id": "1",
          "type": "products",
          "attributes": {
            "name": "Maybelline lipstick",
            "sold-out": false,
            "category": "lipstick",
            "under-sale": false,
            "price": 1000,
            "sale-price": 0
          }
        }
      }
    ```
 
