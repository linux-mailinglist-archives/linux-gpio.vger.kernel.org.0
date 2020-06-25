Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4117620979E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 02:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387843AbgFYA1n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 20:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388297AbgFYA1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 20:27:42 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0608AC061573
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:27:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j94so4067509wrj.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 17:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=twOEEo4sVMzJuj8SG+LhZx4U/3YAbsNh96QjyOpXoFc=;
        b=N8Ct3mHyZaOv2SbFUW5O4+RtAYUpm5f33PESPdvsYwkpUFXnBv6P9+ilmtc9+PD1RH
         iAOScnBHob24pLwN2kUXrwCcw2XezODi5Uev6Bm/037YsGVU0lGuI06vEz9JiG3nPIRb
         V4GeQgu8PpDUh8Ke4eVryiRfUyneVDm6GlG5YwwB9uFNigm1OCoHPcGahGwYiDuwjki8
         XHyUW3UN5VsOJ23VRPvRcmUFdwZDlxgdl8ifP5g7Os0X7ScqtSlb4IrNTNe8raTB0lS4
         W5NbZN1iOPXMgibJfjFp7UxOwiv7rJINDbnkm2BXYNulaS4829NaGS9acHiWFfFyX6ah
         y2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=twOEEo4sVMzJuj8SG+LhZx4U/3YAbsNh96QjyOpXoFc=;
        b=sDQQ2ZPIPlLeAhQiVhgx7SDs5lcAxnZpkBXfI3x23tnenwAMlO8KYSVtjQNyFwbEJ5
         snSqPbGqfuxmc+r0Byjc7PLg5zoEz8TXpZKjorArSgPITCAA7gocRxBBqbN5uIYalLum
         9IiPdVmsgYsWU4n0oizML/QPtK7oueC+m50E1CL7QIRmcsvDhHNtJ6IcSdqa/WgBgYX9
         ZlE0Ia6yKjcuHWSDi/OAXQ03IQQGSqUmm8kCRK0xbXO9IMC69TBxOEtwS3IRUAGIUI5C
         Tm2Hi+gBGqkIrjaJL0JxphDCAKmmEx1VZaC0xWpXrXhwda7VCSZAMdkI5oNRMm7av3bG
         Ie+w==
X-Gm-Message-State: AOAM530Ei8Lbht9ET2uR4IKMUoyvmyq3MfDSnX9SdP9/HBhYSIo2KvRJ
        grJgGglvtHIHTrsL9KFlMDCVzg==
X-Google-Smtp-Source: ABdhPJzpFnn5JabAo7dVEOKs5pBdDMgmmfoc9e02L3NoomJjv8KOqOTBXZW82AswCXHWg65DTgHcIg==
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr33016186wrq.131.1593044859578;
        Wed, 24 Jun 2020 17:27:39 -0700 (PDT)
Received: from x1 ([2001:16b8:5cfa:bd01:8fc:c978:d44b:800])
        by smtp.gmail.com with ESMTPSA id f16sm2801079wmf.17.2020.06.24.17.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:27:38 -0700 (PDT)
Date:   Thu, 25 Jun 2020 02:27:36 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: gpio-omap: handle bias flag for gpio line
Message-ID: <20200625002736.GA24954@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tony and Linus -

I'm hoping you could give me some feedback on this approach. My goal is
to allow a userspace library (like libgpiod) to be able to set pull-up
and pull-downs on the AM3358.

I've changed gpio-omap.c so omap_gpio_set_config() will call
omap_gpio_bias() when the parameter is one of the PIN_CONFIG_BIAS_xxx
flags. That function will call gpiochip_generic_config() and the rest
proceeds normally without further changes.

However, this does require the following:
1) patch to fix return code in pcs_parse_pinconf() [0]
2) patch to add the gpio-ranges mappings [1]
2) change the compatible for the am33xx_pinmux node to "pinconf-single"
4) add "pinctrl-single,bias-pulldown" or "pinctrl-single,bias-pullup"
   property to a pin node.

I found the binding documentation [2] for the bias properties to be very
confusing as to how those 4 values work:

