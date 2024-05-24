const homeScreenAppbarTitle = "Product List";
const homeScreenProductDataHeader = "Showing Product Data";
const addProductSuccessfulText = "Product has been added successfully!";
const updateProductSuccessfulText = "Product has been updated successfully!";
const addProductFailureText = "Product failed to insert, try again!";
const updateProductFailureText = "Product failed to update, try again!";
const deleteProductSuccessful = "Product has been deleted successfully";
const addProductScreenTitle = "Enter Product Information";
const updateProductScreenTitle = "Edit Product Information";
const popupHighToLowText = "Price (High to Low)";
const popupLowToHighText = "Price (Low to High)";
const filterListText = "Filter List";

//Api baseUrl
const String baseUrl = "https://crud.teamrabbil.com/api/v1";
const String readProductEndpoint = "ReadProduct";
const String createProductEndpoint = "CreateProduct";
const String deleteProductEndpoint = "DeleteProduct";
const String updateProductEndpoint = "UpdateProduct";

//alertDialog
const String alertDialogWarningHeader = "Warning";
const String alertDialogDeleteContent = "Are you sure you want to delete this product";
const String alertDialogDeleteButtonText = "Delete";
const String alertDialogCancelButtonText = "Cancel";

//addProductScreen
const String productCodeLabelText = "Product Code";
const String productCodeHintText = "Enter Product Code";
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
const String alphabetsAndDigitsWithSpaceRegEx = r"^[a-z A-z 0-9-' ]+$";
const String digitsRegEx = r'^[0-9]+$';
