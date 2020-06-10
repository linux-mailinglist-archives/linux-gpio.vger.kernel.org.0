Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665101F5B45
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgFJSfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:48393 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729076AbgFJSfu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:50 -0400
IronPort-SDR: vwNG+08VGeedzq/w4DIuNA+IF+PN9RFX1A5plxSpaOWSacuYNR00tKbxvrtHpI4db8W/vq5Jdt
 IxGJ2B/3c/JQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:51 -0700
IronPort-SDR: ZNLgDyYjy5FrtbIywkM99ZDlQmIrviPPHh6wHffE4hSpPp9Rt7B/aJwsVgNbFklU8DsXv1yr8f
 iyD2Dx3F7oUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="271337416"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 10 Jun 2020 11:35:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2A9A14D9; Wed, 10 Jun 2020 21:35:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 07/10] pinctrl: intel: Protect IO in few call backs by lock
Date:   Wed, 10 Jun 2020 21:35:40 +0300
Message-Id: <20200610183543.89414-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Protect IO in intel_gpio_get_direction(), intel_gpio_community_irq_handler(),
intel_config_get_debounce() and intel_config_get_pull() by lock. Even for
simple readl() we better serialize IO to avoid potential problems.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index bb940dc4e1d2..7e25e20293a8 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -526,11 +526,15 @@ static int intel_config_get_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 {
 	const struct intel_community *community;
 	void __iomem *padcfg1;
+	unsigned long flags;
 	u32 value, term;
 
 	community = intel_get_community(pctrl, pin);
 	padcfg1 = intel_get_padcfg(pctrl, pin, PADCFG1);
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	value = readl(padcfg1);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	term = (value & PADCFG1_TERM_MASK) >> PADCFG1_TERM_SHIFT;
 
@@ -592,6 +596,7 @@ static int intel_config_get_debounce(struct intel_pinctrl *pctrl, unsigned int p
 				     enum pin_config_param param, u32 *arg)
 {
 	void __iomem *padcfg2;
+	unsigned long flags;
 	unsigned long v;
 	u32 value2;
 
@@ -599,7 +604,9 @@ static int intel_config_get_debounce(struct intel_pinctrl *pctrl, unsigned int p
 	if (!padcfg2)
 		return -ENOTSUPP;
 
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	value2 = readl(padcfg2);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 	if (!(value2 & PADCFG2_DEBEN))
 		return -EINVAL;
 
@@ -934,6 +941,7 @@ static void intel_gpio_set(struct gpio_chip *chip, unsigned int offset,
 static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(chip);
+	unsigned long flags;
 	void __iomem *reg;
 	u32 padcfg0;
 	int pin;
@@ -946,8 +954,9 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (!reg)
 		return -EINVAL;
 
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	padcfg0 = readl(reg);
-
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 	if (padcfg0 & PADCFG0_PMODE_MASK)
 		return -EINVAL;
 
@@ -1134,12 +1143,17 @@ static int intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 	for (gpp = 0; gpp < community->ngpps; gpp++) {
 		const struct intel_padgroup *padgrp = &community->gpps[gpp];
 		unsigned long pending, enabled, gpp_offset;
+		unsigned long flags;
+
+		raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 		pending = readl(community->regs + community->is_offset +
 				padgrp->reg_num * 4);
 		enabled = readl(community->regs + community->ie_offset +
 				padgrp->reg_num * 4);
 
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
 		/* Only interrupts that are enabled */
 		pending &= enabled;
 
-- 
2.27.0.rc2

