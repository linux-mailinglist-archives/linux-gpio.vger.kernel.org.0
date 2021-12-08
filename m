Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C6546D9BB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 18:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237910AbhLHReb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 12:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhLHReb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 12:34:31 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A789C0617A1;
        Wed,  8 Dec 2021 09:30:59 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a9so5336215wrr.8;
        Wed, 08 Dec 2021 09:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=54JGR63zIfNaYbUUWETCMZ0L4SIvFv6G2eVNTAt71BQ=;
        b=AC6UZ8lHFOLjgwgusugO0jgp/CrsARp0S0viVeFT1sFglbm6S7DfT79ld+HoXSDZm9
         JM7aMajl4XXD2dPLURWO5Zb4XfWMQQ9KIF1lKb6rRk27OFNaW9Qb6jBfrqFYfhcalCFk
         CuTraso2A6X+miWNNmL++AWZoXwncMl6X9CIwEJZvYdtXf5E5MPLHw8WWxfrZw+EF9tV
         Wgxuug6RwweK2hZZ+JSEfylPZ6fxtTWabrwg7WVCFctsZyqp2L7GLU/dOIfUu0Maftr7
         nSwaOIorkIc2pxFlWJBCvWjIaI/cN1g2DqLe33gCiN6P95HGTqgatgNZJxDD3Kf3tEY3
         3HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=54JGR63zIfNaYbUUWETCMZ0L4SIvFv6G2eVNTAt71BQ=;
        b=jNuhLctrG4UecTMFuTCzgIRXd8RK+8zhfQARf7bgJsvcon0wpTHokL6ZuXz4MIS79d
         lNUM62J0bvf+P5GBeuSvFNwAkMhzA7zmX14bJDJ4GS38S0mgKJSyxBOe5zNbY4AzMX7a
         hEwqceZ3NgGEv+lm/US8uQ3HlddK5RqKtIG2I7lYNwzcgLf3nYgaZUxO/OsyMIHlWJAN
         zRHphJtNAKFLN22LImXZCdnvs+QbqY5dX6MJIVAvCm1AaS7zvrkwKP7YErZF8Aqc3PHk
         ORMjkJ8l3WsNpe9QjpPRluA+HRGt+OLgvG2j/+O7Xy3lTs6VxogvS6YurPqDqw5L4+2j
         S0HQ==
X-Gm-Message-State: AOAM531T4tUdr9EHovo1Dk1KFOZ/ni39c1dNGd5pT7pPUL/uYJKHlrZX
        L4pGNMk1NjIETgUQlFWb1Vw=
X-Google-Smtp-Source: ABdhPJxmIZXJZM9LOhQ+l/KwkhbGn8z01Gyd2ua1dZD2KcC2x+sUVYMzLqI3M6ti28UUTL565MNGHw==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr47421wrs.237.1638984657757;
        Wed, 08 Dec 2021 09:30:57 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id f3sm3308414wrm.96.2021.12.08.09.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:30:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/6] gpio: tegra186: Add support for Tegra234
Date:   Wed,  8 Dec 2021 18:30:45 +0100
Message-Id: <20211208173047.558108-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211208173047.558108-1-thierry.reding@gmail.com>
References: <20211208173047.558108-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Prathamesh Shete <pshete@nvidia.com>

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra234. While the programming model remains
the same, the number of pins has slightly changed.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index c026e7141e4e..91c77fccc1e6 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
+#include <dt-bindings/gpio/tegra234-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -972,6 +973,75 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.num_irqs_per_bank = 8,
 };
 
+#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA234_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra234_main_ports[] = {
+	TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT( B, 0, 3, 1),
+	TEGRA234_MAIN_GPIO_PORT( C, 5, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT( D, 5, 2, 4),
+	TEGRA234_MAIN_GPIO_PORT( E, 5, 3, 8),
+	TEGRA234_MAIN_GPIO_PORT( F, 5, 4, 6),
+	TEGRA234_MAIN_GPIO_PORT( G, 4, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT( H, 4, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT( I, 4, 2, 7),
+	TEGRA234_MAIN_GPIO_PORT( J, 5, 0, 6),
+	TEGRA234_MAIN_GPIO_PORT( K, 3, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT( L, 3, 1, 4),
+	TEGRA234_MAIN_GPIO_PORT( M, 2, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT( N, 2, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT( P, 2, 2, 8),
+	TEGRA234_MAIN_GPIO_PORT( Q, 2, 3, 8),
+	TEGRA234_MAIN_GPIO_PORT( R, 2, 4, 6),
+	TEGRA234_MAIN_GPIO_PORT( X, 1, 0, 8),
+	TEGRA234_MAIN_GPIO_PORT( Y, 1, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT( Z, 1, 2, 8),
+	TEGRA234_MAIN_GPIO_PORT(AC, 0, 1, 8),
+	TEGRA234_MAIN_GPIO_PORT(AD, 0, 2, 4),
+	TEGRA234_MAIN_GPIO_PORT(AE, 3, 3, 2),
+	TEGRA234_MAIN_GPIO_PORT(AF, 3, 4, 4),
+	TEGRA234_MAIN_GPIO_PORT(AG, 3, 2, 8),
+};
+
+static const struct tegra_gpio_soc tegra234_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra234_main_ports),
+	.ports = tegra234_main_ports,
+	.name = "tegra234-gpio",
+	.instance = 0,
+	.num_irqs_per_bank = 8,
+};
+
+#define TEGRA234_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA234_AON_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra234_aon_ports[] = {
+	TEGRA234_AON_GPIO_PORT(AA, 0, 4, 8),
+	TEGRA234_AON_GPIO_PORT(BB, 0, 5, 4),
+	TEGRA234_AON_GPIO_PORT(CC, 0, 2, 8),
+	TEGRA234_AON_GPIO_PORT(DD, 0, 3, 3),
+	TEGRA234_AON_GPIO_PORT(EE, 0, 0, 8),
+	TEGRA234_AON_GPIO_PORT(GG, 0, 1, 1),
+};
+
+static const struct tegra_gpio_soc tegra234_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra234_aon_ports),
+	.ports = tegra234_aon_ports,
+	.name = "tegra234-gpio-aon",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -985,6 +1055,12 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra194-gpio-aon",
 		.data = &tegra194_aon_soc
+	}, {
+		.compatible = "nvidia,tegra234-gpio",
+		.data = &tegra234_main_soc
+	}, {
+		.compatible = "nvidia,tegra234-gpio-aon",
+		.data = &tegra234_aon_soc
 	}, {
 		/* sentinel */
 	}
-- 
2.34.1

