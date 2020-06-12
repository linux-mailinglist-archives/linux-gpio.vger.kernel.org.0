Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D267A1F7A18
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgFLOuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:5661 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgFLOuK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:10 -0400
IronPort-SDR: Z4ChiEeRjWbLtb9lhMG0rw1Ys0RlXC92RGK8JVSvdUQjkdTkqINj74jRVKW6OsOYOQus67H2Pd
 y8igiqcHQUyg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:09 -0700
IronPort-SDR: I7rkEr8A1EDuAhtVLfjO3sFkTUAFQ3DdZNxTV3IrtHAhzivtvxGRnPTTFJAZZnCShh/s0ru2Me
 ZXLtzPHFG2jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="260847907"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2020 07:50:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E77DD277; Fri, 12 Jun 2020 17:50:06 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 01/13] pinctrl: intel: Disable input and output buffer when switching to GPIO
Date:   Fri, 12 Jun 2020 17:49:54 +0300
Message-Id: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's possible scenario that pin has been in different mode, while
the respective GPIO register has a leftover output buffer enabled.
In such case when we request GPIO it will switch to GPIO mode, and
thus to output with unknown value, followed by switching to input
mode. This can produce a glitch on the pin.

Disable input and output buffer when switching to GPIO to avoid
potential glitches.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 6a274e20d926..9df5a0c0d416 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -435,11 +435,20 @@ static void intel_gpio_set_gpio_mode(void __iomem *padcfg0)
 {
 	u32 value;
 
+	value = readl(padcfg0);
+
 	/* Put the pad into GPIO mode */
-	value = readl(padcfg0) & ~PADCFG0_PMODE_MASK;
+	value &= ~PADCFG0_PMODE_MASK;
+	value |= PADCFG0_PMODE_GPIO;
+
+	/* Disable input and output buffers */
+	value &= ~PADCFG0_GPIORXDIS;
+	value &= ~PADCFG0_GPIOTXDIS;
+
 	/* Disable SCI/SMI/NMI generation */
 	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
 	value &= ~(PADCFG0_GPIROUTSMI | PADCFG0_GPIROUTNMI);
+
 	writel(value, padcfg0);
 }
 
@@ -1036,6 +1045,9 @@ static int intel_gpio_irq_type(struct irq_data *d, unsigned int type)
 
 	intel_gpio_set_gpio_mode(reg);
 
+	/* Disable TX buffer and enable RX (this will be input) */
+	__intel_gpio_set_direction(reg, true);
+
 	value = readl(reg);
 
 	value &= ~(PADCFG0_RXEVCFG_MASK | PADCFG0_RXINV);
-- 
2.27.0.rc2

