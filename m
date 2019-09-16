Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8067FB3BB2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 15:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbfIPNoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 09:44:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37809 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbfIPNoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Sep 2019 09:44:00 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rIG-00074g-Si; Mon, 16 Sep 2019 15:43:52 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rIE-000156-Ss; Mon, 16 Sep 2019 15:43:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        m.szyprowski@samsung.com, ckeepax@opensource.cirrus.com,
        broonie@kernel.org
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] gpio: fix getting nonexclusive gpiods from DT
Date:   Mon, 16 Sep 2019 15:43:44 +0200
Message-Id: <20190916134344.26656-1-m.felsch@pengutronix.de>
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

Since commit ec757001c818 ("gpio: Enable nonexclusive gpiods from DT
nodes") we are able to get GPIOD_FLAGS_BIT_NONEXCLUSIVE marked gpios.
Currently the gpiolib uses the wrong flags variable for the check. We
need to check the gpiod_flags instead of the of_gpio_flags else we
return -EBUSY for GPIOD_FLAGS_BIT_NONEXCLUSIVE marked and requested
gpiod's.

Fixes: ec757001c818 gpio: Enable nonexclusive gpiods from DT nodes
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d9074191edef..e4203c1eb869 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4303,7 +4303,7 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
 	transitory = flags & OF_GPIO_TRANSITORY;
 
 	ret = gpiod_request(desc, label);
-	if (ret == -EBUSY && (flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
+	if (ret == -EBUSY && (dflags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
 		return desc;
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.20.1

