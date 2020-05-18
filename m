Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C098C1D80BB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 19:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbgERRlo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 13:41:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:49465 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729311AbgERRln (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 13:41:43 -0400
IronPort-SDR: kJ3cphkx3mwmiH85JHoa7Uc9OCgo6PVXMDpQkJqsPkgEm+ChtLY2/+8harT9HJ/Tnaw/MG5tU5
 a/27ZJWpoO5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 10:41:42 -0700
IronPort-SDR: 4uuxjDtzCt+VWxSIZrSY3KxHwLB+l/zR+aOXeQfF4PU9HHQDmRONP5ybq97PhynQ5p6p/I/uk/
 a4Qv5lgMNGIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="299298223"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 18 May 2020 10:41:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A696C1D6; Mon, 18 May 2020 20:41:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 4/4] gpio: dwapb: Remove unneeded has_irq member in struct dwapb_port_property
Date:   Mon, 18 May 2020 20:41:38 +0300
Message-Id: <20200518174138.19367-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
References: <20200518174138.19367-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

has_irq member of struct dwapb_port_property is used only in one place,
so, make it local test instead and remove from the structure.
This local test is using memchr_inv() which is quite effective in comparison
to the original loop and possible little overhead can be neglected.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
v2:
 - fixed compilation error (kbuild bot)
 - added Lee into Cc
 - moved memchr_inv() here (Serge)
 drivers/gpio/gpio-dwapb.c                | 14 +++++++-------
 drivers/mfd/intel_quark_i2c_gpio.c       |  1 -
 include/linux/platform_data/gpio-dwapb.h |  1 -
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c939afac44c9..1d8d55bd63aa 100644
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
-		if (pp->irq[j] >= 0)
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

