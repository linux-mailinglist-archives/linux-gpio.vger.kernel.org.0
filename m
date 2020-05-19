Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533E91D9742
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 15:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgESNMi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 09:12:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:57663 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728943AbgESNMh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 May 2020 09:12:37 -0400
IronPort-SDR: B4K+W8etJxGyy4hcPrS2jOR+yfTWZILN124gNbN1ynkFkxQn96oKKEJd5Bsw+dwfOUHXNWVHW3
 QhAGE1CDGvLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 06:12:37 -0700
IronPort-SDR: lKMBbY1m2wyM1LVTk34zsGak6nW8W8vtDRdSeJOdvIrRr7Nus7CAjYFiZf2CzMSSgLeybkcVwx
 oS/J0m0yu07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="411628739"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 19 May 2020 06:12:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B3A5B1D6; Tue, 19 May 2020 16:12:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v3 4/4] gpio: dwapb: Remove unneeded has_irq member in struct dwapb_port_property
Date:   Tue, 19 May 2020 16:12:33 +0300
Message-Id: <20200519131233.59032-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
References: <20200519131233.59032-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

has_irq member of struct dwapb_port_property is used only in one place,
so, make it local test instead and remove from the structure.
This local test is using memchr_inv() which is quite efficient in comparison
to the original loop and possible little overhead can be neglected.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
v3: appended tags (Serge, Lee)

 drivers/gpio/gpio-dwapb.c                | 14 +++++++-------
 drivers/mfd/intel_quark_i2c_gpio.c       |  1 -
 include/linux/platform_data/gpio-dwapb.h |  1 -
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index d3765672c42b..1d8d55bd63aa 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -366,6 +366,11 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	irq_hw_number_t hwirq;
 	int err, i;
 
+	if (memchr_inv(pp->irq, 0, sizeof(pp->irq)) == NULL) {
+		dev_warn(gpio->dev, "no IRQ for port%d\n", pp->idx);
+		return;
+	}
+
 	gpio->domain = irq_domain_create_linear(fwnode, ngpio,
 						 &irq_generic_chip_ops, gpio);
 	if (!gpio->domain)
@@ -501,7 +506,8 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 	if (pp->idx == 0)
 		port->gc.set_config = dwapb_gpio_set_config;
 
-	if (pp->has_irq)
+	/* Only port A can provide interrupts in all configurations of the IP */
+	if (pp->idx == 0)
 		dwapb_configure_irqs(gpio, port, pp);
 
 	err = gpiochip_add_data(&port->gc, port);
@@ -550,13 +556,7 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 			irq = platform_get_irq_optional(to_platform_device(dev), j);
 		if (irq > 0)
 			pp->irq[j] = irq;
-
-		if (pp->irq[j])
-			pp->has_irq = true;
 	}
-
-	if (!pp->has_irq)
-		dev_warn(dev, "no irq for port%d\n", pp->idx);
 }
 
 static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 41326b48da55..84ca7902e1df 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -216,7 +216,6 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev, struct mfd_cell *cell)
 	pdata->properties->ngpio	= INTEL_QUARK_MFD_NGPIO;
 	pdata->properties->gpio_base	= INTEL_QUARK_MFD_GPIO_BASE;
 	pdata->properties->irq[0]	= pdev->irq;
-	pdata->properties->has_irq	= true;
 	pdata->properties->irq_shared	= true;
 
 	cell->platform_data = pdata;
diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index 3c606c450d05..ff1be737bad6 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -12,7 +12,6 @@ struct dwapb_port_property {
 	unsigned int	ngpio;
 	unsigned int	gpio_base;
 	int		irq[32];
-	bool		has_irq;
 	bool		irq_shared;
 };
 
-- 
2.26.2

