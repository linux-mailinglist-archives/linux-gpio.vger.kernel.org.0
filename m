Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6461853AA0F
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355650AbiFAP2X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355570AbiFAP2L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:28:11 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B6765D24
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:28:00 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id q21so4549526ejm.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2022 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZymzKblkmQHOv6Wxpn4eFQND8kz+YPWJS+8NHwPPhcM=;
        b=KYv7vGpIKqJ65WGv+O0vCumjNnnjO6B/XDXdXHOF6xg470mVs5ya1FWe3u/5WthlB2
         cWVQIVM3UKgI1b2EYBLe8H5YgE60TegCVeG6cxHgtnIfvG4SMpR6I/eY23Z0XmFYK0lp
         rgBbPlQy5h2O9Ytnp8LnipI+t1lKRLHMX1hZXAthnWbi2mGY22N0YPxtoKFAsIzRyAVz
         +thKkPMaxLnyoWsTu7IuRDAcvkPgv/BehKSyfAiR16gEnRWH3CtLJHU0OkWmEKva2DxU
         X2W81ldpMykreuCCNOO3xEqzC6FgukDwZJpjWOUPwlKORr2nUuJLnQ+54Cs9ANmsXcQW
         TaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZymzKblkmQHOv6Wxpn4eFQND8kz+YPWJS+8NHwPPhcM=;
        b=Uc8xFhlPDlCFhCGCYHMdR5KCYFrMui4lqvnLjwvD+mk7KcsBLgdvLi/tPEHQ1MzN3Y
         nL0kVnz+4CDwusvFQLWRCigwbKVivFa+bw4C1HnmHjrDrlWhyAfyieMJRrVF87ewC3UB
         eHUeq74lnPUlsZcyB65e4LA21p1ja6TjY2Y4VUZ62s+WVyK5OFR28EqbYZU6jPVkzlp8
         TACBOpXVnGHorIiVeIF2Fm4Mm32Kv9GLalVnPW7jTpfoggy88okdF/SY4dJVjvTg4cT0
         g9dlYTZcMCrkjbYbB0G34k2JhWDm/IYai2aIE6/5MYi/cehGvY0bFlHkp0TRFSTDeKQI
         lx/w==
X-Gm-Message-State: AOAM531Rsc+4GbEEUUW9cXUVZKDbFD2+L7FytMIwkbzg9qJr9f5MhpkY
        GFS9ajy2/coOmsJzhyHQqjaqNA==
X-Google-Smtp-Source: ABdhPJxXMsBFBclXiIXMml78Dys6pdyCJsOQJJhXxyG6J2hB5NMzBue2ItVsZfCIHwmBsQ6H0UBa5Q==
X-Received: by 2002:a17:907:7ea0:b0:6fe:f024:d006 with SMTP id qb32-20020a1709077ea000b006fef024d006mr80478ejc.248.1654097279137;
        Wed, 01 Jun 2022 08:27:59 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906248d00b006fee7b5dff2sm845870ejb.143.2022.06.01.08.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:27:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 7/7] dt-bindings: pinctrl: deprecate header with register constants
Date:   Wed,  1 Jun 2022 17:27:20 +0200
Message-Id: <20220601152720.232383-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601152720.232383-1-krzysztof.kozlowski@linaro.org>
References: <20220601152720.232383-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For convenience (less code duplication, some meaning added to raw
number), the pin controller pin configuration register values
were defined in the bindings header.  These are not some IDs or other
abstraction layer but raw numbers used in the registers

These constants do not fit the purpose of bindings.  They do not provide
any abstraction, any hardware and driver independent ID.  With minor
exceptions, the Linux drivers actually do not use the bindings header at
all.

