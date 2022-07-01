Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613FE563692
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 17:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbiGAPFT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 11:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbiGAPFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 11:05:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FC93891;
        Fri,  1 Jul 2022 08:05:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id k20so3277403edj.13;
        Fri, 01 Jul 2022 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y1Tnm4HYwP4g2qoe68Ccl1TiZV75XEWzqvFi/zo/iCs=;
        b=kyY9sDzTRGj2ZuzdW7UngoUaHIuCKOYmmdekJ+uIFO41WnisVGy72655aNSK0Gbuhm
         sP8exo0seQ7uKYHUbvB5TTPYG9VwHF813QCnmLqjcLzTpHfU5Wn7hH0BxnBmBcXlT5V+
         97sbjZmy3QspRPQTbuTomu5RCucwd750aYRlKZt9g1ynprSB/VP6T2pU81wibfnuiipg
         NXmnRitLRaA9Ng8ub+i7P5lOfVLRYCbE6XOiIU3UUtChUej7v6WXfBuUljz8CJiNIyVV
         j82eF33Xdk/IgQe06+8Na6FBXDTxK+MreNMHDPOxQozNdxtqlLlWHE2aDxenrvHqLbus
         pPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y1Tnm4HYwP4g2qoe68Ccl1TiZV75XEWzqvFi/zo/iCs=;
        b=mN/PMpnTuLm6XDumU0DkzAUM9PCaWhxAtIcBD/Qp3PJ4oqF5EnPzmvaKd9+rv84m6l
         kIPgMKeaXAQlCDVCKwHkuy4dyrS2yvGfEtQ7o6mpNuN5UMfaxDwPGWNN7R3QYBH225xO
         PP+SGv7h/s++G7/Dmf/vomPF44T/SRE8/M8UcPsEhwQ4dH2qGJlpSaDL1TABataJjPff
         u23cd2jFL7ExUkPryestobWmT8z6/h+D9QHRI1jgw23OhtW8vZH+kBNB23w8kBmFLtSA
         z6sJkE5E4BCQ81kaG1NK8ciSLMUWHc5uUdvklcJRKOB/Lmu6lhDZHuhtpHLMTRSZgnJQ
         86VA==
X-Gm-Message-State: AJIora/VO6eTN2vSm4so6ilKauHC379y7wcfCaAEmFTFvwfU4SJvvYqD
        kYvKiL14yahcjG4IZ0xJpmvO9CvyW7V+jw==
X-Google-Smtp-Source: AGRyM1sbvRkGO+t935ZKbkJFbUPxzDAdb7Ixp4NCM48OEdVft2cVYhZZnlHnKGlGrSVUFQJ6Q5HJdg==
X-Received: by 2002:a05:6402:2051:b0:435:71b5:b627 with SMTP id bc17-20020a056402205100b0043571b5b627mr19865310edb.267.1656687914219;
        Fri, 01 Jul 2022 08:05:14 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kw24-20020a170907771800b0072a3216c23asm3457362ejc.154.2022.07.01.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 08:05:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 4/4] arm64: tegra: Separate AON pinmux from main pinmux on Tegra194
Date:   Fri,  1 Jul 2022 17:05:01 +0200
Message-Id: <20220701150501.443296-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701150501.443296-1-thierry.reding@gmail.com>
References: <20220701150501.443296-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The registers for the AON pinmux reside in a partition different from
the registers for the main pinmux. Instead of treating them as one and
the same device, split them up so that they are each their own devices.
Also add gpio-ranges properties to the corresponding GPIO controllers
such that the pinmux and GPIO controllers can be paired up properly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 78277b538002..2638e480e7da 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -86,6 +86,7 @@ gpio: gpio@2200000 {
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux 0 0 169>;
 		};
 
 		cbb-noc@2300000 {
@@ -626,9 +627,7 @@ tegra_asrc: asrc@2910000 {
 
 		pinmux: pinmux@2430000 {
 			compatible = "nvidia,tegra194-pinmux";
-			reg = <0x2430000 0x17000>,
-			      <0xc300000 0x4000>;
-
+			reg = <0x2430000 0x17000>;
 			status = "okay";
 
 			pex_rst_c5_out_state: pex_rst_c5_out {
@@ -1638,6 +1637,14 @@ gpio_aon: gpio@c2f0000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			gpio-range = <&pinmux_aon 0 0 30>;
+		};
+
+		pinmux_aon: pinmux@c300000 {
+			compatible = "nvidia,tegra194-pinmux-aon";
+			reg = <0xc300000 0x4000>;
+
+			status = "okay";
 		};
 
 		pwm4: pwm@c340000 {
-- 
2.36.1

