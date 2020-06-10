Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69ADF1F5B3F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgFJSfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:8840 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729050AbgFJSfr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:47 -0400
IronPort-SDR: 4HjEIe8zhAhqCE1osVcfre6frIkXOuMwqaT3GymzxIYnE0+z8moPXd9J9XMNHfwVzLQfLAXLNK
 8xshHxc1K+WA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:47 -0700
IronPort-SDR: TS2xLLrtdhE25N2NA6GKwsL+RK/7/OkOGDFWiSCJiJ58Ea5DH9sNbBYXERSstzLefvsOe9c98g
 5YxObhEOdOxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="259367416"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2020 11:35:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E53A221D; Wed, 10 Jun 2020 21:35:44 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 01/10] pinctrl: intel: Disable input and output buffer when switching to GPIO
Date:   Wed, 10 Jun 2020 21:35:34 +0300
Message-Id: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
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

