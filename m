Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9141229839
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 14:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729628AbgGVM3X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 08:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgGVM3X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 08:29:23 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEB4C0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 05:29:22 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id p14so1388917wmg.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W91rvFokifCVPR+o198v06eVGGt939fjm12mG9mSyHI=;
        b=zC/nKfBrLXsHpRuQ+z39G/DxnJ20Yqs3ARHl1smLLddGrYhyVPM+tVH/F8sCbehehy
         NeEBI58h3Xfba84vb/G+9dE5iq71Gnujv/m8UQqkMiHLxzBp4MKirflIDr112hSHTETp
         Vmob1UjeZ7Gkn/OQUVmjW9Y38c4fwJD3STIz2bxxt7N6BxSgBv6HBn68j1VE8DhbUfbG
         rzWEkTEb0OWVATuL/3E5XiXv/bJ475I0BU4estyhRlYhXTaC5AL2eP7xRDI9wBk8qSK8
         315/yM5zg96U/mQJ4MbGWTR2IDlM/eSIFXk8zgshjkPRzu1tHCDZNygJboH6VLVQtJU6
         tFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W91rvFokifCVPR+o198v06eVGGt939fjm12mG9mSyHI=;
        b=hgz1naq4DLRM3DsyxyXqVx3jlkR3Dzf8DTMSDQQmB25ciRDc/QeMlTlHUDzvIVrCQK
         IJEgli7ql3bOEKy4xgaGzDJqUSBrASrxf2IwqyH72c7lLDyrtpdYVjkpRgwP9okCGwqH
         c/Q1yPAHvgWeiI9J6i+YSQcNe0aJkuC3wB8LywUNtq2+MafXBHd+uUVf46qfJ4il8lNc
         WM2hYRwn9OnpBwHF7SbQxrtf6/PlF7qH/cumuKJdW9bcQQOEl7joJBYnjLWfpgGxvirH
         o0vNcVobjy7hR46Svb3m4JYF81GhfQFNujoZb8aVxBK0cD3TiJx0tYeLLjqdx/kpBoIH
         /5/w==
X-Gm-Message-State: AOAM530Qo2JHAztcbL3mZOg40jzhXTHkqE6/8BQP4FGW22nMScOXpbLb
        mRAxBFWDPmIJF9tJiOo+/kN8Qg==
X-Google-Smtp-Source: ABdhPJza2fPEqYYKevpudtxYAEP4TkXuRkD+NMrK9DYbGa9mewMaSnuJMSk2BAeUfX481vQhspXfaw==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr8514433wme.172.1595420961581;
        Wed, 22 Jul 2020 05:29:21 -0700 (PDT)
Received: from localhost.localdomain (172.red-80-27-177.dynamicip.rima-tde.net. [80.27.177.172])
        by smtp.gmail.com with ESMTPSA id k131sm7728855wmb.36.2020.07.22.05.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 05:29:19 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5] pinctrl: core: print gpio in pins debugfs file
Date:   Wed, 22 Jul 2020 14:27:52 +0200
Message-Id: <20200722122751.266440-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there is a gpio range mapping for the pin, then print out the gpio
chip and line index for the pin in the debugfs 'pins' file with the
format: "[line-index]:[gpio-label]"

Here is example output on the BeagleBoard.org PocketBeagle (AM3358):
/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins

pin 25 (PIN25) 25:gpio-32-63 44e10864 00000037 pinctrl-single
pin 26 (PIN26) 26:gpio-32-63 44e10868 00000037 pinctrl-single
pin 27 (PIN27) 27:gpio-32-63 44e1086c 00000037 pinctrl-single
pin 28 (PIN28) 0:? 44e10870 00000036 pinctrl-single
pin 29 (PIN29) 0:? 44e10874 00000006 pinctrl-single
pin 30 (PIN30) 28:gpio-32-63 44e10878 00000027 pinctrl-single
pin 31 (PIN31) 29:gpio-32-63 44e1087c 00000037 pinctrl-single
pin 32 (PIN32) 30:gpio-32-63 44e10880 00000037 pinctrl-single
pin 33 (PIN33) 31:gpio-32-63 44e10884 00000037 pinctrl-single
pin 34 (PIN34) 0:gpio-64-95 44e10888 00000037 pinctrl-single
pin 35 (PIN35) 1:gpio-64-95 44e1088c 00000037 pinctrl-single

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

v4 changes:
- Andy suggested '0:?' would be better because GPIO library uses '?' in
  cases of unknown labels 

v3 changes:
- gpio column is now gpiochip label and line index

v2 changes:
- print 'NA' if pin does not have a GPIO number
- change gpio_num from unsigned to unsigned int per checkpatch

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 821242bb4b16..02a4cc3b60c8 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -27,6 +27,7 @@
 #include <linux/pinctrl/machine.h>
 
 #ifdef CONFIG_GPIOLIB
+#include "../gpio/gpiolib.h"
 #include <asm-generic/gpio.h>
 #endif
 
@@ -1601,6 +1602,9 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
+	struct pinctrl_gpio_range *range;
+	unsigned int gpio_num;
+	struct gpio_chip *chip;
 
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
 
@@ -1618,6 +1622,23 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 		seq_printf(s, "pin %d (%s) ", pin, desc->name);
 
+#ifdef CONFIG_GPIOLIB
+		gpio_num = 0;
+		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
+			if ((pin >= range->pin_base) &&
+			    (pin < (range->pin_base + range->npins))) {
+				gpio_num = range->base + (pin - range->pin_base);
+				break;
+			}
+		}
+		chip = gpio_to_chip(gpio_num);
+		if (chip && chip->gpiodev && chip->gpiodev->base)
+			seq_printf(s, "%u:%s ", gpio_num -
+				chip->gpiodev->base, chip->label);
+		else
+			seq_puts(s, "0:? ");
+#endif
+
 		/* Driver-specific info per pin */
 		if (ops->pin_dbg_show)
 			ops->pin_dbg_show(pctldev, s, pin);
-- 
2.25.1

