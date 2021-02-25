Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC743253FA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbhBYQt6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:49:58 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:46477 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbhBYQsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:48:05 -0500
Received: by mail-io1-f71.google.com with SMTP id w8so4103324iox.13
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2021 08:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HjVoCCLqQ5aLObIxnLkQto/2AeI+2Rp4Wsj6msR1kdQ=;
        b=jNoT2us5OjdVmnJgqXQA14DhMhHHeFqK+EtKl5FAKlxEbGStyut91wtmkbB3ELPr0D
         UwwNuHYdSk1VWfORlBJwpMjXSKIWZ3+8XoNM05mykt3C8uKhh7LvO5VRk1OtwU0hcPsI
         F2QhWZMPzZfecMzFRuH/h1LyH54BgHvJQgfnHx1AtVxqhzQOcFhwVIASo2QXHKDdZCP0
         1k01XEUyq0eyv1l+A+7rEWuma6s8zC3Bus4h041I8j/ZTE7CtNJ6x9bcBhxj8rstQjN5
         pFIra/nr6DET/NYpa7O0tSqGm/1AG4D2UBk6zYZWmN+NEfbGhaCNxr4IeBDby59r23Ak
         c03g==
X-Gm-Message-State: AOAM531caP3BGkO6hj3pSmGq0wUH1DFFWBQ2H4eUq0lLVBPwlsWsBOtM
        6v3BrNstz7aNqTMG7BhmsXT7qJr2huxTlGnFZyxQ4n2u2v1d
X-Google-Smtp-Source: ABdhPJxe1vtc7hJJ7AA0bC4wpgRxM2msPbG4JXKPLog1i6tDpoCBLDmsW4tXqjzybcTwmC+pk9CzFbsUTzvvrZs6EzvKwPa11VLd
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3bb:: with SMTP id z27mr4020048jap.29.1614271643291;
 Thu, 25 Feb 2021 08:47:23 -0800 (PST)
Date:   Thu, 25 Feb 2021 08:47:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000de96a905bc2be7a6@google.com>
Subject: general protection fault in kobject_cleanup
From:   syzbot <syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com>
To:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    719bbd4a Merge tag 'vfio-v5.12-rc1' of git://github.com/aw..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149ff9b6d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd38148e4aa89cdb
dashboard link: https://syzkaller.appspot.com/bug?extid=d27b4c8adbbff70fbfde
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146af9ccd00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11c59e32d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d27b4c8adbbff70fbfde@syzkaller.appspotmail.com

usb 1-1: USB disconnect, device number 2
general protection fault, probably for non-canonical address 0xdffffc00000000b3: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000598-0x000000000000059f]
CPU: 1 PID: 2922 Comm: kworker/1:2 Not tainted 5.11.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:__list_del_entry_valid+0x1f/0x100 lib/list_debug.c:42
Code: fd 0f 0b 0f 1f 84 00 00 00 00 00 41 57 41 56 41 54 53 49 89 fe 49 bc 00 00 00 00 00 fc ff df 48 83 c7 08 48 89 f8 48 c1 e8 03 <42> 80 3c 20 00 74 05 e8 05 81 ec fd 4d 8b 7e 08 4c 89 f0 48 c1 e8
RSP: 0018:ffffc900014ef318 EFLAGS: 00010202
RAX: 00000000000000b3 RBX: 0000000000000000 RCX: ffff88801acb1bc0
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000598
RBP: dffffc0000000000 R08: dffffc0000000000 R09: fffffbfff1f28ab6
R10: fffffbfff1f28ab6 R11: 0000000000000000 R12: dffffc0000000000
R13: dffffc0000000000 R14: 0000000000000590 R15: 1ffff110023f3601
FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004d5800 CR3: 000000000c48e000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __list_del_entry include/linux/list.h:132 [inline]
 list_del include/linux/list.h:146 [inline]
 gpiodevice_release+0x48/0x1b0 drivers/gpio/gpiolib.c:479
 device_release+0x98/0x1c0 drivers/base/core.c:2104
 kobject_cleanup+0x1c9/0x280 lib/kobject.c:705
 ftdi_gpio_remove drivers/usb/serial/ftdi_sio.c:2215 [inline]
 ftdi_sio_port_remove+0x8b/0x2f0 drivers/usb/serial/ftdi_sio.c:2407
 usb_serial_device_remove+0x126/0x1f0 drivers/usb/serial/bus.c:97
 __device_release_driver drivers/base/dd.c:1156 [inline]
 device_release_driver_internal+0x51e/0x7b0 drivers/base/dd.c:1187
 bus_remove_device+0x300/0x420 drivers/base/bus.c:533
 device_del+0x5e1/0xa90 drivers/base/core.c:3421
 usb_serial_disconnect+0x294/0x3c0 drivers/usb/serial/usb-serial.c:1102
 usb_unbind_interface+0x1f2/0x860 drivers/usb/core/driver.c:458
 __device_release_driver drivers/base/dd.c:1156 [inline]
 device_release_driver_internal+0x51e/0x7b0 drivers/base/dd.c:1187
 bus_remove_device+0x300/0x420 drivers/base/bus.c:533
 device_del+0x5e1/0xa90 drivers/base/core.c:3421
 usb_disable_device+0x407/0x800 drivers/usb/core/message.c:1413
 usb_disconnect+0x33a/0x8a0 drivers/usb/core/hub.c:2218
 hub_port_connect+0x214/0x25b0 drivers/usb/core/hub.c:5074
 hub_port_connect_change+0x5c6/0xab0 drivers/usb/core/hub.c:5363
 port_event+0xa6f/0x10b0 drivers/usb/core/hub.c:5509
 hub_event+0x417/0xcb0 drivers/usb/core/hub.c:5591


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
