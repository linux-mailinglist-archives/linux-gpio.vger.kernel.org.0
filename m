Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14EC44773FC
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 15:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237688AbhLPOKY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 09:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237665AbhLPOKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 09:10:24 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C62EC061574;
        Thu, 16 Dec 2021 06:10:24 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t26so8111353wrb.4;
        Thu, 16 Dec 2021 06:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PxyU+XWVTEJWznDnBADFy9jfsdEEP9yIkmzfwC1SDkc=;
        b=g5iHT6E3mT8IaFyfop2oEblxtacvubDUhm/vfMWpvBONSvry7kp/VpUlsIhuBrBl49
         RF1m5E4AaZ8R6ZGqLr9+0UM/UpibTvCIdWfa46mUMIlIDbMeST4260i3AUpQge1qQ+w6
         uZ8bUERPwWA6ec1odJXlzXP50P12WgGId0j/Z+slQ2vBjTRiA8xiz2B/OfdzoJZWAZt0
         rUvoICHr9If8NcV6HHzRboSRFwsVrp9c2U5nXNgjCf4JWM+8UH8jiG2gCWusmoVk8Ffy
         tgCPUBf6janlxLQI4ej7logP90ODsmxhRWE2XjuuNxkD9YqCc8/Jqc0SWaKrTJGRn2Me
         sT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PxyU+XWVTEJWznDnBADFy9jfsdEEP9yIkmzfwC1SDkc=;
        b=T+a/kgiHrBm1pWtFxRU3dJ9uIhbZGWV6JoaJajRd9HTZbPf0HEx6s0m+cNgMUXS15x
         fJP5sZ5FlUTdTtxmdc0v0KtC8nmZ73ocUqUIbqmSAuyoXFSDk2p0Ix7VsCApuB8q04qV
         8iuCovXNHDjJn4dhqlidXBUL/d9tdyE5x4/Umy4THNtk0YYMUxL/iv6nUgTaziXVzaRk
         svqjvMAd0hMz5Hl4LexFA9weVocqkmrxqoYod8VYA1+H8yyJQeedLqOBBM+TcKi6feLH
         UkovnLMnJi2OFauzyD2/FjPEg8YxEVTdF0Ly/WqEViCuQ4myk8i7UWwVTrYSr/9MJs17
         QNDw==
X-Gm-Message-State: AOAM533wu0ixvtRZ/nRUUrlhN64rzxOblNy39aEfIU/TPhALsPQ5F43T
        A7aaZjzlGuvurXqJBKRozjs=
X-Google-Smtp-Source: ABdhPJy8PWrMH/0lqhcwl6GMYkBmwX4mbcZxUo+x3DqxY7D/chl51mapMF4REI5u7Svk7zAwtKvCPQ==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr9020514wrd.144.1639663821471;
        Thu, 16 Dec 2021 06:10:21 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b15sm6612271wri.62.2021.12.16.06.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 06:10:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] gpio: tegra186: Add support for Tegra241
Date:   Thu, 16 Dec 2021 15:10:09 +0100
Message-Id: <20211216141009.1478562-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216141009.1478562-1-thierry.reding@gmail.com>
References: <20211216141009.1478562-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Akhil R <akhilrajeev@nvidia.com>

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra241 (Grace). While the programming model
remains the same, the number of pins has slightly changed.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 91c77fccc1e6..fe45f5a89bb2 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -15,6 +15,7 @@
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
 #include <dt-bindings/gpio/tegra234-gpio.h>
+#include <dt-bindings/gpio/tegra241-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -1042,6 +1043,55 @@ static const struct tegra_gpio_soc tegra234_aon_soc = {
 	.num_irqs_per_bank = 8,
 };
 
+#define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA241_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra241_main_ports[] = {
+	TEGRA241_MAIN_GPIO_PORT(A, 0, 0, 8),
+	TEGRA241_MAIN_GPIO_PORT(B, 0, 1, 8),
+	TEGRA241_MAIN_GPIO_PORT(C, 0, 2, 2),
+	TEGRA241_MAIN_GPIO_PORT(D, 0, 3, 6),
+	TEGRA241_MAIN_GPIO_PORT(E, 0, 4, 8),
+	TEGRA241_MAIN_GPIO_PORT(F, 1, 0, 8),
+	TEGRA241_MAIN_GPIO_PORT(G, 1, 1, 8),
+	TEGRA241_MAIN_GPIO_PORT(H, 1, 2, 8),
+	TEGRA241_MAIN_GPIO_PORT(J, 1, 3, 8),
+	TEGRA241_MAIN_GPIO_PORT(K, 1, 4, 4),
+	TEGRA241_MAIN_GPIO_PORT(L, 1, 5, 6),
+};
+
+static const struct tegra_gpio_soc tegra241_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra241_main_ports),
+	.ports = tegra241_main_ports,
+	.name = "tegra241-gpio",
+	.instance = 0,
+};
+
+#define TEGRA241_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA241_AON_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra241_aon_ports[] = {
+	TEGRA241_AON_GPIO_PORT(AA, 0, 0, 8),
+	TEGRA241_AON_GPIO_PORT(BB, 0, 0, 4),
+};
+
+static const struct tegra_gpio_soc tegra241_aon_soc = {
+	.num_ports = ARRAY_SIZE(tegra241_aon_ports),
+	.ports = tegra241_aon_ports,
+	.name = "tegra241-gpio-aon",
+	.instance = 1,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -1072,6 +1122,8 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
 	{ .id = "NVDA0208", .driver_data = (kernel_ulong_t)&tegra186_aon_soc },
 	{ .id = "NVDA0308", .driver_data = (kernel_ulong_t)&tegra194_main_soc },
 	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
+	{ .id = "NVDA0508", .driver_data = (kernel_ulong_t)&tegra241_main_soc },
+	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
-- 
2.34.1

