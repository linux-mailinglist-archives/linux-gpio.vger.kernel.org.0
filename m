Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7399E72041C
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 16:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbjFBOO4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 10:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234948AbjFBOOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 10:14:55 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325661A6;
        Fri,  2 Jun 2023 07:14:54 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51640b9ed95so636271a12.2;
        Fri, 02 Jun 2023 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685715292; x=1688307292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Mq4zTWNZxgXmn77g79M7jiTcegyvnCqH1d/BABQRw=;
        b=MdpnURFfo2xSF+LNcUy3EATrFiAxtU0Ahw+t6ngyOgs82v8O43y1D2rkwPxJPRNNNO
         qm8FUF4k24oI2ns4mhAFnHUJgjqKhsPZejHQFRhPByrTXebetE0Lcfdxsch0usfXjLU5
         MO0XhzLM+xS0rNlXnNLz+n5LX6DeVjrcCKq4EunC5uTNVFtG+JO7DFNeIxvLdFTcnF+r
         C7MzPymNYRyLQF1rlvogwFB0mNPJyuhZu8+ni5/Z7J6fbKkOLnaJ/t41T/ws93VwEk6E
         6oxyPBecocZ51JQxPQ32xZEJ8L1UYpKQXPHR4R8VlUedcGy60bMjOOXF03oeBuWgTpkE
         rQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685715292; x=1688307292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9Mq4zTWNZxgXmn77g79M7jiTcegyvnCqH1d/BABQRw=;
        b=N+arcyFiQZNJhs9o1/Aryzv/6WVyrmi1yQhzWHcdrA+0IefwyZo7QZ7mECFIBgvXBC
         KqTkIicYYyxp3Ou/rblAVzstnzkoJEzW6oDUDm+BKk7vN+PsT1PtQ9Y1UNPNrOkITZ5O
         hKKuqqVHcw21J78sT6xrjOZnmkyOfnuDWrAcPBcFs+bEjv4hNh2mbBQAp97mJ2mTDZTm
         MhYlYUjcR6qCCaJdwRH5W7ubY5F7e0xSNXEAx5IdphUXJCGMgUaxkavvD5mQQDNFFRKh
         r4YjSJvhhutK/X/ZCxy4NyiKi4NOTzNZk9PLJG70fdWcpt3UE668zpAVfgeojdicixkL
         DDzw==
X-Gm-Message-State: AC+VfDwqqAeC4PuT4RL130MATGrYAMWo6GWhsYsSrZFN72dN4Na4070A
        dKpSOqqhTKBfZ0mY1A6EUMM=
X-Google-Smtp-Source: ACHHUZ6RinDs3iE3gaXYXQ41Xcx4tyV6SOb7xP+HOV0ILLllQhHtK2pudfDmd6ipafJsmZ/CO4EhUA==
X-Received: by 2002:aa7:c904:0:b0:510:db93:f034 with SMTP id b4-20020aa7c904000000b00510db93f034mr2127459edt.36.1685715292657;
        Fri, 02 Jun 2023 07:14:52 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7d919000000b005163008c6b7sm729828edr.27.2023.06.02.07.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:14:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: tegra: Add Tegra234 pin controllers
Date:   Fri,  2 Jun 2023 16:14:45 +0200
Message-Id: <20230602141445.3012550-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602141445.3012550-1-thierry.reding@gmail.com>
References: <20230602141445.3012550-1-thierry.reding@gmail.com>
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

