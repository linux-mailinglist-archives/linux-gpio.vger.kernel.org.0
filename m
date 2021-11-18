Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9582455C97
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbhKRNZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbhKRNZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:25:19 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2111FC061767;
        Thu, 18 Nov 2021 05:22:19 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id c32so26014986lfv.4;
        Thu, 18 Nov 2021 05:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULF68UwhVDlRTvRbeXuUFDMpZQ8miFxqyGy0nvwt3uk=;
        b=pGo1wzg0o2Q8EeSlsXb/UhoMwD2LzHiKdnm68v0zPZs3YW98qOdHxiEmBM40i+ORjP
         s1oDysRZIqf3oucuL7AI0b2/oz6ayhrSUZkmYhZpDQEybzfzHyosNhfKn7f57xZ/T/ri
         2i8Fa+ZFz/zwxJQEkevTM46eNqVDUOgfzKYy0yX/09v3u8rP5nhLTUdGh3Yfs2tSZv7q
         wZVyHSMPKSyJ42OH5kga6Vk016etBoO9QIsr+g3nmfXWtIaCq4vmpRZp5CHQ/6frxBUM
         KTBGFHh6iPUJoINT7O+WqDGD6lCDL+APf/O1k6Rrn8Oq3k1/IUlTgdY47MeWzPb/TIJB
         iCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULF68UwhVDlRTvRbeXuUFDMpZQ8miFxqyGy0nvwt3uk=;
        b=XOy8Y7VdDTx4gvFmSakKkgLEWhDzI9XtFx0WDwPqsOTnumLjuiFb4dCOtlO6ig64V3
         aKutEc17KvPmVKTE1YdDeqJsKXRSbngFuZBJuFphiCiEtXLMjM+b8KYbz4B5ltD/J++7
         sX7hNGgrjuHVUWKCocgrMzy5v+AHu3ffsXAJq0awQui0I6/9Rf98cvs0BlbleAoJau9e
         QtVDl4f3YdNxYyo/RX2FuEV+qIkaS/A6sHcnmwqWenCyBH2GeLpA6gV7P+PZj/PhLHvL
         p74XTXxZT5shUJDm+hg+TaL0+4aVYUKzPDQBcsfOxduVyBN8aZAnYJeCrRx9jF6vTthj
         FIEw==
X-Gm-Message-State: AOAM532VfkrK+YrGqNc8slIHberN1ZvFmUd2WeIJsHK09EAf78Y4MWKF
        iosidDTFzqlpILUEBhU1Ep4=
X-Google-Smtp-Source: ABdhPJwHCfXME+dCe7HSwWboePM3jMjp/q/TB3ludt+Evadz5tV+XX3KLaFub0RTmqqDLK0TBApfPA==
X-Received: by 2002:a2e:9641:: with SMTP id z1mr18419557ljh.66.1637241737452;
        Thu, 18 Nov 2021 05:22:17 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id bp36sm356550lfb.0.2021.11.18.05.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:22:17 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 5/5] ARM: dts: BCM5301X: add pinctrl pins, groups & functions
Date:   Thu, 18 Nov 2021 14:21:52 +0100
Message-Id: <20211118132152.15722-6-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118132152.15722-1-zajec5@gmail.com>
References: <20211118132152.15722-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

They can now be described in DT so do that.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/bcm4709.dtsi  |  74 +++++++++++++++++++
 arch/arm/boot/dts/bcm47094.dtsi |  11 +--
 arch/arm/boot/dts/bcm5301x.dtsi | 123 ++++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4709.dtsi b/arch/arm/boot/dts/bcm4709.dtsi
index cba3d910bed8..ba4700a85772 100644
--- a/arch/arm/boot/dts/bcm4709.dtsi
+++ b/arch/arm/boot/dts/bcm4709.dtsi
@@ -10,6 +10,80 @@ &uart0 {
 	status = "okay";
 };
 
