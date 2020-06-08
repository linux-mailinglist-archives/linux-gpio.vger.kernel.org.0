Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F7F1F1A48
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 15:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbgFHNn1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 09:43:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:11264 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729847AbgFHNnI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jun 2020 09:43:08 -0400
IronPort-SDR: c1flsy9Laug+B+P7BejazEFSoUIKG3Is4UeJXRZttg5mwck+T4D6nrP8FPdudzFUYfIfSvRXi2
 RngJx404mRRA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 06:43:08 -0700
IronPort-SDR: wkoB6TaGPVjkzPD8OvsgRFGE8/+y4/6TtE/A/9P7z9q1TvTJMdXxyxl8O1Cg4Dzh3PVrWFSP7u
 tgofj3AZ2lBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; 
   d="scan'208";a="472584278"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2020 06:43:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D91683CE; Mon,  8 Jun 2020 16:43:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/6] gpio: dwapb: Get rid of legacy platform data
Date:   Mon,  8 Jun 2020 16:42:59 +0300
Message-Id: <20200608134300.76091-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Platform data is a legacy interface to supply device properties
to the driver. In this case we don't have anymore in-kernel users
for it. Just remove it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c                | 27 +++++++++++++++---------
 include/linux/platform_data/gpio-dwapb.h | 22 -------------------
 2 files changed, 17 insertions(+), 32 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-dwapb.h

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index e3d7589434eb..de01b8943bd2 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -23,7 +23,6 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
-#include <linux/platform_data/gpio-dwapb.h>
 #include <linux/slab.h>
 
 #include "gpiolib.h"
@@ -66,6 +65,19 @@
 
 #define DWAPB_NR_CLOCKS		2
 
+struct dwapb_port_property {
+	struct fwnode_handle *fwnode;
+	unsigned int idx;
+	unsigned int ngpio;
+	unsigned int gpio_base;
+	int irq[32];
+};
+
+struct dwapb_platform_data {
+	struct dwapb_port_property *properties;
+	unsigned int nports;
+};
+
 struct dwapb_gpio;
 
 #ifdef CONFIG_PM_SLEEP
@@ -633,17 +645,12 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
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
index a63010b6e898..000000000000
--- a/include/linux/platform_data/gpio-dwapb.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright(c) 2014 Intel Corporation.
- */
-
-#ifndef GPIO_DW_APB_H
-#define GPIO_DW_APB_H
-
-struct dwapb_port_property {
-	struct fwnode_handle *fwnode;
-	unsigned int	idx;
-	unsigned int	ngpio;
-	unsigned int	gpio_base;
-	int		irq[32];
-};
-
-struct dwapb_platform_data {
-	struct dwapb_port_property *properties;
-	unsigned int nports;
-};
-
-#endif
-- 
2.27.0.rc2

