//
//  TouchBarPrivateApi.h
//  TouchBarVisualizer
//
//  Created by Addison Hanrattie on 4/16/20.
//  Copyright © 2020 Addison Hanrattie. All rights reserved.
//

#ifndef TouchBarPrivateApi_h
#define TouchBarPrivateApi_h

#import <AppKit/AppKit.h>
extern void DFRElementSetControlStripPresenceForIdentifier(NSTouchBarItemIdentifier, BOOL);
    extern void DFRSystemModalShowsCloseBoxWhenFrontMost(BOOL);

    @interface NSTouchBarItem (PrivateMethods)
    + (void)addSystemTrayItem:(NSTouchBarItem *)item;
    + (void)removeSystemTrayItem:(NSTouchBarItem *)item;
    @end


    @interface NSTouchBar (PrivateMethods)
    + (void)presentSystemModalTouchBar:(NSTouchBar *)touchBar placement:(long long)placement systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
    + (void)presentSystemModalTouchBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSTouchBarItemIdentifier)identifier;
    + (void)dismissSystemModalTouchBar:(NSTouchBar *)touchBar;
    + (void)minimizeSystemModalTouchBar:(NSTouchBar *)touchBar;
    @end

#endif /* TouchBarPrivateApi_h */
