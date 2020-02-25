Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D925216BD4E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 10:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbgBYJbN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 04:31:13 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34445 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgBYJbM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Feb 2020 04:31:12 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j6WYW-0002LE-E6; Tue, 25 Feb 2020 10:31:08 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j6WYV-0005TJ-Oi; Tue, 25 Feb 2020 10:31:07 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     sfr@canb.auug.org.au, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-next@vger.kernel.org, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpiolib: export gpiochip_get_desc
Date:   Tue, 25 Feb 2020 10:31:02 +0100
Message-Id: <20200225093102.10964-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The function was currently used internal by the gpiolib. Since commit
56cc3af4e8c8 ("pinctrl: da9062: add driver support") it is also used by
drivers so we need to export the symbol.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi,

This commit needs to be applied to address the build failure reported by
Stephen [1].

[1] https://lkml.org/lkml/2020/2/24/1446

 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 753283486037..1dbd0e6d240b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -149,6 +149,7 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip,
 
 	return &gdev->descs[hwnum];
 }
+EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 
 /**
  * desc_to_gpio - convert a GPIO descriptor to the integer namespace
-- 
2.20.1

