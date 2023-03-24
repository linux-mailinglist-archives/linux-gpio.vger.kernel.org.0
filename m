Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EC46C7F74
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 15:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjCXODz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 10:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbjCXODQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 10:03:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4111B1B566
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 07:02:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfhzT-0001aI-0K; Fri, 24 Mar 2023 15:01:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfhzR-006OjW-VK; Fri, 24 Mar 2023 15:01:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfhzR-007dbX-Db; Fri, 24 Mar 2023 15:01:57 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] pinctrl: mcp23s08: Rename and change function that wraps regmap_update_bits()
Date:   Fri, 24 Mar 2023 15:01:47 +0100
Message-Id: <20230324140148.479125-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JrfoQzGUvDct0oV0HRenLavBh2moq7myR4OF0F6611g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkHa1KPcxbavTuD23ALPFKQ4KapTjVabgNwkaB8 4BsjGtLw4GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZB2tSgAKCRCPgPtYfRL+ TnG/B/0fkHd3uNalN04FrscGDC0IXchsDYi9YmfM2V2G6UXNX/Y6P3tJdFtyyY6ux4HbSigmLE1 Se5O/h7ugu65Z/MBFAzyqKjjEH+ijlU2Is0fsZ8DX0ID2+5zzG2pIUvRbBS/SNrgZSzqvaMctqq oxfyszAMZLOFZm4Pv9WCBn24RAjAxD+b9051mrYlhKWaZ61wTfHDdzYvMXr53JkBtlMplNK4ukQ HTTrS5bSRiRyrMsOUS0okJQIpwnFh+THydPiZeMft+t+m58vn+OYUCe51QOdY2i73gguXoc+CiG DjSHyY297NkVtcUo1ygs6hyHrbujgQRJaenxg7TEw4YN9cyF
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

The semantic of mcp_set_mask() was surprising to me when I first read
that driver. So it was unexpected that in the call

	mcp_set_mask(mcp, MCP_OLAT, mask, value);

value was a bool. Make the function a thinner wrapper around
regmap_update_bits() and rename it to also have a similar name.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 5f356edfd0fd..79a41d418482 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -144,10 +144,9 @@ static int mcp_write(struct mcp23s08 *mcp, unsigned int reg, unsigned int val)
 	return regmap_write(mcp->regmap, reg << mcp->reg_shift, val);
 }
 
-static int mcp_set_mask(struct mcp23s08 *mcp, unsigned int reg,
-		       unsigned int mask, bool enabled)
+static int mcp_update_bits(struct mcp23s08 *mcp, unsigned int reg,
+			   unsigned int mask, unsigned int val)
 {
-	u16 val  = enabled ? 0xffff : 0x0000;
 	return regmap_update_bits(mcp->regmap, reg << mcp->reg_shift,
 				  mask, val);
 }
@@ -156,7 +155,7 @@ static int mcp_set_bit(struct mcp23s08 *mcp, unsigned int reg,
 		       unsigned int pin, bool enabled)
 {
 	u16 mask = BIT(pin);
-	return mcp_set_mask(mcp, reg, mask, enabled);
+	return mcp_update_bits(mcp, reg, mask, enabled ? mask : 0);
 }
 
 static const struct pinctrl_pin_desc mcp23x08_pins[] = {
@@ -310,7 +309,7 @@ static int mcp23s08_get(struct gpio_chip *chip, unsigned offset)
 
 static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, bool value)
 {
-	return mcp_set_mask(mcp, MCP_OLAT, mask, value);
+	return mcp_update_bits(mcp, MCP_OLAT, mask, value ? mask : 0);
 }
 
 static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
@@ -333,7 +332,7 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 	mutex_lock(&mcp->lock);
 	status = __mcp23s08_set(mcp, mask, value);
 	if (status == 0) {
-		status = mcp_set_mask(mcp, MCP_IODIR, mask, false);
+		status = mcp_update_bits(mcp, MCP_IODIR, mask, 0);
 	}
 	mutex_unlock(&mcp->lock);
 	return status;

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

