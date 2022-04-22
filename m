Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A302550B18F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 09:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352010AbiDVHdA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 03:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444863AbiDVHcc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 03:32:32 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14205158B
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 00:29:37 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by laurent.telenet-ops.be with bizsmtp
        id MjVa270072Ah9RF01jVafY; Fri, 22 Apr 2022 09:29:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhnjR-001acD-Mg; Fri, 22 Apr 2022 09:29:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhnjR-00CIuS-4i; Fri, 22 Apr 2022 09:29:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: renesas: rcar-gen4: Fix GPIO function on I2C-capable pins
Date:   Fri, 22 Apr 2022 09:29:29 +0200
Message-Id: <cover.1650610471.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

Configuring I2C-capable pins for GPIO may not work on R-Car V3U and
S4-8, as R-Car Gen4 SoCs need additional configuration in a Module
Select Register (MODSELn) register, which is currently missing from the
pin control subdrivers.

Hence when using i2c-gpio instead of i2c-rcar using the commented-out
patch below, I2C
  - fails on the Spider development board (with R-Car S4-8), as the
    firmware/bootloader has configured the corresponding MODSEL bits for
    I2C,
  - still works on the Falcon development board (with R-Car V3U), as the
    firmware/bootloader has configured the corresponding MODSEL bits for
    GPIO.
    It can be made to fail by changing the MODSEL bits from U-Boot,
    before booting Linux:
      1. Write ffff0000 to e6050800 (unlock PMMR using inverted value),
      2. Write 0000ffff to e6050900 (enable I2C functions in MODSEL).

This patch series adds the missing configuration, by temporarily
overriding the GP_*_FN function enums to expand to two enums: the
original GP_*_FN enum to configure the GSPR register bits, and the
missing FN_SEL_I2Cn_0 enum to configure the MODSEL register bits.

I picked this solution as it is simpler than the alternative, which
would be:
  1. Add a copy of the CPU_ALL_GP() macro to describe all GPIO pins that
     are not I2C-capable,
  2. Add a copy of the PINMUX_DATA_GP_ALL() macro to emit mark/function
     enums in pinmux_data[] for GPIO pins that are not I2C-capable,
  3. Add a copy of the _GP_DATA() macro to emit mark/function 
     enums in pinmux_data[] for an I2C-capable GPIO pin,
  4. Invoke the macro above for all I2C-capable GPIO pins.

I intend to queue this in renesas-pinctrl-for-v5.19.

Thanks for your comments!

Geert Uytterhoeven (2):
  pinctrl: renesas: r8a779a0: Fix GPIO function on I2C-capable pins
  pinctrl: renesas: r8a779f0: Fix GPIO function on I2C-capable pins

 drivers/pinctrl/renesas/pfc-r8a779a0.c | 29 ++++++++++++++++++++++++++
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 21 +++++++++++++++++++
 2 files changed, 50 insertions(+)

-- 
2.25.1

# diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
# index ee81c715eb865d0e..d4fb3f122b709d2f 100644
# --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
# +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
# @@ -170,8 +170,10 @@ &extalr_clk {
#  };
#  
#  &i2c0 {
# +#ifndef I2C_GPIO
#  	pinctrl-0 = <&i2c0_pins>;
#  	pinctrl-names = "default";
# +#endif
#  
#  	status = "okay";
#  	clock-frequency = <400000>;
# @@ -185,8 +187,10 @@ eeprom@50 {
#  };
#  
#  &i2c1 {
# +#ifndef I2C_GPIO
#  	pinctrl-0 = <&i2c1_pins>;
#  	pinctrl-names = "default";
# +#endif
#  
#  	status = "okay";
#  	clock-frequency = <400000>;
# @@ -231,8 +235,10 @@ sn65dsi86_out: endpoint {
#  };
#  
#  &i2c6 {
# +#ifndef I2C_GPIO
#  	pinctrl-0 = <&i2c6_pins>;
#  	pinctrl-names = "default";
# +#endif
#  
#  	status = "okay";
#  	clock-frequency = <400000>;
# diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
# index fb10bb3626694227..12b433c2f30dd60d 100644
# --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
# +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
# @@ -5,6 +5,7 @@
#   * Copyright (C) 2020 Renesas Electronics Corp.
#   */
#  
# +#define I2C_GPIO
#  /dts-v1/;
#  #include "r8a779a0-falcon-cpu.dtsi"
#  #include "r8a779a0-falcon-csi-dsi.dtsi"
# diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
# index c251fdca18ab808b..dc2bbe2aa82878a4 100644
# --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
# +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
# @@ -8,6 +8,7 @@
#  #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
#  #include <dt-bindings/interrupt-controller/arm-gic.h>
#  #include <dt-bindings/power/r8a779a0-sysc.h>
# +#include <dt-bindings/gpio/gpio.h>
#  
#  / {
#  	compatible = "renesas,r8a779a0";
# @@ -438,6 +439,25 @@ tmu4: timer@ffc00000 {
#  			status = "disabled";
#  		};
#  
# +#ifdef I2C_GPIO
# +		i2c0: i2c0 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio2 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio2 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +
# +		i2c1: i2c1 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +#else
#  		i2c0: i2c@e6500000 {
#  			compatible = "renesas,i2c-r8a779a0",
#  				     "renesas,rcar-gen4-i2c";
# @@ -469,6 +489,7 @@ i2c1: i2c@e6508000 {
#  			#size-cells = <0>;
#  			status = "disabled";
#  		};
# +#endif
#  
#  		i2c2: i2c@e6510000 {
#  			compatible = "renesas,i2c-r8a779a0",
# @@ -534,6 +555,17 @@ i2c5: i2c@e66e0000 {
#  			status = "disabled";
#  		};
#  
# +#ifdef I2C_GPIO
# +		i2c6: i2c6 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio2 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio2 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +
# +#else
#  		i2c6: i2c@e66e8000 {
#  			compatible = "renesas,i2c-r8a779a0",
#  				     "renesas,rcar-gen4-i2c";
# @@ -549,6 +581,7 @@ i2c6: i2c@e66e8000 {
#  			#size-cells = <0>;
#  			status = "disabled";
#  		};
# +#endif
#  
#  		hscif0: serial@e6540000 {
#  			compatible = "renesas,hscif-r8a779a0",
# diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
# index 999c823719bc0bf5..18b8da87f2b2d251 100644
# --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
# +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
# @@ -32,8 +32,10 @@ &extalr_clk {
#  };
#  
#  &i2c4 {
# +#ifndef I2C_GPIO
#  	pinctrl-0 = <&i2c4_pins>;
#  	pinctrl-names = "default";
# +#endif
#  
#  	status = "okay";
#  	clock-frequency = <400000>;
# diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
# index 2e3b719cc749492d..c12045cc8b106f6b 100644
# --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
# +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
# @@ -5,6 +5,7 @@
#   * Copyright (C) 2021 Renesas Electronics Corp.
#   */
#  
# +#define I2C_GPIO
#  /dts-v1/;
#  #include "r8a779f0-spider-cpu.dtsi"
#  #include "r8a779f0-spider-ethernet.dtsi"
# diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
# index 155a7ee8dae43454..d56e17f714f353b1 100644
# --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
# +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
# @@ -8,6 +8,7 @@
#  #include <dt-bindings/clock/r8a779f0-cpg-mssr.h>
#  #include <dt-bindings/interrupt-controller/arm-gic.h>
#  #include <dt-bindings/power/r8a779f0-sysc.h>
# +#include <dt-bindings/gpio/gpio.h>
#  
#  / {
#  	compatible = "renesas,r8a779f0";
# @@ -164,6 +165,61 @@ sysc: system-controller@e6180000 {
#  			#power-domain-cells = <1>;
#  		};
#  
# +#ifdef I2C_GPIO
# +		i2c0: i2c0 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +
# +		i2c1: i2c1 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +
# +		i2c2: i2c2 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio1 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio1 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +
# +		i2c3: i2c3 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio1 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio1 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +
# +		i2c4: i2c4 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio1 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio1 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +
# +		i2c5: i2c5 {
# +			#address-cells = <1>;
# +			#size-cells = <0>;
# +			compatible = "i2c-gpio";
# +			scl-gpios = <&gpio1 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			sda-gpios = <&gpio1 11 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
# +			i2c-gpio,delay-us = <5>;
# +		};
# +#else
#  		i2c0: i2c@e6500000 {
#  			compatible = "renesas,i2c-r8a779f0",
#  				     "renesas,rcar-gen4-i2c";
# @@ -265,6 +321,7 @@ i2c5: i2c@e66e0000 {
#  			#size-cells = <0>;
#  			status = "disabled";
#  		};
# +#endif
#  
#  		ufs: ufs@e6860000 {
#  			compatible = "renesas,r8a779f0-ufs";

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
