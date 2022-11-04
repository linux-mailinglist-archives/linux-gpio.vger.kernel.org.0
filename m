Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FA56199BB
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 15:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbiKDO0u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 10:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiKDO0N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 10:26:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15485303D5;
        Fri,  4 Nov 2022 07:23:58 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id sc25so13603415ejc.12;
        Fri, 04 Nov 2022 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSGWQNBva4Wvh1YdEHAxVdvountACwrryqYETg34M24=;
        b=CSx5f+vZIodAXw+Nl0tL3xoyvS6ZOWFXdvWl4fRH7fkXZ2y0XwCt76V+t3jiMe4052
         RFqC872wVk0/JAP+axNzEyf8//hQajDB/qdpfrgR1sXZLpxO//S66bRrWNoGUKnWObLW
         BPIE7kfIST3BL8rABkX1L/HP2QlIKW/i/gSoEjEti1+b32NPgvuw6VAAVHtkMaqnTNG5
         pFfMj2MKVt0NcpHqo/4g/iWw7g9nymt1NPbCRzdb5BgB3uCDXR7eBVeemEjmXXeJtQQa
         CHnxkg8/ozD+wkVLC8gVz67m1y54PXVILSUseOz8zMgrNtuhbm6DfZPZvfXTQSfmp8XQ
         UgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSGWQNBva4Wvh1YdEHAxVdvountACwrryqYETg34M24=;
        b=w3IXsTAP8k7G5ujPgnVy8wWSY/WDmsJkAB2Kao5Vqb2Ozll66W7xyu4ptOW3M93Lkf
         vcfa3czKI8At9JdGSU4ybQSj6M5klk3t/b4uwCet9BrGuXCI2JsNRdrWPqw9p5MbdrLb
         IZM8CAvv4b+Ra5iYN1BSb10QNf63fhnu2oewRjAj6I+NFGjDUZmSoq0A/0quu0oDPV10
         FJU/5oNdy2DrPzSuWeAH8kkkwyzUSK/X8d1e3KOJpCOHL5DFKVbWW/PE8JG50aE8ZOYw
         ldu3Akg0e4aQzXu8lOW/Oq3GYptgypIosAQxPy+Dx8ZIjSTaYnvlhaEC7oMM8KDsmvAH
         7oKA==
X-Gm-Message-State: ACrzQf0Mk9OZwmhlTlYaBlrqvCof7ccX9MBZp9F7UQdkmE4c3LtQrONl
        mFSNM2Eq/Yiq96Wa8gGp4nuakiEQMdo=
X-Google-Smtp-Source: AMsMyM5BNiMCqLRpRTsmUjU8lomf6ELmQrZDXb4YOtjUr3GwNu5HpoUPgrCy6KSqewGBNVHyqkwpmA==
X-Received: by 2002:a17:907:a0c7:b0:7ad:dc65:bf8e with SMTP id hw7-20020a170907a0c700b007addc65bf8emr23965986ejc.133.1667571837203;
        Fri, 04 Nov 2022 07:23:57 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qq18-20020a17090720d200b007aa9156f7e9sm1869631ejb.32.2022.11.04.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:23:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: tegra: Separate AON pinmux from main pinmux on Tegra194
Date:   Fri,  4 Nov 2022 15:23:45 +0100
Message-Id: <20221104142345.1562750-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142345.1562750-1-thierry.reding@gmail.com>
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
index 28740c014f1d..6829ee8b50ee 100644
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
@@ -1660,6 +1659,14 @@ gpio_aon: gpio@c2f0000 {
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
2.38.1

