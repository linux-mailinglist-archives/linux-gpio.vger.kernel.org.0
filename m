Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2221C228196
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgGUODw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgGUODw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:03:52 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA752C0619DB
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:03:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f7so21348445wrw.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NfVwMqC0uQWqEXEYVAIidH5sBEC97K0Eu+a0jsNaLKY=;
        b=PzWnn8luK9wl6PGEsGK2ImTxulWmPdYNOiSWEyzjQfRdbJk4gQfgX7qUATANX0nAjW
         bbL0yFiwhqAgEcu63UZper1tkX/FFfdod5D4hQ5uM4O9Jtbe9I27IJU7B5dgNSCmqxLB
         P0HVj9sqNaJycs6cItW8xGlLod2JtT5TaDS0F/BRxuFkOEJdrTCmq2SSzpLYUSDsDfc/
         YG54UEQOeaSAfG8qhctZh30yNjWcrS3MgXofd9toe731uJmd8ZDHHqs9il5wffvRezqW
         4cTLSbPPm0SA9zLhQ82hxtNcUul7NN/Rra6mpFERTIAI5rN/rTXVhnRoOHLj2Rwg2mHf
         jm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NfVwMqC0uQWqEXEYVAIidH5sBEC97K0Eu+a0jsNaLKY=;
        b=a7LjG641qdcQqtIa+Kd2ca+2pPEqVigF7TNnKrJ3SKBUgz27ISw4R7fWZI3Vpx3+VR
         ldfdMGWJUzuE7mW5x0XdHfKCStArjHyCi6d+Aw20HpIzjBXczOlv/fJlDDMuePlRWCOm
         zXLe4C8wmE6xWHUzvWq5GJ6k3+79nZ6l8k1q697ktUkXz8OQC9nnoh/905/trulIQi+U
         sUisbvrk9GIkFumb55jxCD7N+Isdt2dNoL/oKNaRf61Hc0XtN5WWCXyZSmPBhKnuvpEc
         10szNgE9vZNUYmWyCiICgqLHNBvjPqunC/absxpYUA73yXpfj8zsabUyWEy1QWqVCqda
         EZaw==
X-Gm-Message-State: AOAM533KwCzCF8m3Qp0HbdjeYw9UvdL/O2BmFnnN6ClZTcaMhMOnMrHj
        jJrQ8TrkQsol3ulj5JnvHO8WWQ==
X-Google-Smtp-Source: ABdhPJxkr+yVQH10n0lVsc27YqVqO+bGf0Gx8/dmhlMhsEiD6eVWN29Tmcqw0W+PtL2RxJv4RUcuOQ==
X-Received: by 2002:a5d:69d2:: with SMTP id s18mr14514125wrw.408.1595340230395;
        Tue, 21 Jul 2020 07:03:50 -0700 (PDT)
Received: from localhost.localdomain (103.red-88-29-77.staticip.rima-tde.net. [88.29.77.103])
        by smtp.gmail.com with ESMTPSA id c194sm3740003wme.8.2020.07.21.07.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:03:49 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3] pinctrl: core: print gpio in pins debugfs file
Date:   Tue, 21 Jul 2020 16:02:34 +0200
Message-Id: <20200721140233.2063475-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there is a gpio range mapping for the pin, then print out the gpio
chip and line index for the pin in the debugfs 'pins' file with the
format: "[gpiochip-label]:line-[index] "

For example, here is a section of 'pins' the PocketBeagle (AM3358):
/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins

pin 25 (PIN25) gpio-32-63:line-25 44e10864 00000037 pinctrl-single 
pin 26 (PIN26) gpio-32-63:line-26 44e10868 00000037 pinctrl-single 
pin 27 (PIN27) gpio-32-63:line-27 44e1086c 00000037 pinctrl-single 
pin 28 (PIN28) NA 44e10870 00000036 pinctrl-single 
pin 29 (PIN29) NA 44e10874 00000006 pinctrl-single 
pin 30 (PIN30) gpio-32-63:line-28 44e10878 00000027 pinctrl-single 
pin 31 (PIN31) gpio-32-63:line-29 44e1087c 00000037 pinctrl-single 
pin 32 (PIN32) gpio-32-63:line-30 44e10880 00000037 pinctrl-single 
pin 33 (PIN33) gpio-32-63:line-31 44e10884 00000037 pinctrl-single 
pin 34 (PIN34) gpio-64-95:line-0 44e10888 00000037 pinctrl-single 
pin 35 (PIN35) gpio-64-95:line-1 44e1088c 00000037 pinctrl-single 

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>

v3 changes:
- gpio column is now gpiochip label and line index

v2 changes:
- print 'NA' if pin does not have a GPIO number
- change gpio_num from unsigned to unsigned int per checkpatch
---
 drivers/pinctrl/core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 821242bb4b16..a23dc264cae7 100644
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
+			seq_printf(s, "%s:line-%u ", chip->label,
+				gpio_num - chip->gpiodev->base);
+		else
+			seq_puts(s, "NA ");
+#endif
+
 		/* Driver-specific info per pin */
 		if (ops->pin_dbg_show)
 			ops->pin_dbg_show(pctldev, s, pin);
-- 
2.25.1

