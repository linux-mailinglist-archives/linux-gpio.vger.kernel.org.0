Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397BC6C7F75
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 15:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbjCXODz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 10:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjCXODQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 10:03:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A357C25972
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 07:02:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfhzU-0001aU-9L; Fri, 24 Mar 2023 15:02:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfhzT-006Ojb-K6; Fri, 24 Mar 2023 15:01:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfhzS-007dc3-FO; Fri, 24 Mar 2023 15:01:58 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] pinctrl: mcp23s08: Implement gpio bulk functions
Date:   Fri, 24 Mar 2023 15:01:48 +0100
Message-Id: <20230324140148.479125-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324140148.479125-1-u.kleine-koenig@pengutronix.de>
References: <20230324140148.479125-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2185; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=62LfUIakJJJ2YZ7gjtGx+iWmcxQIpMH2UwuIMlZNL1U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkHa1L+C5RBUBPCN/1kWLebAmeFeAo2wkXiZjNz lfy7hyGlJmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZB2tSwAKCRCPgPtYfRL+ TqEKCACgokhDkniaA+d0l0H9JzbMFGVSQvQ/IDPVmQXdsCMkPm0yW7T5leg5MQmCVKH07fVE+gg 9BHy59HLERWUe/gLK7oa300n14yeWlvuKg8BjIHWD2r3RGRRoipe1i1EKw2xjxKuzDHybPo7ZkL Nl6U4MBaauh6je+oL2DQzTLx4tfXKM8Cf/vnMr9R6fjLYVI8hCV35nvSHcz8IlI6OHpLFIKoQuV VAXV2Qx8QkxNCjaxshzNEFZD/E6RgEride+aIbE/qWS9FG+frN8v4s7i7VMbCQ+S5PFOYEL3JOe 6/Ni3mV3HA6T7pRjBI4UwWao5ll83oskC4LofClu+4LmV9dH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To speed up some usecases implement reading and writing several IO lines
at once.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 79a41d418482..a447c77c7ebb 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -307,6 +307,28 @@ static int mcp23s08_get(struct gpio_chip *chip, unsigned offset)
 	return status;
 }
 
+static int mcp23s08_get_multiple(struct gpio_chip *chip,
+				 unsigned long *mask, unsigned long *bits)
+{
+	struct mcp23s08 *mcp = gpiochip_get_data(chip);
+	unsigned int status;
+	int ret;
+
+	mutex_lock(&mcp->lock);
+
+	/* REVISIT reading this clears any IRQ ... */
+	ret = mcp_read(mcp, MCP_GPIO, &status);
+	if (ret < 0)
+		status = 0;
+	else {
+		mcp->cached_gpio = status;
+		*bits = status;
+	}
+
+	mutex_unlock(&mcp->lock);
+	return ret;
+}
+
 static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, bool value)
 {
 	return mcp_update_bits(mcp, MCP_OLAT, mask, value ? mask : 0);
@@ -322,6 +344,17 @@ static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
 	mutex_unlock(&mcp->lock);
 }
 
+static void mcp23s08_set_multiple(struct gpio_chip *chip,
+				  unsigned long *mask, unsigned long *bits)
+{
+	struct mcp23s08	*mcp = gpiochip_get_data(chip);
+	int ret;
+
+	mutex_lock(&mcp->lock);
+	mcp_update_bits(mcp, MCP_OLAT, *mask, *bits);
+	mutex_unlock(&mcp->lock);
+}
+
 static int
 mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 {
@@ -546,8 +579,10 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 	mcp->chip.direction_input = mcp23s08_direction_input;
 	mcp->chip.get = mcp23s08_get;
+	mcp->chip.get_multiple = mcp23s08_get_multiple;
 	mcp->chip.direction_output = mcp23s08_direction_output;
 	mcp->chip.set = mcp23s08_set;
+	mcp->chip.set_multiple = mcp23s08_set_multiple;
 
 	mcp->chip.base = base;
 	mcp->chip.can_sleep = true;
-- 
2.39.2