> - pinctrl-single,bias-pullup : array of value that are used to configure the
>   input bias pullup in the pinmux register.
>
> 		/* input, enabled pullup bits, disabled pullup bits, mask */
> 		pinctrl-single,bias-pullup = <0 1 0 1>;
> 
> - pinctrl-single,bias-pulldown : array of value that are used to configure the
>   input bias pulldown in the pinmux register.

>		/* input, enabled pulldown bits, disabled pulldown bits, mask */
>		pinctrl-single,bias-pulldown = <2 2 0 2>;

For AM3358, the pin conf register has the format [3]:

bit	attribute      value
  6	slew           { 0: fast, 1: slow }
  5     rx_active      { 0: rx disable, 1: rx enabled }
  4     pu_typesel     { 0: pulldown select, 1: pullup select }
  3     puden          { 0: pud enable, 1: disabled }
  2     mode           3 bits to selec mode 0 to 7
  1     mode
  0     mode

I figured out the values for bias-pull{up,down} properties based on:

        16      8       4       2       1
        2^4     2^3     2^2     2^1     2^0
mask    1       1       0       0       0       24
pull-up 1       1       0       0       0       24
pull-dn 0       1       0       0       0       8
none    0       0       0       0       0       0

Thus the properties are:

	pinctrl-single,bias-pulldown = < 8  8 0 24>;
	pinctrl-single,bias-pullup   = <24 24 0 24>;

For an example, I added "pinctrl-single,bias-pulldown" to the node
pinmux-ehrpwm1-pins in am335x-pocketbeagle.dts:

ehrpwm1_pins: pinmux-ehrpwm1-pins {
	pinctrl-single,pins = <
		AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE6)
		/* (U14) gpmc_a2.ehrpwm1A */
	>;
	pinctrl-single,bias-pulldown = <8 8 0 24>;
}

AM335X_PIN_GPMC_A2 is PIN18 based on the memory offset and corresponds
to gpiochip 1 line 18 (MUX_MODE1).

Here is function graph trace (note: I used -fno-inline) when gpiomon
runs with pull-down bias flag on gpiochip 1 line 18:

debian@beaglebone:~$ ./libgpiod/tools/gpiomon -B pull-down 1 18

 0)               |  gpio_ioctl() { 
 0)   2.708 us    |    gpiochip_get_desc();
 0)               |    gpiod_request() {
 0)               |      gpiod_request_commit() {
 0)   2.834 us    |        gpiochip_line_is_valid();
 0)               |        omap_gpio_request() {
 0)   2.708 us    |          omap_enable_gpio_module();
 0) + 15.375 us   |        }
 0)               |        gpiod_get_direction() {
 0)   2.500 us    |          gpiod_to_chip();
 0)   3.459 us    |          omap_gpio_get_direction();
 0) + 16.125 us   |        }
 0) + 52.875 us   |      }
 0) + 60.750 us   |    }
 0)               |    gpiod_direction_input() {
 0)               |      omap_gpio_input() {
 0)   2.500 us    |        omap_set_gpio_direction();
 0)   8.125 us    |      }
 0)               |      gpio_set_bias() {
 0)               |        gpio_set_config() {
 0)               |          gpio_do_set_config() {
 0)               |            omap_gpio_set_config() {
 0)               |              omap_gpio_bias() {
 0)               |                gpiochip_generic_config() {
 0)               |                  pinctrl_gpio_set_config() {
 0)               |                    pinctrl_get_device_gpio_range() {
 0)   3.292 us    |                      pinctrl_match_gpio_range();
 0)   8.667 us    |                    }
 0)               |                    pinconf_set_config() {
 0)               |                      pcs_pinconf_set() {
 0)   5.250 us    |                        pcs_get_function();
 0)   3.417 us    |                        pcs_readl();
 0)               |                        pcs_pinconf_clear_bias() {
 0)               |                          pcs_pinconf_set() {
 0)   3.125 us    |                            pcs_get_function();
 0)   2.833 us    |                            pcs_readl();
 0)   3.792 us    |                            pcs_writel();
 0) + 20.958 us   |                          }
 0)               |                          pcs_pinconf_set() {
 0)   2.750 us    |                            pcs_get_function();
 0)   8.083 us    |                          }
 0) + 37.333 us   |                        }
 0)   2.708 us    |                        pcs_writel();
 0) + 65.916 us   |                      }
 0) + 71.375 us   |                    }
 0) + 89.083 us   |                  }
 0) + 95.292 us   |                }
 0) ! 100.750 us  |              }
 0) ! 106.667 us  |            }
 0) ! 111.791 us  |          }
 0) ! 117.167 us  |        }
 0) ! 122.917 us  |      }
 0)   2.750 us    |      desc_to_gpio();
 0) ! 146.459 us  |    }

