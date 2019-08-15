Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED6C68E776
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 10:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730029AbfHOIxs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 04:53:48 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:13182 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730004AbfHOIxs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Aug 2019 04:53:48 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id CB9C1A110F;
        Thu, 15 Aug 2019 10:53:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id bKwNenchx4uj; Thu, 15 Aug 2019 10:53:42 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-serial@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] serial: mctrl_gpio: Support all GPIO suffixes (gpios vs gpio)
Date:   Thu, 15 Aug 2019 10:53:41 +0200
Message-Id: <20190815085341.28088-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch fixes a backward compatibility issue, when boards use the
old style GPIO suffix "-gpio" instead of the new "-gpios". This
potential problem has been introduced by commit d99482673f95 ("serial:
mctrl_gpio: Check if GPIO property exisits before requesting it").

This patch now fixes this issue by using gpiod_count() which iterates
over all supported GPIO suffixes (thanks to Linus for suggesting this).

With this change, the local string is not needed any more. This way
we can remove the allocation in the loop.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Pavel Machek <pavel@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2
- Use gpiod_count() to check if the GPIO exists (Linus)
- Remove the now unnecessary malloc in the loop (kasprintf)

 drivers/tty/serial/serial_mctrl_gpio.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index 2b400189be91..ce73b142c66b 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -117,18 +117,11 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
 
 	for (i = 0; i < UART_GPIO_MAX; i++) {
 		enum gpiod_flags flags;
-		char *gpio_str;
-		bool present;
+		int count;
 
 		/* Check if GPIO property exists and continue if not */
-		gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
-				     mctrl_gpios_desc[i].name);
-		if (!gpio_str)
-			continue;
-
-		present = device_property_present(dev, gpio_str);
-		kfree(gpio_str);
-		if (!present)
+		count = gpiod_count(dev, mctrl_gpios_desc[i].name);
+		if (count <= 0)
 			continue;
 
 		if (mctrl_gpios_desc[i].dir_out)
-- 
2.22.1

