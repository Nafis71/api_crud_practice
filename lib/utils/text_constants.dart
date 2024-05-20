const homeScreenAppbarTitle = "Product List";
const homeScreenProductDataHeader = "Showing Product Data";


//Api baseUrl
const String baseUrl = "https://crud.teamrabbil.com/api/v1";



//addProductScreen
const String productCodeLabelText = "Product Id";
const String productCodeHintText = "Enter Product Id";
const String productNameLabelText = "Product Name";
const String productNameHintText = "Enter Product Name";
const String productUnitPriceLabelText = "Product Unit Price";
const String productUnitPriceHintText = "Enter Product Unit Price";
const String productQuantityLabelText = "Product Quantity";
const String productQuantityHintText = "Enter Product Quantity";
const String productImageLabelText = "Product Image Url";
const String productImageHintText = "Enter Product Image Url";
const String productCodeErrorText = "Invalid Product Id";
const String productNameErrorText = "Invalid Product Name";
const String productUnitPriceErrorText = "Invalid Unit Price";
const String productQuantityErrorText = "Invalid Quantity";
const String productImageErrorText = "Invalid Image Url";

//regular Expressions
const String alphabetsAndDigitsRegEx = r'^[a-zA-z0-9]+$';
const String alphabetsAndDigitsWithSpaceRegEx = r'^[a-z A-z 0-9]+$';
const String digitsRegEx = r'^[0-9]+$';
const String imageUrlRegEx = r'^(https?:\/\/.*\.(?:png|jpg|jpeg|gif|bmp|webp))$';