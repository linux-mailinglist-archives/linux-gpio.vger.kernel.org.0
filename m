Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0D03E05AB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 18:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhHDQP4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 12:15:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:39495 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229648AbhHDQP4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 12:15:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="213685391"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="213685391"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 09:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="637037059"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 04 Aug 2021 09:15:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 25408142; Wed,  4 Aug 2021 19:16:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/4] gpio: dwapb: Unify ACPI enumeration checks in get_irq() and configure_irqs()
Date:   Wed,  4 Aug 2021 19:00:16 +0300
Message-Id: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Shared IRQ is only enabled for ACPI enumeration, there is no need
to have a special flag for that, since we simple can test if device
has been enumerated by ACPI. This unifies the checks in dwapb_get_irq()
and dwapb_configure_irqs().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added tags (Lee, Serge), rephrased comments near to for-loop (Serge)
 drivers/gpio/gpio-dwapb.c                | 24 ++++++++++++------------
 drivers/mfd/intel_quark_i2c_gpio.c       |  1 -
 include/linux/platform_data/gpio-dwapb.h |  1 -
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 3eb13d6d31ef..4c7153cb646c 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -436,21 +436,17 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
 #endif
 
-	if (!pp->irq_shared) {
-		girq->num_parents = pirq->nr_irqs;
-		girq->parents = pirq->irq;
-		girq->parent_handler_data = gpio;
-		girq->parent_handler = dwapb_irq_handler;
-	} else {
-		/* This will let us handle the parent IRQ in the driver */
+	/*
+	 * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
+	 * IRQ lane shared between several devices. In that case the parental
+	 * IRQ has to be handled in the shared way so to be properly delivered
+	 * to all the connected devices.
+	 */
+	if (has_acpi_companion(gpio->dev)) {
 		girq->num_parents = 0;
 		girq->parents = NULL;
 		girq->parent_handler = NULL;
 
-		/*
-		 * Request a shared IRQ since where MFD would have devices
-		 * using the same irq pin
-		 */
 		err = devm_request_irq(gpio->dev, pp->irq[0],
 				       dwapb_irq_handler_mfd,
 				       IRQF_SHARED, DWAPB_DRIVER_NAME, gpio);
@@ -458,6 +454,11 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 			dev_err(gpio->dev, "error requesting IRQ\n");
 			goto err_kfree_pirq;
 		}
+	} else {
+		girq->num_parents = pirq->nr_irqs;
+		girq->parents = pirq->irq;
+		girq->parent_handler_data = gpio;
+		girq->parent_handler = dwapb_irq_handler;
 	}
 
 	girq->chip = &pirq->irqchip;
@@ -581,7 +582,6 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
 			pp->ngpio = DWAPB_MAX_GPIOS;
 		}
 
-		pp->irq_shared	= false;
 		pp->gpio_base	= -1;
 
 		/*
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 01935ae4e9e1..a43993e38b6e 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -227,7 +227,6 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev)
 	pdata->properties->ngpio	= INTEL_QUARK_MFD_NGPIO;
 	pdata->properties->gpio_base	= INTEL_QUARK_MFD_GPIO_BASE;
 	pdata->properties->irq[0]	= pci_irq_vector(pdev, 0);
-	pdata->properties->irq_shared	= true;
 
 	cell->platform_data = pdata;
 	cell->pdata_size = sizeof(*pdata);
diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index 0aa5c6720259..535e5ed549d9 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -14,7 +14,6 @@ struct dwapb_port_property {
 	unsigned int	ngpio;
 	unsigned int	gpio_base;
 	int		irq[DWAPB_MAX_GPIOS];
-	bool		irq_shared;
 };
 
 struct dwapb_platform_data {
-- 
2.30.2

