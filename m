Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E7730BAC5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 10:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhBBJRz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 04:17:55 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:41337 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbhBBJQ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2021 04:16:58 -0500
Received: by mail-il1-f200.google.com with SMTP id d11so4931906ilu.8
        for <linux-gpio@vger.kernel.org>; Tue, 02 Feb 2021 01:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=bZ0yFA7nEfPK6NHzUikcevfhZbnqWxsxbvcAiDCsbi0=;
        b=hV8hrGhmXSGCBbz1pIt/7GNKxpzjrdlE5m0rNalinN4DjPx2BxGdmZfz8e1d9xAMQT
         VHh9VKbscpkLGiak1l87nxhhl5KJ2P5vFYVQL02xQmHyGk54ZLDUYkIk9zrMD6niwPVf
         UaW6Bh7lb1F+6mmqZxOeJiROHfpIy1BZMPHxPQtVx2T/XAMB7bbUMKSlXPy4/1XjVJpp
         9kmpiF4u2ZAWqSjEb3Q7dxkR7TmggWCvREi8aOPjGVW4cflqEEeVr4yJJzmXbze9uaOw
         w60lDszaDrKSqMhOS5cqWseaJ7P7Le3guOgIeHGrL/jFD7caNZUnYPtZaeuiMKEMh/cT
         ujbQ==
X-Gm-Message-State: AOAM530+iQxB+1W97Odz1jDHSmIpSyps/Bg7PNyPqFHUUQmF1BFyvOVG
        eLkqZfS3QYCYvPeBKoanxgbVML+PEJDAwBrW0xEEtGPidRqx
X-Google-Smtp-Source: ABdhPJzlD2KJ07MPrKtmsN3QsxO0afv6dZVBaa0wYffb0aRCP1FGxkBupk3vERW6FAFNs6iurugpZsbwSDBNJdW9q+J435Ahcy8T
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1541:: with SMTP id h1mr6736936iow.171.1612257376667;
 Tue, 02 Feb 2021 01:16:16 -0800 (PST)
Date:   Tue, 02 Feb 2021 01:16:16 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000390af005ba56ec0f@google.com>
Subject: general protection fault in put_device
From:   syzbot <syzbot+3512de0f935d494a45a6@syzkaller.appspotmail.com>
To:     bgolaszewski@baylibre.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, saravanak@google.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    b01f250d Add linux-next specific files for 20210129
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=144cd11cd00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=725bc96dc234fda7
dashboard link: https://syzkaller.appspot.com/bug?extid=3512de0f935d494a45a6
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1093e16f500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13756b44d00000

The issue was bisected to:

commit 4731210c09f5977300f439b6c56ba220c65b2348
Author: Saravana Kannan <saravanak@google.com>
Date:   Fri Jan 22 19:35:59 2021 +0000

    gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12a1c51cd00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11a1c51cd00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16a1c51cd00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3512de0f935d494a45a6@syzkaller.appspotmail.com
Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")

viperboard 1-1:0.143: version 0.00 found at bus 001 address 002
viperboard-i2c viperboard-i2c.2.auto: failure setting i2c_bus_freq to 100
viperboard-i2c: probe of viperboard-i2c.2.auto failed with error -5
usb 1-1: USB disconnect, device number 2
general protection fault, probably for non-canonical address 0xdffffc00000000b3: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000598-0x000000000000059f]
CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.11.0-rc5-next-20210129-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:__list_del_entry_valid+0x1d/0xf0 lib/list_debug.c:42
Code: 48 8b 34 24 eb b4 0f 1f 80 00 00 00 00 48 b8 00 00 00 00 00 fc ff df 41 55 41 54 55 48 89 fd 48 83 c7 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 a0 00 00 00 48 89 ea 4c 8b 65 08 48 b8 00 00 00
RSP: 0018:ffffc90000ca7308 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff88814149e008 RCX: 0000000000000000
RDX: 00000000000000b3 RSI: ffffffff83e19360 RDI: 0000000000000598
RBP: 0000000000000590 R08: 0000000000000001 R09: ffffffff8ef7388f
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000590
R13: 0000000000000598 R14: ffff88814782ff20 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e1f4df6008 CR3: 0000000016785000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __list_del_entry include/linux/list.h:132 [inline]
 list_del include/linux/list.h:146 [inline]
 gpiodevice_release+0x49/0x250 drivers/gpio/gpiolib.c:477
 device_release+0x9f/0x240 drivers/base/core.c:2055
 kobject_cleanup lib/kobject.c:705 [inline]
 kobject_release lib/kobject.c:736 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x540 lib/kobject.c:753
 put_device+0x1b/0x30 drivers/base/core.c:3283
 release_nodes+0x49b/0x8f0 drivers/base/devres.c:523
 devres_release_all+0x74/0xd0 drivers/base/devres.c:545
 __device_release_driver+0x3d2/0x6f0 drivers/base/dd.c:1160
 device_release_driver_internal drivers/base/dd.c:1187 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1210
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3363
 platform_device_del.part.0+0x1f/0x220 drivers/base/platform.c:783
 platform_device_del include/linux/err.h:41 [inline]
 platform_device_unregister+0x38/0x80 drivers/base/platform.c:821
 mfd_remove_devices_fn drivers/mfd/mfd-core.c:375 [inline]
 mfd_remove_devices_fn+0x166/0x1b0 drivers/mfd/mfd-core.c:357
 device_for_each_child_reverse+0x110/0x180 drivers/base/core.c:3526
 mfd_remove_devices+0x75/0xa0 drivers/mfd/mfd-core.c:391
 vprbrd_disconnect+0x43/0xf0 drivers/mfd/viperboard.c:111
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1156
 device_release_driver_internal drivers/base/dd.c:1187 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1210
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3363
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
 usb_disconnect.cold+0x27d/0x780 drivers/usb/core/hub.c:2218
 hub_port_connect drivers/usb/core/hub.c:5074 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x1c8a/0x42d0 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x15f0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0x82b/0x1120 kernel/workqueue.c:2423
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Modules linked in:
---[ end trace c9367f77087536d6 ]---
RIP: 0010:__list_del_entry_valid+0x1d/0xf0 lib/list_debug.c:42
Code: 48 8b 34 24 eb b4 0f 1f 80 00 00 00 00 48 b8 00 00 00 00 00 fc ff df 41 55 41 54 55 48 89 fd 48 83 c7 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 a0 00 00 00 48 89 ea 4c 8b 65 08 48 b8 00 00 00
RSP: 0018:ffffc90000ca7308 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff88814149e008 RCX: 0000000000000000
RDX: 00000000000000b3 RSI: ffffffff83e19360 RDI: 0000000000000598
RBP: 0000000000000590 R08: 0000000000000001 R09: ffffffff8ef7388f
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000590
R13: 0000000000000598 R14: ffff88814782ff20 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff7b003f068 CR3: 000000001b33c000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
