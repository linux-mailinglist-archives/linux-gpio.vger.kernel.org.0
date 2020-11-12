Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D3D2B0216
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 10:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgKLJj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 04:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgKLJjY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 04:39:24 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA6AC0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 01:39:22 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p1so5230627wrf.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 01:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dsnWEKHYtpjzOtFjGluTaKAH0r24lNymlUc94ld1ook=;
        b=ebPtr5jihm7n0+xxxux+6E7bAaSvsYFXJVg/5Aux3frhL/3hgi6KD8FeoPMaF5rKqu
         Wvzyt8EmvS9i7LEaDVeKth/eTJy3w2hGeBS/Cdw6a41i1+b5p9Y0ZYedDk2GYmLtL5gn
         rxB5DlnzUzes7vCH2TJdGWiXTPdm9EPRhAL03eh9XDRVwqv21OXomEzs6d0G5l8tZtQ0
         8eiWcqJ/gWU8CFpIPgtTzthbHaO7RKvTNf6/4D3khZH9WgMyHvWv9dW5kixDI0Nm4KP2
         N1o68aAb7nbvg8ua35e35onjzlb+kzozKhfrEoK/lvnAucLmEE5FnSpmmrzvBC738ie3
         pdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dsnWEKHYtpjzOtFjGluTaKAH0r24lNymlUc94ld1ook=;
        b=d2fz6+7F6eJ0lNxSDfnq3gqIOrw1Dhxr6Or8ralGoo/ocLbad6h9mkHgvNFOBROMMq
         dH4xZBWsTpb/UqmJTPYO2yeSGv3ahbNB1h0y5lD4PdNwtTJE9H4KcH50w6ZUCn5Ju6Ya
         nZojm0Q4LEEyUjNfPskdnKEZbUdA02xnYF9xqyCdIGzF+n+JAt9/ilF4g34rFcpdsGe3
         x0KmwoqKI3i+oABiZ+uS0i5QEJKyaSwaGngQhYwAFz1gfUvODzqPnHGoQEIYUHmDSec/
         rdorxVKxQxv7AwXCYljsxlYGMu7CmUPNoqebgM89sclMguUcYOj4alpVGwJ9nGC8evrO
         yIzQ==
X-Gm-Message-State: AOAM531fUwwOTzp6L+R2CYemiOW9JIgUB7z9Le/9ndJ/vqbkM3LSTvSu
        IiEgZ+Z0hHORZfZ1yZ01VqmXavYbEPFcerK2
X-Google-Smtp-Source: ABdhPJyFbn3+lYTG5gYtgNHNhpmN8YhcLtnxEz2lGsoB8EgoT5gmuhOKbEON1LEnnxZgpLbbG/4pmg==
X-Received: by 2002:adf:fc84:: with SMTP id g4mr26906936wrr.202.1605173961083;
        Thu, 12 Nov 2020 01:39:21 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id r1sm6516199wro.18.2020.11.12.01.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 01:39:20 -0800 (PST)
Date:   Thu, 12 Nov 2020 09:39:18 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v2 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20201112093918.GV2063125@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713144930.1034632-17-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Both the caller and the supplier's source file should have access to
the include file containing the prototypes.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/pinctrl-at91.c:1637:6: warning: no previous prototype for ‘at91_pinctrl_gpio_suspend’ [-Wmissing-prototypes]
 1637 | void at91_pinctrl_gpio_suspend(void)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~
 drivers/pinctrl/pinctrl-at91.c:1661:6: warning: no previous prototype for ‘at91_pinctrl_gpio_resume’ [-Wmissing-prototypes]
 1661 | void at91_pinctrl_gpio_resume(void)
 | ^~~~~~~~~~~~~~~~~~~~~~~~

Cc: Russell King <linux@armlinux.org.uk>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---

v2: Moved shared header to: include/soc/at91/pm.h

 arch/arm/mach-at91/pm.c        | 19 ++++++++-----------
 drivers/pinctrl/pinctrl-at91.c |  2 ++
 include/soc/at91/pm.h          |  9 +++++++++
 3 files changed, 19 insertions(+), 11 deletions(-)
 create mode 100644 include/soc/at91/pm.h

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 120f9aa6fff32..90dcdfe3b3d0d 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -17,6 +17,8 @@
 #include <linux/clk/at91_pmc.h>
 #include <linux/platform_data/atmel.h>
 
+#include <soc/at91/pm.h>
+
 #include <asm/cacheflush.h>
 #include <asm/fncpy.h>
 #include <asm/system_misc.h>
@@ -25,17 +27,6 @@
 #include "generic.h"
 #include "pm.h"
 
-/*
- * FIXME: this is needed to communicate between the pinctrl driver and
- * the PM implementation in the machine. Possibly part of the PM
- * implementation should be moved down into the pinctrl driver and get
- * called as part of the generic suspend/resume path.
- */
-#ifdef CONFIG_PINCTRL_AT91
-extern void at91_pinctrl_gpio_suspend(void);
-extern void at91_pinctrl_gpio_resume(void);
-#endif
-
 struct at91_soc_pm {
 	int (*config_shdwc_ws)(void __iomem *shdwc, u32 *mode, u32 *polarity);
 	int (*config_pmc_ws)(void __iomem *pmc, u32 mode, u32 polarity);
@@ -326,6 +317,12 @@ static void at91_pm_suspend(suspend_state_t state)
 static int at91_pm_enter(suspend_state_t state)
 {
 #ifdef CONFIG_PINCTRL_AT91
+	/*
+	 * FIXME: this is needed to communicate between the pinctrl driver and
+	 * the PM implementation in the machine. Possibly part of the PM
+	 * implementation should be moved down into the pinctrl driver and get
+	 * called as part of the generic suspend/resume path.
+	 */
 	at91_pinctrl_gpio_suspend();
 #endif
 
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 72edc675431ce..0a7e10d39505c 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -23,6 +23,8 @@
 /* Since we request GPIOs from ourself */
 #include <linux/pinctrl/consumer.h>
 
+#include <soc/at91/pm.h>
+
 #include "pinctrl-at91.h"
 #include "core.h"
 
diff --git a/include/soc/at91/pm.h b/include/soc/at91/pm.h
new file mode 100644
index 0000000000000..0fd5093f7f73a
--- /dev/null
+++ b/include/soc/at91/pm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * atmel platform data
+ */
+
+#ifdef CONFIG_PINCTRL_AT91
+void at91_pinctrl_gpio_suspend(void);
+void at91_pinctrl_gpio_resume(void);
+#endif
-- 
2.25.1
