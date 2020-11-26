Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D0C2C554D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 14:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389852AbgKZN2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Nov 2020 08:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389807AbgKZN2o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2020 08:28:44 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7AAC0613D4
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2020 05:28:44 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r3so2167306wrt.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2020 05:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=j3jIfABHebgIQYyFTFzGmbyYJsJoQbpfkOYYN2ZM7fo=;
        b=ZV/eZfIM43W03jQJiomsNpvL3M8Xh3ZEDa9SgEFel/1eJgOCQRYNDwnjNphuFPVUe6
         Cu75OlfOHnbtg1VPxD16IwF+kqVWISdtQr7/IRrg6HPxJ0zR4hdIqTXJ63SLaRyc7gGJ
         zACoRj3zLKrxWyfpMeOSgLIBTqTCAPyEYD0b9BecjSqrb1LSdSnmRS95P2/X6snZKlbB
         b4PBHCSLFZ4AYJb0pnowd2rpv5vbOjVFQf91wUnS50wMFC/mIaOrlyA1xLHJ6Erkk2NO
         Gl55jhGewJFv/NI3Oq0nu6iCPtl2Nk8qqGFykzALj/kWMqnZ3B/aF0coK2WgRBgJwa0h
         5nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=j3jIfABHebgIQYyFTFzGmbyYJsJoQbpfkOYYN2ZM7fo=;
        b=R2b+GNMMBEjbRJGv1ZhQIrYpxQtBqpyHt5plYsfN2qYgJq8OPBqp9I7zfmGG7kq1gA
         k3rx7EcbWhBGuu7fjd80Afu4F9KaVVa8w1d01BADrjMUXIqaWq025IfP3V5qd9zydYLE
         +V0EjDfIKT8gHUsIyPKayLeSt7etQx7LNM/+Q4LDdlJ6a6U7a9YCaYvPIYAuPLHWNcTh
         2TEslt00lWQwAN7hS/guOloHRVdsYCYLRnQX299IyPo12SA4PIVQgqgdVd4PTNlUem1A
         o1ZCqHRq9uuCCFN8OoZs8o+ZOXf0GklCzm8wAAzkpSimpIGzJVfodghf9ZsdG+aOxjsJ
         JYwA==
X-Gm-Message-State: AOAM532smVDL9D7nPxfWu/7B9Z9qAxSqSZhBjZ3QwqUFEJac6yoOyCPK
        xnMIHdXcjlUF+2TRHYlrGqzxaAue1GwWJURo
X-Google-Smtp-Source: ABdhPJxjSIJGgNUpcnxPjjDIW+t5f0FHzaGLdtLotQpqb9VBHJar1Tt99YBGNFo23H7IPjUPjwYxMQ==
X-Received: by 2002:adf:fd06:: with SMTP id e6mr3897159wrr.206.1606397323119;
        Thu, 26 Nov 2020 05:28:43 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id b18sm9316605wrt.54.2020.11.26.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:28:42 -0800 (PST)
Date:   Thu, 26 Nov 2020 13:28:40 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v3 16/25] arch: arm: mach-at91: pm: Move prototypes to
 mutually included header
Message-ID: <20201126132840.GD2455276@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-17-lee.jones@linaro.org>
 <20201112093918.GV2063125@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112093918.GV2063125@dell>
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
 arch/arm/mach-at91/pm.c        | 19 ++++++++-----------
 drivers/pinctrl/pinctrl-at91.c |  2 ++
 include/soc/at91/pm.h          | 16 ++++++++++++++++
 3 files changed, 26 insertions(+), 11 deletions(-)
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
index 0000000000000..7a41e53a3ffa3
--- /dev/null
+++ b/include/soc/at91/pm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Atmel Power Management
+ *
+ * Copyright (C) 2020 Atmel
+ *
+ * Author: Lee Jones <lee.jones@linaro.org>
+ */
+
+#ifndef __SOC_ATMEL_PM_H
+#define __SOC_ATMEL_PM_H
+
+void at91_pinctrl_gpio_suspend(void);
+void at91_pinctrl_gpio_resume(void);
+
+#endif /* __SOC_ATMEL_PM_H */
-- 
2.25.1
