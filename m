Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF543E05B5
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 18:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhHDQRU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 12:17:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:16160 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229731AbhHDQRT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Aug 2021 12:17:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="201139878"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="201139878"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 09:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="419487558"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 04 Aug 2021 09:15:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8F7921CB; Wed,  4 Aug 2021 19:16:11 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/4] gpio: dwapb: Get rid of legacy platform data
Date:   Wed,  4 Aug 2021 19:00:19 +0300
Message-Id: <20210804160019.77105-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
References: <20210804160019.77105-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Platform data is a legacy interface to supply device properties
to the driver. In this case we don't have anymore in-kernel users
for it. Just remove it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
v2: added tags, put structures after forward declaration (Serge)
 drivers/gpio/gpio-dwapb.c                | 28 +++++++++++++++---------
 include/linux/platform_data/gpio-dwapb.h | 24 --------------------
 2 files changed, 18 insertions(+), 34 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-dwapb.h

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 674e91e69cc5..f98fa33e1679 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -16,7 +16,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/platform_data/gpio-dwapb.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/reset.h>
@@ -48,6 +47,7 @@
 
 #define DWAPB_DRIVER_NAME	"gpio-dwapb"
 #define DWAPB_MAX_PORTS		4
+#define DWAPB_MAX_GPIOS		32
 
 #define GPIO_EXT_PORT_STRIDE	0x04 /* register stride 32 bits */
 #define GPIO_SWPORT_DR_STRIDE	0x0c /* register stride 3*32 bits */
@@ -65,6 +65,19 @@
 
 struct dwapb_gpio;
 
+struct dwapb_port_property {
+	struct fwnode_handle *fwnode;
+	unsigned int idx;
+	unsigned int ngpio;
+	unsigned int gpio_base;
+	int irq[DWAPB_MAX_GPIOS];
+};
+
+struct dwapb_platform_data {
+	struct dwapb_port_property *properties;
+	unsigned int nports;
+};
+
 #ifdef CONFIG_PM_SLEEP
 /* Store GPIO context across system-wide suspend/resume transitions */
 struct dwapb_context {
@@ -674,17 +687,12 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	unsigned int i;
 	struct dwapb_gpio *gpio;
 	int err;
+	struct dwapb_platform_data *pdata;
 	struct device *dev = &pdev->dev;
-	struct dwapb_platform_data *pdata = dev_get_platdata(dev);
-
-	if (!pdata) {
-		pdata = dwapb_gpio_get_pdata(dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
 
-	if (!pdata->nports)
-		return -ENODEV;
+	pdata = dwapb_gpio_get_pdata(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
deleted file mode 100644
index 535e5ed549d9..000000000000
--- a/include/linux/platform_data/gpio-dwapb.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright(c) 2014 Intel Corporation.
- */
-
-#ifndef GPIO_DW_APB_H
-#define GPIO_DW_APB_H
-
-#define DWAPB_MAX_GPIOS		32
-
-struct dwapb_port_property {
-	struct fwnode_handle *fwnode;
-	unsigned int	idx;
-	unsigned int	ngpio;
-	unsigned int	gpio_base;
-	int		irq[DWAPB_MAX_GPIOS];
-};
-
-struct dwapb_platform_data {
-	struct dwapb_port_property *properties;
-	unsigned int nports;
-};
-
-#endif
-- 
2.30.2

