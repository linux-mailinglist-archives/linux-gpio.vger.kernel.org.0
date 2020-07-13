Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E058C21D8F7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgGMOtw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730175AbgGMOtv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:51 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C5BC061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j4so16864415wrp.10
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8XFfrtDb0YISFxdApa9cgcznz1fKsVfnxLcnox2gJ38=;
        b=bY+eI2Sa1VcgBw/m+GSPdg+IKtmwOksNpPhNngNhJ4tpus+dIQgVEyXQmm5h/Mo+8d
         CFGMao+VaidBm/qr7yKY8/suL3RWH+306Rfniq0CT6jdAnE7udAzLAZ38vDwZTSgwCxP
         9Zfvo7Amfu/J/ldW9uMo1y69ApSm1SwamkBSUJZYzG+E0lsy1bD/tTOlXKuPBU95ZPwZ
         5NNTSXixUFUk4gTpO9djXoEEhSurqXpdLHwBPR04hIDB8s8nXY4sx0MYqnLsre6mwD/M
         tVq7d9wH1fGqnHlxr+56BcsdYIdOJk6QJB/JnCveFhAqYodfYN9gC3Sf0THlqUv0vJFp
         w0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8XFfrtDb0YISFxdApa9cgcznz1fKsVfnxLcnox2gJ38=;
        b=oRh6YGnswzZ6LtXwLRIB2DXSV53uDFj27hgUssNFMsg9I+fsZ0u2sTgR3EP0ZkzL7U
         4l3V/FUONTqFE3ZLo5zRLkiE/98b5mMYbTNRxoIGuXscmPpY/3eQKaVl8P+4w49l6YrN
         9+J5dx7HZR/bn3LukcSeDeDEuJ7U00Ksjkwi15QV5r+xgHfX3YFvMBofZYSeyE6fco99
         KJLzDe+/5RqyIFF+0VOS9/efIceUNdxU73U5IBwP5RNG3KeiBglSEp3F2eJad8/Pq4IK
         18PXVgCcSOoDy8OQGQt8+jdzjO8u8kve8ZVjOXek0C5ri/+zlv94kUKiQZ7Jd8DUCJoY
         eapw==
X-Gm-Message-State: AOAM533XQS92ok6UjhgXVwLoIDLlr3DHNG79pM5MvdN3hz0TLPE06Mg2
        IWgdNffjWJbsGf8tY8V3Z/M/Yw==
X-Google-Smtp-Source: ABdhPJwmbiZnb+8yCbeRKEkrxSMvb3wxXhG75vw/5/nsc4kMk/NuIYjdgJ42nxTh62tfqm0segUiEg==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr79197339wrr.42.1594651790130;
        Mon, 13 Jul 2020 07:49:50 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 16/25] arch: arm: mach-at91: pm: Move prototypes to mutually included header
Date:   Mon, 13 Jul 2020 15:49:21 +0100
Message-Id: <20200713144930.1034632-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
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
 arch/arm/mach-at91/pm.c             | 17 ++++++-----------
 drivers/pinctrl/pinctrl-at91.c      |  1 +
 include/linux/platform_data/atmel.h |  5 +++++
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 074bde64064e4..59f2a2d6fbbb8 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -25,17 +25,6 @@
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
@@ -325,6 +314,12 @@ static void at91_pm_suspend(suspend_state_t state)
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
index 9c52130876597..37997e5ab0538 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -22,6 +22,7 @@
 #include <linux/pinctrl/pinmux.h>
 /* Since we request GPIOs from ourself */
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_data/atmel.h>
 
 #include "pinctrl-at91.h"
 #include "core.h"
diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
index 99e6069c5fd89..666ef482ea8c0 100644
--- a/include/linux/platform_data/atmel.h
+++ b/include/linux/platform_data/atmel.h
@@ -28,4 +28,9 @@ static inline int at91_suspend_entering_slow_clock(void)
 }
 #endif
 
+#ifdef CONFIG_PINCTRL_AT91
+void at91_pinctrl_gpio_suspend(void);
+void at91_pinctrl_gpio_resume(void);
+#endif
+
 #endif /* __ATMEL_H__ */
-- 
2.25.1

