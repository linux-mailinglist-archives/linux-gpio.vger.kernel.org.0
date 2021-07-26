Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AFD3D59D6
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 14:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhGZMNr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 08:13:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:28864 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234039AbhGZMNr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Jul 2021 08:13:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="209109453"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="209109453"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 05:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="498131388"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2021 05:54:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 81B71DE; Mon, 26 Jul 2021 15:54:41 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 1/4] gpio: dwapb: Unify ACPI enumeration checks in get_irq() and configure_irqs()
Date:   Mon, 26 Jul 2021 15:54:33 +0300
Message-Id: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
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
---
 drivers/gpio/gpio-dwapb.c                | 13 ++++++-------
 drivers/mfd/intel_quark_i2c_gpio.c       |  1 -
 include/linux/platform_data/gpio-dwapb.h |  1 -
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 3eb13d6d31ef..f6ae69d5d644 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -436,12 +436,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
 #endif
 
-	if (!pp->irq_shared) {
-		girq->num_parents = pirq->nr_irqs;
-		girq->parents = pirq->irq;
-		girq->parent_handler_data = gpio;
-		girq->parent_handler = dwapb_irq_handler;
-	} else {
+	if (has_acpi_companion(gpio->dev)) {
 		/* This will let us handle the parent IRQ in the driver */
 		girq->num_parents = 0;
 		girq->parents = NULL;
@@ -458,6 +453,11 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
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
@@ -581,7 +581,6 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
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

