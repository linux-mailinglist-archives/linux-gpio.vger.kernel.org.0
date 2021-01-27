Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFBD305119
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 05:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239394AbhA0Em1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 23:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389654AbhA0AGq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 19:06:46 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2C8C061352
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 16:05:18 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id n25so354258pgb.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 16:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u2CFxYIjg6arrEjc41dhVQJWSHe8H+mJoN8546JORc4=;
        b=bg4Hqcy5ToVXiqQaq8Cjw4rg6lUpvXbcGmxu7yC1mKiD7XSVQIIROwQdOBColzpyd6
         F3fw7EEQj9tNbs4teaEqiCsfX8DmtXhziwtgvE7eyMIlw3lJYV9cIc0wWXuWV1GtyuV0
         TdnrpmtWGX5pVcYuMu2NPeYyoxjEEADXvtBpuOz0y7Sow/mKMlk4kJ8LjierVee2lde6
         7J6m6G7fZH0J84iktd2K9tsA1+D4c76t7L6w3iycEljE0qa/Hjz9IjDFi9ZxIyhEx6u0
         ktXui8lEM7ph9fEhMnpSygWdd9t57r2YRWPNN89kqcFLbGFHqCtGk17Vf4hek9tEIiFh
         N4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u2CFxYIjg6arrEjc41dhVQJWSHe8H+mJoN8546JORc4=;
        b=Dka/NG7Gn+80sSLlNMIuTCxAj/A3IULMK+0K2boH/+wEsr4KsP2m9L8xsrVg4dhwWL
         BaCrYRC0Ik/HKNqUy4s9JmUDpsJPYgeDSejE3jvNmGYleX6ZsJZameNUdbKBGDEOTh/g
         xZ5a1rH8CF0D78ZMri9Jrsnxbwo9gUTK/arkvNu62qoMz0OE0sFCICng0J1oe2AYPkEk
         J4jzap1ZJsJM8R/xEDGrXG3wfbVRYTQxG05S0oHq3j5SCrmAoOwAd61HOfGiyiry4FPI
         JRSwupJdVWgkVhVEt+SLRS211zO9Tw2jjVIaM7qtD45jR3gvQtjzcv69RychUm9hELoo
         yWyg==
X-Gm-Message-State: AOAM531GzbrsTl0b5+ngEbzeDoHDq3QQae+JfViVIew9CBtYttxIoVQp
        /TCET6nXizukq/j3cUhSXscq8Q==
X-Google-Smtp-Source: ABdhPJyFyWfruZj14k/OS13slAPKs09/xHkOOik47DZmHJRpM/L4mujtjqINHBHc55L6al+3nzeqow==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr8058931pgc.185.1611705918421;
        Tue, 26 Jan 2021 16:05:18 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:515f:b0ad:6302:bbc2])
        by smtp.gmail.com with ESMTPSA id y5sm213536pfq.96.2021.01.26.16.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 16:05:17 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     bcousson@baylibre.com, Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH 2/2] ARM: dts: am335x-boneblack.dts: unique gpio-line-names
Date:   Tue, 26 Jan 2021 16:03:05 -0800
Message-Id: <20210127000303.436595-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127000303.436595-1-drew@beagleboard.org>
References: <20210127000303.436595-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Based on linux-gpio discussion [1], it is best practice to make the
gpio-line-names unique. Generic names like "[ethernet]" are replaced
with the name of the unique signal on the AM3358 SoC ball corresponding
to the gpio line. "[NC]" is also renamed to the standard "NC" name to
represent "not connected".

