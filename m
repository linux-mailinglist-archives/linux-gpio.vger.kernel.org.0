Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68FC360A0F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Apr 2021 15:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233085AbhDONGJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Apr 2021 09:06:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:21249 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232655AbhDONGI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Apr 2021 09:06:08 -0400
IronPort-SDR: rUP6X/kABhgez+RKMWlW1a/O1Lb1ho87CmvdjEKI/rrYPe6Wo/5OU/OZ+xQP3tJ+Fz0+YW0y5O
 ru53mbR7se6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="280162400"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="280162400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 06:03:43 -0700
IronPort-SDR: a1xlUfAK+Z4zpZkF642clCxXpiHmGJoPMBivoYCT1xBwK7GoljWI7xPHhHVZQ9yIGfX3M1YFmE
 c8+fZDCnB50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="452904048"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2021 06:03:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7C1A612A; Thu, 15 Apr 2021 16:03:58 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v1 1/1] pinctrl: core: Show pin numbers for the controllers with base = 0
Date:   Thu, 15 Apr 2021 16:03:56 +0300
Message-Id: <20210415130356.15885-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
enabled GPIO pin number and label in debugfs for pin controller. However,
it limited that feature to the chips where base is positive number. This,
in particular, excluded chips where base is 0 for the historical or backward
compatibility reasons. Refactor the code to include the latter as well.

Fixes: f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
Cc: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index df7f5f049139..8ef24af88b75 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1604,8 +1604,8 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	unsigned i, pin;
 #ifdef CONFIG_GPIOLIB
 	struct pinctrl_gpio_range *range;
-	unsigned int gpio_num;
 	struct gpio_chip *chip;
+	int gpio_num;
 #endif
 
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
@@ -1625,7 +1625,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 		seq_printf(s, "pin %d (%s) ", pin, desc->name);
 
 #ifdef CONFIG_GPIOLIB
-		gpio_num = 0;
+		gpio_num = -1;
 		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
 			if ((pin >= range->pin_base) &&
 			    (pin < (range->pin_base + range->npins))) {
@@ -1633,10 +1633,12 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 				break;
 			}
 		}
-		chip = gpio_to_chip(gpio_num);
-		if (chip && chip->gpiodev && chip->gpiodev->base)
-			seq_printf(s, "%u:%s ", gpio_num -
-				chip->gpiodev->base, chip->label);
+		if (gpio_num >= 0)
+			chip = gpio_to_chip(gpio_num);
+		else
+			chip = NULL;
+		if (chip)
+			seq_printf(s, "%u:%s ", gpio_num - chip->gpiodev->base, chip->label);
 		else
 			seq_puts(s, "0:? ");
 #endif
-- 
2.30.2

