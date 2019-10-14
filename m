Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35ACAD5F5A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 11:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730880AbfJNJvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 05:51:07 -0400
Received: from mga05.intel.com ([192.55.52.43]:15099 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730872AbfJNJvH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Oct 2019 05:51:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 02:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="207937492"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2019 02:51:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 844C6E6; Mon, 14 Oct 2019 12:51:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        fei.yang@intel.com, Oliver Barta <oliver.barta@aptiv.com>,
        Malin Jonsson <malin.jonsson@ericsson.com>
Subject: [PATCH v1] pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
Date:   Mon, 14 Oct 2019 12:51:04 +0300
Message-Id: <20191014095104.77689-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When consumer requests a pin, in order to be on the safest side,
we switch it first to GPIO mode followed by immediate transition
to the input state. Due to posted writes it's luckily to be a single
I/O transaction.

However, if firmware or boot loader already configures the pin
to the GPIO mode, user expects no glitches for the requested pin.
We may check if the pin is pre-configured and leave it as is
till the actual consumer toggles its state to avoid glitches.

Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
Depends-on: f5a26acf0162 ("pinctrl: intel: Initialize GPIO properly when used through irqchip")
Cc: fei.yang@intel.com
Reported-by: Oliver Barta <oliver.barta@aptiv.com>
Reported-by: Malin Jonsson <malin.jonsson@ericsson.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index b9df243e19cf..df8ca7cdefcb 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -52,6 +52,7 @@
 #define PADCFG0_GPIROUTNMI		BIT(17)
 #define PADCFG0_PMODE_SHIFT		10
 #define PADCFG0_PMODE_MASK		GENMASK(13, 10)
+#define PADCFG0_PMODE_GPIO		0
 #define PADCFG0_GPIORXDIS		BIT(9)
 #define PADCFG0_GPIOTXDIS		BIT(8)
 #define PADCFG0_GPIORXSTATE		BIT(1)
@@ -332,7 +333,7 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 	cfg1 = readl(intel_get_padcfg(pctrl, pin, PADCFG1));
 
 	mode = (cfg0 & PADCFG0_PMODE_MASK) >> PADCFG0_PMODE_SHIFT;
-	if (!mode)
+	if (mode == PADCFG0_PMODE_GPIO)
 		seq_puts(s, "GPIO ");
 	else
 		seq_printf(s, "mode %d ", mode);
@@ -458,6 +459,11 @@ static void __intel_gpio_set_direction(void __iomem *padcfg0, bool input)
 	writel(value, padcfg0);
 }
 
+static int intel_gpio_get_gpio_mode(void __iomem *padcfg0)
+{
+	return (readl(padcfg0) & PADCFG0_PMODE_MASK) >> PADCFG0_PMODE_SHIFT;
+}
+
 static void intel_gpio_set_gpio_mode(void __iomem *padcfg0)
 {
 	u32 value;
@@ -491,7 +497,20 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	}
 
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
+
+	/*
+	 * If pin is already configured in GPIO mode, we assume that
+	 * firmware provides correct settings. In such case we avoid
+	 * potential glitches on the pin. Otherwise, for the pin in
+	 * alternative mode, consumer has to supply respective flags.
+	 */
+	if (intel_gpio_get_gpio_mode(padcfg0) == PADCFG0_PMODE_GPIO) {
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+		return 0;
+	}
+
 	intel_gpio_set_gpio_mode(padcfg0);
+
 	/* Disable TX buffer and enable RX (this will be input) */
 	__intel_gpio_set_direction(padcfg0, true);
 
-- 
2.23.0

