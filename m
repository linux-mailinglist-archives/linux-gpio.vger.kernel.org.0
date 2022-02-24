Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5D614C3109
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 17:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiBXQM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 11:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiBXQMv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 11:12:51 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF96D33E93;
        Thu, 24 Feb 2022 08:12:11 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id AF349223EA;
        Thu, 24 Feb 2022 17:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1645719037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OACAE+3+9+ONVX+RMtjjQdFT1P3XhONIABQtrYK1Pig=;
        b=QrR1JWx1P+t4akVZLkBfggd2WYsohyp31aKaI0WjK92YAQpdOhMmzZKHr7QemQlRxyPQ0Y
        atYJOca0dq4r3WIupcOaPbriQ4vfrjWHYIo/v5sDcHiTsurRDhjdC/Hko3Hj3vdYrWrQU1
        9mJ80oDCBWgu+yCUKIrynK7mMyPadfo=
From:   Michael Walle <michael@walle.cc>
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Colin Foster <colin.foster@in-advantage.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v1 1/5] pinctrl: microchip-sgpio: lock RMW access
Date:   Thu, 24 Feb 2022 17:10:17 +0100
Message-Id: <20220224161021.2197263-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220224161021.2197263-1-michael@walle.cc>
References: <20220224161021.2197263-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Protect any RMW access to the registers by a spinlock.

Fixes: 7e5ea974e61c ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index d371b1e66092..b43302cc188a 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -19,6 +19,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -116,6 +117,7 @@ struct sgpio_priv {
 	u32 clock;
 	struct regmap *regs;
 	const struct sgpio_properties *properties;
+	spinlock_t lock;
 };
 
 struct sgpio_port_addr {
@@ -229,6 +231,7 @@ static void sgpio_output_set(struct sgpio_priv *priv,
 			     int value)
 {
 	unsigned int bit = SGPIO_SRC_BITS * addr->bit;
+	unsigned long flags;
 	u32 clr, set;
 
 	switch (priv->properties->arch) {
@@ -247,7 +250,10 @@ static void sgpio_output_set(struct sgpio_priv *priv,
 	default:
 		return;
 	}
+
+	spin_lock_irqsave(&priv->lock, flags);
 	sgpio_clrsetbits(priv, REG_PORT_CONFIG, addr->port, clr, set);
+	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static int sgpio_output_get(struct sgpio_priv *priv,
@@ -575,10 +581,13 @@ static void microchip_sgpio_irq_settype(struct irq_data *data,
 	struct sgpio_bank *bank = gpiochip_get_data(chip);
 	unsigned int gpio = irqd_to_hwirq(data);
 	struct sgpio_port_addr addr;
+	unsigned long flags;
 	u32 ena;
 
 	sgpio_pin_to_addr(bank->priv, gpio, &addr);
 
+	spin_lock_irqsave(&bank->priv->lock, flags);
+
 	/* Disable interrupt while changing type */
 	ena = sgpio_readl(bank->priv, REG_INT_ENABLE, addr.bit);
 	sgpio_writel(bank->priv, ena & ~BIT(addr.port), REG_INT_ENABLE, addr.bit);
@@ -595,6 +604,8 @@ static void microchip_sgpio_irq_settype(struct irq_data *data,
 
 	/* Possibly re-enable interrupts */
 	sgpio_writel(bank->priv, ena, REG_INT_ENABLE, addr.bit);
+
+	spin_unlock_irqrestore(&bank->priv->lock, flags);
 }
 
 static void microchip_sgpio_irq_setreg(struct irq_data *data,
@@ -605,13 +616,16 @@ static void microchip_sgpio_irq_setreg(struct irq_data *data,
 	struct sgpio_bank *bank = gpiochip_get_data(chip);
 	unsigned int gpio = irqd_to_hwirq(data);
 	struct sgpio_port_addr addr;
+	unsigned long flags;
 
 	sgpio_pin_to_addr(bank->priv, gpio, &addr);
 
+	spin_lock_irqsave(&bank->priv->lock, flags);
 	if (clear)
 		sgpio_clrsetbits(bank->priv, reg, addr.bit, BIT(addr.port), 0);
 	else
 		sgpio_clrsetbits(bank->priv, reg, addr.bit, 0, BIT(addr.port));
+	spin_unlock_irqrestore(&bank->priv->lock, flags);
 }
 
 static void microchip_sgpio_irq_mask(struct irq_data *data)
@@ -833,6 +847,7 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->dev = dev;
+	spin_lock_init(&priv->lock);
 
 	reset = devm_reset_control_get_optional_shared(&pdev->dev, "switch");
 	if (IS_ERR(reset))
-- 
2.30.2

