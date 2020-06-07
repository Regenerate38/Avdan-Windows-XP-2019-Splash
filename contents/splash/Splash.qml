/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.1


Image {
    id: root
    source: "images/background.jpg"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }
    Image {
        id: topRect
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height
        source: "images/rectangle.svg"
        Image {
            source: "images/kde.svg"
            anchors.centerIn: parent
        }
        Rectangle {
          
            color: "#000000"
            anchors {
                bottom: parent.bottom
                bottomMargin: -210
                horizontalCenter: parent.horizontalCenter
            }
            height: 32
            width: height*12.5
            border.color: "white"
            border.width: 2
            Rectangle {
                radius: 3
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                
                width: (parent.width / 6) * (stage - 1)
                color: "#0970d2"
                Behavior on width { 
                    PropertyAnimation {
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
        Text {
             text:" 2 0 1 9    E D I T I O N"
             font.family: "NOTO SANS"
             font.pointSize: 18
             color:"#ffffff"
             anchors {
                bottom: parent.bottom
                bottomMargin: -400
                horizontalCenter: parent.horizontalCenter
            }
            
            
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                target: topRect
                to: root.height / 3
                duration: 0
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 3) - bottomRect.height
                duration: 0
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
}
