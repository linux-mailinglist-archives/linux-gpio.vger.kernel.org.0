Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEB8A116DA6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbfLINJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:34 -0500
Received: from mga17.intel.com ([192.55.52.151]:34154 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727604AbfLINJe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="215208187"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D1E2B8F1; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 15/24] pinctrl: lynxpoint: Move ownership check to IRQ chip
Date:   Mon,  9 Dec 2019 15:09:17 +0200
Message-Id: <20191209130926.86483-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is nothing wrong with requesting pin that owned by ACPI.
The only difference is how interrupt status will be reflected.
It means that in ACPI mode we may not use pin as GPIO-backed IRQ.

Taking above into consideration, move the check from GPIO to IRQ chip
callback.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 19e8f8f1f7aa..ddb201e5d78f 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -118,12 +118,6 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned int offset)
 
 	pm_runtime_get(lg->dev); /* should we put if failed */
 
-	/* Fail if BIOS reserved pin for ACPI use */
-	if (lp_gpio_acpi_use(lg, offset)) {
-		dev_err(lg->dev, "gpio %d reserved for ACPI\n", offset);
-		return -EBUSY;
-	}
-
 	/*
 	 * Reconfigure pin to GPIO mode if needed and issue a warning,
 	 * since we expect firmware to configure it properly.
@@ -280,6 +274,12 @@ static int lp_irq_set_type(struct irq_data *d, unsigned int type)
 	if (hwirq >= lg->chip.ngpio)
 		return -EINVAL;
 
+	/* Fail if BIOS reserved pin for ACPI use */
+	if (lp_gpio_acpi_use(lg, hwirq)) {
+		dev_err(lg->dev, "pin %u can't be used as IRQ\n", hwirq);
+		return -EBUSY;
+	}
+
 	raw_spin_lock_irqsave(&lg->lock, flags);
 	value = ioread32(reg);
 
-- 
2.24.0

