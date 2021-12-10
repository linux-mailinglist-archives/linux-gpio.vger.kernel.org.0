Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCDC470520
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 17:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238528AbhLJQF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 11:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238225AbhLJQF4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 11:05:56 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE99C061353;
        Fri, 10 Dec 2021 08:02:20 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id o13so15634698wrs.12;
        Fri, 10 Dec 2021 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0239iPMR2oTflA1EYA/QT9vBNU+rZqJzw2SuouZUzKA=;
        b=qyNm0IFqs5PmValp4Brx7qf2imf3Fr2iXa1IScxddAl1rcv6OIuLwLAlTMDQ4HZgJx
         CD3M+9yuXB+E1R1nD44QAlKFy2OFVbb/Vvu9qnTbgD5RokoI3uOPeSpSL7B8ocmHWpC+
         vBOJIo9R72fU8IdRD/LRqEt5SrPKHT9akR+YwoEOzhPOW2nKRbz1c89MJvHwgkPLnd+F
         UVBllbfETAZg8qTHvvB6yahnnJ3sSL8kNOBAgD0gielKAETDVpRBVecTsH2SmhgMgIXM
         h8GJmwlsW1k6bVgRtuQ8X8GRySZAdpYy2KpGogIoBKBAXQGDW5NYgZ1tNyeYyXPYf56J
         trzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0239iPMR2oTflA1EYA/QT9vBNU+rZqJzw2SuouZUzKA=;
        b=zCIQABTiAHCFydJBJ84AbgzVxolDWWHH93ezvZ2HxZxsPDBHYNFfkdakcDa7STi4DU
         Amtqcfnun88ww8dGfhYAUKh9c0u+7TFCrG7jcFFuuEOFO38hHUNHHLo33TAR1WBr8ire
         NYudiNABCUVnQRXOB4Aa+nDhS/d/KtWi9RD5S5bDW5xFHQ2jj6s2nk/HucAJMNqG2IKI
         HN68XKRjhMv7z/NwuHURj6Y/q15XdPW7lWMv2FnSXuHughz6ygB0AtG3BtLq7nP31bQE
         3KDRtj0ahCfFbGJbYY/9bwf3Svm2lJCmHgSwD5xZl3oQ7WOL/+/XDv5jzCPAzEGFFlY3
         JKdQ==
X-Gm-Message-State: AOAM533jP6GTfgA+KvGrf4gUWs9sUjuNzpIithN0f7lam//N9axcASlk
        mbzKtQRpe9iNCnC4pnzf6u8=
X-Google-Smtp-Source: ABdhPJzufz/w1my2hEp+8y5stCXcPvOEYC2pm5Jq1+yciTEbBW0iYi24U4yI0MNmlW812+eBdXLYog==
X-Received: by 2002:a5d:58fb:: with SMTP id f27mr15007566wrd.10.1639152139437;
        Fri, 10 Dec 2021 08:02:19 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w17sm2932911wrp.79.2021.12.10.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:02:18 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 4/6] gpio: tegra186: Add support for Tegra234
Date:   Fri, 10 Dec 2021 17:02:04 +0100
Message-Id: <20211210160206.872998-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210160206.872998-1-thierry.reding@gmail.com>
References: <20211210160206.872998-1-thierry.reding@gmail.com>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

