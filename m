Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3651F1A47
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 15:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgFHNnH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 09:43:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:64831 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgFHNnG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 09:43:06 -0400
IronPort-SDR: 3L1th1NbUJbDpUkIBAdQwh1AShhmjeCFWhaVBnnqEpeyfA/zTLwJiJpfCn1R6MsSi5pwS9wNLf
 h0+zNNAePIAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:43:05 -0700
IronPort-SDR: gkoKqzml1kBmlnYLlgZ0wp4CiJttFAFB4LjXsNwJlOqkPcWpVY1mDhytMIfPeNYlbOZF6vnSlD
 Tobc6lqkB+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="379426399"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2020 06:43:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D1B193CA; Mon,  8 Jun 2020 16:43:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/6] mfd: intel_quark_i2c_gpio: Convert to use software nodes
Date:   Mon,  8 Jun 2020 16:42:58 +0300
Message-Id: <20200608134300.76091-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
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
 drivers/mfd/intel_quark_i2c_gpio.c | 63 ++++++++++++++----------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 06b538dd124c..fb8c0b042ecc 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -16,8 +16,8 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/dmi.h>
-#include <linux/platform_data/gpio-dwapb.h>
 #include <linux/platform_data/i2c-designware.h>
+#include <linux/property.h>
 
 /* PCI BAR for register base address */
 #define MFD_I2C_BAR		0
@@ -27,15 +27,6 @@
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
 
@@ -89,17 +80,44 @@ static struct resource intel_quark_gpio_res[] = {
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
+	PROPERTY_ENTRY_U32("snps,gpio-base", 8),
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
 	{
 		.id = MFD_GPIO_BAR,
 		.name = "gpio-dwapb",
 		.acpi_match = &intel_quark_acpi_match_gpio,
+		.node_group = intel_quark_gpio_node_group,
 		.num_resources = ARRAY_SIZE(intel_quark_gpio_res),
 		.resources = intel_quark_gpio_res,
 		.ignore_resource_conflicts = true,
@@ -189,36 +207,15 @@ static int intel_quark_i2c_setup(struct pci_dev *pdev, struct mfd_cell *cell)
 
 static int intel_quark_gpio_setup(struct pci_dev *pdev, struct mfd_cell *cell)
 {
-	struct dwapb_platform_data *pdata;
 	struct resource *res = (struct resource *)cell->resources;
-	struct device *dev = &pdev->dev;
 
 	res[INTEL_QUARK_IORES_MEM].start =
 		pci_resource_start(pdev, MFD_GPIO_BAR);
 	res[INTEL_QUARK_IORES_MEM].end =
 		pci_resource_end(pdev, MFD_GPIO_BAR);
 
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
-	pdata->properties->irq[0]	= pdev->irq;
-
-	cell->platform_data = pdata;
-	cell->pdata_size = sizeof(*pdata);
+	res[INTEL_QUARK_IORES_IRQ].start = pdev->irq;
+	res[INTEL_QUARK_IORES_IRQ].end = pdev->irq;
 
 	return 0;
 }
-- 
2.27.0.rc2

