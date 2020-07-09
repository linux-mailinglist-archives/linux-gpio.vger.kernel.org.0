Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C26F21A5DA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgGIRaM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgGIRaM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:30:12 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FD1C08C5CE
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 10:30:11 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id rk21so3160953ejb.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 10:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=F/dfHtnsJB9MOcXbZhwcjlMKxkwZqMB6l2sufAGo788=;
        b=K1hK+bqghnz2MI0oGaGgc1pxDDAgvXqEFggc78Ax1qDP5G5SopCbkoW8lrKdiTBxjx
         +EqtwM1Q65rqSqQwCeDQLhv8R+kcOmFIuWnkkxHEcChOoJE0NXFZFptL4lngsqp6aUe7
         CbxX7XxRdJDF1tfcyivKNwWV39sxvkyl4St9nFSWZT0B7lv054oMpgelbXWG2Rva/yVB
         6zfGPDhEU6++LSBsv2lmFZ7giMFAUcyTMDHVoAQhdg8ss83vMnCP9Gie4CdO+AWkVg7V
         Qy2cYwco4VmAcNTAFz9yNbpKzhi9RQQDoOkRNvUAAg4gE7zZ9LANqShJH2UDCrIUnBFS
         KaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=F/dfHtnsJB9MOcXbZhwcjlMKxkwZqMB6l2sufAGo788=;
        b=NJyNtS+6i7OkZU/Xy10iX7JVkZiguPfDKhXu4a5r5FP1bowPLHvGLQDrm2fufmHdJp
         fOkOA0OPfUtyKPW+B93G5Bp9giymJZ+UJLEbvJceyrTUZ1A4FLKbbgkS0fUmMd6RPCzo
         vbs+LmU6X0+kmyZZ1hD8eHzKwznG1qsmJ3uMr93o6O2styD5stRWWKlGqxIijvDHIljG
         DVD6ST2v60Y9uviSx28PvyBAQnm+M6bqjmLpAVVam6I6llH5+cNe5gbj9f9ExTcTpaKk
         CVSwbdyrw4AGOtD8KwX7vWRkGsgilLdh1PRpcNG+bMFiJAXyfpeoJQH7OrMywB+XOUAU
         2apA==
X-Gm-Message-State: AOAM533bmhQ+XGCYNTaTJrF+m8CYf3OgfuYGP4TG7YG4OZO+n4ZalurL
        Qcvk5UJrEMvdvuEOLFYrSiBV5g==
X-Google-Smtp-Source: ABdhPJy4azb0lAJom66K1CZw3JBvjqNnZK8mqimmkNmMod3QpRruZvs6oLa3Al9hlHMxrDJiq+heVQ==
X-Received: by 2002:a17:906:d286:: with SMTP id ay6mr48901383ejb.400.1594315810469;
        Thu, 09 Jul 2020 10:30:10 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id m16sm2151745eji.23.2020.07.09.10.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:30:09 -0700 (PDT)
Date:   Thu, 9 Jul 2020 19:30:07 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [RFC] gpio-omap: handle bias flags
Message-ID: <20200709173007.GA739269@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tony - what do you think of this approach?

I have added this in arch/arm/boot/dts/am335x-pocketbeagle.dts to
describe the pins which will be gpio lines accessed by userspace
through gpiod ioctl() calls:

&am33xx_pinmux {

	pinctrl-names = "default";
	pinctrl-0 =   < &gpio_pins >;

	gpio_pins: pinmux-gpio-pins {
		/* MUX_MODE7 is gpio mode */
		pinctrl-single,pins = <
			/* PIN 95 and PIN 94 */
			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT, MUX_MODE7)
			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_INPUT, MUX_MODE7)
			/* PIN 100 */
			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_INPUT, MUX_MODE7)
			/* PIN 18 */
			AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_INPUT, MUX_MODE7)
		>;
		pinctrl-single,bias-pullup   = < 8 16  8 24>;
		pinctrl-single,bias-pulldown = < 8  0  8 24>;
	};

The "pinctrl-single,bias-pullup" and "pinctrl-single,bias-pulldown"
pinconf properties are set for the gpio_pins pin group.  The input
value 0x8 causes both to be inactive but still added to the
PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.  This is necessary for
pcs_pinconf_set() to be able to be able to set the bias config.

For AM335x, the pin conf register has the format [0]:

bit	attribute      value
  6	slew           { 0: fast, 1: slow }
  5     rx_active      { 0: rx disable, 1: rx enabled }
  4     pu_typesel     { 0: pulldown select, 1: pullup select }
  3     puden          { 0: pud enable, 1: disabled }
  2     mode           3 bits to selec mode 0 to 7
  1     mode
  0     mode

