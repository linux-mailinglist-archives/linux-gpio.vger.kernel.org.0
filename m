Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390DF482519
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Dec 2021 17:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhLaQXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Dec 2021 11:23:20 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47138
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230150AbhLaQXS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 Dec 2021 11:23:18 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CE1D63FFDF
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967797;
        bh=3im6DR0tfQSvVQYJAITaAc2sEgTm9ctnw8/dFQunAY0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=BqvvZBUIZntOdC8Hs9/clCx5d+CV+D009PQlMPb/0ZIe2tzpQgFR9kVuoaSCNCh1K
         Uf0ZKtaycEpR8naCeD8dZ6F4hdC5w4CAUAws8K/LvUQoK+IklcVJZkpDuYJnuaUVzk
         UKWgXahcbxPyv+llsN4VhLkSFpS1JUwjKAMxumokEQuqoRa6xP8CtvfOQvl/wVbIOe
         Y0ABhp5ThQSkBhO8+IRTmUIY3iK6yMm474V4QFWG/g8JrlDWj4tGOUXkxineukZweF
         BKtGIJ43l1qs9/E8U82iGbBiySwT9MohtEhJivDn91PprWloIe/Lx4fXMu0ZJMuOgv
         8X+lVr9TgpN4w==
Received: by mail-lj1-f200.google.com with SMTP id k20-20020a2e9214000000b0022d6b13bc8aso9441500ljg.13
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 08:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3im6DR0tfQSvVQYJAITaAc2sEgTm9ctnw8/dFQunAY0=;
        b=gmZV3z3EgJNF+3VfnhUkx20vtt/PEY3WaT9kFP/H1/9478aSGKY3SjULXn5hPFodN6
         BrmJ3X8W6FvjlwqKQFi2cop94wUAHRmaBITZijS2MVV52x44fXNywJzaIn+49hdU4n3Z
         +2hHzHkLJaBaUimjSQ+aTniFigqv44DZixdthVM28y5TH+KEtk216AdWbQ1MfnPHpC7K
         L/p8BDWfo6bqAek4TdakYgmgHbJI7dWoDUPkXugFgXSZsNcivxqNBoO8gJEsxY1VV8iU
         9HDbD1jgraHf+IWEtjqReXm27cOc+0IsRvLfKmmEIXJoFmuNOMCEvd9/iPoLvYCyUjDZ
         Q2vw==
X-Gm-Message-State: AOAM532PY+ZVQOI9iFR1QYJ79g44uRPbYpBigLsDN+U7QUUFi77TSA2Y
        uI2LPPFYbGkFcr6xkXIg5W+cIYgPk4Yv7dEXvnHEx4dXHID33vNnCE2ZtSvoQHfvQ49OViutBGX
        Z20kCu64PMzkrauoyU6yGSddMFX+cJZor1AMAWOM=
X-Received: by 2002:a19:7b1d:: with SMTP id w29mr31770823lfc.674.1640967796941;
        Fri, 31 Dec 2021 08:23:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIUkXHjrcu5gpNac2hXDPPeiFztS0xFjX8YiWCGDHTQhbtFj5U6pPah4eLrfq4TgUlFkWUWg==
X-Received: by 2002:a19:7b1d:: with SMTP id w29mr31770814lfc.674.1640967796772;
        Fri, 31 Dec 2021 08:23:16 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y20sm1510835ljn.69.2021.12.31.08.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:23:16 -0800 (PST)
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
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 21/24] ARM: dts: s3c24xx: align pinctrl with dtschema
Date:   Fri, 31 Dec 2021 17:23:06 +0100
Message-Id: <20211231162309.257587-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Align the pin controller related nodes with dtschema.  No functional
change expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi | 60 +++++++++++++-------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/s3c2416-pinctrl.dtsi b/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
index 92439ee5d7de..20a7d72827c2 100644
--- a/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
+++ b/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
@@ -12,66 +12,66 @@ &pinctrl_0 {
 	 * Pin banks
 	 */
 
-	gpa: gpa {
+	gpa: gpa-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpb: gpb {
+	gpb: gpb-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpc: gpc {
+	gpc: gpc-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpd: gpd {
+	gpd: gpd-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpe: gpe {
+	gpe: gpe-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpf: gpf {
+	gpf: gpf-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 
-	gpg: gpg {
+	gpg: gpg-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
 
-	gph: gph {
+	gph: gph-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpj: gpj {
+	gpj: gpj-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpk: gpk {
+	gpk: gpk-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpl: gpl {
+	gpl: gpl-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	gpm: gpm {
+	gpm: gpm-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
@@ -80,92 +80,92 @@ gpm: gpm {
 	 * Pin groups
 	 */
 
-	uart0_data: uart0-data {
+	uart0_data: uart0-data-pins {
 		samsung,pins = "gph-0", "gph-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	uart0_fctl: uart0-fctl {
+	uart0_fctl: uart0-fctl-pins {
 		samsung,pins = "gph-8", "gph-9";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	uart1_data: uart1-data {
+	uart1_data: uart1-data-pins {
 		samsung,pins = "gph-2", "gph-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	uart1_fctl: uart1-fctl {
+	uart1_fctl: uart1-fctl-pins {
 		samsung,pins = "gph-10", "gph-11";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	uart2_data: uart2-data {
+	uart2_data: uart2-data-pins {
 		samsung,pins = "gph-4", "gph-5";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	uart2_fctl: uart2-fctl {
+	uart2_fctl: uart2-fctl-pins {
 		samsung,pins = "gph-6", "gph-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	uart3_data: uart3-data {
+	uart3_data: uart3-data-pins {
 		samsung,pins = "gph-6", "gph-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	extuart_clk: extuart-clk {
+	extuart_clk: extuart-clk-pins {
 		samsung,pins = "gph-12";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	i2c0_bus: i2c0-bus {
+	i2c0_bus: i2c0-bus-pins {
 		samsung,pins = "gpe-14", "gpe-15";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	spi0_bus: spi0-bus {
+	spi0_bus: spi0-bus-pins {
 		samsung,pins = "gpe-11", "gpe-12", "gpe-13";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd0_clk: sd0-clk {
+	sd0_clk: sd0-clk-pins {
 		samsung,pins = "gpe-5";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd0_cmd: sd0-cmd {
+	sd0_cmd: sd0-cmd-pins {
 		samsung,pins = "gpe-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd0_bus1: sd0-bus1 {
+	sd0_bus1: sd0-bus1-pins {
 		samsung,pins = "gpe-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd0_bus4: sd0-bus4 {
+	sd0_bus4: sd0-bus4-pins {
 		samsung,pins = "gpe-8", "gpe-9", "gpe-10";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd1_cmd: sd1-cmd {
+	sd1_cmd: sd1-cmd-pins {
 		samsung,pins = "gpl-8";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd1_clk: sd1-clk {
+	sd1_clk: sd1-clk-pins {
 		samsung,pins = "gpl-9";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd1_bus1: sd1-bus1 {
+	sd1_bus1: sd1-bus1-pins {
 		samsung,pins = "gpl-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
 
-	sd1_bus4: sd1-bus4 {
+	sd1_bus4: sd1-bus4-pins {
 		samsung,pins = "gpl-1", "gpl-2", "gpl-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 	};
-- 
2.32.0

