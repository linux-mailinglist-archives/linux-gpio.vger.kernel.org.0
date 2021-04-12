Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE6035D33F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 00:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240983AbhDLWgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 18:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240974AbhDLWgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 18:36:49 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886EEC061574;
        Mon, 12 Apr 2021 15:36:27 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id e14so22804799ejz.11;
        Mon, 12 Apr 2021 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lLwjdfFdp3zRi4PK8zglE9mVb84ajZiNMIXRGSeC74w=;
        b=uaj9y2bz5k3eZZGDylatN9ASgJjpPcw5q85e0ub3OKibxRuRcGvih3/tLeXsN82Dej
         Wph9+5cQWRp/Ngja7aUyLwjQqIb71zWzi+tZAbgjFiGeuIKQYMZWALgxj7DNojlRXHh7
         m+4pjZDzv4VwZxns4b8O5KTVLa6cBNv89t5KrNfF7lneR+PSKhLUEpG5Em4YZuHzUGmA
         UfkDNUahociAzdy7EEaQKoo1RB1/lhmi/LuYlVQ+/ck/wz4R7Ktk16BlVncG5Vme3IC/
         Rit6PgJkiZW4FhgM1MPPwqUF99JSMPnIm5n+xRYqRGXvJctbVUCpZJKt5FtZTXaUXfRZ
         D0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lLwjdfFdp3zRi4PK8zglE9mVb84ajZiNMIXRGSeC74w=;
        b=T//pvzydbJYQmsqktNks1zNm3DFPRse9P0Adjz5gzLgdUhThlAU3UOxTPXRL4dQunO
         r7pOZiPKZxS/xSFYiehMFg2FBXk+CpUnB7cGGvXnPzjvYo1g2xn5TNRIW4eBcCHKjCbJ
         BvBMlDXGvRjTswbTxPZ2POvD6kB9ACltvcDhT4zPI6hLPJMinEk5bz4qDQ4q3P2G8G5s
         hpOGByM8raNSIueOGvKTAUn8MbQk+bMBT79/RLc1x2PjVyndesREwrjZW1as/bYCzA2N
         DiLCBYyV9jbMf9gBGSNuCgpAviyTWtzqhIdZ1DOVo28KS7GbCrXoLYn6NsVHWG6AK2F9
         4Lew==
X-Gm-Message-State: AOAM533uQxnd55bqMH2erceXfNywbNMk0I9ZZoc6udD2E8j7d99ptazY
        ibDovK3AmM+5EuJMCfOj+dE=
X-Google-Smtp-Source: ABdhPJxs5rIWJ913wkFrbZmj7COR+OK3FJ6qBQGScfnHbGx7n7mKSA8P/fdMEBLketsfhK7YU1yJgg==
X-Received: by 2002:a17:906:9598:: with SMTP id r24mr26858876ejx.397.1618266986260;
        Mon, 12 Apr 2021 15:36:26 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id d10sm7817209edp.77.2021.04.12.15.36.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 15:36:25 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] ARM: dts: rockchip: change gpio nodenames
