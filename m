Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E08B5A9980
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 15:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbiIANzL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 09:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbiIANzC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 09:55:02 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D12D125
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JnQhTlwHzIVikhCGsRTLsC2A0a33+pkycpo1BfjL2SA=; b=rqk68KuTdzSHya5coYufxP+sPP
        F8Mie7AIlcSAng1IVS4y+8n49CRN1G9uuuQmgpIPsGd+m8EWzA3j2deMvhZPTW00cLTnAEwn/lTgC
        oH22UwCiCacoUCN5mXmx7eFaYjAlySTMLxhnbri3swKnZXg0LMg0oXI8h920bhtOP4yHvWltOsdG+
        tR6joy0L5sDgobPpS3/2MoAwI3ijgYOYgPjjlql4iDxkfkQ0iBl7AleQoAte+rnMH9xvE8edGDb1Z
        gBrnKtwXWahHqPGEZp7kZD/lLKF4l3NK2TR33IZzKGkXAG/BnTLC85qObtwSMkw2Ercq6do2mA4rq
        C1s7cQDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60320 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1oTkeh-0005xL-9Y; Thu, 01 Sep 2022 14:54:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1oTkeg-003t9k-Mc; Thu, 01 Sep 2022 14:54:50 +0100
In-Reply-To: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
From:   Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: [PATCH 6/6] gpio: macsmc: Add IRQ support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oTkeg-003t9k-Mc@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 01 Sep 2022 14:54:50 +0100
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hector Martin <marcan@marcan.st>

Add IRQ support to the macsmc driver. This patch has updates from Joey
Gouly and Russell King.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/gpio/gpio-macsmc.c | 156 +++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/gpio/gpio-macsmc.c b/drivers/gpio/gpio-macsmc.c
index ff9950afb69a..939e2dc33c6f 100644
--- a/drivers/gpio/gpio-macsmc.c
+++ b/drivers/gpio/gpio-macsmc.c
@@ -10,6 +10,7 @@
 #include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/irq.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/macsmc.h>
 
@@ -68,10 +69,20 @@
  *   3 = ?
  */
 
+#define SMC_EV_GPIO 0x7202
+
 struct macsmc_gpio {
 	struct device *dev;
 	struct apple_smc *smc;
 	struct gpio_chip gc;
+	struct notifier_block nb;
+
+	struct mutex irq_mutex;
+	DECLARE_BITMAP(irq_supported, MAX_GPIO);
+	DECLARE_BITMAP(irq_enable_shadow, MAX_GPIO);
+	DECLARE_BITMAP(irq_enable, MAX_GPIO);
+	u32 irq_mode_shadow[MAX_GPIO];
+	u32 irq_mode[MAX_GPIO];
 
 	int first_index;
 };
@@ -161,6 +172,7 @@ static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
 	for (i = 0; i < count; i++) {
 		smc_key key;
 		int gpio_nr;
+		u32 val;
 		int ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
 
 		if (ret < 0)
@@ -176,11 +188,143 @@ static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
 		}
 
 		set_bit(gpio_nr, valid_mask);
+
+		/* Check for IRQ support */
+		ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
+		if (!ret)
+			set_bit(gpio_nr, smcgp->irq_supported);
+	}
+
+	return 0;
+}
+
+static int macsmc_gpio_event(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct macsmc_gpio *smcgp = container_of(nb, struct macsmc_gpio, nb);
+	u16 type = event >> 16;
+	u8 offset = (event >> 8) & 0xff;
+	smc_key key = macsmc_gpio_key(offset);
+	unsigned long flags;
+        int ret;
+
+	if (type != SMC_EV_GPIO)
+		return NOTIFY_DONE;
+
+	if (offset > MAX_GPIO) {
+		dev_err(smcgp->dev, "GPIO event index %d out of range\n", offset);
+		return NOTIFY_BAD;
+	}
+
+	local_irq_save(flags);
+	ret = generic_handle_domain_irq(smcgp->gc.irq.domain, offset);
+	local_irq_restore(flags);
+
+	if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ACK | 1) < 0)
+		dev_err(smcgp->dev, "GPIO IRQ ack failed for %p4ch\n", &key);
+
+	return (ret == 0) ? NOTIFY_OK : NOTIFY_DONE;
+}
+
+static void macsmc_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	set_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
+}
+
+static void macsmc_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+
+	clear_bit(irqd_to_hwirq(d), smcgp->irq_enable_shadow);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
+}
+
+static int macsmc_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d);
+	u32 mode;
+
+	if (!test_bit(offset, smcgp->irq_supported))
+		return -EINVAL;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		mode = IRQ_MODE_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		mode = IRQ_MODE_LOW;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		mode = IRQ_MODE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		mode = IRQ_MODE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		mode = IRQ_MODE_BOTH;
+		break;
+	default:
+		return -EINVAL;
 	}
 
