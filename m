Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDAC1AA9A6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636556AbgDOOQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:16:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:15292 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636551AbgDOOPr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:47 -0400
IronPort-SDR: uTGZAmmn9Z8GVMK8zADKECKygyMld6xRc8JRnVKFkM6CKx36k0FPMrHTwdAkCfz5OPUPM1nfdo
 CnaP2zAvlXNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:41 -0700
IronPort-SDR: 8aHx/hsvYBVgdzREBbZBfA5mGl7bWeY6jyumdIaOFVNrmQgBAZvcYdytamyf2MogQCZ2NlOPOb
 D5hM+if1UOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="253536823"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 15 Apr 2020 07:15:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 183D6EED; Wed, 15 Apr 2020 17:15:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 14/14] gpio: dwapb: Amend indentation in some cases
Date:   Wed, 15 Apr 2020 17:15:34 +0300
Message-Id: <20200415141534.31240-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some cases indentation makes code harder to read. Amend indentation
in those cases despite of lines go a bit over 80 character limit.

Cc: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 84c971e0adf0..a09332d9c7fe 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -437,7 +437,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		}
 	}
 
-	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
+	for (hwirq = 0; hwirq < ngpio; hwirq++)
 		irq_create_mapping(gpio->domain, hwirq);
 
 	port->gc.to_irq = dwapb_gpio_to_irq;
@@ -453,7 +453,7 @@ static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
 	if (!gpio->domain)
 		return;
 
-	for (hwirq = 0 ; hwirq < ngpio ; hwirq++)
+	for (hwirq = 0; hwirq < ngpio; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(gpio->domain, hwirq));
 
 	irq_domain_remove(gpio->domain);
@@ -478,10 +478,9 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		return -ENOMEM;
 #endif
 
-	dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_STRIDE);
-	set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_STRIDE);
-	dirout = gpio->regs + GPIO_SWPORTA_DDR +
-		(pp->idx * GPIO_SWPORT_DDR_STRIDE);
+	dat = gpio->regs + GPIO_EXT_PORTA + pp->idx * GPIO_EXT_PORT_STRIDE;
+	set = gpio->regs + GPIO_SWPORTA_DR + pp->idx * GPIO_SWPORT_DR_STRIDE;
+	dirout = gpio->regs + GPIO_SWPORTA_DDR + pp->idx * GPIO_SWPORT_DDR_STRIDE;
 
 	/* This registers 32 GPIO lines per port */
 	err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
@@ -582,17 +581,13 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 
 		if (fwnode_property_read_u32(fwnode, "reg", &pp->idx) ||
 		    pp->idx >= DWAPB_MAX_PORTS) {
-			dev_err(dev,
-				"missing/invalid port index for port%d\n", i);
+			dev_err(dev, "missing/invalid port index for port%d\n", i);
 			fwnode_handle_put(fwnode);
 			return ERR_PTR(-EINVAL);
 		}
 
-		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios",
-					 &pp->ngpio)) {
-			dev_info(dev,
-				 "failed to get number of gpios for port%d\n",
-				 i);
+		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {
+			dev_info(dev, "failed to get number of gpios for port%d\n", i);
 			pp->ngpio = 32;
 		}
 
@@ -743,8 +738,7 @@ static int dwapb_gpio_suspend(struct device *dev)
 			ctx->int_deb	= dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 
 			/* Mask out interrupts */
-			dwapb_write(gpio, GPIO_INTMASK,
-				    0xffffffff & ~ctx->wake_en);
+			dwapb_write(gpio, GPIO_INTMASK, 0xffffffff & ~ctx->wake_en);
 		}
 	}
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
-- 
2.25.1

