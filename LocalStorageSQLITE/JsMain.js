function runInitialConfiguration() {

    // Creates the instance of the Database Object
    db = LocalStorage.openDatabaseSync(dbId,dbVersion,dbDescription,dbSize);

    // Configures a Table within the Databse
    db.transaction( function(tx) {
        // Create the Table if it doesn't already exist
        var sql = ('CREATE TABLE IF NOT EXISTS Prescription '
                   + '(ID INTEGER PRIMARY KEY AUTOINCREMENT,'
                   + 'CommodityName VARCHAR(20),'
                   + 'DispensedForm VARCHAR(20),'
                   + 'Quantity DOUBLE)');
        tx.executeSql(sql);

    });

    // Read the information inside the table
    db.transaction( function(tx) {
        // Return all records in the Table
        var sql = tx.executeSql('SELECT * FROM Prescription');
        var rs = tx.executeSql(sql);

        var myId;
        var myCommodityName;
        var myDispensedForm;
        var myQuantity;
        var ix;
        for(ix = 0;ix<rs.rows.length;++ix){
            myId = rs.rows.item(ix).id;
            myCommodityName = rs.rows.item(ix).CommodityName;
            myDispensedForm = rs.rows.items(ix).DispensedForm;
            myQuantity = rs.rows.item(ix).Quantity;

            commodityListView.model.append({
                                               ID : myId,
                                               CommodityName : myCommodityName,
                                               DispensedForm : myDispensedForm,
                                               Quantity : myQuantity
                                           })

        }
    });

}
