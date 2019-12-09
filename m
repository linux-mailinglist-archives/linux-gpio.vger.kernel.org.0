Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDAB116DAF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 14:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfLINJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 08:09:37 -0500
Received: from mga04.intel.com ([192.55.52.120]:15277 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727648AbfLINJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 08:09:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="219976302"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2019 05:09:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 29081B92; Mon,  9 Dec 2019 15:09:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 22/24] pinctrl: lynxpoint: Add GPIO <-> pin mapping ranges via callback
Date:   Mon,  9 Dec 2019 15:09:24 +0200
Message-Id: <20191209130926.86483-23-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
References: <20191209130926.86483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When IRQ chip is instantiated via GPIO library flow, the few functions,
in particular the ACPI event registration mechanism, on some of ACPI based
platforms expect that the pin ranges are initialized to that point.

Add GPIO <-> pin mapping ranges via callback in the GPIO library flow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index bfdd283d2c20..795a9c7054ca 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -828,6 +828,19 @@ static int lp_gpio_irq_init_hw(struct gpio_chip *chip)
 	return 0;
 }
 
+static int lp_gpio_add_pin_ranges(struct gpio_chip *chip)
+{
+	struct intel_pinctrl *lg = gpiochip_get_data(chip);
+	struct device *dev = lg->dev;
+	int ret;
+
+	ret = gpiochip_add_pin_range(chip, dev_name(dev), 0, 0, lg->soc->npins);
+	if (ret)
+		dev_err(dev, "failed to add GPIO pin range\n");
+
+	return ret;
+}
+
 static int lp_gpio_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc;
@@ -899,6 +912,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->base = -1;
 	gc->ngpio = LP_NUM_GPIO;
 	gc->can_sleep = false;
+	gc->add_pin_ranges = lp_gpio_add_pin_ranges;
 	gc->parent = dev;
 
 	/* set up interrupts  */
-- 
2.24.0

