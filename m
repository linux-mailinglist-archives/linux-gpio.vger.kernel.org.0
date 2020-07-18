Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9696224CB5
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 17:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgGRPxN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 11:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgGRPxN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jul 2020 11:53:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46BCC0619D3
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2020 08:53:09 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j18so18475111wmi.3
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2020 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm7RbRbPXsGrD5oeSS4NsVpJcs55MiMj/6SWijtpEjw=;
        b=BousnIH6TWxTOBuP6LlByW1rJ2d7ZIi1dhlxP/92+rdVWYIm+UwlgtzTh/JdDvY810
         3mLF+bW3d3wmVhklOzBmxIKlj9NjiNxPzWl+VCYZHkwYGJ+p31uwC767CTqRBSrNmH2D
         KLQ4/1SUBUG/0j52bY65Btclx94bWLVL6mmypADVLgbqsPIJwu8BYpPmq1/KJ7tAQ6W+
         VUNk98nrVOubafzIbrB1wAB3etaT/gZ41fVGzgYWEWyAxn5U9Ug8x0CFbI+mFVrj0Tn2
         +8CRVASIuskUTdMhrLa83t196RP1EZRhuV4UmxSFoO3hE34kGkbLc7Hgt4bm+8QOC69i
         Tl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm7RbRbPXsGrD5oeSS4NsVpJcs55MiMj/6SWijtpEjw=;
        b=L9iL7mf8bd5XMfVAHdYbwfFTzCT3bcpCNX8PEONI7yePqAz3mTPVhrrn+SbXEplf46
         e9aGV34VHqt6toJ9e3QYQTI/a50rR0bYgGmO7x3I57fn2x0SB0jweIWL7Bj+R2CDXJ8e
         hXKWL/lqHZAPbZqXaVa0S6W5c8yq5z6zIaNIO0kAFMHUuuL7UM5x1oznwLNIRZO0Aigb
         rIOf0f80rkI1SWdbjvUTm09W1fnhsI8iZ/tVFGhBARJOeByPq++jdfFfhhVejFuwJ4WU
         J331EBe9UCYCCjXrA/zrYySG/6X36u+Vq7dwcgk2gVERSQ0j3MIctXKbwiv3bcV5jky2
         VNEg==
X-Gm-Message-State: AOAM532JpmaaEEFYb07nSZOG7o4fAjFteMKPBNX0mlHq92zOWVvCfugf
        jvjFSpt5wdSVG5DqvjPLZpn88g==
X-Google-Smtp-Source: ABdhPJybWy/0R3DSJk1V+N6uY+brwF6uf7mCMJfmMhhasJYalSP2zIEWXZfA9FMYPFmiKFdMaqWoFg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr14371545wmc.117.1595087588317;
        Sat, 18 Jul 2020 08:53:08 -0700 (PDT)
Received: from localhost.localdomain (195.red-80-27-212.dynamicip.rima-tde.net. [80.27.212.195])
        by smtp.gmail.com with ESMTPSA id s10sm21284623wme.31.2020.07.18.08.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2020 08:53:07 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] pinctrl: core: print gpio in pins debugfs file
Date:   Sat, 18 Jul 2020 17:49:10 +0200
Message-Id: <20200718154908.1816031-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there is a gpio range mapping for the pin, then print out the gpio
number for the pin in the debugfs 'pins' file.

Here is an example output on the BeagleBone Black from:
/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins

pin 103 (PIN103) GPIO-113 44e1099c 00000027 pinctrl-single
pin 104 (PIN104) GPIO-114 44e109a0 0000002c pinctrl-single
pin 105 (PIN105) GPIO-115 44e109a4 00000027 pinctrl-single
pin 106 (PIN106) GPIO-116 44e109a8 00000027 pinctrl-single
pin 107 (PIN107) GPIO-117 44e109ac 00000027 pinctrl-single
pin 108 (PIN108) GPIO-19 44e109b0 00000027 pinctrl-single
pin 109 (PIN109) GPIO-20 44e109b4 00000027 pinctrl-single
pin 110 (PIN110) 44e109b8 00000030 pinctrl-single
pin 111 (PIN111) 44e109bc 00000028 pinctrl-single
pin 112 (PIN112) 44e109c0 00000030 pinctrl-single
pin 113 (PIN113) 44e109c4 00000028 pinctrl-single
pin 114 (PIN114) 44e109c8 00000028 pinctrl-single

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
Note:
- I am hoping to get feedback if another format is better.  Currently
  the column 'GPIO-xxx' will only be printed when there is a GPIO num

 drivers/pinctrl/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 70e13fcd94c4..e3eee950a553 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1633,6 +1633,8 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
+	struct pinctrl_gpio_range *range;
+	unsigned gpio_num;
 
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
 
@@ -1650,6 +1652,16 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 		seq_printf(s, "pin %d (%s) ", pin, desc->name);
 
+		gpio_num = 0;
+		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
+			if ((pin >= range->pin_base) &&
+			    (pin < (range->pin_base + range->npins)))
+				gpio_num = range->base + (pin - range->pin_base);
+		}
+
+		if (gpio_num > 0)
+			seq_printf(s, "GPIO-%u ", gpio_num);
+
 		/* Driver-specific info per pin */
 		if (ops->pin_dbg_show)
 			ops->pin_dbg_show(pctldev, s, pin);
-- 
2.25.1

