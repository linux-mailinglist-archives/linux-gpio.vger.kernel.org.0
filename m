Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8508F44E6F0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 14:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbhKLNFB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 08:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbhKLNFA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 08:05:00 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46125C061766;
        Fri, 12 Nov 2021 05:02:10 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so6729349wmd.1;
        Fri, 12 Nov 2021 05:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wkYaVoKGtwTLfJg21yxqtXOg5Px0Ajr6a8TEjKHS6WM=;
        b=dAbajU69C9C98hM+k9F/n/6vLQKV8G/8KZrDXSZXzLoEg8BhMB/0LkwuygWaJ8r4LD
         dH7yh9REUHcIhEB1GGLm6EQpYt30UVQcZxROtByZALkWrLLkkiGOINfe5SouU3m66+nf
         IZQrqTHxAXEEIeX8iRfACUfnCUKADLoBH/VqskatARS29gO8x+Bctd2mAG8/V7s7JGYU
         K2MnX4ByNesnjeX76SAQVxZgX16i5pU08PCrn7tmFspc5Aaib8y53+lPNQiNd/yi8x20
         j8vVPI6TtvBYpGAO7xwfeRmQB2Hg3c7gfXHychGvM4sbUMtGuWdr5f41/r9nistEdAXo
         o9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wkYaVoKGtwTLfJg21yxqtXOg5Px0Ajr6a8TEjKHS6WM=;
        b=Szyu506OBCHW1A+FPJMs7T6DJCgnnENh642Iq7vuGENlGFYiG/oys4ddqxubW9jd6E
         stsO41CrserBKf7IdHfu+EHFgkFACRtlGCx8liSwMHE08jy2hz8Oy38O19fmtweLDlPe
         p6DKGaHs5Y42i7wbwylsHRksr2e6tfn2mJyzWGtVpfiMf1nB9SlmvDips9H3duHc8mND
         ionaUBWeeb6wJnxMl7yf8WMtLQ2VtzXRqydpBdTplZOcV8qbV01fCtuun7FzR+j8GLfB
         Ff9xcFor2ATrTBpuspPZ8ZDTmlf+KyN3WepSPdZ+Q2GFqPuGs3eF9dzRWXAqplNoGiF4
         xPqQ==
X-Gm-Message-State: AOAM530wBe18+on9MiGh/lVe/EwfU6UgrXTM5+mL+EuDYbhYf5K6K0s0
        3Ibk2X7XZrhlcUN25csK8lI=
X-Google-Smtp-Source: ABdhPJwyykvE2tDnsNDN/mmR1V4/O8/H2VmAv8QrbDrNMjy1Pbh6+Y9IdPUBxvlJf7UfKPgcZLisdQ==
X-Received: by 2002:a05:600c:3505:: with SMTP id h5mr33591850wmq.22.1636722128808;
        Fri, 12 Nov 2021 05:02:08 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p27sm5387522wmi.28.2021.11.12.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:02:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/5] gpio: tegra186: Add support for Tegra234
Date:   Fri, 12 Nov 2021 14:01:50 +0100
Message-Id: <20211112130152.3682556-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130152.3682556-1-thierry.reding@gmail.com>
References: <20211112130152.3682556-1-thierry.reding@gmail.com>
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
2.33.1

