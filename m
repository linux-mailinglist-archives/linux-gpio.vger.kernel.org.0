Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18CC6C829E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 17:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCXQuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 12:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjCXQuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 12:50:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE5D10279
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 09:50:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfkc5-0001sG-4v; Fri, 24 Mar 2023 17:50:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfkc4-006QTy-Fw; Fri, 24 Mar 2023 17:50:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfkc3-007faP-Nw; Fri, 24 Mar 2023 17:49:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 2/2] pinctrl: mcp23s08: Implement gpio bulk functions
Date:   Fri, 24 Mar 2023 17:49:57 +0100
Message-Id: <20230324164957.485924-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324164957.485924-1-u.kleine-koenig@pengutronix.de>
References: <20230324164957.485924-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=F8r3COYlwj3Rj1J64pj+YOUb3QQUseyUN2mNsajV4VA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkHdS0UbUXHYFVX4UEoB4B5CCM0lwDkQq+c9ON2 HNqLjwsnB+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZB3UtAAKCRCPgPtYfRL+ TkdWCAC3QeidYcCxor19BjP9vzJlociDbm6AWisKzrkcpTQYMK3urepTaFqEYsEIdHrYVqSTkOd BRcYCQ+YpgkEa0CWSxxOE1xvUU3gyo2nEcKwRKzXgh1uI0PXiJJDOiHC4YsKIMpxmfesWmzbQuK mz49XKfKI5Ql8QgskAELYTmwRkSkiqb4WZ+4o1YtnHRnlsUWGKsruuI0GNydu41ZOo2bMOkwRlm 1r6+Z4a/2Q7/sZVF7QmM7Uqde9rGagUiKTFQlchLeINXZNK4CI31rqDWLfO4147pg6/kxpA1Wfq ey5xSjCyQ3KbXHa20kctnRp4kb3YvzDzIm4b30b5dHuCoCUb
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
 drivers/pinctrl/pinctrl-mcp23s08.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 79a41d418482..8ec7f2a3d009 100644
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
@@ -322,6 +344,16 @@ static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
 	mutex_unlock(&mcp->lock);
 }
 
+static void mcp23s08_set_multiple(struct gpio_chip *chip,
+				  unsigned long *mask, unsigned long *bits)
+{
+	struct mcp23s08	*mcp = gpiochip_get_data(chip);
+
+	mutex_lock(&mcp->lock);
+	mcp_update_bits(mcp, MCP_OLAT, *mask, *bits);
+	mutex_unlock(&mcp->lock);
+}
+
 static int
 mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 {
@@ -546,8 +578,10 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
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

