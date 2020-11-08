Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8162AACD6
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Nov 2020 19:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgKHSkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Nov 2020 13:40:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHSkS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Nov 2020 13:40:18 -0500
X-Greylist: delayed 2294 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 Nov 2020 10:40:17 PST
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A543AC0613CF
        for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2020 10:40:17 -0800 (PST)
Received: from dslb-084-059-242-201.084.059.pools.vodafone-ip.de ([84.59.242.201] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1kbp0n-00025g-Fz; Sun, 08 Nov 2020 19:01:57 +0100
From:   Martin Kaiser <martin@kaiser.cx>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] pinctrl: pinctrl-at91-pio4: Set irq handler and data in one go
Date:   Sun,  8 Nov 2020 19:01:44 +0100
Message-Id: <20201108180144.28594-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the two separate calls for setting the irq handler and data with a
single irq_set_chained_handler_and_data() call.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 578b387100d9..157fea808629 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1127,8 +1127,8 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 		atmel_pioctrl->irqs[i] = res->start;
-		irq_set_chained_handler(res->start, atmel_gpio_irq_handler);
-		irq_set_handler_data(res->start, atmel_pioctrl);
+		irq_set_chained_handler_and_data(res->start,
+			atmel_gpio_irq_handler, atmel_pioctrl);
 		dev_dbg(dev, "bank %i: irq=%pr\n", i, res);
 	}
 
-- 
2.20.1