+&pinctrl {
+	compatible = "brcm,bcm4709-pinmux";
+
+	pins {
+		reg@6 {
+			reg = <6>;
+			label = "mdc";
+		};
+
+		reg@7 {
+			reg = <7>;
+			label = "mdio";
+		};
+
+		reg@10 {
+			reg = <16>;
+			label = "uart2_rx";
+		};
+
+		reg@11 {
+			reg = <17>;
+			label = "uart2_tx";
+		};
+
+		/* TODO
+		 * reg@ {
+		 *	label = "xtal_out";
+		 * };
+		 */
+
+		reg@16 {
+			reg = <22>;
+			label = "sdio_pwr";
+		};
+
+		reg@17 {
+			reg = <23>;
+			label = "sdio_en_1p8v";
+		};
+	};
+
+	groups {
+		mdio_grp: mdio_grp {
+			pins = <6 7>;
+		};
+
+		uart2_grp: uart2_grp {
+			pins = <16 17>;
+		};
+
+		sdio_pwr_grp: sdio_pwr_grp {
+			pins = <22>;
+		};
+
+		sdio_1p8v_grp: sdio_1p8v_grp {
+			pins = <23>;
+		};
+	};
+
+	functions {
+		mdio {
+			groups = <&mdio_grp>;
+		};
+
+		uart2 {
+			groups = <&uart2_grp>;
+		};
+
+		sdio {
+			groups = <&sdio_pwr_grp &sdio_1p8v_grp>;
+		};
+	};
+};
+
 &srab {
 	compatible = "brcm,bcm53012-srab", "brcm,bcm5301x-srab";
 };
diff --git a/arch/arm/boot/dts/bcm47094.dtsi b/arch/arm/boot/dts/bcm47094.dtsi
index 6282363313e1..239c1c1b0268 100644
--- a/arch/arm/boot/dts/bcm47094.dtsi
+++ b/arch/arm/boot/dts/bcm47094.dtsi
@@ -3,14 +3,12 @@
  * Copyright (C) 2016 Rafał Miłecki <rafal@milecki.pl>
  */
 
-#include "bcm4708.dtsi"
+#include "bcm4709.dtsi"
 
 / {
 };
 
 &pinctrl {
-	compatible = "brcm,bcm4709-pinmux";
-
 	pinmux_mdio: mdio-pins {
 		groups = "mdio_grp";
 		function = "mdio";
@@ -21,11 +19,4 @@ &usb3_phy {
 	compatible = "brcm,ns-bx-usb3-phy";
 };
 
-&uart0 {
-	clock-frequency = <125000000>;
-	status = "okay";
-};
 
-&srab {
-	compatible = "brcm,bcm53012-srab", "brcm,bcm5301x-srab";
-};
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index d4f355015e3c..31c6a3dbba30 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -473,6 +473,129 @@ pinmux_uart1: uart1-pins {
 					groups = "uart1_grp";
 					function = "uart1";
 				};
+
+				pins {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					pin@0 {
+						reg = <0>;
+						label = "spi_clk";
+					};
+
+					pin@1 {
+						reg = <1>;
+						label = "spi_ss";
+					};
+
+					pin@2 {
+						reg = <2>;
+						label = "spi_mosi";
+					};
+
+					pin@3 {
+						reg = <3>;
+						label = "spi_miso";
+					};
+
+					pin@4 {
+						reg = <4>;
+						label = "i2c_scl";
+					};
+
+					pin@5 {
+						reg = <5>;
+						label = "i2c_sda";
+					};
+
+					pin@8 {
+						reg = <8>;
+						label = "pwm0";
+					};
+
+					pin@9 {
+						reg = <9>;
+						label = "pwm1";
+					};
+
+					pin@a {
+						reg = <10>;
+						label = "pwm2";
+					};
+
+					pin@b {
+						reg = <11>;
+						label = "pwm3";
+					};
+
+					pin@c {
+						reg = <12>;
+						label = "uart1_rx";
+					};
+
+					pin@d {
+						reg = <13>;
+						label = "uart1_tx";
+					};
+
+					pin@e {
+						reg = <14>;
+						label = "uart1_cts";
+					};
+
+					pin@f {
+						reg = <15>;
+						label = "uart1_rts";
+					};
+				};
+
+				groups {
+					spi_grp: spi_grp {
+						pins = <0 1 2 3>;
+					};
+
+					i2c_grp: i2c_grp {
+						pins = <4 5>;
+					};
+
+					pwm0_grp: pwm0_grp {
+						pins = <8>;
+					};
+
+					pwm1_grp: pwm1_grp {
+						pins = <9>;
+					};
+
+					pwm2_grp: pwm2_grp {
+						pins = <10>;
+					};
+
+					pwm3_grp: pwm3_grp {
+						pins = <11>;
+					};
+
+					uart1_grp: uart1_grp {
+						pins = <12 13 14 15>;
+					};
+				};
+
+				functions {
+					spi {
+						groups = <&spi_grp>;
+					};
+
+					i2c {
+						groups = <&i2c_grp>;
+					};
+
+					pwm {
+						groups = <&pwm0_grp &pwm1_grp &pwm2_grp &pwm3_grp>;
+					};
+
+					uart1 {
+						groups = <&uart1_grp>;
+					};
+				};
 			};
 
 			thermal: thermal@2c0 {
-- 
2.31.1

