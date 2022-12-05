Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3DF6429EC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbiLENxB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbiLENwP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:52:15 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA9511C22
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:52:12 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id ay8-20020a05600c1e0800b003d0808d2826so5918780wmb.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=wsgdxTuhatf3mw1TVkJQeXcqLfocJhxhj74YDevQF9YeRF3dfceSwSOa7IojVzyb7L
         B5YvTchNNBM8QERb8Z7fZ00Jr+oRZR0N/NuKpDCFANoDerZjz9ZdYHt82uWhTHHbAOCQ
         vXVW0fi+9ldGrDVOsSuL8bIFpJXG8/m/TfObyMHBcJ8DmBJ1sTkaZf1o5lOuo3ghvqsi
         ZPcAfUwmTSACNF3BiQwmC2Prh5kU/b4NT3DCQd1ANXM4wBVZdEuaevnv+aFsnxuVEiWy
         ebRpiQCTG3e/og2yEhXh3KrXQQVDdzNur2s96I56dkMdMoZRBpPh53XbFOQXhbNr8WYf
         clNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
        b=RKRhescFoew95tVB8RZIIugBPJXgnBv4/9fepHQMp3e5KVNJNQEuxOcRPoCxkhvPR3
         gaHjzfxIUYhM6Pat/A94Itp0HfBWppjGvH0fmQFm9UwBWJpu5dH34wb7vo5RStmv06Gb
         p1cHF7xQwV0riuNtAOxUx+QQdaXRtf+uOahrmdawX5kiLZLxtIeLBwMYTOS3dSnFe9TH
         EZYy8PXxTpWPqcS1sREQgWGlWnUji7UA1KJrUiWy6FZAKHKBTFvc47Kclm1Ha2irPbUj
         TLxRwu0QGENrAgZ6Cdox8/EmPlNwPZiQdmBfjZ6Hq+0d3Xbx2OOWyhuLQ6Mn05mEWvQG
         EqBw==
X-Gm-Message-State: ANoB5pksgxVNwg2gKp/8gXo9hmghuWW2ZTW1oMqbOtcS29RZ/4bmWTaN
        LwsecFxLxCv+klNVWPDC6XbDkw==
X-Google-Smtp-Source: AA0mqf52PvQXYzT5vaPuTGBXNCz91Q2KV0iCLC9fNEbt3klSJRTAtpx67PD5xqTxQIpCyNL0zdkknw==
X-Received: by 2002:a05:600c:350a:b0:3d0:74be:a059 with SMTP id h10-20020a05600c350a00b003d074bea059mr16204523wmq.177.1670248330589;
        Mon, 05 Dec 2022 05:52:10 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:52:10 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/3] ARM: dts: mediatek: Remove pins-are-numbered property
Date:   Mon,  5 Dec 2022 14:51:57 +0100
Message-Id: <20221205135158.1842465-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205135158.1842465-1-bero@baylibre.com>
References: <20221205135158.1842465-1-bero@baylibre.com>
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

Remove the unnecessary pins-are-numbered property from
Mediatek ARM DeviceTrees

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 1 -
 arch/arm/boot/dts/mt7623.dtsi | 1 -
 arch/arm/boot/dts/mt8135.dtsi | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index b8eba3ba153c2..0a0fe8c5a4059 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -178,7 +178,6 @@ pio: pinctrl@1000b000 {
 		compatible = "mediatek,mt2701-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 25d31e40a5535..11379c3e6b4ca 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -253,7 +253,6 @@ pio: pinctrl@10005000 {
 		compatible = "mediatek,mt7623-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-		pins-are-numbered;
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index a031b36363187..0f291ad22d3af 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -152,7 +152,6 @@ pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8135-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;
-			pins-are-numbered;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.38.1

