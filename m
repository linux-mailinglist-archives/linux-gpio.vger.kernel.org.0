Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A146429E3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbiLENwU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbiLENwM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:52:12 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3958811A0C
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:52:11 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id n7so8764405wms.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
        b=IKDFAlrDyxXK2EEK+ACFA1JPj32DVH9XgXokFfk+Yxaz7H2tgkE+MwTdD0iWz34gT2
         kGu/7VCPmfBZSD0bSQi1NaquemVdzGnINllybPA3DuggEyxpLkCDportqRPdfaQdHHb5
         8vJnYNRf+kq/YfRdjhkHNSw0AComi83Du6PJCNa80DInUGelaQ5gBo2QoVGV7S9PMFQ2
         EB7xLFbfI4duQ+816dRZz5wuUf3/uwpuN7H8Us3+fwHC8B/5HI5kz5+M7AA+wMlpz6Ai
         Gn6oFyyKp5BXQ4GwQdiFZVWDv6QyBKD6PLBtb0JCCB5Q6XS/BN3XowRQqVOGV7sRNJgO
         R2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
        b=nEVPUA4f41yKJsE3Wb5rx4F0PNeZrj1o3OnWzdHq95TZ48lHSzEeST8FenjM5a/qSL
         3tPJ133b64yav6h1fAGBJxZspS0AJfhK3NCHBlXDFqEZuII949sjAy3ghreEhQgxnJGR
         5L+HPKD77153LrHZ6GDUezv3Qdk6RpvNxAXyrLBmT25jJMlJSnDbh0eJUT2swyLIZ4D0
         N8WOWN5Hb/KdNS2YkrzbrgusSTgmoRZU4Vh2hPoOjgawPvK0Z81Ritu8KxyRXvmBsQhH
         QD5Bw29SEnf5X8q5th3TLd5r3ycv5a/ArJMMeG3ve0+Rcfydt586f5CTENxLxj/SlgSg
         0O4w==
X-Gm-Message-State: ANoB5pmF4oiVIgZCay8Ew3hi8rlz4kxs46s1U+E/W7k9bh4R7C6wAyOV
        c3rgrxDq7lTrdC5TuDPS0lI46g==
X-Google-Smtp-Source: AA0mqf6QY6Tthxm6x2fqOOdM80szIi1eOKD06IVk7s/SIwGmjuxQjE19iKfLT/DaINP5IMUfgk0RLg==
X-Received: by 2002:a05:600c:4e88:b0:3b5:477:1e80 with SMTP id f8-20020a05600c4e8800b003b504771e80mr60778976wmq.200.1670248329707;
        Mon, 05 Dec 2022 05:52:09 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:52:09 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/3] arm64: dts: mediatek: Remove pins-are-numbered property
Date:   Mon,  5 Dec 2022 14:51:56 +0100
Message-Id: <20221205135158.1842465-2-bero@baylibre.com>
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

