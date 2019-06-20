Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A68FF4D91C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 20:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfFTSas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 14:30:48 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44453 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfFTSar (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 14:30:47 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6EAC1C0002;
        Thu, 20 Jun 2019 18:30:42 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] pinctrl: ocelot: fix gpio direction for pins after 31
Date:   Thu, 20 Jun 2019 20:30:36 +0200
Message-Id: <20190620183037.29652-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The third argument passed to REG is not the correct one and
ocelot_gpio_set_direction is not working for pins after 31. Fix that by
passing the pin number instead of the modulo 32 value.

Fixes: da801ab56ad8 pinctrl: ocelot: add MSCC Jaguar2 support
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 3b4ca52d2456..d2478db975bd 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -432,7 +432,7 @@ static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
 	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int p = pin % 32;
 
-	regmap_update_bits(info->map, REG(OCELOT_GPIO_OE, info, p), BIT(p),
+	regmap_update_bits(info->map, REG(OCELOT_GPIO_OE, info, pin), BIT(p),
 			   input ? 0 : BIT(p));
 
 	return 0;
-- 
2.21.0

