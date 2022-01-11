Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C5B48B815
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243357AbiAKUP2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:15:28 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37756
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242528AbiAKUPY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:24 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EA47F40019
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932123;
        bh=yMRg5bpikDO180MsuJoGQbsc7amvRmcUNEN2QLw9x1s=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=BlVjFCFEDEqxUu4C8Rj3D0gmwrrmo2eO80CEE2ggoiXOMSSNPnbvHkAwOoMatLW7Z
         V/h30LRjs6P4QRgyAd2uT7WGlccQM3uH8ElWnKp+P/kv9b5OA418QCAJNSOl9jAcgO
         9mnY1cGInaXgdcIk1kyeiDNRQN46LwrwPV4m3irrUOIeYO/GTUIGmNlOFMw7jGPmXH
         HRvTH6zb7htgwVEMYFuRRmlfjFxwtkXrZUicvdxb7JrIPPOZOZ6QgDu058TgDJ/X2c
         hdIjmW7ZN30e9IWyEzArqfHnTMMKXELEqxYiNr13Nd7hOO2TYj2bcvZ74Pv6Xqyzq5
         rPpH9RVyyAVPQ==
Received: by mail-ed1-f71.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso139816edc.23
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMRg5bpikDO180MsuJoGQbsc7amvRmcUNEN2QLw9x1s=;
        b=ZSVRS91v64ArCLTBIh4GTMCPNPCacXfiSF5e2tPf6UEdLqKpvmT0Y6fBFduHzJKoZa
         UqK+wb1KJKqO3CZ4HX2CaWAiGcd6eCr8yAs5XD96raUFce/dp1IotgbNRpDPIslkZGMB
         /SBenXCmZv91cLlD3Is6380cDDBRGQ6Q3ViLgDVl5NOzjj6pAoH8zBocpbYNnEfZ1bUe
         cTUy+AJqBhoZ/HqfyKO8RbvJtfz43Vaas6RMFth4uKuTTpSJp5+2GZWEIsMj5+Bp2hzH
         E8lb7xiyaNiIa90fvVxpXTCioZH3UD7OTL2oSAZ+8D6S3+GZDM3cILUMkc6YDkvPL94d
         DJqg==
X-Gm-Message-State: AOAM532GCn9DYuDS5lPanGdXpL62961E7uwtm8BIk+SFl562sghZFIKQ
        lCsd8BwOhh+AYhxn0NwZXJs7WbaPMchVvtvoPPlQyOMt335OuG5wlW6BVufMBGuoY6ZyOqf+i6J
        59W1FZ7AvL5qRhucSYojgxCi51GpkJ1XtajgqL3s=
X-Received: by 2002:a17:906:e92:: with SMTP id p18mr4852333ejf.616.1641932122794;
        Tue, 11 Jan 2022 12:15:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy0jhY+ruxR5/A+E+ypB8QX7lhJyLehZkmqyLuFS2EyP4zC5Ct+Xt3e8pj1XNa67xaH8Jh9A==
X-Received: by 2002:a17:906:e92:: with SMTP id p18mr4852317ejf.616.1641932122648;
        Tue, 11 Jan 2022 12:15:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 05/28] ARM: dts: exynos: override pins by label in Peach Pit
Date:   Tue, 11 Jan 2022 21:14:03 +0100
Message-Id: <20220111201426.326777-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Using node paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index e76fb104db19..1ae5528e9ebf 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -868,27 +868,26 @@ pmic_dvs_1: pmic-dvs-1 {
 	};
 };
 
-&pinctrl_1 {
-	/* Adjust WiFi drive strengths lower for EMI */
-	sd1_clk: sd1-clk {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+/* pinctrl_1 */
+/* Adjust WiFi drive strengths lower for EMI */
+&sd1_bus1 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_cmd: sd1-cmd {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_bus4 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus1: sd1-bus-width1 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_bus8 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus4: sd1-bus-width4 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_clk {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus8: sd1-bus-width8 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_cmd {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
 };
 
 &pinctrl_2 {
@@ -907,12 +906,13 @@ pmic_dvs_3: pmic-dvs-3 {
 	};
 };
 
-&pinctrl_3 {
-	/* Drive SPI lines at x2 for better integrity */
-	spi2-bus {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+/* pinctrl_3*/
+/* Drive SPI lines at x2 for better integrity */
+&spi2_bus {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
+&pinctrl_3 {
 	/* Drive SPI chip select at x2 for better integrity */
 	ec_spi_cs: ec-spi-cs {
 		samsung,pins = "gpb1-2";
-- 
2.32.0

