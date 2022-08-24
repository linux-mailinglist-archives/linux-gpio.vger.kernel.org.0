Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE39659FD48
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Aug 2022 16:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239174AbiHXO30 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Aug 2022 10:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239173AbiHXO3Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Aug 2022 10:29:25 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670BF57549;
        Wed, 24 Aug 2022 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661351364; x=1692887364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8CmXevIRXpcq/8RoRDq62C0e3h/Z3YcfAuw47h/B5fo=;
  b=cwTuF+qGhBMCJ3Wsq6Nz0BzuNGdDPrIavN8llKk7G+nlimRsumB7GVmh
   c7n/tTIKRRHHu+m8PUy35GqzUhdtTCxVy+Zf1hNZWhfAllOWIe2YvoW0x
   cL3b9eobr6m+9AEkkTFOn27gfycUN+5E6BkTILah1iptiaOJvWPnyyp7k
   MujWKb/42yy0ENRZgokUTIO7lq1PgBIrqP4xDz3DI8CQQzgjGeUgBL4pf
   9A6CWrDqgN36swzCKD/WmH4MAYmMAsS/Fj6C1D6Z+JSDPBZOqog+HYHd0
   0tNAPallqu6nCRwjPXLVG/B6oDqiIFKuJXulF5ODmiznGZp5+fC8o7SU3
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="187868736"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 07:29:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 07:29:23 -0700
Received: from CHE-LT-UNGSOFTWARE.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 24 Aug 2022 07:29:20 -0700
From:   Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
To:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <UNGLinuxDriver@microchip.com>, <gregkh@linuxfoundation.org>,
        <arnd@arndb.de>, <dragan.cvetic@xilinx.com>,
        <derek.kiernan@xilinx.com>
Subject: [PATCH v1 char-misc-next 2/5] misc: microchip: pci1xxxx: load gpio driver for the gpio controller auxiliary device enumerated by the auxiliary bus driver.
Date:   Thu, 25 Aug 2022 01:30:44 +0530
Message-ID: <20220824200047.150308-3-kumaravel.thiagarajan@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824200047.150308-1-kumaravel.thiagarajan@microchip.com>
References: <20220824200047.150308-1-kumaravel.thiagarajan@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PIO function's auxiliary bus driver enumerates separate child devices for
GPIO controller and OTP/EEPROM interface. This gpio driver implemented
based on the gpio framework is loaded for the gpio auxiliary device.

Signed-off-by: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
---
 MAINTAINERS                                   |   1 +
 drivers/misc/mchp_pci1xxxx/Makefile           |   2 +-
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c   | 163 ++++++++++++++++++
 3 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d20c9af0d5c..d90cfd74fe81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13250,6 +13250,7 @@ L:	linux-gpio@vger.kernel.org
 S:	Supported
 F:	drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
 F:	drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.h
+F:	drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
 
 MICROCHIP OTPC DRIVER
 M:	Claudiu Beznea <claudiu.beznea@microchip.com>
