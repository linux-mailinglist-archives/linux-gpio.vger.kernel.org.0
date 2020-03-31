Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA3319998E
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 17:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730966AbgCaPZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 11:25:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:17202 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730946AbgCaPZv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Mar 2020 11:25:51 -0400
IronPort-SDR: cGukN29pP1Nbm7Jh3xk6Uv1Dt9JwgeBH2iiNufGbQqFoXumki981elRnsL4vTlT7gvE1uSRCjf
 Qzrd1swbv02w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 08:25:50 -0700
IronPort-SDR: q1Eex8Hk+aaiwtv7mMuKGRl2/dOL+P3T56qLhIimdMB8fQggYz9D4UxgaeUbRG/63GHzqKJ1qG
 8NHOIpTu1YvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="395530019"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2020 08:25:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2E409202; Tue, 31 Mar 2020 18:25:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] pinctrl: intel: Introduce common flags for GPIO mapping scheme
Date:   Tue, 31 Mar 2020 18:25:44 +0300
Message-Id: <20200331152547.34044-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-intel.c | 19 +++++++++++++------
 drivers/pinctrl/intel/pinctrl-intel.h |  5 +++--
 2 files changed, 16 insertions(+), 8 deletions(-)

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
index c6f066f6d3fb..df11bd6e4a80 100644
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
@@ -64,6 +63,8 @@ struct intel_padgroup {
 	unsigned int reg_num;
 	unsigned int base;
 	unsigned int size;
+#define INTEL_GPIO_BASE_MATCH	0	/* matches with @base */
+#define INTEL_GPIO_BASE_NOMAP	(-1)	/* no GPIO mapping should be created */
 	int gpio_base;
 	unsigned int padown_num;
 };
-- 
2.25.1

