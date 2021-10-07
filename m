Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C904255A0
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 16:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242127AbhJGOm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 10:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242115AbhJGOmZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 10:42:25 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B362C061746;
        Thu,  7 Oct 2021 07:40:31 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id d9so23677edh.5;
        Thu, 07 Oct 2021 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4fHOScNcCFsZmikDQcNcQQNB0p5GRDb7IlwtypKc8sw=;
        b=Be+NODpBkVchFwQSiBtLXkTSLmVpbF4ZnEVcopoCoPDyQ5JNzG1U5AVAULQplxQp96
         8HS1gGx/xh8e4IjxIsnIZqoOsNvZ+Z2OF7RMqSH8dRuzEeasIySI+kMim2/KiQoQM3qz
         quoXT42EnvSGjAJFwcNZ/I4BjjyuTJxr1kJmF+x9G1oPfml+o7HoxMGpDekFKOdmpZI4
         jwvKIDVKuwJLyO0hYB3u4lYTcJLOO2HX5p7yrtQyZXYO29DVLuDQ9Unt5izN+2Eo3x/f
         5uxLl8fsrhWP65Da0FnZWQc+x2TOh7aYAKcdJ1ZuSuBaCW6H+6SNeskFS2P1cKZBQkCX
         vOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4fHOScNcCFsZmikDQcNcQQNB0p5GRDb7IlwtypKc8sw=;
        b=Ia8T3hX1mSNgLivbf/VqaFz0ZWc0v+9MwXCLAx/zBMN+YtAV5K5mIGtq2ooH5x6WEx
         lTjOF8LVawSXktk9BTCApdzjt+MZU9luHmhwZVjGFqUjDmsvX7n9/OlJNsQo+sS631nS
         CFLO6mZl47bHB2vVfp1q2AoYi9qigEs6PycwSSzQHWXAV5cYKgNoXJQzFpfsukUT078/
         5YGVLQTJaCEXeLK+rNS2IlEpSbXh4UNtCj/PkIKjmtZdkg2fE+p7jFx6BGDoKdJL4aaR
         RmAjmOEz4PwLtEmLPgI6PbjXh7sWGCFv/BZ0O5Gys2+SS5IY4n5e8fAl8pVxTufUFEvE
         8U6Q==
X-Gm-Message-State: AOAM5326Go0oCO7BAmJ5qDg4Hqs/OY524kUbB9kq1Tjf8/a8VoL0zDhv
        7iW7OcE4ofXxTjoWu3Z9sZ0=
X-Google-Smtp-Source: ABdhPJwGqQ/Q2npScyIooUkehMQZskJS/NtMKzKuhaxglwg1BQ/zhWzkgQZ18BCwWI+CgIs2SjATLQ==
X-Received: by 2002:a50:9d44:: with SMTP id j4mr6899339edk.173.1633617629774;
        Thu, 07 Oct 2021 07:40:29 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id 21sm10086523ejv.54.2021.10.07.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:40:29 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: rockchip: change gpio nodenames
Date:   Thu,  7 Oct 2021 16:40:19 +0200
Message-Id: <20211007144019.7461-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211007144019.7461-1-jbx6244@gmail.com>
References: <20211007144019.7461-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently all gpio nodenames are sort of identical to there label.
Nodenames should be of a generic type, so change them all.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi   |  8 ++++----
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 10 +++++-----
 arch/arm64/boot/dts/rockchip/rk3328.dtsi |  8 ++++----
 arch/arm64/boot/dts/rockchip/rk3368.dtsi |  8 ++++----
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 +++++-----
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 64f643145..17a64c3f0 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1297,7 +1297,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff040000 {
+		gpio0: gpio@ff040000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff040000 0x0 0x100>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -1309,7 +1309,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@ff250000 {
+		gpio1: gpio@ff250000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff250000 0x0 0x100>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -1321,7 +1321,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@ff260000 {
+		gpio2: gpio@ff260000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff260000 0x0 0x100>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
@@ -1333,7 +1333,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@ff270000 {
+		gpio3: gpio@ff270000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff270000 0x0 0x100>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index ce6f4a28d..cec6d179b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -790,7 +790,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff220000 {
+		gpio0: gpio@ff220000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff220000 0x0 0x100>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -801,7 +801,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@ff230000 {
+		gpio1: gpio@ff230000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff230000 0x0 0x100>;
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
@@ -812,7 +812,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@ff240000 {
+		gpio2: gpio@ff240000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff240000 0x0 0x100>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -823,7 +823,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@ff250000 {
+		gpio3: gpio@ff250000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff250000 0x0 0x100>;
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
@@ -834,7 +834,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio4: gpio4@ff260000 {
+		gpio4: gpio@ff260000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff260000 0x0 0x100>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 5b2020590..6edb1a537 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -1014,7 +1014,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff210000 {
+		gpio0: gpio@ff210000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff210000 0x0 0x100>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
@@ -1027,7 +1027,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@ff220000 {
+		gpio1: gpio@ff220000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff220000 0x0 0x100>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
@@ -1040,7 +1040,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@ff230000 {
+		gpio2: gpio@ff230000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff230000 0x0 0x100>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
@@ -1053,7 +1053,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@ff240000 {
+		gpio3: gpio@ff240000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff240000 0x0 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 4217897cd..ef6847014 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -797,7 +797,7 @@
 		#size-cells = <0x2>;
 		ranges;
 
-		gpio0: gpio0@ff750000 {
+		gpio0: gpio@ff750000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff750000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO0>;
@@ -810,7 +810,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio1: gpio1@ff780000 {
+		gpio1: gpio@ff780000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff780000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO1>;
@@ -823,7 +823,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio2: gpio2@ff790000 {
+		gpio2: gpio@ff790000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff790000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO2>;
@@ -836,7 +836,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio3: gpio3@ff7a0000 {
+		gpio3: gpio@ff7a0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7a0000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO3>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 44def886b..577c02047 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1978,7 +1978,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff720000 {
+		gpio0: gpio@ff720000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff720000 0x0 0x100>;
 			clocks = <&pmucru PCLK_GPIO0_PMU>;
@@ -1991,7 +1991,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio1: gpio1@ff730000 {
+		gpio1: gpio@ff730000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff730000 0x0 0x100>;
 			clocks = <&pmucru PCLK_GPIO1_PMU>;
@@ -2004,7 +2004,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio2: gpio2@ff780000 {
+		gpio2: gpio@ff780000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff780000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO2>;
@@ -2017,7 +2017,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio3: gpio3@ff788000 {
+		gpio3: gpio@ff788000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff788000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO3>;
@@ -2030,7 +2030,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio4: gpio4@ff790000 {
+		gpio4: gpio@ff790000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff790000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO4>;
-- 
2.20.1

