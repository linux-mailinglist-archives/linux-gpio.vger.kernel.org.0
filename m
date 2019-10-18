Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4A2DC20D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 12:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633217AbfJRKFk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 06:05:40 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39221 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfJRKFk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 06:05:40 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iLP8c-0001ZV-Na; Fri, 18 Oct 2019 12:05:38 +0200
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Subject: [PATCH] gpio: of: don't warn if ignored GPIO flag matches the behavior
Date:   Fri, 18 Oct 2019 12:05:38 +0200
Message-Id: <20191018100538.9137-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some devicetrees specify the ACTIVE_LOW flag in the fixed regulator GPIO
handle. While this has always been ignored, it's consistent with the
behavior of the regulator binding in the absence of the
"enable-active-high" DT property. It doesn't make much sense to print a
user visible warning for a configuration which is consistent, so only
print the warning if the GPIO flag contradicts the behavior dictated by
by the enable-active-high property.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpio/gpiolib-of.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 1eea2c6c2e1d..0b5383706b91 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -134,18 +134,20 @@ static void of_gpio_flags_quirks(struct device_node *np,
 	     (!(strcmp(propname, "enable-gpio") &&
 		strcmp(propname, "enable-gpios")) &&
 	      of_device_is_compatible(np, "regulator-gpio")))) {
+		bool active_low =
+			!of_property_read_bool(np, "enable-active-high");
 		/*
 		 * The regulator GPIO handles are specified such that the
 		 * presence or absence of "enable-active-high" solely controls
 		 * the polarity of the GPIO line. Any phandle flags must
 		 * be actively ignored.
 		 */
-		if (*flags & OF_GPIO_ACTIVE_LOW) {
+		if ((*flags & OF_GPIO_ACTIVE_LOW) && !active_low) {
 			pr_warn("%s GPIO handle specifies active low - ignored\n",
 				of_node_full_name(np));
 			*flags &= ~OF_GPIO_ACTIVE_LOW;
 		}
-		if (!of_property_read_bool(np, "enable-active-high"))
+		if (active_low)
 			*flags |= OF_GPIO_ACTIVE_LOW;
 	}
 	/*
-- 
2.20.1

