Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4311F7A16
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgFLOuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:10 -0400
Received: from mga09.intel.com ([134.134.136.24]:15155 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgFLOuK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:10 -0400
IronPort-SDR: pv3oOct4pXmWPz27U46zwiuShpCLtYWezxOojdBs66WRdEthAvs40EBUhUy2fnF7Oza/Ug8ZAU
 WXRrJhHeM09g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:09 -0700
IronPort-SDR: pOsHACIWV6tU46O07CCTBgDvG9Rve6Z7w2W+Okreoi6tkj43ug1tvsgZ0F8Qx9ydekLZdpdC4i
 h2IBhz8fXYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="380719450"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2020 07:50:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F2F6821D; Fri, 12 Jun 2020 17:50:06 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 02/13] pinctrl: intel: Reduce scope of the lock
Date:   Fri, 12 Jun 2020 17:49:55 +0300
Message-Id: <20200612145006.9145-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some cases lock covers unneeded calls and operations.
Reduce scope of the lock in such cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 9df5a0c0d416..d0b658ba2136 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -460,6 +460,8 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 	void __iomem *padcfg0;
 	unsigned long flags;
 
+	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	if (!intel_pad_owned_by_host(pctrl, pin)) {
@@ -472,8 +474,6 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
 		return 0;
 	}
 
-	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
-
 	/*
 	 * If pin is already configured in GPIO mode, we assume that
 	 * firmware provides correct settings. In such case we avoid
@@ -503,11 +503,10 @@ static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
 	void __iomem *padcfg0;
 	unsigned long flags;
 
-	raw_spin_lock_irqsave(&pctrl->lock, flags);
-
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
-	__intel_gpio_set_direction(padcfg0, input);
 
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	__intel_gpio_set_direction(padcfg0, input);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
@@ -622,10 +621,11 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 	int ret = 0;
 	u32 value;
 
-	raw_spin_lock_irqsave(&pctrl->lock, flags);
-
 	community = intel_get_community(pctrl, pin);
 	padcfg1 = intel_get_padcfg(pctrl, pin, PADCFG1);
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+
 	value = readl(padcfg1);
 
 	switch (param) {
-- 
2.27.0.rc2

