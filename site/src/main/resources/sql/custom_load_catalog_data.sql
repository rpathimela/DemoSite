--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the the catalog data used in the Archetype.   Implementers can change this file
-- to load their initial catalog.
--

-- BLC Admin Required Categories
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (1,'Root','Root',NULL,NULL,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2, 'Primary Nav','Primary Nav',NULL,1,CURRENT_TIMESTAMP);

-- Custom store navigation (default template uses these for the header navigation)
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE, DISPLAY_TEMPLATE) VALUES (2001,'Home','Home','/',2,CURRENT_TIMESTAMP, 'layout/home');
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2002,'Our Collection','Our Collection','/our-collection',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2003,'Custom Cases','Custom Cases','/custom-cases',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2004,'Contact Us','Contact Us','/contact-us',2,CURRENT_TIMESTAMP);
INSERT INTO BLC_CATEGORY (CATEGORY_ID,DESCRIPTION,NAME,URL,DEFAULT_PARENT_CATEGORY_ID,ACTIVE_START_DATE) VALUES (2005,'FAQs','FAQs','/faq',2,CURRENT_TIMESTAMP);

-- Builds the category hierarchy (simple in this case) - Root --> Nav --> All other categories
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (1,2,1,1)
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (2,2001,2,1);
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (3,2002,2,2);
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (4,2003,2,3);
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (5,2004,2,4);
INSERT INTO BLC_CATEGORY_XREF (CATEGORY_XREF_ID, SUB_CATEGORY_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (6,2005,2,5);

-- Add in any applicable search facets for the given category
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (1, 'PRODUCT', 'manufacturer', 'mfg', TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (2, 'PRODUCT', 'productAttributes.heatRange', 'heatRange', FALSE, 'i');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (3, 'PRODUCT', 'defaultSku.retailPrice', 'price', FALSE, 'p');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE, FACET_FIELD_TYPE) VALUES (4, 'PRODUCT', 'defaultSku.name', 'name', TRUE, TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (5, 'PRODUCT', 'model', 'model', TRUE, 's');
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE) VALUES (6, 'PRODUCT', 'defaultSku.description', 'desc', TRUE, TRUE);
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, TRANSLATABLE) VALUES (7, 'PRODUCT', 'defaultSku.longDescription', 'ldesc', TRUE, TRUE);
INSERT INTO BLC_FIELD (FIELD_ID, ENTITY_TYPE, PROPERTY_NAME, ABBREVIATION, SEARCHABLE, FACET_FIELD_TYPE) VALUES (8, 'PRODUCT', 'productAttributes.color', 'color', TRUE, 's');

INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (1, 't');
-- Note that we are don't search on heat range
-- Note that we are don't search on price
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (4, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (5, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (6, 't');
INSERT INTO BLC_FIELD_SEARCH_TYPES (FIELD_ID, SEARCHABLE_FIELD_TYPE) VALUES (7, 't');

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (1, 1, 'Manufacturer', FALSE, TRUE, 0);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (1, 2002, 1, 1);

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (2, 2, 'Heat Range', FALSE, TRUE, 0);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (2, 2002, 2, 2);

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (4, 8, 'Color', TRUE, TRUE, 0);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (4,2003, 4, 1);

INSERT INTO BLC_SEARCH_FACET (SEARCH_FACET_ID, FIELD_ID, LABEL, SHOW_ON_SEARCH, MULTISELECT, SEARCH_DISPLAY_PRIORITY) VALUES (3, 3, 'Price', TRUE, TRUE, 1);
INSERT INTO BLC_CAT_SEARCH_FACET_XREF (CATEGORY_SEARCH_FACET_ID, CATEGORY_ID, SEARCH_FACET_ID, SEQUENCE) VALUES (3, 1, 3, 3);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (1, 3, 0, 5);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (2, 3, 5, 10);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (3, 3, 10, 15);
INSERT INTO BLC_SEARCH_FACET_RANGE (SEARCH_FACET_RANGE_ID, SEARCH_FACET_ID, MIN_VALUE, MAX_VALUE) VALUES (4, 3, 15, null);

------------------------------------------------------------------------------------------------------------------
-- Inserting products manually involves five steps which are outlined below.   Typically, products are loaded 
-- up front in the project and then managed via the Broadleaf Commerce admin.   
--
-- Loading through this script is a convenient way to get started when prototyping and can be useful in development
-- as a way to share data-setup without requiring a shared DB connection. 
------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 1:  Create the products
-- =============================================
-- In this step, we are also populating the manufacturer for the product
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (1,2002,'/hot-sauces/sudden_death_sauce','Blair''s',TRUE);
INSERT INTO BLC_PRODUCT (PRODUCT_ID,  DEFAULT_CATEGORY_ID, URL, MANUFACTURE, IS_FEATURED_PRODUCT) VALUES (100,2003,'/merchandise/hawt_like_a_habanero_mens','The Heat Clinic',FALSE);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 2:  Create "default" SKUs
-- =============================================
-- The Broadleaf Commerce product model is setup such that every product has a default SKU.   For many products,
-- a product only has one SKU.    SKUs hold the pricing information for the product and are the actual entity
-- that is added to the cart.    Inventory, Pricing, and Fulfillment concerns are done at the SKU level
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (1,1,'Sudden Death Sauce','As my Chilipals know, I am never one to be satisfied. Hence, the creation of Sudden Death. When you need to go beyond... Sudden Death will deliver! ',10.99,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Give some of the SKUs a sale price
------------------------------------------------------------------------------------------------------------------
--INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,SALE_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (17,17,'Insanity Sauce','This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.',5.99,4.99,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Some SKUs (such as merchandise) may be product options based on one product. For example, there may be a 
-- "Men's Hand drawn Heat Clinic Shirt" product that has up to 12 SKUs showing the options of 
-- Red/Black/Silver, and Small/Medium/Large/X-Large
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_OPTION (PRODUCT_OPTION_ID, OPTION_TYPE, ATTRIBUTE_NAME, LABEL, REQUIRED) VALUES (1, 'COLOR', 'COLOR', 'Shirt Color', TRUE);
INSERT INTO BLC_PRODUCT_OPTION (PRODUCT_OPTION_ID, OPTION_TYPE, ATTRIBUTE_NAME, LABEL, REQUIRED) VALUES (2, 'SIZE', 'SIZE', 'Shirt Size', TRUE);
INSERT INTO BLC_PRODUCT_OPTION (PRODUCT_OPTION_ID, OPTION_TYPE, ATTRIBUTE_NAME, LABEL, REQUIRED,USE_IN_SKU_GENERATION,VALIDATION_TYPE,VALIDATION_STRING,ERROR_MESSAGE,ERROR_CODE) VALUES (3, 'TEXT', 'NAME', 'Personalized Name', FALSE,FALSE,'REGEX','[a-zA-Z ]{3,30}','Name must be less than 30 characters, with only letters and spaces','INVALID_NAME');

INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (1, 'Black', 1, 1);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (2, 'Red', 2, 1);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (3, 'Silver', 3, 1);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (11, 'S', 1, 2);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (12, 'M', 2, 2);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (13, 'L', 3, 2);
INSERT INTO BLC_PRODUCT_OPTION_VALUE (PRODUCT_OPTION_VALUE_ID, ATTRIBUTE_VALUE, DISPLAY_ORDER, PRODUCT_OPTION_ID) VALUES (14, 'XL', 4, 2);

INSERT INTO BLC_SKU (SKU_ID,DEFAULT_PRODUCT_ID,NAME,LONG_DESCRIPTION,RETAIL_PRICE,TAXABLE_FLAG,DISCOUNTABLE_FLAG,ACTIVE_START_DATE) VALUES (100,100,'Hawt Like a Habanero Shirt (Men''s)','Men''s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.',14.99,'Y','Y',CURRENT_TIMESTAMP);

------------------------------------------------------------------------------------------------------------------
-- Update the DEFAULT_SKU_ID on the products
------------------------------------------------------------------------------------------------------------------
UPDATE BLC_PRODUCT SET DEFAULT_SKU_ID = 1 WHERE PRODUCT_ID = 1;

UPDATE BLC_PRODUCT SET DEFAULT_SKU_ID = 9992 WHERE PRODUCT_ID = 992;
UPDATE BLC_PRODUCT SET DEFAULT_SKU_ID = 9993 WHERE PRODUCT_ID = 993;

UPDATE BLC_PRODUCT SET DEFAULT_SKU_ID = 100 WHERE PRODUCT_ID = 100;

------------------------------------------------------------------------------------------------------------------
-- Create non-default SKUs for some merchandise. In this case, we're stating that all XL shirts are $1.00 more
-- All other combinations have no special properties, but we must create them so we can track inventory on a 
-- per-SKU level. Generally, either you have only a default SKU or SKUs for all permutations of product options
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU (SKU_ID,RETAIL_PRICE,DISCOUNTABLE_FLAG) VALUES (114,16.99,'Y');
INSERT INTO BLC_SKU (SKU_ID,DISCOUNTABLE_FLAG) VALUES (111,'Y');
		
------------------------------------------------------------------------------------------------------------------
-- Associate the appropriate option values for the skus
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (111, 1), (111, 11);
INSERT INTO BLC_SKU_OPTION_VALUE_XREF (SKU_ID, PRODUCT_OPTION_VALUE_ID) VALUES (114, 1), (114, 14);


------------------------------------------------------------------------------------------------------------------
-- Add some heat levels to all the products
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_ATTRIBUTE (PRODUCT_ATTRIBUTE_ID, PRODUCT_ID, NAME, VALUE) VALUES (1, 1, 'heatRange', 4);

------------------------------------------------------------------------------------------------------------------
-- Link the non-default SKUs for merchandise
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_SKU_XREF (SKU_ID, PRODUCT_ID) VALUES (111, 100), (114, 100);

------------------------------------------------------------------------------------------------------------------
-- Associate the merchandise products with their appropriate available product options
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_PRODUCT_OPTION_XREF (PRODUCT_OPTION_XREF_ID, PRODUCT_OPTION_ID, PRODUCT_ID) VALUES (1, 1, 100);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 3:  Create Category/Product Mapping
-- ========================================================
-- Add all hot-sauce items to the hot-sauce category
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (1,1,2002,1);

-- merchandise items
INSERT INTO BLC_CATEGORY_PRODUCT_XREF (CATEGORY_PRODUCT_ID, PRODUCT_ID, CATEGORY_ID, DISPLAY_ORDER) VALUES (29,100,2003,1);

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 4:  Media Items used by products
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT) VALUES (101,'/cmsstatic/img/sauces/Sudden-Death-Sauce-Bottle.jpg','Sudden Death Sauce Bottle','primary');

INSERT INTO BLC_MEDIA (MEDIA_ID, URL, TITLE, ALT_TEXT, TAGS) VALUES (10001,'/cmsstatic/img/merch/habanero_mens_black.jpg','Hawt Like a Habanero Men''s Black','primary','Black');

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 5:  Mapping for product to media
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (1,101,'primary');

INSERT INTO BLC_SKU_MEDIA_MAP (BLC_SKU_SKU_ID, MEDIA_ID, MAP_KEY) VALUES (100,10001,'primary');

------------------------------------------------------------------------------------------------------------------
-- Load Catalog - Step 5: Asset Items (media)
-- ========================================================
------------------------------------------------------------------------------------------------------------------
INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (101,'image/jpg','FILESYSTEM','/img/sauces/Sudden-Death-Sauce-Bottle.jpg','Sudden Death Sauce Bottle');

INSERT INTO BLC_STATIC_ASSET (STATIC_ASSET_ID, MIME_TYPE, STORAGE_TYPE, FULL_URL, NAME) VALUES (10001,'image/jpg','FILESYSTEM','/img/merch/habanero_mens_black.jpg','Hawt Like a Habanero Men''s Black');


------------------------------------------------------------------------------------------------------------------
-- End of Catalog load
-- ========================================================
------------------------------------------------------------------------------------------------------------------

INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (1, '/googlePerm', 'http://www.google.com', 'REDIRECT_PERM');
INSERT INTO BLC_URL_HANDLER(URL_HANDLER_ID, INCOMING_URL, NEW_URL, URL_REDIRECT_TYPE) VALUES (2, '/googleTemp', 'http://www.google.com', 'REDIRECT_TEMP');

INSERT INTO BLC_SEARCH_INTERCEPT(SEARCH_REDIRECT_ID,PRIORITY, SEARCH_TERM, URL,ACTIVE_START_DATE,ACTIVE_END_DATE) VALUES (2,-10, 'new york', '/search?q=pace picante','1992-10-15 14:28:36','1999-10-15 21:28:36');

-----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-- RELATED PRODUCT - DATA (featured products for right-hand side display)
-----------------------------------------------------------------------------------------------------------------------------------
-- Adding to root category
-- INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (1, 1, 1, 18);

-- Adding to merchandise category
-- INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (5, 1, 2003, 4);

-- Adding to hot-sauces category
-- INSERT INTO BLC_PRODUCT_FEATURED(FEATURED_PRODUCT_ID, SEQUENCE, CATEGORY_ID, PRODUCT_ID)  VALUES (8, 1, 2002, 500);

-- Adding a 20% off sale to Merchandise category to fit the Shirts Special Homepage Banner
INSERT INTO BLC_OFFER (OFFER_ID, APPLIES_TO_RULES, OFFER_NAME, START_DATE, END_DATE, OFFER_TYPE, OFFER_DISCOUNT_TYPE, OFFER_VALUE, OFFER_DELIVERY_TYPE, STACKABLE, COMBINABLE_WITH_OTHER_OFFERS, OFFER_PRIORITY, APPLY_OFFER_TO_MARKED_ITEMS, APPLY_TO_SALE_PRICE, USES, MAX_USES) VALUES (1,NULL, 'Shirts Special',CURRENT_DATE,'2020-01-01 00:00:00','ORDER_ITEM','PERCENT_OFF',20,'AUTOMATIC',TRUE,TRUE,10,FALSE,FALSE,0,0);

INSERT INTO BLC_OFFER_ITEM_CRITERIA (OFFER_ITEM_CRITERIA_ID, ORDER_ITEM_MATCH_RULE, QUANTITY) VALUES (1, 'MVEL.eval("toUpperCase()",discreteOrderItem.category.name)==MVEL.eval("toUpperCase()","merchandise")', 1);

INSERT INTO BLC_TAR_CRIT_OFFER_XREF (OFFER_ITEM_CRITERIA_ID, OFFER_ID) VALUES (1, 1);

-- Sample fulfillment option
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (1, 'Standard', '5 - 7 Days', FALSE, 'PHYSICAL_SHIP');
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (2, 'Priority', '3 - 5 Days', FALSE, 'PHYSICAL_SHIP');
INSERT INTO BLC_FULFILLMENT_OPTION (FULFILLMENT_OPTION_ID, NAME, LONG_DESCRIPTION, USE_FLAT_RATES, FULFILLMENT_TYPE) VALUES (3, 'Express', '1 - 2 Days', FALSE, 'PHYSICAL_SHIP');

INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (1, 5.00);
INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (2, 10.00);
INSERT INTO BLC_FULFILLMENT_OPTION_FIXED (FULFILLMENT_OPTION_ID, PRICE) VALUES (3, 20.00);

INSERT INTO BLC_CURRENCY(CURRENCY_CODE, FRIENDLY_NAME, DEFAULT_FLAG) VALUES('INR', 'Indian Rupee', TRUE);