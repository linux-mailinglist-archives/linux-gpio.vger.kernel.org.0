Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5F3260665
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 23:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgIGVja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 17:39:30 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:33239 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbgIGViZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 17:38:25 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 38ACB23E4E;
        Mon,  7 Sep 2020 23:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1599514702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1NfcsN3qEVI5G1zgs83NwVOsXPnR9YJuW7nG+W9s5CY=;
        b=vnFRVYT8Ty5INE4V6Wfn8AMmzypDwxCYU7aEpDzNDq2pQWDoc/PQyLZvHXC4gA63d9UvGi
        GqsGnv7N5sx0LbKYVssUY96Fdj0p6QMzCSmTQR1zcNfgKgTk0DuyOtc+9VtZ1dbtN98KiT
        GXGbaQ3LTxICYlgopGkCkZlLuYuIFPk=
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
Subject: [PATCH v9 10/13] arm64: dts: freescale: sl28: map GPIOs to input events
Date:   Mon,  7 Sep 2020 23:37:59 +0200
Message-Id: <20200907213802.26745-11-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200907213802.26745-1-michael@walle.cc>
References: <20200907213802.26745-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that we have support for GPIO lines of the SMARC connector, map the
sleep, power and lid switch signals to the corresponding keys using the
gpio-keys and gpio-keys-polled drivers. The power and sleep signals have
dedicated interrupts, thus we use these ones. The lid switch is just
mapped to a GPIO input and needs polling.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since v8:
 - none

Changes since v7:
 - none

Changes since v6:
 - none

Changes since v5:
 - none

Changes since v4:
 - none

Changes since v3:
 - see cover letter

 .../freescale/fsl-ls1028a-kontron-sl28.dts    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
index 9f9834eafe65..17a2f5dacc3f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
@@ -9,6 +9,8 @@
 /dts-v1/;
 #include "fsl-ls1028a.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Kontron SMARC-sAL28";
@@ -23,6 +25,36 @@
 		spi1 = &dspi2;
 	};
 
+	buttons0 {
+		compatible = "gpio-keys";
+
+		power-button {
+			interrupts-extended = <&sl28cpld_intc
+					       4 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_POWER>;
+			label = "Power";
+		};
+
+		sleep-button {
+			interrupts-extended = <&sl28cpld_intc
+					       5 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_SLEEP>;
+			label = "Sleep";
+		};
+	};
+
+	buttons1 {
+		compatible = "gpio-keys-polled";
+		poll-interval = <200>;
+
+		lid-switch {
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			gpios = <&sl28cpld_gpio3 4 GPIO_ACTIVE_LOW>;
+			label = "Lid";
+		};
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
-- 
2.20.1

