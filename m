Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D59B1A3580
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 16:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgDIOMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 10:12:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:22009 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgDIOMl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:41 -0400
IronPort-SDR: VuI8ld5GRa16gr6ysPZXklkanudZ9eaKtzgCgUUJ9LtJW6ZDt29BSfrzQEFpTXGEf6Z/tIBycT
 7jPsSdDt8FhA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:36 -0700
IronPort-SDR: RoWAGnHVGrJYyocvJV7ER5xMzwmshNILUqaqMJ6ocbLYid9JFRKDpPUaOK4xQYggJICdXmQvQ8
 ZcMSnVtukn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="453172111"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 09 Apr 2020 07:12:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E0EA4CC3; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 13/13] gpio: dwapb: Amend indentation in some cases
Date:   Thu,  9 Apr 2020 17:12:28 +0300
Message-Id: <20200409141228.49561-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some cases indentation makes code harder to read. Amend indentation
in those cases despite of lines go a bit over 80 character limit.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index bbaf909a463a..e4c946cafab0 100644
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

