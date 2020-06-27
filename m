Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E635720C1DF
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 15:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgF0Nzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 09:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgF0Nzy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 09:55:54 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0623C03E97A
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 06:55:53 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a8so7837695edy.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 06:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoSrfN6BUR4s2KxWgiwxUSDxg2CiKyhfKscI1191oiA=;
        b=T8sLRMvw/GozyjPIwBVAuof7TWZV5UE+xRUqLg5JJVUQV/qh8ABpO+NdDWOEOl7In3
         3500XHgq2minPL+o2DBa/QDRLeY4TU+A/XsjL0LRaRr7b5ZdBj6MW2SOysKirBN4UZdW
         9sxehSPrLAFe100eH49YKmxBEazdwIU6WfX0ouKm4v7dwM+3bKbNoytUSSwoDhhb8Rmn
         EXv33BYFX8Etmck3DZxXkKer4ZRM8sleFnVNf9Qzmrk56vh6Qx27uoOxSop58Rw0CYBm
         O6CzoQ+wScSN57FdDSHJ2Uk64fFluScupS0tEEQLyvgP8iMsmBSwDbG+etGnrVxS4W4P
         ZbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoSrfN6BUR4s2KxWgiwxUSDxg2CiKyhfKscI1191oiA=;
        b=XPtb6yqyrgh5rdADMiyIrScd1SBbKsq7iC3ZKY/uYzLmpZNfKvHQ443OMkJFLvuhKO
         XE7GTM/XUotRJzqW/UcznU9xIxg78DLUAVr9fiA9ZOGMHfotwo8EzkPNEAu5yw0xlxsJ
         r8pYF2qO1/trNYtNSidM6iO/S8r9i+/b6ichDTJeerXungkx1fpdp4pRNFvwiEvZQ8Tf
         Mh9x9PV2DvxAC9dOObZbh09poTybcb/r4wBVM6MC31M3cBMrZkXkerfb8rp+p3ewFZLj
         vK8+vn9Znd6iQJ7Ifp2hlPbda+Zhsx4OCiv8IRoYSjbI8pkP6D74lE9NncwjRE/zv+bN
         zP6w==
X-Gm-Message-State: AOAM531EiXfnqjuAv9v3DHyUeO/5gTAipA95+C2nI5QHWYlpIUoJe28I
        JJXQpTn2C13JzteVjTp9K/l0nA==
X-Google-Smtp-Source: ABdhPJyQ9Nm7pcD7I8ZuGmTzvTdIQKbVgRckXBQakwSnqr+vyREZjumQpmx23E0PMKrU7of3rXTC8g==
X-Received: by 2002:aa7:c305:: with SMTP id l5mr2571618edq.163.1593266152157;
        Sat, 27 Jun 2020 06:55:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c8f:5b01:3446:ed90:fece:8da5])
        by smtp.gmail.com with ESMTPSA id bc23sm5665335edb.90.2020.06.27.06.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 06:55:51 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        bcousson@baylibre.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] Add default mux for pins that a free GPIO lines on the PocketBeagle
Date:   Sat, 27 Jun 2020 15:55:38 +0200
Message-Id: <20200627135538.194179-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These pins on the PocketBeagle P1 and P2 headers are connected to AM3358
balls with gpio lines, and these pins are not used for any other
peripherals by default. These GPIO lines are unclaimed and could be used
by userspace program through the gpiod ABI. However, no driver will have
set mux mode for the pins.

This patch adds a "default" state in the am33xx_pinmux node and sets the
pins to gpio output mux mode.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am335x-pocketbeagle.dts | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index f0b222201b86..900dc6558701 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -60,6 +60,104 @@ vmmcsd_fixed: fixedregulator0 {
 };
 
 &am33xx_pinmux {
+
+	pinctrl-names = "default";
+	pinctrl-0 =   <	&P2_03_gpio &P1_34_gpio &P2_19_gpio &P2_24_gpio
+			&P2_33_gpio &P2_22_gpio &P2_18_gpio &P2_10_gpio
+			&P2_06_gpio &P2_04_gpio &P2_02_gpio &P2_08_gpio
+			&P2_17_gpio >;
+
+	/* P2_03 (ZCZ ball T10) gpio0_23 0x824 */
+	P2_03_gpio: pinmux_P2_03_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD9, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P1_34 (ZCZ ball T11) gpio0_26 0x828 */
+	P1_34_gpio: pinmux_P1_34_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD10, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+		/* P2_19 (ZCZ ball U12) gpio0_27 0x82c */
+	P2_19_gpio: pinmux_P2_19_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_24 (ZCZ ball T12) gpio1_12 0x830 */
+	P2_24_gpio: pinmux_P2_24_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_33 (ZCZ ball R12) gpio1_13 0x834 */
+	P2_33_gpio: pinmux_P2_33_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_22 (ZCZ ball V13) gpio1_14 0x838 */
+	P2_22_gpio: pinmux_P2_22_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_18 (ZCZ ball U13) gpio1_15 0x83c */
+	P2_18_gpio: pinmux_P2_18_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_10 (ZCZ ball R14) gpio1_20 0x850 */
+	P2_10_gpio: pinmux_P2_10_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_06 (ZCZ ball U16) gpio1_25 0x864 */
+	P2_06_gpio: pinmux_P2_06_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_04 (ZCZ ball T16) gpio1_26 0x868 */
+	P2_04_gpio: pinmux_P2_04_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_02 (ZCZ ball V17) gpio1_27 0x86c */
+	P2_02_gpio: pinmux_P2_02_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_08 (ZCZ ball U18) gpio1_28 0x878 */
+	P2_08_gpio: pinmux_P2_08_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
+	/* P2_17 (ZCZ ball V12) gpio2_1 0x88c */
+	P2_17_gpio: pinmux_P2_17_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_OUTPUT, MUX_MODE7)
+		>;
+	};
+
 	i2c2_pins: pinmux-i2c2-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLUP, MUX_MODE3)	/* (D17) uart1_rtsn.I2C2_SCL */
-- 
2.25.1

