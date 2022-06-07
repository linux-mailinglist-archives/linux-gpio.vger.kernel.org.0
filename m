Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71BBC53DCB3
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jun 2022 18:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345964AbiFEQFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Jun 2022 12:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345825AbiFEQFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2022 12:05:36 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C4226E1
        for <linux-gpio@vger.kernel.org>; Sun,  5 Jun 2022 09:05:29 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id h19so15905582edj.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jun 2022 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MihgLJPqGWUv2Mm+Z5dzUq0+bAHmab72Eghr16YBDK8=;
        b=vD/hFLlV6bJ6oyRv5nGJCRyCrzj2q+/nB3w/WgWFNvCZP4MwYHQghUeowh2XYy3YFK
         GAwq7M0VeGhfFHk6u2b9IAsnYEWREM0j+wgpa/Qv/J/UT9wUaiprLgL8IznOZVf9fNu8
         EtKZ1xRlXwAD96TJQGbLuEDxIf0/ZQgrc59uq6P0mzopHEy5FXa5eeD/OlvK0APvznCg
         gbXRSqH7BEl6eGD1FfCy9Dx9TTbGHI5bCLtOgxqAj01PTeuYLnEjEbi/P8/ZPPwUG1xR
         hvRMiygfGo1Dhqt3ljBsYloxYcHfAEfj8dlPQTSrCqtmKUGCzW04HbsMBO4kC0sGn4TE
         tImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MihgLJPqGWUv2Mm+Z5dzUq0+bAHmab72Eghr16YBDK8=;
        b=yyg5/HXyoCEI6DUOmNEJtJKV2t98uHU3q8s9+paBRRKDHSEwG4/YjcQeF0mr9tvc04
         qrGgzSfME8JPCqx3LKea2g+/bbLzzokEwqGMwUVidXsCUrWz2K2txcxmyZuUD5yqs/zK
         H8p/Y/rGGobvHayhL8vwWCmG7awlnAZfB+a/wAZD86LEE0mYlUZwXGfWJRdq5gcnaPLN
         9SYx8Y/N2PcuWPySn6jbYsTKh5KnW5pj3C834RF+XNpHilis1uaULAWzbsZO9SgBZ7oe
         0ePSSz7gRFH5geU+5LM17ydxN3XvFXgSE2gWqHNc3MRnyrjZlPEItpgnVgKCxhZ5N+IE
         DKfw==
X-Gm-Message-State: AOAM5321z2UchS/bnnJa/A0IH5DIDXro/3utM6so2/duysiKWqoE2Ax0
        tUftnxvlxkc6V5ayM8t+oyh4L2mFotKRbA==
X-Google-Smtp-Source: ABdhPJzIhJtGu/fOWbLW7TYiSAdZYv7cPEN8RQTv9Z4yQ3kyurITI6VDd+AHy68NRXU6Aukx2Y6GQQ==
X-Received: by 2002:aa7:d295:0:b0:42d:e371:ded2 with SMTP id w21-20020aa7d295000000b0042de371ded2mr22192322edq.336.1654445127698;
        Sun, 05 Jun 2022 09:05:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906805200b0070b7875aa6asm3969963ejw.166.2022.06.05.09.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:05:27 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 2/8] ARM: dts: s3c64xx: use local header for pinctrl register values
Date:   Sun,  5 Jun 2022 18:05:02 +0200
Message-Id: <20220605160508.134075-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org>
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org>
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

The DTS uses hardware register values directly in pin controller pin
configuration.  These are not some IDs or other abstraction layer but
raw numbers used in the registers.

These numbers were previously put in the bindings header to avoid code
duplication and to provide some context meaning (name), but they do not
fit the purpose of bindings.  It is also quite confusing to use
constants prefixed with Exynos for other SoC, because there is actually
nothing here in common, except the actual value.

Store the constants in a header next to DTS and use them instead of
bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi | 178 ++++++++++++-------------
 arch/arm/boot/dts/s3c64xx-pinctrl.h    |  27 ++++
 2 files changed, 116 insertions(+), 89 deletions(-)
 create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.h

