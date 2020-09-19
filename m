Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EBE271064
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Sep 2020 21:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgISTxn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Sep 2020 15:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgISTxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Sep 2020 15:53:43 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BC2C0613D1
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2020 12:53:42 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n22so9249114edt.4
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2020 12:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMwGB/6Q8iuh06nESVxnQhD9mhvdXzNztX0AnrMhLHo=;
        b=Av22sauDdvg5f8PJXeQVU4ypMPuew4aeryx9oJBswTAhrJHWsVkgSte0K74F7AR5GT
         IbrGAYZhgWen0QxSEd5Ccij1pT9wnVpFZGkFzWPglsy9z2hz4EqfIjvB3sMvyaDA2w0c
         nL+TPQqa1eSsXRqyA6nkzEWPoMegpGQ+J/UeA1rqUiDgNqxePx/CsrwhqteSgmkswNqk
         7dSuWWmhxQCwL3ESjeMtfWemDZYOsra4XP6FznaRG+4xGZH2V1w4W9xai+R/BnQBXi/T
         HTy8StVIlM5ONAj0vexUroJMm37GBhGfir8cHX7bgZIr/CTD6FUDDWUiZ6dbLZIpc4c3
         Os8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qMwGB/6Q8iuh06nESVxnQhD9mhvdXzNztX0AnrMhLHo=;
        b=CcimM84uaJNFah0NaHzBa5yVZwHutxqh0qegSEcTUJFLhuhLd+ZXTzlkbKoquWOv8i
         xtJz/K/QSMLOT5+6oXhG93DyR+bjK0eRwoE8rV9SYnTxHT4rqhKplHT7uv6Xp2E2AaNr
         2AkT1Tb6RSUFc+LvUhs3w9fB/cjZHJ1PjSfqWSo4sDNXVlIDkrwrzHx8J5ZxcJenquGi
         CTykMqQlNjeBsyMBmOkfz6IbvEH98atKUjssQMgk6IhRgIKLTD9IJ3L8nIB/4AF130pQ
         WpFUafQsacoB6ewztAWWy35XseAst1ZN5jYRKNfjkA9yZyLNdazk5udWAxBaKJjqfDPn
         dzCA==
X-Gm-Message-State: AOAM532nLa9V1peKvePvvwZgtrea5o/BspchKXZqzIS1SnyxKCR6etRR
        bvfB53br5e/+b/cTCSna26Fe6A==
X-Google-Smtp-Source: ABdhPJwl3da6h+kCC6DLGgNphfmJ0WGAOBmg2rj2XT2NbMiwRvB0yOEG972ZAybPmrRI/nyI6ETh/g==
X-Received: by 2002:a50:bb26:: with SMTP id y35mr46674569ede.234.1600545221134;
        Sat, 19 Sep 2020 12:53:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c3d:1401:6946:9f46:bd13:f4c6])
        by smtp.gmail.com with ESMTPSA id h5sm4978881ejk.41.2020.09.19.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 12:53:40 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] ARM: dts: am335x: guardian: switch to AM33XX_PADCONF
Date:   Sat, 19 Sep 2020 21:52:00 +0200
Message-Id: <20200919195159.3126193-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change the pin defintions from AM33XX_IOPAD to AM33XX_PADCONF macro so
that it correctly handles changes to #pinctrl-cells.

Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am335x-guardian.dts | 172 +++++++++++++-------------
 1 file changed, 86 insertions(+), 86 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-guardian.dts b/arch/arm/boot/dts/am335x-guardian.dts
index 1918766c1f80..56c9cd674d98 100644
--- a/arch/arm/boot/dts/am335x-guardian.dts
+++ b/arch/arm/boot/dts/am335x-guardian.dts
@@ -339,152 +339,152 @@ &am33xx_pinmux {
 
 	clkout2_pin: pinmux_clkout2_pin {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x9b4, PIN_OUTPUT_PULLDOWN | MUX_MODE3)
+			AM33XX_PADCONF(0x9b4, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
 		>;
 	};
 
 	dmtimer7_pins: pinmux_dmtimer7_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x968, PIN_OUTPUT | MUX_MODE5)
+			AM33XX_PADCONF(0x968, PIN_OUTPUT, MUX_MODE5)
 		>;
 	};
 
 	gpio_keys_pins: pinmux_gpio_keys_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x940, PIN_INPUT | MUX_MODE7)
+			AM33XX_PADCONF(0x940, PIN_INPUT, MUX_MODE7)
 		>;
 	};
 
 	gpio_pins: pinmux_gpio_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x928, PIN_OUTPUT | MUX_MODE7)
-			AM33XX_IOPAD(0x990, PIN_OUTPUT | MUX_MODE7)
+			AM33XX_PADCONF(0x928, PIN_OUTPUT, MUX_MODE7)
+			AM33XX_PADCONF(0x990, PIN_OUTPUT, MUX_MODE7)
 		>;
 	};
 
 	i2c0_pins: pinmux_i2c0_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x988, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x98c, PIN_INPUT_PULLUP | MUX_MODE0)
