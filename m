Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE8075E794
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 17:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfGCPP5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 11:15:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:49025 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbfGCPP5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jul 2019 11:15:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jul 2019 08:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="362672636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2019 08:15:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 08FC612C; Wed,  3 Jul 2019 18:15:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: baytrail: Use GENMASK() consistently
Date:   Wed,  3 Jul 2019 18:15:54 +0300
Message-Id: <20190703151554.30454-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use GENMASK() macro for all definitions where it's appropriate.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4fc4f9658484..14a81943c5ab 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -37,6 +37,7 @@
 /* BYT_CONF0_REG register bits */
 #define BYT_IODEN		BIT(31)
 #define BYT_DIRECT_IRQ_EN	BIT(27)
+#define BYT_TRIG_MASK		GENMASK(26, 24)
 #define BYT_TRIG_NEG		BIT(26)
 #define BYT_TRIG_POS		BIT(25)
 #define BYT_TRIG_LVL		BIT(24)
@@ -45,31 +46,28 @@
 #define BYT_GLITCH_F_SLOW_CLK	BIT(17)
 #define BYT_GLITCH_F_FAST_CLK	BIT(16)
 #define BYT_PULL_STR_SHIFT	9
-#define BYT_PULL_STR_MASK	(3 << BYT_PULL_STR_SHIFT)
+#define BYT_PULL_STR_MASK	GENMASK(10, 9)
 #define BYT_PULL_STR_2K		(0 << BYT_PULL_STR_SHIFT)
 #define BYT_PULL_STR_10K	(1 << BYT_PULL_STR_SHIFT)
 #define BYT_PULL_STR_20K	(2 << BYT_PULL_STR_SHIFT)
 #define BYT_PULL_STR_40K	(3 << BYT_PULL_STR_SHIFT)
 #define BYT_PULL_ASSIGN_SHIFT	7
-#define BYT_PULL_ASSIGN_MASK	(3 << BYT_PULL_ASSIGN_SHIFT)
+#define BYT_PULL_ASSIGN_MASK	GENMASK(8, 7)
 #define BYT_PULL_ASSIGN_UP	(1 << BYT_PULL_ASSIGN_SHIFT)
 #define BYT_PULL_ASSIGN_DOWN	(2 << BYT_PULL_ASSIGN_SHIFT)
-#define BYT_PIN_MUX		0x07
+#define BYT_PIN_MUX		GENMASK(2, 0)
 
 /* BYT_VAL_REG register bits */
+#define BYT_DIR_MASK		GENMASK(2, 1)
 #define BYT_INPUT_EN		BIT(2)  /* 0: input enabled (active low)*/
 #define BYT_OUTPUT_EN		BIT(1)  /* 0: output enabled (active low)*/
 #define BYT_LEVEL		BIT(0)
 
-#define BYT_DIR_MASK		(BIT(1) | BIT(2))
-#define BYT_TRIG_MASK		(BIT(26) | BIT(25) | BIT(24))
-
-#define BYT_CONF0_RESTORE_MASK	(BYT_DIRECT_IRQ_EN | BYT_TRIG_MASK | \
-				 BYT_PIN_MUX)
+#define BYT_CONF0_RESTORE_MASK	(BYT_DIRECT_IRQ_EN | BYT_TRIG_MASK | BYT_PIN_MUX)
 #define BYT_VAL_RESTORE_MASK	(BYT_DIR_MASK | BYT_LEVEL)
 
 /* BYT_DEBOUNCE_REG bits */
-#define BYT_DEBOUNCE_PULSE_MASK		0x7
+#define BYT_DEBOUNCE_PULSE_MASK		GENMASK(2, 0)
 #define BYT_DEBOUNCE_PULSE_375US	1
 #define BYT_DEBOUNCE_PULSE_750US	2
 #define BYT_DEBOUNCE_PULSE_1500US	3
-- 
2.20.1

