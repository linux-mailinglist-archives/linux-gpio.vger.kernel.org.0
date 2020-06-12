Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10701F7A1C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgFLOuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:15155 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgFLOuM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:12 -0400
IronPort-SDR: yc7O+zpXkvaUH359rzvvlRvaAnfI1ShVSK+v5MATDEuUxa8wXtDR0wxdXElp/fnjyyS8v/Rzap
 8x4+6VIy6wsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:11 -0700
IronPort-SDR: Gmo1lDWVr1xVwgXzBrFHHQYJoPQyEk0T5+sQnBlqUcZ4igT+25nO8qBcbyLk7j+9OfKsedNPuy
 N1JdBnnsNU7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="260983695"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2020 07:50:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 26DB45FC; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 07/13] pinctrl: intel: Protect IO in few call backs by lock
Date:   Fri, 12 Jun 2020 17:50:00 +0300
Message-Id: <20200612145006.9145-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
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
index d6ef012f2cc4..35c88fcb75a2 100644
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

