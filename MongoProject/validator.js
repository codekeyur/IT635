productValidator = {
    $jsonSchema: {
        bsonType: "object",
        required:["sku", "title","category","manufacture_details", "shipping_details", "price", "quantity"],
        properties:{
            sku:{
                bsonType: "string",
                description:"Each product needs item barcode."
            },
            title:{
                bsonType: "string",
                description:"Each product required a name."
            },
            category:{
                bsonType: "object",
                required:["name", "_id"],
                description:"Each product must have a category and id.",
                properties:{
                    name:{
                        enum:["Consumer Goods","Automotive and Transport","Chemicals And Materials"],
                        description:"Each Products must have one these categories."
                    },
                    _id:{
                        bsonType:"string",
                        description:"All products must have a product id."
                    }

                }
            },
            manufacture_details:{
                bsonType: "object",
                required:["model_number","manufacture","city","State"],
                description:"Each product required detailed information of manufacturer.",
                properties: {
                    model_number:{
                        bsonType:"string",
                        description:"Each product must have manufacture model number."
                    },
                    manufacture:{
                        bsonType:"string",
                        description:"Each product must have manufacture name."
                    },
                    city:{
                        bsonType:"string",
                        description:"Each product must have manufacture City."
                    },
                    State:{
                        bsonType:"string",
                        description:"Each product must have manufacture state."
                    },
                }
            },
            shipping_details:{
                bsonType: "object",
                required:["weight","height","width"],
                description:"Each product needs Shipping details.",
                properties: {
                    weight:{
                        bsonType:"number",
                        description:"Weight of the shipment required."
                    },
                    height:{
                        bsonType:"number",
                        description:"Height of the shipment required."
                    },
                    width:{
                        bsonType:"number",
                        description:"Width of the shipment required."
                    }
                    
                }
            },
             price:{
                 bsonType:"number"
             },
             quantity:{
                 bsonType:"number"
             }
            
        }
    }
}
