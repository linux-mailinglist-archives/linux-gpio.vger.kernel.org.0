Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9741F5B41
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729050AbgFJSfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:47 -0400
Received: from mga03.intel.com ([134.134.136.65]:57675 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729058AbgFJSfr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:47 -0400
IronPort-SDR: L9xR2oyhWgs2/15uUD+qXAsngafZI5OFRRS54aLVtGL5F1e92vntxXsAgDJWM2jcpzWAe3fisP
 NxTmcapAUmtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:47 -0700
IronPort-SDR: i0a/Yg6xhXaDmjAhr5RHu9C97KePlbjYYJTkrrRDjVZikuiOD5Yd4BG/BKqakLSqFPjWABhTgs
 RBwP805sJaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="260245262"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 10 Jun 2020 11:35:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EFEA4D2; Wed, 10 Jun 2020 21:35:44 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 02/10] pinctrl: intel: Reduce scope of the lock
Date:   Wed, 10 Jun 2020 21:35:35 +0300
Message-Id: <20200610183543.89414-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
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

