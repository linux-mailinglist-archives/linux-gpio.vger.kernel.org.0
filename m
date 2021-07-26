Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22723D59D8
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 14:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbhGZMNs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 08:13:48 -0400
Received: from mga06.intel.com ([134.134.136.31]:38475 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234111AbhGZMNr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Jul 2021 08:13:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="273312626"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="273312626"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 05:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="661995636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2021 05:54:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 93CAF14F; Mon, 26 Jul 2021 15:54:41 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use software nodes
Date:   Mon, 26 Jul 2021 15:54:35 +0300
Message-Id: <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver can provide a software node group instead of
passing legacy platform data. This will allow to drop
the legacy platform data structures along with unifying
a child device driver to use same interface for all
property providers, i.e. Device Tree, ACPI, and board files.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index a43993e38b6e..9b9c76bd067b 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -17,7 +17,6 @@
 #include <linux/clk-provider.h>
 #include <linux/dmi.h>
 #include <linux/i2c.h>
-#include <linux/platform_data/gpio-dwapb.h>
 #include <linux/property.h>
 
 /* PCI BAR for register base address */
@@ -28,15 +27,6 @@
 #define MFD_ACPI_MATCH_GPIO	0ULL
 #define MFD_ACPI_MATCH_I2C	1ULL
 
-/* The base GPIO number under GPIOLIB framework */
-#define INTEL_QUARK_MFD_GPIO_BASE	8
-
-/* The default number of South-Cluster GPIO on Quark. */
-#define INTEL_QUARK_MFD_NGPIO		8
-
-/* The DesignWare GPIO ports on Quark. */
-#define INTEL_QUARK_GPIO_NPORTS	1
-
 #define INTEL_QUARK_IORES_MEM	0
 #define INTEL_QUARK_IORES_IRQ	1
 
@@ -111,12 +101,38 @@ static struct resource intel_quark_gpio_res[] = {
 	[INTEL_QUARK_IORES_MEM] = {
 		.flags = IORESOURCE_MEM,
 	},
+	[INTEL_QUARK_IORES_IRQ] = {
+		.flags = IORESOURCE_IRQ,
+	},
 };
 
 static struct mfd_cell_acpi_match intel_quark_acpi_match_gpio = {
 	.adr = MFD_ACPI_MATCH_GPIO,
 };
 
+static const struct software_node intel_quark_gpio_controller_node = {
+	.name = "intel-quark-gpio-controller",
+};
+
+static const struct property_entry intel_quark_gpio_portA_properties[] = {
+	PROPERTY_ENTRY_U32("reg", 0),
+	PROPERTY_ENTRY_U32("snps,nr-gpios", 8),
+	PROPERTY_ENTRY_U32("gpio-base", 8),
+	{ }
+};
+
+static const struct software_node intel_quark_gpio_portA_node = {
+	.name = "portA",
+	.parent = &intel_quark_gpio_controller_node,
+	.properties = intel_quark_gpio_portA_properties,
+};
+
+static const struct software_node *intel_quark_gpio_node_group[] = {
+	&intel_quark_gpio_controller_node,
+	&intel_quark_gpio_portA_node,
+	NULL
+};
+
 static struct mfd_cell intel_quark_mfd_cells[] = {
 	[MFD_I2C_BAR] = {
 		.id = MFD_I2C_BAR,
@@ -203,34 +219,19 @@ static int intel_quark_gpio_setup(struct pci_dev *pdev)
 {
 	struct mfd_cell *cell = &intel_quark_mfd_cells[MFD_GPIO_BAR];
 	struct resource *res = intel_quark_gpio_res;
-	struct dwapb_platform_data *pdata;
-	struct device *dev = &pdev->dev;
+	int ret;
 
 	res[INTEL_QUARK_IORES_MEM].start = pci_resource_start(pdev, MFD_GPIO_BAR);
 	res[INTEL_QUARK_IORES_MEM].end = pci_resource_end(pdev, MFD_GPIO_BAR);
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-
-	/* For intel quark x1000, it has only one port: portA */
-	pdata->nports = INTEL_QUARK_GPIO_NPORTS;
-	pdata->properties = devm_kcalloc(dev, pdata->nports,
-					 sizeof(*pdata->properties),
-					 GFP_KERNEL);
-	if (!pdata->properties)
-		return -ENOMEM;
-
-	/* Set the properties for portA */
-	pdata->properties->fwnode	= NULL;
-	pdata->properties->idx		= 0;
-	pdata->properties->ngpio	= INTEL_QUARK_MFD_NGPIO;
-	pdata->properties->gpio_base	= INTEL_QUARK_MFD_GPIO_BASE;
-	pdata->properties->irq[0]	= pci_irq_vector(pdev, 0);
+	res[INTEL_QUARK_IORES_IRQ].start = pci_irq_vector(pdev, 0);
+	res[INTEL_QUARK_IORES_IRQ].end = pci_irq_vector(pdev, 0);
 
-	cell->platform_data = pdata;
-	cell->pdata_size = sizeof(*pdata);
+	ret = software_node_register_node_group(intel_quark_gpio_node_group);
+	if (ret)
+		return ret;
 
+	cell->swnode = &intel_quark_gpio_controller_node;
 	return 0;
 }
 
@@ -273,10 +274,12 @@ static int intel_quark_mfd_probe(struct pci_dev *pdev,
 			      ARRAY_SIZE(intel_quark_mfd_cells), NULL, 0,
 			      NULL);
 	if (ret)
-		goto err_free_irq_vectors;
+		goto err_unregister_gpio_node_group;
 
 	return 0;
 
+err_unregister_gpio_node_group:
+	software_node_unregister_node_group(intel_quark_gpio_node_group);
 err_free_irq_vectors:
 	pci_free_irq_vectors(pdev);
 err_unregister_i2c_clk:
@@ -287,6 +290,7 @@ static int intel_quark_mfd_probe(struct pci_dev *pdev,
 static void intel_quark_mfd_remove(struct pci_dev *pdev)
 {
 	mfd_remove_devices(&pdev->dev);
+	software_node_unregister_node_group(intel_quark_gpio_node_group);
 	pci_free_irq_vectors(pdev);
 	intel_quark_unregister_i2c_clk(&pdev->dev);
 }
-- 
2.30.2

