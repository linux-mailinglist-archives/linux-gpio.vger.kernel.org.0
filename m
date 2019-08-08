Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502388630F
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 15:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732865AbfHHNZ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 09:25:58 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:59202 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732643AbfHHNZ6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Aug 2019 09:25:58 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id DCFF0A1749;
        Thu,  8 Aug 2019 15:25:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id UthFW26DoSIi; Thu,  8 Aug 2019 15:25:45 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios vs gpio)
Date:   Thu,  8 Aug 2019 15:25:43 +0200
Message-Id: <20190808132543.26274-2-sr@denx.de>
In-Reply-To: <20190808132543.26274-1-sr@denx.de>
References: <20190808132543.26274-1-sr@denx.de>
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

This patch now fixes this issue by iterating over all supported GPIO
suffixes by using the newly introduced for_each_gpio_suffix() helper.

Also, the string buffer is now allocated on the stack to avoid the
problem of allocation in a loop and its potential failure.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Pavel Machek <pavel@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/serial_mctrl_gpio.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index 2b400189be91..d444fdaa280a 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -15,6 +15,7 @@
 #include <linux/property.h>
 
 #include "serial_mctrl_gpio.h"
+#include "../../gpio/gpiolib.h"
 
 struct mctrl_gpios {
 	struct uart_port *port;
@@ -117,17 +118,24 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
 
 	for (i = 0; i < UART_GPIO_MAX; i++) {
 		enum gpiod_flags flags;
-		char *gpio_str;
+		const char *suffix;
+		char gpio_str[32];	/* 32 is max size of property name */
 		bool present;
+		int k;
+
+		/*
+		 * Check if GPIO property exists and continue if not. Iterate
+		 * over all supported GPIO suffixes (foo-gpios vs. foo-gpio).
+		 */
+		for_each_gpio_suffix(k, suffix) {
+			snprintf(gpio_str, sizeof(gpio_str), "%s-%s",
+				 mctrl_gpios_desc[i].name, suffix);
+
+			present = device_property_present(dev, gpio_str);
+			if (present)
+				break;
+		}
 
-		/* Check if GPIO property exists and continue if not */
-		gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
-				     mctrl_gpios_desc[i].name);
-		if (!gpio_str)
-			continue;
-
-		present = device_property_present(dev, gpio_str);
-		kfree(gpio_str);
 		if (!present)
 			continue;
 
-- 
2.22.0

