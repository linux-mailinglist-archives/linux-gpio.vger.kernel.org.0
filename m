Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B924737223A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 23:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhECVHJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 17:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhECVHJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 17:07:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0770CC061573
        for <linux-gpio@vger.kernel.org>; Mon,  3 May 2021 14:06:16 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ldfle-0005z9-2B; Mon, 03 May 2021 23:06:14 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ldfld-00041C-Oj; Mon, 03 May 2021 23:06:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] gpio: use "asserted" and "deasserted" instead of "high" and "low"
Date:   Mon,  3 May 2021 23:05:28 +0200
Message-Id: <20210503210526.43455-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For active-low GPIOs the currently available nomenclature requires
regular explaination to the non-enlightened folks, e.g. because a hog
defined as:

	someline {
		gpio-hog;
		gpios = <24 GPIO_ACTIVE_LOW>;
		output-high;
	}

results in the line being set to the physical low level.

So use the terms "asserted" and "deasserted" which are less ambigous and
keep the old names as synonyms. The above example can now be written as:

	someline {
		gpio-hog;
		gpios = <24 GPIO_ACTIVE_LOW>;
		output-asserted;
	}

where it is less surprising that the output is set to a low level.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c     | 10 ++++++++--
 include/linux/gpio/consumer.h | 14 ++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index baf0153b7bca..89e852da6a61 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -624,10 +624,16 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	if (of_property_read_bool(np, "input"))
 		*dflags |= GPIOD_IN;
+	else if (of_property_read_bool(np, "output-deasserted"))
+		*dflags |= GPIOD_OUT_DEASSERTED;
+	else if (of_property_read_bool(np, "output-asserted"))
+		*dflags |= GPIOD_OUT_ASSERTED;
 	else if (of_property_read_bool(np, "output-low"))
-		*dflags |= GPIOD_OUT_LOW;
+		/* misleading alias for output-deasserted */
+		*dflags |= GPIOD_OUT_DEASSERTED;
 	else if (of_property_read_bool(np, "output-high"))
-		*dflags |= GPIOD_OUT_HIGH;
+		/* misleading alias for output-asserted */
+		*dflags |= GPIOD_OUT_ASSERTED;
 	else {
 		pr_warn("GPIO line %d (%pOFn): no hogging state specified, bailing out\n",
 			desc_to_gpio(desc), np);
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index c73b25bc9213..b40cc19cf419 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -49,11 +49,17 @@ struct gpio_descs {
 enum gpiod_flags {
 	GPIOD_ASIS	= 0,
 	GPIOD_IN	= GPIOD_FLAGS_BIT_DIR_SET,
-	GPIOD_OUT_LOW	= GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT,
-	GPIOD_OUT_HIGH	= GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT |
+	GPIOD_OUT_DEASSERTED = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT,
+	GPIOD_OUT_ASSERTED = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT |
 			  GPIOD_FLAGS_BIT_DIR_VAL,
-	GPIOD_OUT_LOW_OPEN_DRAIN = GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_OPEN_DRAIN,
-	GPIOD_OUT_HIGH_OPEN_DRAIN = GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_OPEN_DRAIN,
+	GPIOD_OUT_DEASSERTED_OPEN_DRAIN = GPIOD_OUT_DEASSERTED | GPIOD_FLAGS_BIT_OPEN_DRAIN,
+	GPIOD_OUT_ASSERTED_OPEN_DRAIN = GPIOD_OUT_ASSERTED | GPIOD_FLAGS_BIT_OPEN_DRAIN,
+
+	/* old names that are confusing in combination with active-low GPIOs */
+	GPIOD_OUT_LOW = GPIOD_OUT_DEASSERTED,
+	GPIOD_OUT_HIGH = GPIOD_OUT_ASSERTED,
+	GPIOD_OUT_LOW_OPEN_DRAIN = GPIOD_OUT_DEASSERTED_OPEN_DRAIN,
+	GPIOD_OUT_HIGH_OPEN_DRAIN = GPIOD_OUT_ASSERTED_OPEN_DRAIN,
 };
 
 #ifdef CONFIG_GPIOLIB
-- 
2.30.2