[1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am335x-boneblack.dts | 130 ++++++++++++-------------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index b4feb85e171a..ad9d32c7ec44 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -26,54 +26,54 @@ oppnitro-1000000000 {
 
 &gpio0 {
 	gpio-line-names =
-		"[ethernet]",
-		"[ethernet]",
+		"[mdio_data]",
+		"[mdio_clk]",
 		"P9_22 [spi0_sclk]",
 		"P9_21 [spi0_d0]",
 		"P9_18 [spi0_d1]",
 		"P9_17 [spi0_cs0]",
-		"[sd card]",
+		"[mmc0_cd]",
 		"P8_42A [ecappwm0]",
-		"P8_35 [hdmi]",
-		"P8_33 [hdmi]",
-		"P8_31 [hdmi]",
-		"P8_32 [hdmi]",
+		"P8_35 [lcd d12]",
+		"P8_33 [lcd d13]",
+		"P8_31 [lcd d14]",
+		"P8_32 [lcd d15]",
 		"P9_20 [i2c2_sda]",
 		"P9_19 [i2c2_scl]",
 		"P9_26 [uart1_rxd]",
 		"P9_24 [uart1_txd]",
-		"[ethernet]",
-		"[ethernet]",
-		"[usb]",
-		"[hdmi]",
+		"[rmii1_txd3]",
+		"[rmii1_txd2]",
+		"[usb0_drvvbus]",
+		"[hdmi cec]",
 		"P9_41B",
-		"[ethernet]",
+		"[rmii1_txd1]",
 		"P8_19 [ehrpwm2a]",
 		"P8_13 [ehrpwm2b]",
-		"[NC]",
-		"[NC]",
+		"NC",
+		"NC",
 		"P8_14",
 		"P8_17",
-		"[ethernet]",
-		"[ethernet]",
+		"[rmii1_txd0]",
+		"[rmii1_refclk]",
 		"P9_11 [uart4_rxd]",
 		"P9_13 [uart4_txd]";
 };
 
 &gpio1 {
 	gpio-line-names =
-		"P8_25 [emmc]",
-		"[emmc]",
-		"P8_5 [emmc]",
-		"P8_6 [emmc]",
-		"P8_23 [emmc]",
-		"P8_22 [emmc]",
-		"P8_3 [emmc]",
-		"P8_4 [emmc]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
+		"P8_25 [mmc1_dat0]",
+		"[mmc1_dat1]",
+		"P8_5 [mmc1_dat2]",
+		"P8_6 [mmc1_dat3]",
+		"P8_23 [mmc1_dat4]",
+		"P8_22 [mmc1_dat5]",
+		"P8_3 [mmc1_dat6]",
+		"P8_4 [mmc1_dat7]",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
 		"P8_12",
 		"P8_11",
 		"P8_16",
@@ -82,13 +82,13 @@ &gpio1 {
 		"P9_23",
 		"P9_14 [ehrpwm1a]",
 		"P9_16 [ehrpwm1b]",
-		"[emmc]",
+		"[emmc rst]",
 		"[usr0 led]",
 		"[usr1 led]",
 		"[usr2 led]",
 		"[usr3 led]",
-		"[hdmi]",
-		"[usb]",
+		"[hdmi irq]",
+		"[usb vbus oc]",
 		"[hdmi audio]",
 		"P9_12",
 		"P8_26",
@@ -116,38 +116,38 @@ &gpio2 {
 		"P8_38 [hdmi]",
 		"P8_36 [hdmi]",
 		"P8_34 [hdmi]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
+		"[rmii1_rxd3]",
+		"[rmii1_rxd2]",
+		"[rmii1_rxd1]",
+		"[rmii1_rxd0]",
 		"P8_27 [hdmi]",
 		"P8_29 [hdmi]",
 		"P8_28 [hdmi]",
 		"P8_30 [hdmi]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]",
-		"[emmc]";
+		"[mmc0_dat3]",
+		"[mmc0_dat2]",
+		"[mmc0_dat1]",
+		"[mmc0_dat0]",
+		"[mmc0_clk]",
+		"[mmc0_cmd]";
 };
 
 &gpio3 {
 	gpio-line-names =
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[ethernet]",
-		"[i2c0]",
-		"[i2c0]",
-		"[emu]",
-		"[emu]",
-		"[ethernet]",
-		"[ethernet]",
-		"[NC]",
-		"[NC]",
-		"[usb]",
+		"[mii col]",
+		"[mii crs]",
+		"[mii rx err]",
+		"[mii tx en]",
+		"[mii rx dv]",
+		"[i2c0 sda]",
+		"[i2c0 scl]",
+		"[jtag emu0]",
+		"[jtag emu1]",
+		"[mii tx clk]",
+		"[mii rx clk]",
+		"NC",
+		"NC",
+		"[usb vbus en]",
 		"P9_31 [spi1_sclk]",
 		"P9_29 [spi1_d0]",
 		"P9_30 [spi1_d1]",
@@ -156,14 +156,14 @@ &gpio3 {
 		"P9_27",
 		"P9_41A",
 		"P9_25",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]",
-		"[NC]";
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC";
 };
-- 
2.25.1

