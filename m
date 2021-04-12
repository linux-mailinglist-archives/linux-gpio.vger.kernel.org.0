Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0787935D33C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 00:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241196AbhDLWgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 18:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240461AbhDLWgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 18:36:49 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CFCC061756;
        Mon, 12 Apr 2021 15:36:28 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z1so16993458edb.8;
        Mon, 12 Apr 2021 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sHokrbjxUk9CxNu5Bo4VP4hyr5zpK6a3pydEeIAAa54=;
        b=p4lbONYRgUNkJpbLpLAGpYQoLZc5D3Ovfx7cQn5XuHlF5BizOnbL116S2dHoSfXCVA
         5qbDfqqGiW5E4OT0KXyaFGbo6UsuYROyC1EuFyKvJ/MI55cizEoCB8dfvKeXhE64lsgK
         zAGSlhMMdDNGUyKNlDQ+RuftsrTvVlUYzf1Tjl/8rDgPn5oS67BmF2YWVbXEYLXg3Cq0
         VkjMAUT3omqHqnt5ZANhQjJzkVSeOJyeA5PW0q8dxX8gctxlk4d7sh3upBEzb8tn6w9s
         dQNA+/OPmm3NaV4ZIpfoCTKf8+nZQaGgLgf0u/nzJ18yAYfgPS6spZTaXyOGi1B65WE1
         mbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sHokrbjxUk9CxNu5Bo4VP4hyr5zpK6a3pydEeIAAa54=;
        b=FcNSGFBYJQHBGYTnNRgifr5uy3qobLDVQfS6VNnkHqJLiTsK/V0W+ndQKXCdadDSst
         Z6q2U5UYq30G+I/6B2uNGkzzZDFxHkxhYS0FDte30xC9/b5r2dvyZpDUBhIcear4p9tO
         T1B1VgS1cLwyA865lMYW/TA3MXUxfrRWGaFeJam66j1Tot6Er5Id07SrYHWdu8GxFlJE
         wUZ5lgtcP9fDyMQjp/fuOoFEA75sGrpKqpXsL06+jtEYntKkEVQrdGEYag77Pbc0kXcz
         Qe+MBnM1+jwIOyvmjQ8juu7svDUoP7xvp1dlWhcAosePf3oG46ozWLmtpgX1bCaI/HW6
         RSrg==
X-Gm-Message-State: AOAM531VUHz3P5sUtYcv8oJs0MKN7/fTwQsBPXOzlGnb/HnaVumEQAFu
        BxtczvjwPcFfdwdl82Zo3UE=
X-Google-Smtp-Source: ABdhPJzHgjy+ifN0vwI3pJFkvTjmxNibGyGRx51L8DgmJ88HqRvNQViWHduWoQ3jKle/lI/WI8mqWg==
X-Received: by 2002:a50:9fa1:: with SMTP id c30mr22772945edf.66.1618266987566;
        Mon, 12 Apr 2021 15:36:27 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id d10sm7817209edp.77.2021.04.12.15.36.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 15:36:27 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: rockchip: change gpio nodenames
Date:   Tue, 13 Apr 2021 00:36:17 +0200
Message-Id: <20210412223617.8634-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210412223617.8634-1-jbx6244@gmail.com>
References: <20210412223617.8634-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently all gpio nodenames are sort of identical to there label.
Nodenames should be of a generic type, so change them all.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi   |  8 ++++----
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 10 +++++-----
 arch/arm64/boot/dts/rockchip/rk3328.dtsi |  8 ++++----
 arch/arm64/boot/dts/rockchip/rk3368.dtsi |  8 ++++----
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 +++++-----
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 939440015..96924e05a 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1247,7 +1247,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff040000 {
+		gpio0: gpio@ff040000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff040000 0x0 0x100>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -1259,7 +1259,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@ff250000 {
+		gpio1: gpio@ff250000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff250000 0x0 0x100>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -1271,7 +1271,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@ff260000 {
+		gpio2: gpio@ff260000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff260000 0x0 0x100>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
@@ -1283,7 +1283,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@ff270000 {
+		gpio3: gpio@ff270000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff270000 0x0 0x100>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 00844a0e0..ba7dee2e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -688,7 +688,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff220000 {
+		gpio0: gpio@ff220000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff220000 0x0 0x100>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -699,7 +699,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@ff230000 {
+		gpio1: gpio@ff230000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff230000 0x0 0x100>;
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
@@ -710,7 +710,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@ff240000 {
+		gpio2: gpio@ff240000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff240000 0x0 0x100>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -721,7 +721,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@ff250000 {
+		gpio3: gpio@ff250000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff250000 0x0 0x100>;
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
@@ -732,7 +732,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio4: gpio4@ff260000 {
+		gpio4: gpio@ff260000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff260000 0x0 0x100>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index c2ca358c7..858d52e2d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -1019,7 +1019,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff210000 {
+		gpio0: gpio@ff210000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff210000 0x0 0x100>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
@@ -1032,7 +1032,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@ff220000 {
+		gpio1: gpio@ff220000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff220000 0x0 0x100>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
@@ -1045,7 +1045,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@ff230000 {
+		gpio2: gpio@ff230000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff230000 0x0 0x100>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
@@ -1058,7 +1058,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@ff240000 {
+		gpio3: gpio@ff240000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff240000 0x0 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 7832e26a3..8ae10c434 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -803,7 +803,7 @@
 		#size-cells = <0x2>;
 		ranges;
 
-		gpio0: gpio0@ff750000 {
+		gpio0: gpio@ff750000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff750000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO0>;
@@ -816,7 +816,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio1: gpio1@ff780000 {
+		gpio1: gpio@ff780000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff780000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO1>;
@@ -829,7 +829,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio2: gpio2@ff790000 {
+		gpio2: gpio@ff790000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff790000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO2>;
@@ -842,7 +842,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio3: gpio3@ff7a0000 {
+		gpio3: gpio@ff7a0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7a0000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO3>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 6221b027e..c97a25c70 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1941,7 +1941,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff720000 {
+		gpio0: gpio@ff720000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff720000 0x0 0x100>;
 			clocks = <&pmucru PCLK_GPIO0_PMU>;
@@ -1954,7 +1954,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio1: gpio1@ff730000 {
+		gpio1: gpio@ff730000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff730000 0x0 0x100>;
 			clocks = <&pmucru PCLK_GPIO1_PMU>;
@@ -1967,7 +1967,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio2: gpio2@ff780000 {
+		gpio2: gpio@ff780000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff780000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO2>;
@@ -1980,7 +1980,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio3: gpio3@ff788000 {
+		gpio3: gpio@ff788000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff788000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO3>;
@@ -1993,7 +1993,7 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		gpio4: gpio4@ff790000 {
+		gpio4: gpio@ff790000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff790000 0x0 0x100>;
 			clocks = <&cru PCLK_GPIO4>;
-- 
2.11.0

