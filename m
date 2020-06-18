Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125D91FF0F6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 13:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgFRLtL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 07:49:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:55249 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727788AbgFRLtK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jun 2020 07:49:10 -0400
IronPort-SDR: RffHWMUlYGquQ9DyfoEAjauVQ3nU2duWXE4hAPYKPFl87aTvyMGeaMfsCrqSvwNMPe+MZbnwYe
 KpXN+R3UCVJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="142484247"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="142484247"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 04:49:09 -0700
IronPort-SDR: WL6lFX7bXpJ+a4YAsMN9L5ak+/jQZlgkXP15e98g3/NTb4ioPeDCB4HGGl898OX4yXSB36EAFb
 pmEieVpZycZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="383502763"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2020 04:49:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6AFC2217; Thu, 18 Jun 2020 14:49:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1] gpio: pca953x: Fix GPIO resource leak on Intel Galileo Gen 2
Date:   Thu, 18 Jun 2020 14:49:06 +0300
Message-Id: <20200618114906.79346-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When adding a quirk for IRQ on Intel Galileo Gen 2 the commit ba8c90c61847
("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
missed GPIO resource release. We can safely do this in the same quirk, since
IRQ will be locked by GPIO framework when requested and unlocked on freeing.

Fixes: ba8c90c61847 ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index cea22fcc2a24..9c90cf3aac5a 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -177,7 +177,12 @@ static int pca953x_acpi_get_irq(struct device *dev)
 	if (ret)
 		return ret;
 
-	return gpio_to_irq(pin);
+	ret = gpio_to_irq(pin);
+
+	/* When pin is used as an IRQ, no need to keep it requested */
+	gpio_free(pin);
+
+	return ret;
 }
 #endif
 
-- 
2.27.0.rc2

