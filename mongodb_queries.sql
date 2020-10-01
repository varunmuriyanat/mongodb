db.listingsAndReviews.find({}, {"_id":0, "last_scraped": 1})




db.listingsAndReviews.aggregate( [
   {
     $group: {
            _id: {
               room_type: "$room_type",
               last_scraped: { $dateToString: {
                  format: "%Y-%m-%d",
                  date: "$last_scraped"
               }}
        },
        total: { $sum: "$beds" }
     }
   }
] )


db.listingsAndReviews.aggregate( 
[
    {
        $group: 
        {
            _id: 
            {
                room_type: "$room_type",
                last_scraped: 
                { 
                    $dateToString: 
                    {
                        format: "%Y-%m-%d",
                        date: "$last_scraped"
                    }
                }
            },
            total: { $sum: "$beds" }
         }
    },
    { $match: { total: { $gte: 20 } } }
] )




db.listingsAndReviews.aggregate( 
[
    {
        $group: 
        {
            _id: 
            {
                room_type: "$room_type",
                last_scraped: 
                { 
                    $dateToString: 
                    {
                        format: "%Y-%m-%d",
                        date: "$last_scraped"
                    }
                }
            },
            total: { $sum: "$beds" }
        }
    },
    { 
        $match: { total: { $gte: 20 } }
    },
    { 
        $sort: { total: 1 } }
    }
] )





db.listingsAndReviews.aggregate( 
[
    {
        $group: 
        {
            _id: 
            {
                room_type: "$room_type",
                last_scraped: 
                { 
                    $dateToString: 
                    {
                        format: "%Y-%m-%d",
                        date: "$last_scraped"
                    }
                }
            },
            total: { $sum: "$beds" }
        }
    },
    { $match: { total: { $gt: 20 } } },
    { $sort: { total: 1 } }
] )


db.listingsAndReviews.aggregate( 
[
    { $match: { property_type: "House" } },
    {
        $group: 
        {
            _id: 
            {
                room_type: "$room_type",
                last_scraped: 
                { 
                    $dateToString: 
                    {
                        format: "%Y-%m-%d",
                        date: "$last_scraped"
                    }
                }
            },
            total: { $sum: "$beds" }
        }
    },
    { $match: { total: { $gt: 20 } } },
    { $sort: { total: 1 } }
] )



db.listingsAndReviews.find(
    {},
    {
        room_type:1,
        last_scraped:1
    }
)




db.listingsAndReviews.find(
    {},
    {
        last_scraped: { 
            $dateToString: {
                format:"%Y-%m-%d",
                date: "$last_scraped"
            }
        }
    }
)



