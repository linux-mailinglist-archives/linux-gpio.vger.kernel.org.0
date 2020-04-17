Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FEB1AD516
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 06:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgDQEOY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 00:14:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:21656 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgDQEOX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 00:14:23 -0400
IronPort-SDR: s4wWzdpompxrKbrQbxJF0cTD0NIjQkQGXzr0199LHZaTFh+ZAWO2s+MzWYSdMAp33MGCrDOLGh
 sxl677ojiHTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 21:14:23 -0700
IronPort-SDR: IDoNqVk6E6JTgW9w8qABw1UfOocx9w9nxydBfZUKoOb1XROwI3gJge4Xq0SDPmjsJxJ0gBC1iI
 3b4TmP3aeLcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; 
   d="scan'208";a="278241747"
Received: from gracekao-precision-3630-tower.itwn.intel.com ([10.5.232.24])
  by fmsmga004.fm.intel.com with ESMTP; 16 Apr 2020 21:14:22 -0700
From:   Grace Kao <grace.kao@intel.com>
To:     linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, briannorris@chromium.org,
        grace.kao@intel.com
Subject: [PATCH v2 1/1] pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
Date:   Fri, 17 Apr 2020 12:11:54 +0800
Message-Id: <20200417041154.13063-1-grace.kao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417030449.10601-1-grace.kao@intel.com>
References: <20200417030449.10601-1-grace.kao@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to Braswell NDA Specification Update (#557593),
concurrent read accesses may result in returning 0xffffffff and write
instructions may be dropped. We have an established format for the
commit references, i.e.
cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in
byt_gpio_irq_handler")

Signed-off-by: Grace Kao <grace.kao@intel.com>
Reported-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 4c74fdde576d..1093a6105d40 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1479,11 +1479,15 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
+	unsigned long flags;
 	u32 intr_line;
 
 	chained_irq_enter(chip, desc);
 
+	raw_spin_lock_irqsave(&chv_lock, flags);
 	pending = readl(pctrl->regs + CHV_INTSTAT);
+	raw_spin_unlock_irqrestore(&chv_lock, flags);
+
 	for_each_set_bit(intr_line, &pending, pctrl->community->nirqs) {
 		unsigned int irq, offset;
 
-- 
2.17.1

