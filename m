Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9D44D91D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 20:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfFTSav (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 14:30:51 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56473 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfFTSat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 14:30:49 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E774CE0006;
        Thu, 20 Jun 2019 18:30:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] pinctrl: ocelot: fix pinmuxing for pins after 31
Date:   Thu, 20 Jun 2019 20:30:37 +0200
Message-Id: <20190620183037.29652-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620183037.29652-1-alexandre.belloni@bootlin.com>
References: <20190620183037.29652-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The actual layout for OCELOT_GPIO_ALT[01] when there are more than 32 pins
is interleaved, i.e. OCELOT_GPIO_ALT0[0], OCELOT_GPIO_ALT1[0],
OCELOT_GPIO_ALT0[1], OCELOT_GPIO_ALT1[1]. Introduce a new REG_ALT macro to
facilitate the register offset calculation and use it where necessary.

Fixes: da801ab56ad8 pinctrl: ocelot: add MSCC Jaguar2 support
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index d2478db975bd..fb76fb2e9ea5 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -396,7 +396,7 @@ static int ocelot_pin_function_idx(struct ocelot_pinctrl *info,
 	return -1;
 }
 
-#define REG(r, info, p) ((r) * (info)->stride + (4 * ((p) / 32)))
+#define REG_ALT(msb, info, p) (OCELOT_GPIO_ALT0 * (info)->stride + 4 * ((msb) + ((info)->stride * ((p) / 32))))
 
 static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int selector, unsigned int group)
@@ -412,19 +412,21 @@ static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
 
 	/*
 	 * f is encoded on two bits.
-	 * bit 0 of f goes in BIT(pin) of ALT0, bit 1 of f goes in BIT(pin) of
-	 * ALT1
+	 * bit 0 of f goes in BIT(pin) of ALT[0], bit 1 of f goes in BIT(pin) of
+	 * ALT[1]
 	 * This is racy because both registers can't be updated at the same time
 	 * but it doesn't matter much for now.
 	 */
-	regmap_update_bits(info->map, REG(OCELOT_GPIO_ALT0, info, pin->pin),
+	regmap_update_bits(info->map, REG_ALT(0, info, pin->pin),
 			   BIT(p), f << p);
-	regmap_update_bits(info->map, REG(OCELOT_GPIO_ALT1, info, pin->pin),
+	regmap_update_bits(info->map, REG_ALT(1, info, pin->pin),
 			   BIT(p), f << (p - 1));
 
 	return 0;
 }
 
+#define REG(r, info, p) ((r) * (info)->stride + (4 * ((p) / 32)))
+
 static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
 				     struct pinctrl_gpio_range *range,
 				     unsigned int pin, bool input)
@@ -445,9 +447,9 @@ static int ocelot_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int p = offset % 32;
 
-	regmap_update_bits(info->map, REG(OCELOT_GPIO_ALT0, info, offset),
+	regmap_update_bits(info->map, REG_ALT(0, info, offset),
 			   BIT(p), 0);
-	regmap_update_bits(info->map, REG(OCELOT_GPIO_ALT1, info, offset),
+	regmap_update_bits(info->map, REG_ALT(1, info, offset),
 			   BIT(p), 0);
 
 	return 0;
-- 
2.21.0