Thus, all it seems I can do is set a bias flag on a gpio line if the
corresponding bias property is already set for that pin in dts.  This
does not accomplish anything.

The ideal capability in my mind would be for pinctrl-single to
understand that a pin defined by a "pinctrl-single,pins" property has
both a configuration value and a mux mode value.  The current pinconf
support is based on "pinctrl-single,bias-pull{up,down}" which does not
seem useful.

I would appreciate any feedback.

Thanks,
Drew

[0] https://lore.kernel.org/linux-omap/20200608125143.GA2789203@x1/
[1] https://lore.kernel.org/linux-omap/20200602131428.GA496390@x1/
[2] Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
[3] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf (see Figure 9-51)
---
 arch/arm/boot/dts/am335x-pocketbeagle.dts |  2 ++
 arch/arm/boot/dts/am33xx-l4.dtsi          |  2 +-
 drivers/gpio/Makefile                     |  2 +-
 drivers/gpio/gpio-omap.c                  | 37 ++++++++++++++++++++---
 drivers/pinctrl/Makefile                  |  2 +-
 5 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index 22d52516b7fc..f6de2028ba53 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -221,6 +221,8 @@ ehrpwm1_pins: pinmux-ehrpwm1-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE6)	/* (U14) gpmc_a2.ehrpwm1A */
 		>;
+		pinctrl-single,bias-pulldown = <8 8 0 24>;
+		/*pinctrl-single,bias-pullup = <24 24 0 24>;*/
 	};
 
 	mmc0_pins: pinmux-mmc0-pins {
diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 903338015a68..cb8a57ed13c1 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -288,7 +288,7 @@ scm: scm@0 {
 				ranges = <0 0 0x2000>;
 
 				am33xx_pinmux: pinmux@800 {
-					compatible = "pinctrl-single";
+					compatible = "pinconf-single";
 					reg = <0x800 0x238>;
 					#pinctrl-cells = <2>;
 					pinctrl-single,register-width = <32>;
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1e4894e0bf0f..c55a5c167c43 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # generic gpio support: platform drivers, dedicated expander chips, etc
 
-ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
+ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG -fno-inline
 
 obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index b8e2ecc3eade..972629d69917 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -871,6 +871,21 @@ static int omap_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	return 0;
 }
 
+/**
+ * omap_gpio_bias() - apply configuration for a pin
+ * @gc: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to apply the configuration
+ * @config: the configuration to be applied
+ */
+static int omap_gpio_bias(struct gpio_chip *gc, unsigned offset, unsigned long config)
+{
+	int ret = 0;
+
+	ret = gpiochip_generic_config(gc, offset, config);
+	return ret;
+}
+
+
 static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 			      unsigned debounce)
 {
@@ -896,12 +911,26 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				unsigned long config)
 {
 	u32 debounce;
+	u32 config_arg;
+	int ret;
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
-		return -ENOTSUPP;
+	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
+	{
+		ret = omap_gpio_bias(chip, offset, config);
+	}
+	else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
+	{
+		debounce = pinconf_to_config_argument(config);
+		ret = omap_gpio_debounce(chip, offset, debounce);
+	}
+	else
+	{
+		ret = -ENOTSUPP;
+	}
 
-	debounce = pinconf_to_config_argument(config);
-	return omap_gpio_debounce(chip, offset, debounce);
+	return ret;
 }
 
 static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 1731b2154df9..fc62c20702c6 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # generic pinmux support
 
-subdir-ccflags-$(CONFIG_DEBUG_PINCTRL)	+= -DDEBUG
+subdir-ccflags-$(CONFIG_DEBUG_PINCTRL)	+= -DDEBUG -fno-inline
 
 obj-y				+= core.o pinctrl-utils.o
 obj-$(CONFIG_PINMUX)		+= pinmux.o
-- 
2.25.1

