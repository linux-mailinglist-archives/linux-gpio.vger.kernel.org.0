Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F6332E797
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 13:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhCEMC5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 07:02:57 -0500
Received: from mga12.intel.com ([192.55.52.136]:5542 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229701AbhCEMCx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Mar 2021 07:02:53 -0500
IronPort-SDR: duwtj94eeJuFKFt/R9JFqDjyovZ8rigtPPn9Cn/Jg+yWReTw/Qf+v79NFMRh86/JYcSV4dLv46
 +z0+nyDL7RMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="166898672"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="166898672"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 04:02:46 -0800
IronPort-SDR: OP/+SnY89MZvIbzgqkHxJy+nfFR1XESAGGXtefEMy26fr58yyn9UWSKvJMdBdsd/ymbAzNXoE3
 xbuy9eRzpE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="401656796"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Mar 2021 04:02:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 117CB192; Fri,  5 Mar 2021 14:02:43 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Subject: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
Date:   Fri,  5 Mar 2021 14:02:40 +0200
Message-Id: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
and iterates over all of its DT subnodes when registering each GPIO
bank gpiochip. Each gpiochip has:

  - gpio_chip.parent = dev,
    where dev is the device node of the pin controller
  - gpio_chip.of_node = np,
    which is the OF node of the GPIO bank

Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.

The original code behaved correctly, as it extracted the "gpio-line-names"
from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.

To achieve the same behaviour, read property from the firmware node.

Fixes: 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
Reported-by: Marek Vasut <marex@denx.de>
Reported-by: Roman Guskov <rguskov@dh-electronics.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3bc25a9c4cd6..ba88011cc79d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -367,22 +367,18 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
  *
  * Looks for device property "gpio-line-names" and if it exists assigns
  * GPIO line names for the chip. The memory allocated for the assigned
- * names belong to the underlying software node and should not be released
+ * names belong to the underlying firmware node and should not be released
  * by the caller.
  */
 static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 {
 	struct gpio_device *gdev = chip->gpiodev;
-	struct device *dev = chip->parent;
+	struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
 	const char **names;
 	int ret, i;
 	int count;
 
-	/* GPIO chip may not have a parent device whose properties we inspect. */
-	if (!dev)
-		return 0;
-
-	count = device_property_string_array_count(dev, "gpio-line-names");
+	count = fwnode_property_string_array_count(fwnode, "gpio-line-names");
 	if (count < 0)
 		return 0;
 
@@ -396,7 +392,7 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
 	if (!names)
 		return -ENOMEM;
 
-	ret = device_property_read_string_array(dev, "gpio-line-names",
+	ret = fwnode_property_read_string_array(fwnode, "gpio-line-names",
 						names, count);
 	if (ret < 0) {
 		dev_warn(&gdev->dev, "failed to read GPIO line names\n");
-- 
2.30.1