+			AM33XX_PADCONF(0x988, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x98c, PIN_INPUT_PULLUP, MUX_MODE0)
 		>;
 	};
 
 	lcd_disen_pins: pinmux_lcd_disen_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x9a4, PIN_OUTPUT_PULLUP | SLEWCTRL_SLOW | MUX_MODE7)
+			AM33XX_PADCONF(0x9a4, PIN_OUTPUT_PULLUP | SLEWCTRL_SLOW, MUX_MODE7)
 		>;
 	};
 
 	lcd_pins_default: pinmux_lcd_pins_default {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x820, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x824, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x828, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x82c, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x830, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x834, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x838, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x83c, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE1)
-			AM33XX_IOPAD(0x8a0, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8a4, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8a8, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8ac, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8b0, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8b4, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8b8, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8bc, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8c0, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8c4, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8c8, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8cc, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8d0, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8d4, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8d8, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8dc, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8e0, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8e4, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8e8, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
-			AM33XX_IOPAD(0x8ec, PIN_OUTPUT | SLEWCTRL_SLOW | MUX_MODE0)
+			AM33XX_PADCONF(0x820, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x824, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x828, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x82c, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x830, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x834, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x838, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x83c, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE1)
+			AM33XX_PADCONF(0x8a0, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8a4, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8a8, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8ac, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8b0, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8b4, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8b8, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8bc, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8c0, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8c4, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8c8, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8cc, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8d0, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8d4, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8d8, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8dc, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8e0, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8e4, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8e8, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
+			AM33XX_PADCONF(0x8ec, PIN_OUTPUT | SLEWCTRL_SLOW, MUX_MODE0)
 		>;
 	};
 
 	lcd_pins_sleep: pinmux_lcd_pins_sleep {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x8a0, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8a4, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8a8, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8ac, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8b0, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8b4, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8b8, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8bc, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8c0, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8c4, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8c8, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8cc, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8d0, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8d4, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8d8, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8dc, PULL_DISABLE | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8e0, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8e4, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8e8, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW | MUX_MODE7)
-			AM33XX_IOPAD(0x8ec, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW | MUX_MODE7)
+			AM33XX_PADCONF(0x8a0, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8a4, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8a8, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8ac, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8b0, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8b4, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8b8, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8bc, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8c0, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8c4, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8c8, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8cc, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8d0, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8d4, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8d8, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8dc, PULL_DISABLE | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8e0, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8e4, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8e8, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW, MUX_MODE7)
+			AM33XX_PADCONF(0x8ec, PIN_INPUT_PULLDOWN | SLEWCTRL_SLOW, MUX_MODE7)
 		>;
 	};
 
 	leds_pins: pinmux_leds_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x868, PIN_OUTPUT | MUX_MODE7)
-			AM33XX_IOPAD(0x86c, PIN_OUTPUT | MUX_MODE7)
+			AM33XX_PADCONF(0x868, PIN_OUTPUT, MUX_MODE7)
+			AM33XX_PADCONF(0x86c, PIN_OUTPUT, MUX_MODE7)
 		>;
 	};
 
 	mmc1_pins: pinmux_mmc1_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x8f0, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x8f4, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x8f8, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x8fc, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x900, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x904, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x960, PIN_INPUT | MUX_MODE7)
+			AM33XX_PADCONF(0x8f0, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x8f4, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x8f8, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x8fc, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x900, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x904, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x960, PIN_INPUT, MUX_MODE7)
 		>;
 	};
 
 	spi0_pins: pinmux_spi0_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x950, PIN_OUTPUT_PULLDOWN | MUX_MODE0)
-			AM33XX_IOPAD(0x954, PIN_OUTPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x958, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x95c, PIN_OUTPUT_PULLUP | MUX_MODE0)
+			AM33XX_PADCONF(0x950, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(0x954, PIN_OUTPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x958, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x95c, PIN_OUTPUT_PULLUP, MUX_MODE0)
 		>;
 	};
 
 	uart0_pins: pinmux_uart0_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x970, PIN_INPUT_PULLUP | MUX_MODE0)
-			AM33XX_IOPAD(0x974, PIN_OUTPUT_PULLDOWN | MUX_MODE0)
+			AM33XX_PADCONF(0x970, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(0x974, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 		>;
 	};
 
 	nandflash_pins: pinmux_nandflash_pins {
 		pinctrl-single,pins = <
-			AM33XX_IOPAD(0x800, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x804, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x808, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x80c, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x810, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x814, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x818, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x81c, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x870, PIN_INPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x874, PIN_OUTPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x87c, PIN_OUTPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x890, PIN_OUTPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x894, PIN_OUTPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x898, PIN_OUTPUT | MUX_MODE0)
-			AM33XX_IOPAD(0x89c, PIN_OUTPUT | MUX_MODE0)
+			AM33XX_PADCONF(0x800, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x804, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x808, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x80c, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x810, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x814, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x818, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x81c, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x870, PIN_INPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x874, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x87c, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x890, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x894, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x898, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(0x89c, PIN_OUTPUT, MUX_MODE0)
 		>;
 	};
 };
-- 
2.25.1

