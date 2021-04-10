Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205CF35AC20
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 11:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbhDJJJz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 05:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhDJJJz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 05:09:55 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24649C061764
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 02:09:41 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so6236224wmq.1
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8aPX/yhyDURpzd9he2oFVc3UD257yU7cZPkDvSNwmA=;
        b=j8zUr5y1aGMOckYxnzgWhcFZvHUB26DkBP3lqp4GNu50qv1KWM/VV+68cxPaQgL5Je
         Ju8UEj1Dnxb7sMT+qdfe1RgzE3k3mgb53UPIE5wutbGvwaJf5IiLh70HeZuuLOUWqKPh
         bRvnMalO6C+CfsyYJm9+ZxkC0G9A7YGlY0vdOPz31DNLVbBFmzjjxUQ4yH2cD1vwtrUz
         BpGm8tkC50O9w4bBSzzvJj+t1PryGF1Wew3hJ+ttv4uuA+jIHQVbccRpwRMKQOUHbvW4
         zcx/iaxMPZ9Tlqt/wKG7V/X1FGIoBh3oX54O8iV/pgt2P5ttwEexvjncFmUDLTlUUQqb
         L7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8aPX/yhyDURpzd9he2oFVc3UD257yU7cZPkDvSNwmA=;
        b=c2YcdJfWNoAw5m6qT07Eb0WR5Nq4XWHn4T9wP/aSoClMrb/PhNEMsF5QzaOnoaOUAD
         ksDFNoen0JJIp0ZxljwTiHOsPr6iCBiRxpHOoy0s94UTwWRyb2P3eLvqLDLxNLgN8H1r
         eKNtJOt0Fu3X3MOFI23NVI5VLI7ljuIVZu64kemhTAM61sZg2ALXjOK6zY4aQbGEmijt
         yBlb9f0bRQhE8+6erBY6uP9PbwD8fF6edqnXRXqsBpQARaR0YOqzjcsymcb7P0LTQXZq
         uClYncL4S/OZv3vJZa9ufmfZe02a/jReKUY1mp+x4FRpyGuAt3BPm3jO25/Bram3n6aI
         crhQ==
X-Gm-Message-State: AOAM530fD26O0wxudpe+2bjiF/BpMnt10Ek/Eo/c/OJ+2HLnPFfyLntg
        W6Ph99DKUnJZwyx8ZtGTp6agpQ==
X-Google-Smtp-Source: ABdhPJzMBdIAblvC8n15zoDbPzu6FnmiqaZWX7oEBVLEDZDBMRYWZrZCqK7Dtk92kopeMxP789R1Cg==
X-Received: by 2002:a1c:a502:: with SMTP id o2mr12057387wme.16.1618045779784;
        Sat, 10 Apr 2021 02:09:39 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id h63sm6986094wmh.13.2021.04.10.02.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 02:09:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        stable@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH stable] gpiolib: Read "gpio-line-names" from a firmware node
Date:   Sat, 10 Apr 2021 11:09:19 +0200
Message-Id: <20210410090919.3157-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
Cc: stable@vger.kernel.org
Reported-by: Marek Vasut <marex@denx.de>
Reported-by: Roman Guskov <rguskov@dh-electronics.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Marek Vasut <marex@denx.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Hi Greg,

This patch somehow got lost and never made its way into stable. Could you
please apply it?

Thanks,
Bartosz

 drivers/gpio/gpiolib.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4253837f870b..7ec0822c0505 100644
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