diff --git a/drivers/misc/mchp_pci1xxxx/Makefile b/drivers/misc/mchp_pci1xxxx/Makefile
index 23927ab251c4..fc4615cfe28b 100644
--- a/drivers/misc/mchp_pci1xxxx/Makefile
+++ b/drivers/misc/mchp_pci1xxxx/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_GP_PCI1XXXX) := mchp_pci1xxxx_gp.o
+obj-$(CONFIG_GP_PCI1XXXX) := mchp_pci1xxxx_gp.o mchp_pci1xxxx_gpio.o
diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
new file mode 100644
index 000000000000..97ed7ae1baaa
--- /dev/null
+++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2022 Microchip Technology Inc.
+// pci1xxxx gpio driver
+
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/gpio/driver.h>
+#include <linux/bio.h>
+#include <linux/spinlock.h>
+#include <linux/mutex.h>
+#include <linux/kthread.h>
+
+#include "mchp_pci1xxxx_gp.h"
+
+#define PCI1XXXX_NR_PINS		93
+#define PULLUP_OFFSET(x)		((((x) / 32) * 4) + 0x400 + 0x40)
+#define PULLDOWN_OFFSET(x)		((((x) / 32) * 4) + 0x400 + 0x50)
+#define OPENDRAIN_OFFSET(x)		((((x) / 32) * 4) + 0x400 + 0x60)
+#define DEBOUNCE_OFFSET(x)		((((x) / 32) * 4) + 0x400 + 0xE0)
+#define PIO_GLOBAL_CONFIG_OFFSET	(0x400 + 0xF0)
+#define PIO_PCI_CTRL_REG_OFFSET	(0x400 + 0xF4)
+#define INTR_MASK_OFFSET(x)		((((x) / 32) * 4) + 0x400 + 0x100)
+#define INTR_STATUS_OFFSET(x)		(((x) * 4) + 0x400 + 0xD0)
+
+struct pci1xxxx_gpio {
+	struct auxiliary_device *aux_dev;
+	void __iomem *reg_base;
+	struct gpio_chip gpio;
+	spinlock_t lock;
+	int irq_base;
+};
+
+static inline void pci1xxx_assign_bit(void __iomem *base_addr, unsigned int reg_offset,
+				      unsigned int bitpos, bool set)
+{
+	u32 data;
+
+	data = readl(base_addr + reg_offset);
+	if (set)
+		data |= BIT(bitpos);
+	else
+		data &= ~BIT(bitpos);
+	writel(data, base_addr + reg_offset);
+}
+
+static int pci1xxxx_gpio_set_config(struct gpio_chip *gpio, unsigned int offset,
+				    unsigned long config)
+{
+	struct pci1xxxx_gpio *priv = gpiochip_get_data(gpio);
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		pci1xxx_assign_bit(priv->reg_base, PULLUP_OFFSET(offset), (offset % 32), true);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		pci1xxx_assign_bit(priv->reg_base, PULLDOWN_OFFSET(offset), (offset % 32), true);
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		pci1xxx_assign_bit(priv->reg_base, PULLUP_OFFSET(offset), (offset % 32), false);
+		pci1xxx_assign_bit(priv->reg_base, PULLDOWN_OFFSET(offset), (offset % 32), false);
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		pci1xxx_assign_bit(priv->reg_base, OPENDRAIN_OFFSET(offset), (offset % 32), true);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return ret;
+}
+
+static int pci1xxxx_gpio_setup(struct pci1xxxx_gpio *priv, int irq)
+{
+	struct gpio_chip *gchip = &priv->gpio;
+
+	gchip->label = dev_name(&priv->aux_dev->dev);
+	gchip->parent = &priv->aux_dev->dev;
+	gchip->owner = THIS_MODULE;
+	gchip->set_config = pci1xxxx_gpio_set_config;
+	gchip->dbg_show = NULL;
+	gchip->base = -1;
+	gchip->ngpio =  PCI1XXXX_NR_PINS;
+	gchip->can_sleep = false;
+
+	return 0;
+}
+
+static int pci1xxxx_gpio_probe(struct auxiliary_device *aux_dev,
+			       const struct auxiliary_device_id *id)
+
+{
+	struct auxiliary_device_wrapper *aux_dev_wrapper;
+	struct gp_aux_data_type *pdata;
+	struct pci1xxxx_gpio *priv;
+	int retval;
+
+	aux_dev_wrapper = (struct auxiliary_device_wrapper *)
+			  container_of(aux_dev, struct auxiliary_device_wrapper, aux_dev);
+
+	pdata = &aux_dev_wrapper->gp_aux_data;
+
+	if (!pdata)
+		return -EINVAL;
+
+	priv = devm_kzalloc(&aux_dev->dev, sizeof(struct pci1xxxx_gpio), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->aux_dev = aux_dev;
+
+	if (!devm_request_mem_region(&aux_dev->dev, pdata->region_start, 0x800, aux_dev->name))
+		return -EBUSY;
+
+	priv->reg_base = devm_ioremap(&aux_dev->dev, pdata->region_start, 0x800);
+	if (!priv->reg_base)
+		return -ENOMEM;
+
+	writel(0x0264, (priv->reg_base + 0x400 + 0xF0));
+
+	retval = pci1xxxx_gpio_setup(priv, pdata->irq_num);
+
+	if (retval < 0)
+		return retval;
+
+	dev_set_drvdata(&aux_dev->dev, priv);
+
+	return devm_gpiochip_add_data(&aux_dev->dev, &priv->gpio, priv);
+}
+
+const struct auxiliary_device_id pci1xxxx_gpio_auxiliary_id_table[] = {
+	{.name = "mchp_pci1xxxx_gp.gp_gpio"},
+	{}
+};
+
+static struct auxiliary_driver pci1xxxx_gpio_driver = {
+	.driver = {
+		.name = "PCI1xxxxGPIO",
+		},
+	.probe = pci1xxxx_gpio_probe,
+	.id_table = pci1xxxx_gpio_auxiliary_id_table
+};
+
+static int __init pci1xxxx_gpio_driver_init(void)
+{
+	return auxiliary_driver_register(&pci1xxxx_gpio_driver);
+}
+
+static void __exit pci1xxxx_gpio_driver_exit(void)
+{
+	auxiliary_driver_unregister(&pci1xxxx_gpio_driver);
+}
+
+module_init(pci1xxxx_gpio_driver_init);
+module_exit(pci1xxxx_gpio_driver_exit);
+
+MODULE_DESCRIPTION("Microchip Technology Inc. PCI1xxxx GPIO controller");
+MODULE_AUTHOR("Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

