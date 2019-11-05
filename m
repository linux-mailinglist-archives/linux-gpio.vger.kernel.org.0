Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE87F0710
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfKEUgF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:36:05 -0500
Received: from mga06.intel.com ([134.134.136.31]:23757 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729735AbfKEUgF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="225903822"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2019 12:36:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DDCAD300; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 6/7] pinctrl: baytrail: Add GPIO <-> pin mapping ranges via callback
Date:   Tue,  5 Nov 2019 22:35:56 +0200
Message-Id: <20191105203557.78562-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-baytrail.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 9ffb22211d2b..b4d0e945e8c2 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1506,6 +1506,19 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 	}
 }
 
+static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
+{
+	struct byt_gpio *vg = gpiochip_get_data(chip);
+	int ret;
+
+	ret = gpiochip_add_pin_range(&vg->chip, dev_name(&vg->pdev->dev),
+				     0, 0, vg->soc_data->npins);
+	if (ret)
+		dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
+
+	return ret;
+}
+
 static int byt_gpio_probe(struct byt_gpio *vg)
 {
 	struct gpio_chip *gc;
@@ -1518,6 +1531,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	gc->label	= dev_name(&vg->pdev->dev);
 	gc->base	= -1;
 	gc->can_sleep	= false;
+	gc->add_pin_ranges = byt_gpio_add_pin_ranges;
 	gc->parent	= &vg->pdev->dev;
 	gc->ngpio	= vg->soc_data->npins;
 	gc->irq.init_valid_mask	= byt_init_irq_valid_mask;
@@ -1534,13 +1548,6 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 		return ret;
 	}
 
-	ret = gpiochip_add_pin_range(&vg->chip, dev_name(&vg->pdev->dev),
-				     0, 0, vg->soc_data->npins);
-	if (ret) {
-		dev_err(&vg->pdev->dev, "failed to add GPIO pin range\n");
-		return ret;
-	}
-
 	/* set up interrupts  */
 	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
 	if (irq_rc && irq_rc->start) {
-- 
2.24.0.rc1

