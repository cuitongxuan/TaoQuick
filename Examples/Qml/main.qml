import QtQuick 2.9
import QtQuick.Controls 2.0

import TaoQuick 1.0
import "qrc:/Tao/Qml/Config"

import "./Page"

Rectangle {
    id: root
    width: 800
    height: 600
    color: TConfig.darkcyan
    Rectangle {
        id: vLine
        width: parent.width - 2
        height: 1
        y: parent.height / 8
        x: 1
        color: "gray"
    }
    Rectangle {
        id: hLine
        width: 1
        height: parent.height - 2
        y: 1
        x: parent.width / 4
        color: "gray"
    }


    Item {
        id: logoFrame
        anchors {
            left: parent.left
            top: parent.top
            right: hLine.left
            bottom: vLine.top
        }
        Image {
            id: name
            source: "qrc:/Image/logo/logo_transparent.png"
            anchors.fill: parent
        }
    }
    Item {
        id: titleFrame
        anchors {
            left: hLine.right
            right: parent.right
            top: parent.top
            bottom: vLine.top
        }
        TitlePage {
            id: titlePage
            title: menuPage.currentTitle
            anchors.fill: parent
        }
    }
    Item {
        id: menuFrame
        anchors {
            left: parent.left
            right: hLine.left
            top: vLine.bottom
            bottom: parent.bottom
        }
        MenuPage {
            id: menuPage
            anchors.fill: parent
            Component.onCompleted: {
                var modelData = [
                            { name: qsTr("首页"), title: qsTr("欢迎"), url: "qrc:/Qml/Contents/Welcome/Welcome.qml", children: []},
                            {
                                name: qsTr("基础组件"), title: qsTr("基础组件"),  children: [
                                    { name: qsTr("文本组件"), title: qsTr("文本组件"), url: "qrc:/Qml/Contents/BaseComponent/Texts.qml"},
                                    { name: qsTr("按钮组件"), title: qsTr("按钮组件"), url: "qrc:/Qml/Contents/BaseComponent/Buttons.qml"},
                                    { name: qsTr("下拉组件"), title: qsTr("下拉组件"), url: "qrc:/Qml/Contents/BaseComponent/DropDowns.qml"},
                                    { name: qsTr("标签页组件"), title: qsTr("标签页组件"), url: "qrc:/Qml/Contents/BaseComponent/Tabs.qml"},
                                    { name: qsTr("进度条组件"), title: qsTr("进度条组件"), url: "qrc:/Qml/Contents/BaseComponent/Progresses.qml"},
                                ]
                            },
                            {
                                name: qsTr("功能组件"), title: qsTr("功能组件"),  children: [
                                    { name: qsTr("徽章"), title: qsTr("徽章"), url: "qrc:/Qml/Contents/FunctionComponent/Badge.qml"},
                                    { name: qsTr("二维码"), title: qsTr("二维码"), url: "qrc:/Qml/Contents/FunctionComponent/QRCode.qml"},
                                    { name: qsTr("IP地址"), title: qsTr("IP地址"), url: "qrc:/Qml/Contents/FunctionComponent/IPAddress.qml"},
                                    { name: qsTr("弹幕"), title: qsTr("IP地址"), url: "qrc:/Qml/Contents/FunctionComponent/Barrage.qml"},
                                ]
                            },
                            {
                                name: qsTr("酷炫组件"), title: qsTr("酷炫组件"),  children: [
                                    { name: qsTr("能量球"), title: qsTr("能量球"), url: "qrc:/Qml/Contents/CoolComponent/PowerBall.qml"},
                                    { name: qsTr("暗影之流"), title: qsTr("暗影之流"), url: "qrc:/Qml/Contents/CoolComponent/ArrowFlow.qml"},
                                    { name: qsTr("烟花漫舞"), title: qsTr("烟花漫舞"), url: "qrc:/Qml/Contents/CoolComponent/FireworksDance.qml"},
                                    { name: qsTr("哈雷彗星"), title: qsTr("哈雷彗星"), url: "qrc:/Qml/Contents/CoolComponent/HalleyComet.qml"},
                                    { name: qsTr("焰之欢愉"), title: qsTr("焰之欢愉"), url: "qrc:/Qml/Contents/CoolComponent/HappyFlame.qml"},
                                    { name: qsTr("霜之哀伤"), title: qsTr("霜之哀伤"), url: "qrc:/Qml/Contents/CoolComponent/SadFrost.qml"},
                                ]
                            }
                        ]
                freshData(modelData);
            }
        }
    }
    Item {
        id: contentFrame
        anchors {
            left: hLine.right
            right: parent.right
            top: vLine.bottom
            bottom: parent.bottom
        }
        ContentPage {
            id: contentPage
            anchors.fill: parent
            source: menuPage.currentUrl
        }
    }
}