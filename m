Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A90E3D8FCF
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbhG1Nz6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236327AbhG1Nz5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:55:57 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44FFC061764;
        Wed, 28 Jul 2021 06:55:55 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id f22so2230571qke.10;
        Wed, 28 Jul 2021 06:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S56htb9vVkDrFmzApk71DTCJizGCv0+IZp82FWSdz/g=;
        b=E8cuFmXqjHfLllE6yR7g1E34dMT/0iPJZw6DLYh6lm8kZm7xOuai4TWh4DiCAfglld
         OnkhoLtHVQ8XVSiuL/R44vrYuoaW3wS8lMUnEpQvQfKyx7afA/Up7DR5NvctljZKJw4N
         mN2Nzyls+8dn9LasQQcI13VTAcI69c29GUtW8qh9LIHm9ApYX9X541+w8x9wGMFZvhGG
         Z3Ft6wrgHRbdps4jgahEOwTJ9n/BZ6TtaqSV/yy4Rr4TKansQQIKCPGasrLclgIP//tS
         bw5+DddVYToqrUiyuFnSTI1MmbgNgirAUzId+NDL8UazYC3m0YeJ1rIQtq/kIkZNugG1
         JYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S56htb9vVkDrFmzApk71DTCJizGCv0+IZp82FWSdz/g=;
        b=icTHoF9rzzF+kXLKTik0yqJdQoo5jpudH0ZNukUglyCx0w3l3ykHEWnbqo7cRewPIL
         eJ/AEwn57GqR5I4g0WwubODxeBPvJFq7o9cD6G/I6uD6kPrY5wry9cyW4iLa7rjrvAy7
         if/xuSqEJMNGxJPsN+9mGFMKoUoIEmyQSjq1K+rJgkN5vgmLB2K4bpIg/DfXt0uDWqrP
         jyY4lGSpmZiKjsNJZBkc7ArbWCDI0L50RcJjSd3mmR6L7tjfYkitiyrpwJAajy7Ihl0g
         wCIZJQsxK9/isrRv8EL3qWt8Nqt4tZ2fe7VpuBGDYeOnKpnG5DFFUq8tFVfy+yz6+ha5
         qWOw==
X-Gm-Message-State: AOAM533Q2Q0K2+Km1qapsWlR+5XQcN2pAMoBBNVh7eCISDRouQdDd8rf
        93H/3fQvskSaYxilJ6Cgsec=
X-Google-Smtp-Source: ABdhPJwP81NA2r+kZGDYStvsEpwYxM6uFEq0jWx5yFJXsrySE3baKz0WlLBBJ3XVPEOBZmyn58D0XQ==
X-Received: by 2002:a05:620a:537:: with SMTP id h23mr7409375qkh.361.1627480554839;
        Wed, 28 Jul 2021 06:55:54 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:54 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 3/9] arm64: dts: rockchip: add rk356x gpio debounce clocks
Date:   Wed, 28 Jul 2021 09:55:28 -0400
Message-Id: <20210728135534.703028-4-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The rk356x added a debounce clock to the gpio devices. This clock is
necessary for the new v2 gpio driver to bind.
Add the clocks to the rk356x device tree.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index f7ecdfd66f86..c2aa7aeec58d 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -750,7 +750,7 @@ gpio0: gpio@fdd60000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xfdd60000 0x0 0x100>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pmucru PCLK_GPIO0>;
+			clocks = <&pmucru PCLK_GPIO0>, <&pmucru DBCLK_GPIO0>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -761,7 +761,7 @@ gpio1: gpio@fe740000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xfe740000 0x0 0x100>;
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO1>;
+			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -772,7 +772,7 @@ gpio2: gpio@fe750000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xfe750000 0x0 0x100>;
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO2>;
+			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -783,7 +783,7 @@ gpio3: gpio@fe760000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xfe760000 0x0 0x100>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO3>;
+			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -794,7 +794,7 @@ gpio4: gpio@fe770000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xfe770000 0x0 0x100>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cru PCLK_GPIO4>;
+			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.25.1

