Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055CB3DBB49
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239384AbhG3OuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239538AbhG3OuB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:50:01 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8BEC061370
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:40 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b7so13575964edu.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tQGRmp6w/PSekRXBpdFwg0L2q55A125G3jOg4JhNBfI=;
        b=K2aZWGktsgMltZ3WLzBixgOfIHWcImbQSJya4GM1UG4HTCccAN1gtNKZdXnDZa6xs7
         Q8SkI6yYdX+gWCzQAhq9hY1d0wvUlH9k3nueLL5Hxfjtt7Cf6MZrLGDzjshOdHQhIKcb
         eVglYOajtTjQAP8vR+xbsgEYdgpMfCVbVtitIdzAI7m8eb1UO9NAuGE9jFgkXTzX47bw
         KaTKRkMRrhDZpGkLFHXOk9vPLbemW1gt41649JDo51nymBKJ/0kzYYMgU8AvXnclNOB+
         tpo22Hl7+hPbldDb4DhfGH1Ji4VRwSBYiYtptEjFhlcn/W8RRVQ6I58JDN3e60h4dQHu
         y1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tQGRmp6w/PSekRXBpdFwg0L2q55A125G3jOg4JhNBfI=;
        b=RBw9V5PafAYZGccM4YRVgFXLhf3vaQinJqaK21y5gmENqmHzrRuMnmHZIAXaNL7bX8
         xcnyq059akPRuYCiX0NtnW5fWtmn4ERndGzIK6m+wnIUJF7ve0l8bZRleLtlHgu70XX8
         a9bR1vhkgggR0gesj0Fh+pUnGr0o9CEfDBKeSWaOi9KzaiGj3IIUejbg5oEujDLjK8qH
         JDI2nNP9DzqSGRHkLVPokAwrRCZrVs49xJfu0LUqLLbLU+43mWHMGxeW0QSEJOO4/tTd
         uBkx4edYkjjpDfymKn5CJKP2nalGyJh8m3K7yvVobHPShH8cdm8epYEt2i29ZHsd/KFn
         a4jQ==
X-Gm-Message-State: AOAM533h0XuNifQu2W1FzDPfiYJ4/hrROsppPnOv5KKTcGLyPmPm5Pvz
        2zwVuChgJgyNXFGRuZlHNlFJ8A==
X-Google-Smtp-Source: ABdhPJxn0sgrAzc8oH2ckgTDzHk+Zg1E5gqFm4yp+FA/Rh9DceW9eF7J/ZELRVS4eClsIdsbkum/UA==
X-Received: by 2002:a05:6402:26ca:: with SMTP id x10mr3404671edd.319.1627656579080;
        Fri, 30 Jul 2021 07:49:39 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p18sm783100edu.8.2021.07.30.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:38 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 10/12] clk: samsung: Add Exynos850 clock driver stub
Date:   Fri, 30 Jul 2021 17:49:20 +0300
Message-Id: <20210730144922.29111-11-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For now it's just a stub driver to make serial driver work. Later it
will be implemented properly.

This driver doesn't really change clocks, only registers the UART clock
as a fixed-rate clock. Without this clock driver the UART driver won't
work, as it's trying to obtain "uart" clock and fails if it's not able
to. From drivers/tty/serial/samsung_tty.c:

8<------------------------------------------------------------------->8
    ourport->clk = clk_get(&platdev->dev, "uart");
    if (IS_ERR(ourport->clk)) {
        pr_err("%s: Controller clock not found\n",
                dev_name(&platdev->dev));
        ret = PTR_ERR(ourport->clk);
        goto err;
    }
8<------------------------------------------------------------------->8

In order to get functional serial console we have to implement that
minimal clock driver with "uart" clock. It's not necessary to actually
configure clocks, as those are already configured in bootloader, so
kernel can rely on that for now.

80 column limit is broken here to make checkpatch happy, otherwise it
swears about incorrect __initconst usage.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/Makefile        |  1 +
 drivers/clk/samsung/clk-exynos850.c | 63 +++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynos850.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 028b2e27a37e..c46cf11e4d0b 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
 obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
 obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
 obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
 obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
new file mode 100644
index 000000000000..3192ec9bb90b
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2021 Linaro Ltd.
+ *
+ * Common Clock Framework support for Exynos850 SoC.
+ */
+
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <dt-bindings/clock/exynos850.h>
+
+#include "clk.h"
+
+/* Fixed rate clocks generated outside the SoC */
+static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
+	FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
+};
+
+/*
+ * Model the UART clock as a fixed-rate clock for now, to make serial driver
+ * work. This clock is already configured in the bootloader.
+ */
+static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
+	FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
+};
+
+static const struct of_device_id ext_clk_match[] __initconst = {
+	{ .compatible = "samsung,exynos850-oscclk", .data = (void *)0 },
+	{},
+};
+
+void __init exynos850_clk_init(struct device_node *np)
+{
+	void __iomem *reg_base;
+	struct samsung_clk_provider *ctx;
+
+	if (!np)
+		panic("%s: unable to determine soc\n", __func__);
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base)
+		panic("%s: failed to map registers\n", __func__);
+
+	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
+	if (!ctx)
+		panic("%s: unable to allocate ctx\n", __func__);
+
+	samsung_clk_of_register_fixed_ext(ctx,
+			exynos850_fixed_rate_ext_clks,
+			ARRAY_SIZE(exynos850_fixed_rate_ext_clks),
+			ext_clk_match);
+
+	samsung_clk_register_fixed_rate(ctx, exynos850_peri_clks,
+			ARRAY_SIZE(exynos850_peri_clks));
+
+	samsung_clk_of_add_provider(np, ctx);
+}
+
+CLK_OF_DECLARE(exynos850_clk, "samsung,exynos850-clock", exynos850_clk_init);
-- 
2.30.2

