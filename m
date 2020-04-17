Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B7A1AD4B6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 05:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgDQDHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 23:07:22 -0400
Received: from mga09.intel.com ([134.134.136.24]:55962 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbgDQDHW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 23:07:22 -0400
IronPort-SDR: EYdJCmtBru4rbaluOyE5MHeEV7Ivrm+HrzjFRK86wc3KiFFCHHtZtTSzQr6Y4DytL+QqCIWyWV
 8rkoE9IPUrdA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 20:07:21 -0700
IronPort-SDR: oHFK1spMtpYMj3ToB3RxqHDIeFREVMv9M2EozHcEDEAr5bLUR9sj5f/mtarLi5cvLgUCKMUukH
 eYkPq9vAo4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; 
   d="scan'208";a="289122494"
Received: from gracekao-precision-3630-tower.itwn.intel.com ([10.5.232.24])
  by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2020 20:07:19 -0700
From:   Grace Kao <grace.kao@intel.com>
To:     linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, briannorris@chromium.org,
        grace.kao@intel.com
Subject: [PATCH v2 1/1] pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
Date:   Fri, 17 Apr 2020 11:04:49 +0800
Message-Id: <20200417030449.10601-1-grace.kao@intel.com>
X-Mailer: git-send-email 2.17.1
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

