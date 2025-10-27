//
//  SelectRoomTypeTableViewControllerDelegate.swift
//  ComplexInputScreens
//
//  Created by Student on 27/08/25.
//

import Foundation

protocol SelectRoomTypeTableViewControllerDelegate : AnyObject{
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType)
}
