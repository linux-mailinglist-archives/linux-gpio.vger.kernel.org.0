Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 595F471C42
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 17:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbfGWPye (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 11:54:34 -0400
Received: from mga17.intel.com ([192.55.52.151]:41009 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727398AbfGWPye (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 11:54:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 08:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="169598716"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2019 08:54:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3490981; Tue, 23 Jul 2019 18:54:31 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Use NSEC_PER_USEC for debounce calculus
Date:   Tue, 23 Jul 2019 18:54:31 +0300
Message-Id: <20190723155431.65095-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace hard coded constants with self-explanatory names, i.e.
use NSEC_PER_USEC for debounce calculus.

While here, add a unit suffix to debounce period constant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 3a7876efd4a6..99c5bca789eb 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -8,12 +8,13 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/gpio/driver.h>
 #include <linux/log2.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/time.h>
 
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -71,7 +72,7 @@
 #define PADCFG2_DEBOUNCE_SHIFT		1
 #define PADCFG2_DEBOUNCE_MASK		GENMASK(4, 1)
 
-#define DEBOUNCE_PERIOD			31250 /* ns */
+#define DEBOUNCE_PERIOD_NS		31250
 
 struct intel_pad_context {
 	u32 padcfg0;
@@ -566,7 +567,7 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			return -EINVAL;
 
 		v = (v & PADCFG2_DEBOUNCE_MASK) >> PADCFG2_DEBOUNCE_SHIFT;
-		arg = BIT(v) * DEBOUNCE_PERIOD / 1000;
+		arg = BIT(v) * DEBOUNCE_PERIOD_NS / NSEC_PER_USEC;
 
 		break;
 	}
@@ -683,7 +684,7 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 	if (debounce) {
 		unsigned long v;
 
-		v = order_base_2(debounce * 1000 / DEBOUNCE_PERIOD);
+		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NS);
 		if (v < 3 || v > 15) {
 			ret = -EINVAL;
 			goto exit_unlock;
-- 
2.20.1

