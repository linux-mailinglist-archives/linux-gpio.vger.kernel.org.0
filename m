Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61B27166D8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 17:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbjE3PUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 11:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjE3PUB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 11:20:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004F1C7
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 08:19:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418d-0007zo-KT; Tue, 30 May 2023 17:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418c-003uGd-Rf; Tue, 30 May 2023 17:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418c-009XZr-3I; Tue, 30 May 2023 17:19:54 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 2/2] gpio: use "active" and "inactive" instead of "high" and "low" for output hogs
Date:   Tue, 30 May 2023 17:19:46 +0200
Message-Id: <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3058; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Yoi9sBfxb0uzWxhgrLD44cP0kUh/d8G1Lh3lvWfk9kE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdhQIXsP2lYiN07PCH5OhLm2OdSJd/Fkdk2m5z zNUiWcYrouJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHYUCAAKCRCPgPtYfRL+ TmDICACSpb9nDBVDSD1OGXKa2UcOwpkofum2+A3F9MAMUZdkex09vZ151HsiQ/U4+ujsbFBvIUr kmWsotTNdh2coEmGORPExRzgHxn1NYwZPM4KV2010jq56WdTNq7g8byD5nXJdm3fxI0h3a/wTpE Ic1RmJmaXtvhmEyhQaHKSNb+TVp3OlMqzS9+gHc5de1Mm2oSm4XyrB9NLKm3cVeN5uvi4bRBUvC J3QJFxkl7TKlqh3k3GiB0Zat1ydgZwejnjmRvbvMh8JpR32tUbuvJA2XbapF1SB4sZaIZajz7Dk gIa7Ixj0UWUVrfS6SWZPVa378KjJzQWwDlVmNihzsNSpzwbK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

So use the terms "active" and "inactive" which are less ambigous and
keep the old names as synonyms. The above example can now be written as:

	someline {
		gpio-hog;
		gpios = <24 GPIO_ACTIVE_LOW>;
		output-active;
	}

where it is less surprising that the output is set to a low level.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c     | 10 ++++++++--
 include/linux/gpio/consumer.h | 14 ++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 1436cdb5fa26..45fc1e4dbc40 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -698,10 +698,16 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	if (of_property_read_bool(np, "input"))
 		*dflags |= GPIOD_IN;
+	else if (of_property_read_bool(np, "output-inactive"))
+		*dflags |= GPIOD_OUT_INACTIVE;
+	else if (of_property_read_bool(np, "output-active"))
+		*dflags |= GPIOD_OUT_ACTIVE;
 	else if (of_property_read_bool(np, "output-low"))
-		*dflags |= GPIOD_OUT_LOW;
+		/* misleading alias for output-deasserted */
+		*dflags |= GPIOD_OUT_INACTIVE;
 	else if (of_property_read_bool(np, "output-high"))
-		*dflags |= GPIOD_OUT_HIGH;
+		/* misleading alias for output-asserted */
+		*dflags |= GPIOD_OUT_ACTIVE;
 	else {
 		pr_warn("GPIO line %d (%pOFn): no hogging state specified, bailing out\n",
 			desc_to_gpio(desc), np);
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 1c4385a00f88..3e953a1960f4 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -47,11 +47,17 @@ struct gpio_descs {
 enum gpiod_flags {
 	GPIOD_ASIS	= 0,
 	GPIOD_IN	= GPIOD_FLAGS_BIT_DIR_SET,
-	GPIOD_OUT_LOW	= GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT,
-	GPIOD_OUT_HIGH	= GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT |
+	GPIOD_OUT_INACTIVE = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT,
+	GPIOD_OUT_ACTIVE = GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT |
 			  GPIOD_FLAGS_BIT_DIR_VAL,
-	GPIOD_OUT_LOW_OPEN_DRAIN = GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_OPEN_DRAIN,
-	GPIOD_OUT_HIGH_OPEN_DRAIN = GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_OPEN_DRAIN,
+	GPIOD_OUT_INACTIVE_OPEN_DRAIN = GPIOD_OUT_INACTIVE | GPIOD_FLAGS_BIT_OPEN_DRAIN,
+	GPIOD_OUT_ACTIVE_OPEN_DRAIN = GPIOD_OUT_ACTIVE | GPIOD_FLAGS_BIT_OPEN_DRAIN,
+
+	/* old names that are confusing in combination with active-low GPIOs */
+	GPIOD_OUT_LOW = GPIOD_OUT_INACTIVE,
+	GPIOD_OUT_HIGH = GPIOD_OUT_ACTIVE,
+	GPIOD_OUT_LOW_OPEN_DRAIN = GPIOD_OUT_INACTIVE_OPEN_DRAIN,
+	GPIOD_OUT_HIGH_OPEN_DRAIN = GPIOD_OUT_ACTIVE_OPEN_DRAIN,
 };
 
 #ifdef CONFIG_GPIOLIB
-- 
2.39.2