Date:   Tue, 13 Apr 2021 00:36:16 +0200
Message-Id: <20210412223617.8634-2-jbx6244@gmail.com>
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
 arch/arm/boot/dts/rk3036.dtsi  |  6 +++---
 arch/arm/boot/dts/rk3066a.dtsi | 12 ++++++------
 arch/arm/boot/dts/rk3188.dtsi  |  8 ++++----
 arch/arm/boot/dts/rk322x.dtsi  |  8 ++++----
 arch/arm/boot/dts/rk3288.dtsi  | 18 +++++++++---------
 arch/arm/boot/dts/rv1108.dtsi  |  8 ++++----
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index e24230d50..33ddede4b 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -505,7 +505,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		gpio0: gpio0@2007c000 {
+		gpio0: gpio@2007c000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2007c000 0x100>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
@@ -518,7 +518,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@20080000 {
+		gpio1: gpio@20080000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20080000 0x100>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
@@ -531,7 +531,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@20084000 {
+		gpio2: gpio@20084000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20084000 0x100>;
 			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 252750c97..cf3ea32e5 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -297,7 +297,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		gpio0: gpio0@20034000 {
+		gpio0: gpio@20034000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20034000 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
@@ -310,7 +310,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@2003c000 {
+		gpio1: gpio@2003c000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003c000 0x100>;
 			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -323,7 +323,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@2003e000 {
+		gpio2: gpio@2003e000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003e000 0x100>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
@@ -336,7 +336,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@20080000 {
+		gpio3: gpio@20080000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20080000 0x100>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
@@ -349,7 +349,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio4: gpio4@20084000 {
+		gpio4: gpio@20084000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20084000 0x100>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
@@ -362,7 +362,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio6: gpio6@2000a000 {
+		gpio6: gpio@2000a000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2000a000 0x100>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 2298a8d84..08aac5452 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -247,7 +247,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		gpio0: gpio0@2000a000 {
+		gpio0: gpio@2000a000 {
 			compatible = "rockchip,rk3188-gpio-bank0";
 			reg = <0x2000a000 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
@@ -260,7 +260,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@2003c000 {
+		gpio1: gpio@2003c000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003c000 0x100>;
 			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
@@ -273,7 +273,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@2003e000 {
+		gpio2: gpio@2003e000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x2003e000 0x100>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
@@ -286,7 +286,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@20080000 {
+		gpio3: gpio@20080000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20080000 0x100>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 118d96424..d9ac1d08c 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -823,7 +823,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		gpio0: gpio0@11110000 {
+		gpio0: gpio@11110000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11110000 0x100>;
 			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
@@ -836,7 +836,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@11120000 {
+		gpio1: gpio@11120000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11120000 0x100>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
@@ -849,7 +849,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@11130000 {
+		gpio2: gpio@11130000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11130000 0x100>;
 			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
@@ -862,7 +862,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@11140000 {
+		gpio3: gpio@11140000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x11140000 0x100>;
 			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 05557ad02..e96a70ebe 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1424,7 +1424,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		gpio0: gpio0@ff750000 {
+		gpio0: gpio@ff750000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff750000 0x0 0x100>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
@@ -1437,7 +1437,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@ff780000 {
+		gpio1: gpio@ff780000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff780000 0x0 0x100>;
 			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
@@ -1450,7 +1450,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@ff790000 {
+		gpio2: gpio@ff790000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff790000 0x0 0x100>;
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
@@ -1463,7 +1463,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@ff7a0000 {
+		gpio3: gpio@ff7a0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7a0000 0x0 0x100>;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -1476,7 +1476,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio4: gpio4@ff7b0000 {
+		gpio4: gpio@ff7b0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7b0000 0x0 0x100>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -1489,7 +1489,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio5: gpio5@ff7c0000 {
+		gpio5: gpio@ff7c0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7c0000 0x0 0x100>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -1502,7 +1502,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio6: gpio6@ff7d0000 {
+		gpio6: gpio@ff7d0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7d0000 0x0 0x100>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
@@ -1515,7 +1515,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio7: gpio7@ff7e0000 {
+		gpio7: gpio@ff7e0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7e0000 0x0 0x100>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
@@ -1528,7 +1528,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio8: gpio8@ff7f0000 {
+		gpio8: gpio@ff7f0000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x0 0xff7f0000 0x0 0x100>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 68e2282f7..3ace88e8c 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -582,7 +582,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		gpio0: gpio0@20030000 {
+		gpio0: gpio@20030000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x20030000 0x100>;
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
@@ -595,7 +595,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio1: gpio1@10310000 {
+		gpio1: gpio@10310000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x10310000 0x100>;
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
@@ -608,7 +608,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio2: gpio2@10320000 {
+		gpio2: gpio@10320000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x10320000 0x100>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
@@ -621,7 +621,7 @@
 			#interrupt-cells = <2>;
 		};
 
-		gpio3: gpio3@10330000 {
+		gpio3: gpio@10330000 {
 			compatible = "rockchip,gpio-bank";
 			reg = <0x10330000 0x100>;
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0

