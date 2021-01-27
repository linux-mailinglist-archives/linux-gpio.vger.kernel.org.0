Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570393058CA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhA0Ktq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235986AbhA0KrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 05:47:17 -0500
Received: from forward106j.mail.yandex.net (forward106j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD398C061573;
        Wed, 27 Jan 2021 02:46:30 -0800 (PST)
Received: from iva7-77076e19dd85.qloud-c.yandex.net (iva7-77076e19dd85.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:2ead:0:640:7707:6e19])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id 7FDEB11A0643;
        Wed, 27 Jan 2021 13:46:27 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva7-77076e19dd85.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 8U1XPbnwzw-kRHKF6ox;
        Wed, 27 Jan 2021 13:46:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744387;
        bh=+ZwTYzQu6mbwzwqaeNm7UNbTYzt0QGNc+lzqE2N5MNA=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=T+p/uPgU/EYSMdfAZYeFDczxxIz7X4rmibUSudh5yUA/PK3MzdoQsKb/MRdhEcsuk
         9yzuKUb4YT/lxW0bRj56AYoVbeoyySZ6Jd71ySDBCaJhr2+vdIe4ByrVjxhCZN4zB2
         qMDn2FDfIgr06qQ6g/atJ7LTToSfBxVc0FZpppcw=
Authentication-Results: iva7-77076e19dd85.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kQm85vQS;
        Wed, 27 Jan 2021 13:46:26 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] gpio: ep93xx: fix BUG_ON port F usage
Date:   Wed, 27 Jan 2021 13:46:09 +0300
Message-Id: <20210127104617.1173-2-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127104617.1173-1-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
 <20210127104617.1173-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The port F is actually index 2 not 5 as it is calculated 
by ep93xx_gpio_port.

Looks like it happened because of the confusing ep93xx_gpio_banks 
table that shows like port F is having index 5, but is actually 
index 2 if we rely on .base instead of index position.

------------[ cut here ]------------
kernel BUG at drivers/gpio/gpio-ep93xx.c:64!
Internal error: Oops - BUG: 0 [#1] ARM
Modules linked in:
CPU: 0 PID: 403 Comm: gpio-event-mon Not tainted 5.9.10-00011-ge93e9618628b-dirty #19
Hardware name: Technologic Systems TS-72xx SBC
PC is at ep93xx_gpio_update_int_params+0x1c/0x80
LR is at ep93xx_gpio_update_int_params+0x14/0x80
pc : [<c03abc44>] lr : [<c03abc3c>] psr: 20000093
sp : c158de00 ip : 00000000 fp : 00000001
r10: c44154d4 r9 : 00000000 r8 : c4415020
r7 : c04ef884 r6 : c051c842 r5 : c4415020 r4 : 00000005
r3 : 00000000 r2 : 00000000 r1 : c04eb768 r0 : 00000008
Flags: nzCv IRQs off FIQs on Mode SVC_32 ISA ARM Segment none
Control: 0000717f Table: 01684000 DAC: 00000051
Process gpio-event-mon (pid: 403, stack limit = 0x(ptrval))
Stack: (0xc158de00 to 0xc158e000)
de00: 00000005 00000002 c051c842 c0238dc0 c0238c98 c0238c98 c04ef874 00000000
de20: 00000003 c04fcfcc 60000013 c04ef910 c04ef8d4 c00456f0 c04ef874 c15f1e00
de40: 00000000 00000000 00000001 c0045d40 c15f1e00 c4400160 c0044ca8 c04ef8a8
de60: 60000013 00000000 c15f1e00 c04ef874 c04ef884 00000001 c0235d70 c158b800
de80: be825f0f c0045ec8 00000003 c158b800 c440aa00 be825bc8 00000003 00000001
dea0: 00000000 c0236f00 c44ed3a0 c158b800 c45c2015 00000000 00000001 00000003
dec0: 6f697067 6576652d 6d2d746e 00006e6f 00000000 00000000 00000000 00000000
dee0: be825df4 c00abb0c c440c500 c00aabd4 c440c500 c528b840 c45c2010 c04e1228
df00: 00000ff0 c4478d28 c030b404 be825bc8 c1550e20 00000003 c1550e20 c00c3388
df20: c4478d28 c00c3d48 be825f0f c00abd00 c45c2000 c45c2000 c1550e20 c00bfea8
df40: 00000003 c00b0714 00000000 c4450000 00000004 00000100 00000001 c04e1228
df60: c158dfb0 ffffff9c 000231f8 00000003 00000142 c00b085c 00000000 c04e1228
df80: 00000000 be825f0f 00000003 00000003 00000036 c00083c4 c158c000 00000000
dfa0: be825f0f c00081e0 be825f0f 00000003 00000003 c030b404 be825bc8 00000000
dfc0: be825f0f 00000003 00000003 00000036 00000001 00000000 00022070 be825f0f
dfe0: b6f2e4e0 be825bac 00010acc b6f2e4ec 60000010 00000003 00000000 00000000
[<c03abc44>] (ep93xx_gpio_update_int_params) from [<c0238dc0>] (ep93xx_gpio_irq_type+0x128/0x1c0)
[<c0238dc0>] (ep93xx_gpio_irq_type) from [<c00456f0>] (__irq_set_trigger+0x6c/0x128)
[<c00456f0>] (__irq_set_trigger) from [<c0045d40>] (__setup_irq+0x594/0x678)
[<c0045d40>] (__setup_irq) from [<c0045ec8>] (request_threaded_irq+0xa4/0x128)
[<c0045ec8>] (request_threaded_irq) from [<c0236f00>] (gpio_ioctl+0x300/0x4d8)
[<c0236f00>] (gpio_ioctl) from [<c00c3388>] (vfs_ioctl+0x24/0x3c)
[<c00c3388>] (vfs_ioctl) from [<c00c3d48>] (sys_ioctl+0xbc/0x768)
[<c00c3d48>] (sys_ioctl) from [<c00081e0>] (ret_fast_syscall+0x0/0x50)
Exception stack(0xc158dfa8 to 0xc158dff0)
dfa0: be825f0f 00000003 00000003 c030b404 be825bc8 00000000
dfc0: be825f0f 00000003 00000003 00000036 00000001 00000000 00022070 be825f0f
dfe0: b6f2e4e0 be825bac 00010acc b6f2e4ec
Code: e59f0060 ebfff3e1 e3540002 9a000000 (e7f001f2)
---[ end trace 3f6544e133e9f5ae ]---

Fixes: fd935fc421e74 ("gpio: ep93xx: Do not pingpong irq numbers")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 226da8df6f10..0d0435c07a5a 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -39,6 +39,12 @@ struct ep93xx_gpio {
 	struct gpio_chip	gc[8];
 };
 
+/*
+ * F Port index in GPIOCHIP'S array is 5
+ * but we use index 2 for stored values and offsets
+ */
+#define EP93XX_GPIO_F_PORT_INDEX 5
+
 /*************************************************************************
  * Interrupt handling for EP93xx on-chip GPIOs
  *************************************************************************/
@@ -85,6 +91,9 @@ static int ep93xx_gpio_port(struct gpio_chip *gc)
 		return 0;
 	}
 
+	if (port == EP93XX_GPIO_F_PORT_INDEX)
+		port = 2;
+
 	return port;
 }
 
-- 
2.29.2

