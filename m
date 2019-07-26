Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E75C57728E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2019 22:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfGZUIf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jul 2019 16:08:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:47468 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfGZUIf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Jul 2019 16:08:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jul 2019 13:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,312,1559545200"; 
   d="scan'208";a="175715896"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2019 13:08:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8E995130; Fri, 26 Jul 2019 23:08:31 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Allow to request locked pins
Date:   Fri, 26 Jul 2019 23:08:30 +0300
Message-Id: <20190726200830.52728-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some firmwares would like to protect pins from being modified by OS
and at the same time provide them to OS as a resource. So, the driver
in such circumstances may request pin and may not change its state.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 55 +++++++++++++++++++--------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 3a945997b8eb..567fe43b238f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -220,22 +220,30 @@ static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned int pin)
 	return !(readl(hostown) & BIT(gpp_offset));
 }
 
-static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
+enum {
+	PAD_UNLOCKED	= 0,
+	PAD_LOCKED	= 1,
+	PAD_LOCKED_TX	= 2,
+	PAD_LOCKED_FULL	= PAD_LOCKED | PAD_LOCKED_TX,
+};
+
+static int intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	struct intel_community *community;
 	const struct intel_padgroup *padgrp;
 	unsigned int offset, gpp_offset;
 	u32 value;
+	int ret = PAD_UNLOCKED;
 
 	community = intel_get_community(pctrl, pin);
 	if (!community)
-		return true;
+		return PAD_LOCKED_FULL;
 	if (!community->padcfglock_offset)
-		return false;
+		return PAD_UNLOCKED;
 
 	padgrp = intel_community_get_padgroup(community, pin);
 	if (!padgrp)
-		return true;
+		return PAD_LOCKED_FULL;
 
 	gpp_offset = padgroup_offset(padgrp, pin);
 
@@ -244,23 +252,27 @@ static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
 	 * the pad is considered unlocked. Any other case means that it is
 	 * either fully or partially locked and we don't touch it.
 	 */
-	offset = community->padcfglock_offset + padgrp->reg_num * 8;
+	offset = community->padcfglock_offset + 0 + padgrp->reg_num * 8;
 	value = readl(community->regs + offset);
 	if (value & BIT(gpp_offset))
-		return true;
+		ret |= PAD_LOCKED;
 
 	offset = community->padcfglock_offset + 4 + padgrp->reg_num * 8;
 	value = readl(community->regs + offset);
 	if (value & BIT(gpp_offset))
-		return true;
+		ret |= PAD_LOCKED_TX;
 
-	return false;
+	return ret;
+}
+
+static bool intel_pad_is_unlocked(struct intel_pinctrl *pctrl, unsigned int pin)
+{
+	return (intel_pad_locked(pctrl, pin) & PAD_LOCKED) == PAD_UNLOCKED;
 }
 
 static bool intel_pad_usable(struct intel_pinctrl *pctrl, unsigned int pin)
 {
-	return intel_pad_owned_by_host(pctrl, pin) &&
-		!intel_pad_locked(pctrl, pin);
+	return intel_pad_owned_by_host(pctrl, pin) && intel_pad_is_unlocked(pctrl, pin);
 }
 
 static int intel_get_groups_count(struct pinctrl_dev *pctldev)
@@ -294,7 +306,8 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *padcfg;
 	u32 cfg0, cfg1, mode;
-	bool locked, acpi;
+	int locked;
+	bool acpi;
 
 	if (!intel_pad_owned_by_host(pctrl, pin)) {
 		seq_puts(s, "not available");
@@ -322,11 +335,16 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 
 	if (locked || acpi) {
 		seq_puts(s, " [");
-		if (locked) {
+		if (locked)
 			seq_puts(s, "LOCKED");
-			if (acpi)
-				seq_puts(s, ", ");
-		}
+		if ((locked & PAD_LOCKED_FULL) == PAD_LOCKED_TX)
+			seq_puts(s, " TX");
+		else if ((locked & PAD_LOCKED_FULL) == PAD_LOCKED_FULL)
+			seq_puts(s, " FULL");
+
+		if (locked && acpi)
+			seq_puts(s, ", ");
+
 		if (acpi)
 			seq_puts(s, "ACPI");
 		seq_puts(s, "]");
@@ -448,11 +466,16 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	if (!intel_pad_usable(pctrl, pin)) {
+	if (!intel_pad_owned_by_host(pctrl, pin)) {
 		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 		return -EBUSY;
 	}
 
+	if (!intel_pad_is_unlocked(pctrl, pin)) {
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+		return 0;
+	}
+
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
 	intel_gpio_set_gpio_mode(padcfg0);
 	/* Disable TX buffer and enable RX (this will be input) */
-- 
2.20.1

