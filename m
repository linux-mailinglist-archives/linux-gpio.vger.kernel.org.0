Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02534722BA6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 17:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235087AbjFEPnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 11:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbjFEPna (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 11:43:30 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AB6171E;
        Mon,  5 Jun 2023 08:43:10 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1a7e31dcaso52811041fa.2;
        Mon, 05 Jun 2023 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685979758; x=1688571758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Mq4zTWNZxgXmn77g79M7jiTcegyvnCqH1d/BABQRw=;
        b=aQX9HeNtpVpdgQ5rkNy9e/6N27UtHbD1pztf3G5AN6CbHwTfHqydU5sPtRCg1rsd4z
         /hJNEGtUAe2arMvipUml6/O2Y9k2oL5BN7WQtISetrK8aNYY1z+TVGXkPv+WQgGmY3Tz
         P70wNbzF/J5ZkQi+UnsvLRA4EywEkHb6HqLPrJZEcIkyOqFDr0PYutv9sbVDzIgkkURm
         8wjc0OsQ+IeYQwUi4k+otpWxE39ZwsgZaI93dcjYopdSKxH+YotxeUIdso8fEonjKOE4
         pvfn8uIg2wLWneQXwCrvCHAz4FPgvOL8c33+mbrOHTTCsEsquZ5kag7H2aoqolzW2gFA
         w7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979758; x=1688571758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9Mq4zTWNZxgXmn77g79M7jiTcegyvnCqH1d/BABQRw=;
        b=gSkFnnjhqGB7p+KG5zewC1I0dus0FCQWTwzaq/mrLnKS/BmmW7jTR9A+Ulf+8Scf9e
         DI9NAUxoFEK+UTDRuUymb7Pi/veZCys4HwvFij3rBAtHK0ajehm1T4M79GuiA2m9rUmG
         1teb1UEZYulqrU0Nonoytfo1wV73j8ONvi+J4ZGb0zo1U9Ohl81xWtj+7j1XGlWgPTtR
         DrEX7bxpjb9aiIcwlt0Dc1t9OM7jzY1j91j9EmxK7Dt6iUcbJFoSWarywDtY/An4IeUh
         9qmxlgRKpm80baP/YC5ftxuO3fnwTfT7s0lCfkifDtumQfssfuU3dV5TAtE6rpYi0hnN
         itdg==
X-Gm-Message-State: AC+VfDzfs9ZYQeKjLlvmX0SPUnEcyNxKvg5e2aieN2j8CDwRPN5wrvS6
        SCuUfmWlmbcY5gdpeIdJuO4=
X-Google-Smtp-Source: ACHHUZ7uSBvK8+Gq54/3tBpKPjqxsA98DAXoC1lr+6bS+RiMtEsjbD/Dyri+Gt+JQE1vDHfM71o6RA==
X-Received: by 2002:a2e:9d54:0:b0:2b1:bf83:4165 with SMTP id y20-20020a2e9d54000000b002b1bf834165mr3095783ljj.37.1685979758010;
        Mon, 05 Jun 2023 08:42:38 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id sd17-20020a170906ce3100b0095fbb1b72c2sm4400844ejb.63.2023.06.05.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:42:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 3/3] arm64: tegra: Add Tegra234 pin controllers
Date:   Mon,  5 Jun 2023 17:42:30 +0200
Message-Id: <20230605154230.2910847-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605154230.2910847-1-thierry.reding@gmail.com>
References: <20230605154230.2910847-1-thierry.reding@gmail.com>
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

From: Prathamesh Shete <pshete@nvidia.com>

Add the device tree nodes for the MAIN and AON pin controllers found on
the Tegra234 family of SoCs.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- use correct value for #address-cells and #size-cells
- correct gpio-ranges property name

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 133b2d32d19b..9dba05be03d2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -109,6 +109,7 @@ gpio: gpio@2200000 {
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux 0 0 164>;
 		};
 
 		ethernet@2310000 {
@@ -147,6 +148,11 @@ codec@242c000 {
 			status = "disabled";
 		};
 
+		pinmux: pinmux@2430000 {
+			compatible = "nvidia,tegra234-pinmux";
+			reg = <0x0 0x2430000 0x0 0x19100>;
+		};
+
 		gpcdma: dma-controller@2600000 {
 			compatible = "nvidia,tegra234-gpcdma",
 				     "nvidia,tegra186-gpcdma";
@@ -1805,6 +1811,12 @@ gpio_aon: gpio@c2f0000 {
 			interrupt-controller;
 			#gpio-cells = <2>;
 			gpio-controller;
+			gpio-ranges = <&pinmux_aon 0 0 32>;
+		};
+
+		pinmux_aon: pinmux@c300000 {
+			compatible = "nvidia,tegra234-pinmux-aon";
+			reg = <0x0 0xc300000 0x0 0x4000>;
 		};
 
 		pwm4: pwm@c340000 {
-- 
2.40.1