+	smcgp->irq_mode_shadow[offset] = mode;
 	return 0;
 }
 
+static void macsmc_gpio_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+
+	mutex_lock(&smcgp->irq_mutex);
+}
+
+static void macsmc_gpio_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	smc_key key = macsmc_gpio_key(irqd_to_hwirq(d));
+	int offset = irqd_to_hwirq(d);
+	bool val;
+
+	if (smcgp->irq_mode_shadow[offset] != smcgp->irq_mode[offset]) {
+		u32 cmd = CMD_IRQ_MODE | smcgp->irq_mode_shadow[offset];
+		if (apple_smc_write_u32(smcgp->smc, key, cmd) < 0)
+			dev_err(smcgp->dev, "GPIO IRQ config failed for %p4ch = 0x%x\n", &key, cmd);
+		else
+			smcgp->irq_mode_shadow[offset] = smcgp->irq_mode[offset];
+	}
+
+	val = test_bit(offset, smcgp->irq_enable_shadow);
+	if (test_bit(offset, smcgp->irq_enable) != val) {
+		if (apple_smc_write_u32(smcgp->smc, key, CMD_IRQ_ENABLE | val) < 0)
+			dev_err(smcgp->dev, "GPIO IRQ en/disable failed for %p4ch\n", &key);
+		else
+			change_bit(offset, smcgp->irq_enable);
+	}
+
+	mutex_unlock(&smcgp->irq_mutex);
+}
+
+static const struct irq_chip macsmc_gpio_irqchip = {
+	.name			= "macsmc-pmu-gpio",
+	.irq_mask		= macsmc_gpio_irq_disable,
+	.irq_unmask		= macsmc_gpio_irq_enable,
+	.irq_set_type		= macsmc_gpio_irq_set_type,
+	.irq_bus_lock		= macsmc_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock	= macsmc_gpio_irq_bus_sync_unlock,
+	.irq_set_type 		= macsmc_gpio_irq_set_type,
+	.flags 			= IRQCHIP_SET_TYPE_MASKED |
+					IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int macsmc_gpio_probe(struct platform_device *pdev)
 {
 	struct macsmc_gpio *smcgp;
@@ -221,6 +365,18 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
 	smcgp->gc.base = -1;
 	smcgp->gc.parent = &pdev->dev;
 
+	gpio_irq_chip_set_chip(&smcgp->gc.irq, &macsmc_gpio_irqchip);
+	smcgp->gc.irq.parent_handler = NULL;
+	smcgp->gc.irq.num_parents = 0;
+	smcgp->gc.irq.parents = NULL;
+	smcgp->gc.irq.default_type = IRQ_TYPE_NONE;
+	smcgp->gc.irq.handler = handle_simple_irq;
+
+	mutex_init(&smcgp->irq_mutex);
+
+	smcgp->nb.notifier_call = macsmc_gpio_event;
+	apple_smc_register_notifier(smc, &smcgp->nb);
+
 	return devm_gpiochip_add_data(&pdev->dev, &smcgp->gc, smcgp);
 }
 
-- 
2.30.2

