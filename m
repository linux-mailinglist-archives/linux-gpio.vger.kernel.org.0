Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A11269806
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 23:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgINVpB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 17:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgINVoR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 17:44:17 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53E3C061797;
        Mon, 14 Sep 2020 14:44:09 -0700 (PDT)
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 5444723E4A;
        Mon, 14 Sep 2020 23:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1600119847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R8b1z+iGFiRGQhOIFM3diNO1SOWmPlbWlOSVAJR1ANI=;
        b=E9U+o0UWfl6a5fOImDoxr/uVfKVXQKLTX2clptY/xn/AHBPEUSW7cJLp09xdp7Pk3/BcQK
        EG4jlwPlmePHPccQmCKVlg0ruZv/0gAubjBy6OvOzRwET4rk1hzqA3y3OoaBQaxxg/lSWP
        CdcDybfvjsVmatJdBXCd03CvB2rEofY=
From:   Michael Walle <michael@walle.cc>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v10 11/13] arm64: dts: freescale: sl28: enable LED support
Date:   Mon, 14 Sep 2020 23:43:39 +0200
Message-Id: <20200914214341.14268-12-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200914214341.14268-1-michael@walle.cc>
References: <20200914214341.14268-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that we have support for GPIO lines of the SMARC connector, enable
LED support on the KBox A-230-LS. There are two LEDs without fixed
functions, one is yellow and one is green. Unfortunately, it is just one
multi-color LED, thus while it is possible to enable both at the same
time it is hard to tell the difference between "yellow only" and "yellow
and green".

Signed-off-by: Michael Walle <michael@walle.cc>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
Changes since v9:
 - none

Changes since v8:
 - none

Changes since v7:
 - use new "function" and "color" properties instead of a label
 - added default-on trigger for the power-led

Changes since v6:
 - none

Changes since v5:
 - changed the label, suggested by Pavel Machek

Changes since v4:
 - none

Changes since v3:
 - see cover letter

 .../fsl-ls1028a-kontron-kbox-a-230-ls.dts      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts
index 4b4cc6a1573d..dd516c0efd8b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dts
@@ -11,11 +11,29 @@
 
 /dts-v1/;
 #include "fsl-ls1028a-kontron-sl28-var4.dts"
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Kontron KBox A-230-LS";
 	compatible = "kontron,kbox-a-230-ls", "kontron,sl28-var4",
 		     "kontron,sl28", "fsl,ls1028a";
+
+	leds {
+		compatible = "gpio-leds";
+
+		alarm-led {
+			function = LED_FUNCTION_ALARM;
+			color = <LED_COLOR_ID_YELLOW>;
+			gpios = <&sl28cpld_gpio0 0 0>;
+		};
+
+		power-led {
+			linux,default-trigger = "default-on";
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&sl28cpld_gpio1 3 0>;
+		};
+	};
 };
 
 &enetc_mdio_pf3 {
-- 
2.20.1

