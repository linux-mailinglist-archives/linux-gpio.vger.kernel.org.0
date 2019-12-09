Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9D8116DA9
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbfLINJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:36 -0500
Received: from mga18.intel.com ([134.134.136.126]:29136 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727604AbfLINJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="206887936"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2019 05:09:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 83C597AF; Mon,  9 Dec 2019 15:09:27 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 08/24] pinctrl: lynxpoint: Relax GPIO request rules
Date:   Mon,  9 Dec 2019 15:09:10 +0200
Message-Id: <20191209130926.86483-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A pin in native mode still can be requested as GPIO, though we assume
that firmware has configured it properly, which sometimes is not the case.

Here we allow turning the pin as GPIO to avoid potential issues,
but issue warning that something might be wrong.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 4b2e3f298641..3ac95f9d6a7f 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -104,6 +104,7 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 	unsigned long reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
 	unsigned long conf2 = lp_gpio_reg(chip, offset, LP_CONFIG2);
 	unsigned long acpi_use = lp_gpio_reg(chip, offset, LP_ACPI_OWNED);
+	u32 value;
 
 	pm_runtime_get(&lg->pdev->dev); /* should we put if failed */
 
@@ -112,9 +113,16 @@ static int lp_gpio_request(struct gpio_chip *chip, unsigned offset)
 		dev_err(&lg->pdev->dev, "gpio %d reserved for ACPI\n", offset);
 		return -EBUSY;
 	}
-	/* Fail if pin is in alternate function mode (not GPIO mode) */
-	if ((inl(reg) & USE_SEL_MASK) != USE_SEL_GPIO)
-		return -ENODEV;
+
+	/*
+	 * Reconfigure pin to GPIO mode if needed and issue a warning,
+	 * since we expect firmware to configure it properly.
+	 */
+	value = inl(reg);
+	if ((value & USE_SEL_MASK) != USE_SEL_GPIO) {
+		outl((value & USE_SEL_MASK) | USE_SEL_GPIO, reg);
+		dev_warn(&lg->pdev->dev, FW_BUG "pin %u forcibly reconfigured as GPIO\n", offset);
+	}
 
 	/* enable input sensing */
 	outl(inl(conf2) & ~GPINDIS_BIT, conf2);
-- 
2.24.0

