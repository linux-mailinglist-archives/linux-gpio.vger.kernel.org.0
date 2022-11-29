Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A104563B800
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 03:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235239AbiK2CeW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 21:34:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbiK2CeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 21:34:11 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596A9421B0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:10 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id b2so14225236eja.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GylWv8dDUhA43mvLSIaB6C4Oy4jyZ7+vGJ/Fsw+O6A=;
        b=0m6ouxXw30oIxgRwgkPo6CeHsm2CLaN1oSS8RgoHzFTHSmFM+QcNJX9b5Iltq9nX7H
         cHRMOO0mzso4wPyjWuZbtB+LrGId1phqwBtFQV2MDd6gywKVrletV3RiYjj73uW/LOh8
         yGYyFJrlpqWHXOfZQ/sckRPJpwRoQQGS8xl2hZo/CPyG71xdROgL+XBDHsU/HPWewRgP
         D2ecAUrlMpWT2G7A2cxmgL2wb1gZO2UWiXmQrWI/6hKna/4xofs6gRoxkmEezPBKDjg2
         Ec1FzbRFuuxfpYU5c6wHJYbtGXQQvFeL8oZbHtH/6wlQzheQylfWgCXax0gXkfCkRc+V
         agdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GylWv8dDUhA43mvLSIaB6C4Oy4jyZ7+vGJ/Fsw+O6A=;
        b=70HyWPNjfSBFAS+atf8+z7olCYun9v9ENhKpHR76pBq7mWT3NkYrFKmo5CfJCzIvA/
         HQX95Zzi3IzpeOpJqJsAGA7r9gqF3HbHlETZb0NPVvqSpOH71wNrE/QCmh7LkfGVFfq3
         ToR8ZepnMeJoSxqkwFWu9yn0UyPY/v11JU4R50gpT/IPHhao0Kj3mgmlROuVgnyhNkn2
         Moj/TBUTGYy/jL/y4GeFJpQnvmsLv98cnuSt9wnVamFNdRGAf58Rwy9op/rB5nKrrqyT
         AFcOo2lEbAEz3skx5cqzkGd3Sm1nE+S2505X062hjLnuy63PU+d3Um903ITZ/EfjtpCN
         KLWQ==
X-Gm-Message-State: ANoB5pk6Cx0BSK6zAKL4842Vorj/PjSTxWwjM6VMJYtN/dONLifFS3gp
        cR/bn7ENTEsq1NgCmq4bHYyfVA==
X-Google-Smtp-Source: AA0mqf5dNW9VEmEdHrazpTchJx5yo9e4tUL2Lviv2XCBayhBYwcC0BZ3jGo9WYO2bpTIIPeJczirWg==
X-Received: by 2002:a17:907:9854:b0:7bc:30e0:6bea with SMTP id jj20-20020a170907985400b007bc30e06beamr17870029ejc.49.1669689249990;
        Mon, 28 Nov 2022 18:34:09 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:09 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH v3 7/7] ARM: dts: stm32: Remove the pins-are-numbered property
Date:   Tue, 29 Nov 2022 03:34:01 +0100
Message-Id: <20221129023401.278780-8-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the pins-are-numbered property from STM32 DeviceTrees

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 1 -
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 1 -
 arch/arm/boot/dts/stm32h743.dtsi       | 1 -
 arch/arm/boot/dts/stm32mp131.dtsi      | 1 -
 arch/arm/boot/dts/stm32mp151.dtsi      | 2 --
 5 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 500bcc302d422..4523c63475e4c 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -51,7 +51,6 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
index 8f37aefa73150..c8e6c52fb248e 100644
--- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
@@ -15,7 +15,6 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 28e3deb20e1e1..f30796f7adf36 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -588,7 +588,6 @@ pinctrl: pinctrl@58020000 {
 			ranges = <0 0x58020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@58020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 2a9b3a5bba830..adaee0f9e1263 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -549,7 +549,6 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 5491b6c4dec20..4e437d3f2ed66 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1660,7 +1660,6 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0xa400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1789,7 +1788,6 @@ pinctrl_z: pinctrl@54004000 {
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-z-pinctrl";
 			ranges = <0 0x54004000 0x400>;
-			pins-are-numbered;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
 
-- 
2.38.1