Here is how I derived the values:

pinctrl-single,bias-pullup   = <[input] [enabled] [disable] [mask]>;
pinctrl-single,bias-pullup   = <     8        16        8      24 >;

          2^5    2^4    2^3    2^2    2^1    2^0  | 
         0x20   0x10   0x08   0x04   0x02   0x01  |
           32     16      8      4      2      1  | 
-------------------------------------------------------  
input       x      0      1     x      x      x   |   8 
enabled     x      1      0     x      x      x   |  16
disabled    x      0      1     x      x      x   |   8
mask        x      1      1     x      x      x   |  24


pinctrl-single,bias-pulldown = <[input] [enabled] [disable] [mask]>;
pinctrl-single,bias-pulldown = <     8         0        8      24 >;

          2^5    2^4    2^3    2^2    2^1    2^0  | 
         0x20   0x10   0x08   0x04   0x02   0x01  |
           32     16      8      4      2      1  | 
-------------------------------------------------------  
input       x      0      1     x      x      x   |   8 
enabled     x      0      0     x      x      x   |   0 
disabled    x      0      1     x      x      x   |   8
mask        x      1      1     x      x      x   |  24

The pinconf bias properties get applied to the pin group during boot
when pcs_pinconf_group_set() calls pcs_pinconf_set() for each pin. Here
is the output from function_graph tracer:

              pinconf_apply_setting() {
                pcs_pinconf_group_set() {
                  pinctrl_generic_get_group_pins();
                  pcs_pinconf_set() {
                    pcs_get_function() {
                      pinmux_generic_get_function();
                    }
                    pcs_readl();
                    pcs_writel();
                    pcs_readl();
                    pcs_writel();
                  }
                  pcs_pinconf_set() {
                    pcs_get_function() {
                      pinmux_generic_get_function();
                    }
                    pcs_readl();
                    pcs_writel();
                    pcs_readl();
                    pcs_writel();
                  }
                  pcs_pinconf_set() {
                    pcs_get_function() {
                      pinmux_generic_get_function();
                    }
                    pcs_readl();
                    pcs_writel();
                    pcs_readl();
                    pcs_writel();
                  }
                  pcs_pinconf_set() {
                    pcs_get_function() {
                      pinmux_generic_get_function();
                    }
                    pcs_readl();
                    pcs_writel();
                    pcs_readl();
                    pcs_writel();
                  }
                }
              }

After boot, I then use gpiomon utility with bias flags:

	gpiomon -B pull-up 3 14

gpiochip 3 line 14 maps to pin 100 which is AM335X_PIN_MCASP0_ACLKX at
offset 0x990.  For this to succeed, I modified omap_gpio_set_config() in
gpio_omap.c to handle PIN_CONFIG_BIAS_PULL_{UP,DOWN} by calling
gpiochip_generic_config().  Here is output of function_grapher tracer:

             gpio_ioctl() {
               gpiochip_get_desc();
               gpiod_request() {
                 gpiod_request_commit() {
                   gpiochip_line_is_valid();
                   omap_gpio_request() {
                     omap_gpio_runtime_resume() {
                       omap_gpio_unidle() {
                         omap_gpio_restore_context();
                       }
                     }
                     omap_enable_gpio_module();
                   }
                   gpiod_get_direction() {
                     gpiod_to_chip();
                     omap_gpio_get_direction();
                   }
                 }
               }
               gpiod_direction_input() {
                 omap_gpio_input() {
                   omap_set_gpio_direction();
                 }
                 gpio_set_bias() {
                   gpio_set_config() {
                     gpio_do_set_config() {
                       omap_gpio_set_config() {
                         gpiochip_generic_config() {
                           pinctrl_gpio_set_config() {
                             pinctrl_get_device_gpio_range() {
                               pinctrl_match_gpio_range();
                             }
                             pinconf_set_config() {
                               pcs_pinconf_set() {
                                 pcs_get_function() {
                                   pinmux_generic_get_function();
                                 }
                                 pcs_readl();
                                 pcs_pinconf_clear_bias.constprop.0();
                                 pcs_writel();

Thanks,
Drew

[0] http://www.ti.com/lit/ds/symlink/am3358.pdf
---
 drivers/gpio/gpio-omap.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index b8e2ecc3eade..a471a152f318 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -896,12 +896,25 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				unsigned long config)
 {
 	u32 debounce;
+	int ret;
 
-	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
-		return -ENOTSUPP;
+	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
+	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
+	{
+		ret = gpiochip_generic_config(chip, offset, config);
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
-- 
2.25.1
