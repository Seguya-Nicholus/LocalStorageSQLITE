import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12

Item {
    anchors.fill:parent

    Column{
        spacing: 2

        Row{
            spacing: 2

            Label{
                text:"Commodity Id"
            }

            TextField{
                id:commID
            }
        }

        Row{
            spacing: 2
            Label{
                text: "Commodity Name"
            }

            TextField{
                id:commName
            }
        }

        Row{
            spacing: 2
            Label{
                text: "Dispensed Form"
            }

            TextField{
                id:commForm
            }
        }

        Row{
            spacing: 2
            Label{
                text: "Quantity"
            }

            TextField{
                id:commQty
            }
        }

        Button{
            id:garButton
            onClicked:{

                var ID = commID.text;
                var CommodityName = commName.text;
                var DispensedForm = commForm.text;
                var Quantity = commQty.text;


                db.transaction(
                            function(tx) {
                                // Add commodity to Database
                                var sql = ('INSERT INTO Prescription(ID,CommodityName,DispensedForm,Quantity) VALUES('+ ID +','+ CommodityName +','+ DispensedForm +','+ Quantity +')');
                                tx.executeSql(sql);
                            });

            }
        }

        Button{
            id:addButton
            onClicked:{
                stackView.push(dataForm);
            }
        }

    }

}
