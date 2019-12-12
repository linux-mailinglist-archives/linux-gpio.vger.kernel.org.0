Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA5411CAA6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbfLLK0K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:26:10 -0500
Received: from mga12.intel.com ([192.55.52.136]:37567 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728512AbfLLK0J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 05:26:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 02:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
   d="scan'208";a="245664560"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2019 02:26:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 51C85238; Thu, 12 Dec 2019 12:26:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        hdegoede@redhat.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/5] pinctrl: intel: Share struct intel_pinctrl for wider use
Date:   Thu, 12 Dec 2019 12:25:54 +0200
Message-Id: <20191212102557.87754-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are few drivers for Intel SoC GPIO which may utilize
the same data structure to describe this IP.

Share struct intel_pinctrl for wider user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 35 +--------------------
 drivers/pinctrl/intel/pinctrl-intel.h | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 4860bc9a4e48..924094956f8d 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -8,8 +8,8 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/interrupt.h>
 #include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -85,39 +85,6 @@ struct intel_community_context {
 	u32 *hostown;
 };
 
-struct intel_pinctrl_context {
-	struct intel_pad_context *pads;
-	struct intel_community_context *communities;
-};
-
-/**
- * struct intel_pinctrl - Intel pinctrl private structure
- * @dev: Pointer to the device structure
- * @lock: Lock to serialize register access
- * @pctldesc: Pin controller description
- * @pctldev: Pointer to the pin controller device
- * @chip: GPIO chip in this pin controller
- * @irqchip: IRQ chip in this pin controller
- * @soc: SoC/PCH specific pin configuration data
- * @communities: All communities in this pin controller
- * @ncommunities: Number of communities in this pin controller
- * @context: Configuration saved over system sleep
- * @irq: pinctrl/GPIO chip irq number
- */
-struct intel_pinctrl {
-	struct device *dev;
-	raw_spinlock_t lock;
-	struct pinctrl_desc pctldesc;
-	struct pinctrl_dev *pctldev;
-	struct gpio_chip chip;
-	struct irq_chip irqchip;
-	const struct intel_pinctrl_soc_data *soc;
-	struct intel_community *communities;
-	size_t ncommunities;
-	struct intel_pinctrl_context context;
-	int irq;
-};
-
 #define pin_to_padno(c, p)	((p) - (c)->pin_base)
 #define padgroup_offset(g, p)	((p) - (g)->base)
 
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 34b38a321760..c6f066f6d3fb 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -10,7 +10,10 @@
 #ifndef PINCTRL_INTEL_H
 #define PINCTRL_INTEL_H
 
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
 #include <linux/pm.h>
+#include <linux/spinlock_types.h>
 
 struct pinctrl_pin_desc;
 struct platform_device;
@@ -174,6 +177,47 @@ struct intel_pinctrl_soc_data {
 	size_t ncommunities;
 };
 
+struct intel_pad_context;
+struct intel_community_context;
+
+/**
+ * struct intel_pinctrl_context - context to be saved during suspend-resume
+ * @pads: Opaque context per pad (driver dependent)
+ * @communities: Opaque context per community (driver dependent)
+ */
+struct intel_pinctrl_context {
+	struct intel_pad_context *pads;
+	struct intel_community_context *communities;
+};
+
+/**
+ * struct intel_pinctrl - Intel pinctrl private structure
+ * @dev: Pointer to the device structure
+ * @lock: Lock to serialize register access
+ * @pctldesc: Pin controller description
+ * @pctldev: Pointer to the pin controller device
+ * @chip: GPIO chip in this pin controller
+ * @irqchip: IRQ chip in this pin controller
+ * @soc: SoC/PCH specific pin configuration data
+ * @communities: All communities in this pin controller
+ * @ncommunities: Number of communities in this pin controller
+ * @context: Configuration saved over system sleep
+ * @irq: pinctrl/GPIO chip irq number
+ */
+struct intel_pinctrl {
+	struct device *dev;
+	raw_spinlock_t lock;
+	struct pinctrl_desc pctldesc;
+	struct pinctrl_dev *pctldev;
+	struct gpio_chip chip;
+	struct irq_chip irqchip;
+	const struct intel_pinctrl_soc_data *soc;
+	struct intel_community *communities;
+	size_t ncommunities;
+	struct intel_pinctrl_context context;
+	int irq;
+};
+
 int intel_pinctrl_probe_by_hid(struct platform_device *pdev);
 int intel_pinctrl_probe_by_uid(struct platform_device *pdev);
 
-- 
2.24.0

