import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    anchors.fill:parent

    ListView{
        id :commodityListView

        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: addButton.top
        }
        model:ListModel{}

        delegate: Label{
            anchors{
                left:left.parent
                right:right.parent
            }

            height:50
            text: ID + ''+ CommodityName + '' + DispensedForm
        }
    }
    Button{
        id:addButton

        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        onClicked:{
            stackView.push(inputForm);
        }
    }

}