All of the constants were moved already to headers local to DTS
(residing in DTS directory), so remove any references to the bindings
header and add a warning tha tit is deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  | 6 ++----
 drivers/pinctrl/samsung/pinctrl-exynos.h  | 3 +++
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 +---
 drivers/pinctrl/samsung/pinctrl-samsung.h | 8 ++++++++
 include/dt-bindings/pinctrl/samsung.h     | 7 +++++++
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 6d7ca1758292..a8212fc126bf 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -27,8 +27,6 @@
 #include <linux/soc/samsung/exynos-pmu.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 
-#include <dt-bindings/pinctrl/samsung.h>
-
 #include "pinctrl-samsung.h"
 #include "pinctrl-exynos.h"
 
@@ -173,7 +171,7 @@ static int exynos_irq_request_resources(struct irq_data *irqd)
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
-	con |= EXYNOS_PIN_FUNC_EINT << shift;
+	con |= EXYNOS_PIN_CON_FUNC_EINT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
@@ -196,7 +194,7 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 
 	con = readl(bank->pctl_base + reg_con);
 	con &= ~(mask << shift);
-	con |= EXYNOS_PIN_FUNC_INPUT << shift;
+	con |= PIN_CON_FUNC_INPUT << shift;
 	writel(con, bank->pctl_base + reg_con);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index bfad1ced8017..7bd6d82c9f36 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -16,6 +16,9 @@
 #ifndef __PINCTRL_SAMSUNG_EXYNOS_H
 #define __PINCTRL_SAMSUNG_EXYNOS_H
 
+/* Values for the pin CON register */
+#define EXYNOS_PIN_CON_FUNC_EINT	0xf
+
 /* External GPIO and wakeup interrupt related definitions */
 #define EXYNOS_GPIO_ECON_OFFSET		0x700
 #define EXYNOS_GPIO_EFLTCON_OFFSET	0x800
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 26d309d2516d..4837bceb767b 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -26,8 +26,6 @@
 #include <linux/of_device.h>
 #include <linux/spinlock.h>
 
-#include <dt-bindings/pinctrl/samsung.h>
-
 #include "../core.h"
 #include "pinctrl-samsung.h"
 
@@ -614,7 +612,7 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
 	data = readl(reg);
 	data &= ~(mask << shift);
 	if (!input)
-		data |= EXYNOS_PIN_FUNC_OUTPUT << shift;
+		data |= PIN_CON_FUNC_OUTPUT << shift;
 	writel(data, reg);
 
 	return 0;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index fc6f5199c548..9af93e3d8d9f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -53,6 +53,14 @@ enum pincfg_type {
 #define PINCFG_UNPACK_TYPE(cfg)		((cfg) & PINCFG_TYPE_MASK)
 #define PINCFG_UNPACK_VALUE(cfg)	(((cfg) & PINCFG_VALUE_MASK) >> \
 						PINCFG_VALUE_SHIFT)
+/*
+ * Values for the pin CON register, choosing pin function.
+ * The basic set (input and output) are same between: S3C24xx, S3C64xx, S5PV210,
+ * Exynos ARMv7, Exynos ARMv8, Tesla FSD.
+ */
+#define PIN_CON_FUNC_INPUT		0x0
+#define PIN_CON_FUNC_OUTPUT		0x1
+
 /**
  * enum eint_type - possible external interrupt types.
  * @EINT_TYPE_NONE: bank does not support external interrupts
diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index 950970634dfe..d1da5ff68d0c 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -10,6 +10,13 @@
 #ifndef __DT_BINDINGS_PINCTRL_SAMSUNG_H__
 #define __DT_BINDINGS_PINCTRL_SAMSUNG_H__
 
+/*
+ * These bindings are deprecated, because they do not match the actual
+ * concept of bindings but rather contain pure register values.
+ * Instead include the header in the DTS source directory.
+ */
+#warning "These bindings are deprecated. Instead use the header in the DTS source directory."
+
 #define EXYNOS_PIN_PULL_NONE		0
 #define EXYNOS_PIN_PULL_DOWN		1
 #define EXYNOS_PIN_PULL_UP		3
-- 
2.34.1

