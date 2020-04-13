Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8391A658F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 13:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbgDMLSb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 07:18:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:3812 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728826AbgDMLSa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 07:18:30 -0400
IronPort-SDR: 8X8pvIa1UThvHqNUK/iYwPtGe/gUhWmZ5rM+tuppnxm5LmaORxZudba5ewhuXoey7WV2gxSPcw
 zEa3e/plyq6Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 04:18:29 -0700
IronPort-SDR: J+8fLmFZQudK6Ht9ItQvHS9DVAVBvZ6GCoUW7avdAUuxX5ybYoJ2baJB2KclA3cdzGLlzGQTpd
 3wzdZYrDlqyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="266744443"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 13 Apr 2020 04:18:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3BD82DE; Mon, 13 Apr 2020 14:18:26 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/6] pinctrl: intel: Introduce common flags for GPIO mapping scheme
Date:   Mon, 13 Apr 2020 14:18:20 +0300
Message-Id: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Few drivers are using the same flag to tell Intel pin control core
how to interpret GPIO base.

Provide a generic flags so all drivers can use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: replace defines with enum with kernel doc descriptions (Mika)
 drivers/pinctrl/intel/pinctrl-intel.c | 19 +++++++++++++------
 drivers/pinctrl/intel/pinctrl-intel.h | 14 ++++++++++++--
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 74fdfd2b9ff5..a1b286dc7008 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -798,7 +798,7 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
 		for (j = 0; j < comm->ngpps; j++) {
 			const struct intel_padgroup *pgrp = &comm->gpps[j];
 
-			if (pgrp->gpio_base < 0)
+			if (pgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
 				continue;
 
 			if (offset >= pgrp->gpio_base &&
@@ -1138,7 +1138,7 @@ static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
 	for (i = 0; i < community->ngpps; i++) {
 		const struct intel_padgroup *gpp = &community->gpps[i];
 
-		if (gpp->gpio_base < 0)
+		if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
 			continue;
 
 		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
@@ -1180,7 +1180,7 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 		for (j = 0; j < community->ngpps; j++) {
 			const struct intel_padgroup *gpp = &community->gpps[j];
 
-			if (gpp->gpio_base < 0)
+			if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
 				continue;
 
 			if (gpp->gpio_base + gpp->size > ngpio)
@@ -1276,8 +1276,15 @@ static int intel_pinctrl_add_padgroups(struct intel_pinctrl *pctrl,
 		if (gpps[i].size > 32)
 			return -EINVAL;
 
-		if (!gpps[i].gpio_base)
-			gpps[i].gpio_base = gpps[i].base;
+		/* Special treatment for GPIO base */
+		switch (gpps[i].gpio_base) {
+			case INTEL_GPIO_BASE_MATCH:
+				gpps[i].gpio_base = gpps[i].base;
+				break;
+			case INTEL_GPIO_BASE_NOMAP:
+			default:
+				break;
+		}
 
 		gpps[i].padown_num = padown_num;
 
@@ -1596,7 +1603,7 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
 	struct device *dev = pctrl->dev;
 	u32 requested;
 
-	if (padgrp->gpio_base < 0)
+	if (padgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
 		return;
 
 	requested = intel_gpio_is_requested(&pctrl->chip, padgrp->gpio_base, padgrp->size);
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index c6f066f6d3fb..89f38fae6da7 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -53,8 +53,7 @@ struct intel_function {
  * @reg_num: GPI_IS register number
  * @base: Starting pin of this group
  * @size: Size of this group (maximum is 32).
- * @gpio_base: Starting GPIO base of this group (%0 if matches with @base,
- *	       and %-1 if no GPIO mapping should be created)
+ * @gpio_base: Starting GPIO base of this group
  * @padown_num: PAD_OWN register number (assigned by the core driver)
  *
  * If pad groups of a community are not the same size, use this structure
@@ -68,6 +67,17 @@ struct intel_padgroup {
 	unsigned int padown_num;
 };
 
+/**
+ * enum - Special treatment for GPIO base in pad group
+ *
+ * @INTEL_GPIO_BASE_NOMAP:	no GPIO mapping should be created
+ * @INTEL_GPIO_BASE_MATCH:	matches with starting pin number
+ */
+enum {
+	INTEL_GPIO_BASE_NOMAP	= -1,
+	INTEL_GPIO_BASE_MATCH	= 0,
+};
+
 /**
  * struct intel_community - Intel pin community description
  * @barno: MMIO BAR number where registers for this community reside
-- 
2.25.1

