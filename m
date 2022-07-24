Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA9C57F76B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 00:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiGXWuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jul 2022 18:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbiGXWuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jul 2022 18:50:05 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12355CE30
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jul 2022 15:50:04 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6FE10840FC;
        Mon, 25 Jul 2022 00:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658703001;
        bh=P3P7zX7DArAnzm2f9Qx+o5BGy+s0OX4lOObHIR/g+9g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hCmMhW+Arp3JT0gl+yUl5wpjy3wd9+1taUwGlJmwboGC0wd+dNmG2zNRX7NpWIG2R
         pQrEbDuWGFA/jpwXaaQNpMMDjeW0GJuXyDUZrj/qtwCwRf5lNlQEH3KSut5nj3Ulcu
         6HESWc/3GaWs+jWKRqkjAt8NHD1zuHPBcFvbAOUD3L6TwdFxF4t0uJUzC/3ktqLDYX
         XF+PG9GOd1QTpW2CRXaKHV0v21cv92ow/sCPyuSMqBgIaOaoNPVCRsMF6y2odZSY/E
         NUVAMWgLFmzkfQoLZoxkhpiPYi0S3/zn2XJeNRXsi8xLewtA9dnpw7t8Si3Ya5DIO5
         9RU3hHgK9Lx/A==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v4 2/2] gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
Date:   Mon, 25 Jul 2022 00:49:43 +0200
Message-Id: <20220724224943.294057-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724224943.294057-1-marex@denx.de>
References: <20220724224943.294057-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Always configure GPIO pins which are used as interrupt source as INPUTs.
In case the default pin configuration is OUTPUT, or the prior stage does
configure the pins as OUTPUT, then Linux will not reconfigure the pin as
INPUT and no interrupts are received.

Always configure interrupt source GPIO pin as input to fix the above case.

Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
---
V2: Actually update and clear bits in GDIR register
V3: Rebase on top of new patch 1/2, expand CC list, add Fixes tag
V4: No change
---
 drivers/gpio/gpio-mxc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 75e7aceecac0a..f4cadbf30c6b8 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -149,7 +149,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
 	unsigned long flags;
-	u32 bit, val;
+	u32 bit, val, dir;
 	u32 gpio_idx = d->hwirq;
 	int edge;
 	void __iomem *reg = port->base;
@@ -208,6 +208,10 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 	writel(1 << gpio_idx, port->base + GPIO_ISR);
 
+	dir = readl(port->base + GPIO_GDIR);
+	dir &= ~BIT(gpio_idx);
+	writel(dir, port->base + GPIO_GDIR);
+
 	spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 
 	return 0;
-- 
2.35.1

