Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF0663B7FB
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 03:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbiK2CeN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 21:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiK2CeK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 21:34:10 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754A4421BD
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:09 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id b2so14225102eja.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
        b=iILHEhBDJeI6roPJ+yKBiU7KMlVgcArUjotoW4AxLsih2mo1ghMrCxS09gQE+29dmU
         +RbUeMblWHDQ89WPsSfHBHa1Cg/FPw/y93DB0GeFVIREpHEdfiWBQEg/+q23ll+jonTt
         VLlqquvqbMNJI0FrjDlhm9d2ZSHuec7UkUKFF+5CYgB3MR/ZZzyGqt2XvmvQ/9d9cg+y
         krG7lMW9sr2YN8MwJeTgyXazold705MzoT1+u6hzff+Y6niIK3qC0Ohciys7rc/U/aeM
         dLfjnSw3GDkQA7ntnFduQxUaOuGK1fEpo1q7ejXYnM0tDIukVJ/lrxbEb+YErEcXr3Tl
         KloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
        b=Sd54yX5MpQOhsNRZMfsCQWj75pBjdO9osoUvWDGZQNd8bQ81yM7U5taN3gvWp6abeU
         tAK9aOATks6AjjIYR8Bx6UoSKwRE3mlARZ9vB4qagN6V5RUcHvNQ2TR1iuSkygg3iQsq
         usDspuYS8Ucxt6T9wp9YODUxaLB4sTA+WW8wgM9hop4DLzb8bFrjR8rMYeOwFfpOp6xk
         q538NqmKKWpOUqhfJXNVHuA5sS1EgulJHMwV4hpJsD0FLBKqZ3Fnov/RwfCLUhwD0vCs
         ccPD+94kiIFMqviZQZfqZd74zrQWJ23tsh7UgK4xGDDSXc47qdt7oL1ksrLL/gBfHCIN
         8ymA==
X-Gm-Message-State: ANoB5pmu0lpNTpip/BDW8Pbk41dVP4EX1VEftiiZo/yP7wDiU7gIj7SV
        HMJufVY52DTARNPMhEgDgxXN9Q==
X-Google-Smtp-Source: AA0mqf7yhvrPVC0kUAVz2nWRfivf1QRifx3vYbKDMiHnNxce2TQlEbllXiOrJ3+ZNhog43flqf5Omg==
X-Received: by 2002:a17:906:cf85:b0:78d:b66d:749f with SMTP id um5-20020a170906cf8500b0078db66d749fmr43970741ejb.566.1669689248073;
        Mon, 28 Nov 2022 18:34:08 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:07 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH v3 5/7] arm64: dts: mediatek: Remove pins-are-numbered property
Date:   Tue, 29 Nov 2022 03:33:59 +0100
Message-Id: <20221129023401.278780-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the unnecessary pins-are-numbered property from
arm64 Mediatek DeviceTrees

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi    | 1 -
 arch/arm64/boot/dts/mediatek/mt8167.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi     | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 92212cddd37e6..879dff24dcd3b 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -270,7 +270,6 @@ pio: pinctrl@1000b000 {
 		compatible = "mediatek,mt2712-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index fbe1a1128cc6a..6a54315cf6502 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -117,7 +117,6 @@ pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822b..18e214464a2d3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -929,7 +929,6 @@ clock: mt6397clock {
 
 		pio6397: pinctrl {
 			compatible = "mediatek,mt6397-pinctrl";
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7640b5158ff9d..c47d7d900f283 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -375,7 +375,6 @@ pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8173-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index d1b67c82d7617..118025263a29b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -229,7 +229,6 @@ pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8516-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.38.1

