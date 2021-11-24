Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05EE845D0BA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 00:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352394AbhKXXIO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 18:08:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352383AbhKXXIO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 18:08:14 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6402C061574;
        Wed, 24 Nov 2021 15:05:03 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id l22so11258944lfg.7;
        Wed, 24 Nov 2021 15:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BA4tDKZ+Blkfi7C2aIpzTSZjN8sBLs0JXhtIeRx//l0=;
        b=HJ3CzNE720BoEQwLXxTJzU5F5WnyQL9L+TwIUcvsYGsBGKSIQ5GwKBnVoSjH5CG2sv
         olhelTd/O/14pEeBgbvUOg+NzaB3ti4j8hOxor24+LHcu9G96PuxnjTsTOZmf5NtkoNP
         DirSPu/JIGQNj0alR1rqZgsizHyjfmxyMrfp7pAEBUelBW9esFxun/ii54ytV1xPsGQg
         dfXegp2PYaR8aIMhricIxIftejKYnrv1fNGg1/EugDfqfWduqxSb7mI4/u7syXNf+8nU
         epZwkE9dHJ0+Lg/EjwpmTZ4qNdo/1tndgnYTyLcc7KLrNB0jIVYkc8csr3qfcZyTjSr5
         LpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BA4tDKZ+Blkfi7C2aIpzTSZjN8sBLs0JXhtIeRx//l0=;
        b=ZvwzbirFQWSWub4hZzK4n2S+Vg5ljOvh3EI7OHF0d6OvaRtoHCA+2Wj2j/H0O0rWm5
         DlNPqSNLWgx80cwEArVerLNYP4ODyv2FV04Mf8zNbq8Qr/UPDtrAiiserooVhobNEwjo
         NmdwwZWlV56Y7fU3RWrrGvte2DF1TcGhgaEUa7hyBJ6tv1wH/SHQ0pYOfad6wnKq0zF4
         aAUECSX4wKSTRsVCjB9hfPOdgVfiOX8XPfxiUWe5a+qI0RjKeIY34axm4MEwBMqj6+Bu
         ez3y+eu6U3vls+Wrm7k+KBdk0HeFxNoYyFw5k7xtSEDDlk9XJJ8TzT08hSzp59+HQxvz
         CKyQ==
X-Gm-Message-State: AOAM530VDyUkyHpmRfMc5gfW3kMJWLwG95w0Y8KlrTCnwLwMjSky1ct+
        u2LWLZ30zDxClanGP18kiQg=
X-Google-Smtp-Source: ABdhPJxlKTpuABlfgXMhnD3RKra37k5e5VXA1sE76OLIfrEf7HmMbG+YtBDg7qbXIQtXRpVCU4Zzhw==
X-Received: by 2002:ac2:5d67:: with SMTP id h7mr18924907lft.493.1637795102007;
        Wed, 24 Nov 2021 15:05:02 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t15sm106243lfp.181.2021.11.24.15.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:05:01 -0800 (PST)
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
Subject: [PATCH V2 6/6] ARM: dts: BCM5301X: add pinctrl pins, groups & functions
Date:   Thu, 25 Nov 2021 00:04:39 +0100
Message-Id: <20211124230439.17531-7-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124230439.17531-1-zajec5@gmail.com>
References: <20211124230439.17531-1-zajec5@gmail.com>
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
V2: Update "pins" to match updated binding
---
 arch/arm/boot/dts/bcm4709.dtsi  |  67 ++++++++++++++++++++
 arch/arm/boot/dts/bcm47094.dtsi |  11 +---
 arch/arm/boot/dts/bcm5301x.dtsi | 109 ++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4709.dtsi b/arch/arm/boot/dts/bcm4709.dtsi
index cba3d910bed8..481dc3e9353b 100644
--- a/arch/arm/boot/dts/bcm4709.dtsi
+++ b/arch/arm/boot/dts/bcm4709.dtsi
@@ -10,6 +10,73 @@ &uart0 {
 	status = "okay";
 };
 
+&pinctrl {
+	compatible = "brcm,bcm4709-pinmux";
+
+	pins {
+		mdc {
+			number = <6>;
+		};
+
+		mdio {
+			number = <7>;
+		};
+
+		uart2_rx {
+			number = <16>;
+		};
+
+		uart2_tx {
+			number = <17>;
+		};
+
+		/* TODO
+		 * xtal_out {
+		 * };
+		 */
+
+		sdio_pwr {
+			number = <22>;
+		};
+
+		sdio_en_1p8v {
+			number = <23>;
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
index d4f355015e3c..dc89d2f5fa8f 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -473,6 +473,115 @@ pinmux_uart1: uart1-pins {
 					groups = "uart1_grp";
 					function = "uart1";
 				};
+
+				pins {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					spi_clk {
+						number = <0>;
+					};
+
+					spi_ss {
+						number = <1>;
+					};
+
+					spi_mosi {
+						number = <2>;
+					};
+
+					spi_miso {
+						number = <3>;
+					};
+
+					i2c_scl {
+						number = <4>;
+					};
+
+					i2c_sda {
+						number = <5>;
+					};
+
+					pwm0 {
+						number = <8>;
+					};
+
+					pwm1 {
+						number = <9>;
+					};
+
+					pwm2 {
+						number = <10>;
+					};
+
+					pwm3 {
+						number = <11>;
+					};
+
+					uart1_rx {
+						number = <12>;
+					};
+
+					uart1_tx {
+						number = <13>;
+					};
+
+					uart1_cts {
+						number = <14>;
+					};
+
+					uart1_rts {
+						number = <15>;
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

