Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D41C1B42C9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 13:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgDVLG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 07:06:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:35303 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgDVLG6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 07:06:58 -0400
IronPort-SDR: qpKxz8uQ5SrWuG+NfoAgS50EdkpShEpGFUG4hBLJQb/IvJDU8uptntYu1KIyvJf/4tWj15xx/1
 B0T14/DydASw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 04:06:58 -0700
IronPort-SDR: ZQLEjVs73RGo05w8tg7ozKPcPvVDH3jtRbTARQIVsF/uk+eefgHlB7ubLr76/c3nn/Rmk1I5sw
 kbakxDe8oGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="429870431"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 22 Apr 2020 04:06:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C78EC402; Wed, 22 Apr 2020 14:06:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v1 2/2] gpio: dwapb: Amend indentation in some cases
Date:   Wed, 22 Apr 2020 14:06:54 +0300
Message-Id: <20200422110654.23442-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
References: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
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
---
 drivers/gpio/gpio-dwapb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 9d8476afaba3d..8639c4a7f4697 100644
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
@@ -588,8 +587,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			return ERR_PTR(-EINVAL);
 		}
 
-		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios",
-					 &pp->ngpio)) {
+		if (fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {
 			dev_info(dev,
 				 "failed to get number of gpios for port%d\n",
 				 i);
-- 
2.26.1