diff --git a/arch/arm/boot/dts/s3c64xx-pinctrl.dtsi b/arch/arm/boot/dts/s3c64xx-pinctrl.dtsi
index 0a3186d57cb5..f53959b7d031 100644
--- a/arch/arm/boot/dts/s3c64xx-pinctrl.dtsi
+++ b/arch/arm/boot/dts/s3c64xx-pinctrl.dtsi
@@ -9,7 +9,7 @@
  * listed as device tree nodes in this file.
  */
 
-#include <dt-bindings/pinctrl/samsung.h>
+#include "s3c64xx-pinctrl.h"
 
 &pinctrl0 {
 	/*
@@ -133,219 +133,219 @@ gpq: gpq-gpio-bank {
 
 	uart0_data: uart0-data-pins {
 		samsung,pins = "gpa-0", "gpa-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	uart0_fctl: uart0-fctl-pins {
 		samsung,pins = "gpa-2", "gpa-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	uart1_data: uart1-data-pins {
 		samsung,pins = "gpa-4", "gpa-5";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	uart1_fctl: uart1-fctl-pins {
 		samsung,pins = "gpa-6", "gpa-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	uart2_data: uart2-data-pins {
 		samsung,pins = "gpb-0", "gpb-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	uart3_data: uart3-data-pins {
 		samsung,pins = "gpb-2", "gpb-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	ext_dma_0: ext-dma-0-pins {
 		samsung,pins = "gpb-0", "gpb-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	ext_dma_1: ext-dma-1-pins {
 		samsung,pins = "gpb-2", "gpb-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	irda_data_0: irda-data-0-pins {
 		samsung,pins = "gpb-0", "gpb-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	irda_data_1: irda-data-1-pins {
 		samsung,pins = "gpb-2", "gpb-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	irda_sdbw: irda-sdbw-pins {
 		samsung,pins = "gpb-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	i2c0_bus: i2c0-bus-pins {
 		samsung,pins = "gpb-5", "gpb-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_UP>;
 	};
 
 	i2c1_bus: i2c1-bus-pins {
 		/* S3C6410-only */
 		samsung,pins = "gpb-2", "gpb-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_6>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_6>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_UP>;
 	};
 
 	spi0_bus: spi0-bus-pins {
 		samsung,pins = "gpc-0", "gpc-1", "gpc-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_UP>;
 	};
 
 	spi0_cs: spi0-cs-pins {
 		samsung,pins = "gpc-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	spi1_bus: spi1-bus-pins {
 		samsung,pins = "gpc-4", "gpc-5", "gpc-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_UP>;
 	};
 
 	spi1_cs: spi1-cs-pins {
 		samsung,pins = "gpc-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd0_cmd: sd0-cmd-pins {
 		samsung,pins = "gpg-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd0_clk: sd0-clk-pins {
 		samsung,pins = "gpg-0";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd0_bus1: sd0-bus1-pins {
 		samsung,pins = "gpg-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd0_bus4: sd0-bus4-pins {
 		samsung,pins = "gpg-2", "gpg-3", "gpg-4", "gpg-5";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd0_cd: sd0-cd-pins {
 		samsung,pins = "gpg-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_UP>;
 	};
 
 	sd1_cmd: sd1-cmd-pins {
 		samsung,pins = "gph-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd1_clk: sd1-clk-pins {
 		samsung,pins = "gph-0";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd1_bus1: sd1-bus1-pins {
 		samsung,pins = "gph-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd1_bus4: sd1-bus4-pins {
 		samsung,pins = "gph-2", "gph-3", "gph-4", "gph-5";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd1_bus8: sd1-bus8-pins {
 		samsung,pins = "gph-2", "gph-3", "gph-4", "gph-5",
 				"gph-6", "gph-7", "gph-8", "gph-9";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd1_cd: sd1-cd-pins {
 		samsung,pins = "gpg-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_UP>;
 	};
 
 	sd2_cmd: sd2-cmd-pins {
 		samsung,pins = "gpc-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd2_clk: sd2-clk-pins {
 		samsung,pins = "gpc-5";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd2_bus1: sd2-bus1-pins {
 		samsung,pins = "gph-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	sd2_bus4: sd2-bus4-pins {
 		samsung,pins = "gph-6", "gph-7", "gph-8", "gph-9";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	i2s0_bus: i2s0-bus-pins {
 		samsung,pins = "gpd-0", "gpd-2", "gpd-3", "gpd-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	i2s0_cdclk: i2s0-cdclk-pins {
 		samsung,pins = "gpd-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	i2s1_bus: i2s1-bus-pins {
 		samsung,pins = "gpe-0", "gpe-2", "gpe-3", "gpe-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	i2s1_cdclk: i2s1-cdclk-pins {
 		samsung,pins = "gpe-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
@@ -353,50 +353,50 @@ i2s2_bus: i2s2-bus-pins {
 		/* S3C6410-only */
 		samsung,pins = "gpc-4", "gpc-5", "gpc-6", "gph-6",
 				"gph-8", "gph-9";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_5>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_5>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	i2s2_cdclk: i2s2-cdclk-pins {
 		/* S3C6410-only */
 		samsung,pins = "gph-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_5>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_5>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	pcm0_bus: pcm0-bus-pins {
 		samsung,pins = "gpd-0", "gpd-2", "gpd-3", "gpd-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	pcm0_extclk: pcm0-extclk-pins {
 		samsung,pins = "gpd-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	pcm1_bus: pcm1-bus-pins {
 		samsung,pins = "gpe-0", "gpe-2", "gpe-3", "gpe-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	pcm1_extclk: pcm1-extclk-pins {
 		samsung,pins = "gpe-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	ac97_bus_0: ac97-bus-0-pins {
 		samsung,pins = "gpd-0", "gpd-1", "gpd-2", "gpd-3", "gpd-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	ac97_bus_1: ac97-bus-1-pins {
 		samsung,pins = "gpe-0", "gpe-1", "gpe-2", "gpe-3", "gpe-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
@@ -404,242 +404,242 @@ cam_port: cam-port-pins {
 		samsung,pins = "gpf-0", "gpf-1", "gpf-2", "gpf-4",
 				"gpf-5", "gpf-6", "gpf-7", "gpf-8",
 				"gpf-9", "gpf-10", "gpf-11", "gpf-12";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	cam_rst: cam-rst-pins {
 		samsung,pins = "gpf-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	cam_field: cam-field-pins {
 		/* S3C6410-only */
 		samsung,pins = "gpb-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	pwm_extclk: pwm-extclk-pins {
 		samsung,pins = "gpf-13";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	pwm0_out: pwm0-out-pins {
 		samsung,pins = "gpf-14";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	pwm1_out: pwm1-out-pins {
 		samsung,pins = "gpf-15";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	clkout0: clkout-0-pins {
 		samsung,pins = "gpf-14";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col0_0: keypad-col0-0-pins {
 		samsung,pins = "gph-0";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col1_0: keypad-col1-0-pins {
 		samsung,pins = "gph-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col2_0: keypad-col2-0-pins {
 		samsung,pins = "gph-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col3_0: keypad-col3-0-pins {
 		samsung,pins = "gph-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col4_0: keypad-col4-0-pins {
 		samsung,pins = "gph-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col5_0: keypad-col5-0-pins {
 		samsung,pins = "gph-5";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col6_0: keypad-col6-0-pins {
 		samsung,pins = "gph-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col7_0: keypad-col7-0-pins {
 		samsung,pins = "gph-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_4>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col0_1: keypad-col0-1-pins {
 		samsung,pins = "gpl-0";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col1_1: keypad-col1-1-pins {
 		samsung,pins = "gpl-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col2_1: keypad-col2-1-pins {
 		samsung,pins = "gpl-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col3_1: keypad-col3-1-pins {
 		samsung,pins = "gpl-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col4_1: keypad-col4-1-pins {
 		samsung,pins = "gpl-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col5_1: keypad-col5-1-pins {
 		samsung,pins = "gpl-5";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col6_1: keypad-col6-1-pins {
 		samsung,pins = "gpl-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_col7_1: keypad-col7-1-pins {
 		samsung,pins = "gpl-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row0_0: keypad-row0-0-pins {
 		samsung,pins = "gpk-8";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row1_0: keypad-row1-0-pins {
 		samsung,pins = "gpk-9";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row2_0: keypad-row2-0-pins {
 		samsung,pins = "gpk-10";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row3_0: keypad-row3-0-pins {
 		samsung,pins = "gpk-11";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row4_0: keypad-row4-0-pins {
 		samsung,pins = "gpk-12";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row5_0: keypad-row5-0-pins {
 		samsung,pins = "gpk-13";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row6_0: keypad-row6-0-pins {
 		samsung,pins = "gpk-14";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row7_0: keypad-row7-0-pins {
 		samsung,pins = "gpk-15";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row0_1: keypad-row0-1-pins {
 		samsung,pins = "gpn-0";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row1_1: keypad-row1-1-pins {
 		samsung,pins = "gpn-1";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row2_1: keypad-row2-1-pins {
 		samsung,pins = "gpn-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row3_1: keypad-row3-1-pins {
 		samsung,pins = "gpn-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row4_1: keypad-row4-1-pins {
 		samsung,pins = "gpn-4";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row5_1: keypad-row5-1-pins {
 		samsung,pins = "gpn-5";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row6_1: keypad-row6-1-pins {
 		samsung,pins = "gpn-6";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	keypad_row7_1: keypad-row7-1-pins {
 		samsung,pins = "gpn-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	lcd_ctrl: lcd-ctrl-pins {
 		samsung,pins = "gpj-8", "gpj-9", "gpj-10", "gpj-11";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
@@ -648,7 +648,7 @@ lcd_data16: lcd-data-width16-pins {
 				"gpi-7", "gpi-10", "gpi-11", "gpi-12",
 				"gpi-13", "gpi-14", "gpi-15", "gpj-3",
 				"gpj-4", "gpj-5", "gpj-6", "gpj-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
@@ -658,7 +658,7 @@ lcd_data18: lcd-data-width18-pins {
 				"gpi-12", "gpi-13", "gpi-14", "gpi-15",
 				"gpj-2", "gpj-3", "gpj-4", "gpj-5",
 				"gpj-6", "gpj-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
@@ -669,14 +669,14 @@ lcd_data24: lcd-data-width24-pins {
 				"gpi-12", "gpi-13", "gpi-14", "gpi-15",
 				"gpj-0", "gpj-1", "gpj-2", "gpj-3",
 				"gpj-4", "gpj-5", "gpj-6", "gpj-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_2>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 
 	hsi_bus: hsi-bus-pins {
 		samsung,pins = "gpk-0", "gpk-1", "gpk-2", "gpk-3",
 				"gpk-4", "gpk-5", "gpk-6", "gpk-7";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-function = <S3C64XX_PIN_FUNC_3>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
 };
diff --git a/arch/arm/boot/dts/s3c64xx-pinctrl.h b/arch/arm/boot/dts/s3c64xx-pinctrl.h
new file mode 100644
index 000000000000..645c591db357
--- /dev/null
+++ b/arch/arm/boot/dts/s3c64xx-pinctrl.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Samsung S3C64xx DTS pinctrl constants
+ *
+ * Copyright (c) 2016 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2022 Linaro Ltd
+ * Author: Krzysztof Kozlowski <krzk@kernel.org>
+ */
+
+#ifndef __DTS_ARM_SAMSUNG_S3C64XX_PINCTRL_H__
+#define __DTS_ARM_SAMSUNG_S3C64XX_PINCTRL_H__
+
+#define S3C64XX_PIN_PULL_NONE		0
+#define S3C64XX_PIN_PULL_DOWN		1
+#define S3C64XX_PIN_PULL_UP		2
+
+#define S3C64XX_PIN_FUNC_INPUT		0
+#define S3C64XX_PIN_FUNC_OUTPUT		1
+#define S3C64XX_PIN_FUNC_2		2
+#define S3C64XX_PIN_FUNC_3		3
+#define S3C64XX_PIN_FUNC_4		4
+#define S3C64XX_PIN_FUNC_5		5
+#define S3C64XX_PIN_FUNC_6		6
+#define S3C64XX_PIN_FUNC_EINT		7
+
+#endif /* __DTS_ARM_SAMSUNG_S3C64XX_PINCTRL_H__ */
-- 
2.34.1

