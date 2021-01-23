Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFEE3013BC
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jan 2021 08:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbhAWHaS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jan 2021 02:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbhAWHaS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2021 02:30:18 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F97C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 23:29:37 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id c22so5374307pgg.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 23:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3qtoCVz889Dd6MmoLPfSY63i8AWbbeBcxd1/WQN1oXk=;
        b=fiqkZJxXzWUBN8DsIQW8UqLrLanNVVv8SD8/vfW8smFTbU+/r/ZO4yFi1L7E2R7Jxn
         aVmXxf/7oRT6lVK7GZilRgHdMjuPJAd+d9/AILV9pAoqOmecI/dz1bJtp/Yfb3V67Ngb
         SUxAo1wREO29eDnegaSV3DlJzG7oPTjTpro1EcJpEO6di+OfY7d7FK878rNGgceaj5K1
         vlNoXJ6KTsi3MbW4wWRSFLvXjpV008gf2LNlaozUL5xq+yYcFfUtDkGrELAoibcTn23Y
         LV4Yyhq1qgd+Qphs8Jy4NZqSrBeBAued8BFghVb6OSM2SPl5SkIYscCPEJUZ2ztSG2Fj
         JtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3qtoCVz889Dd6MmoLPfSY63i8AWbbeBcxd1/WQN1oXk=;
        b=TCLPVlXqdHtnCdOQhUJExt4LV3lYKHJxRBBqphB+wU+WvhYLfnIsZvQGLZTR10fLYq
         mp3ILlIYPwBmhAm0pqFsL0+O8LIHYFprSSbFAt9Rb4qG2SkTq+zqW0zkes1tIUQXUKCN
         uecx6fK7sdAX1tISN0zAwshLX+DZ+KIHy/AFyPAMuXgnOM9CJ3W09L8yGFHxc7Id4x34
         dAlqNY+NDuTtWJkjWdODDKAW/X07H5mPm6xH/o75bfWmJ2tPm+cwp/CjPj3S7aI/65SP
         OEJ3mMd6K8GHyoYs3QF7tPGCedqdlRn72RSCuniO4jddaYzOEzzcs0j8xuP9kgMtFsUu
         sNrQ==
X-Gm-Message-State: AOAM530296WqRYJJT+lrATL1tH8cJ3a/rW7gp2cTij01db02/KJUq1Jq
        jZvhggrbk5dBFNmp9mvSMzwuI8ijyVP70Q==
X-Google-Smtp-Source: ABdhPJxKRkbnE2XKVull8XSJHQAwkMWiFNsGKShG/n5LNJvYg5RYJfQNKftdXke8Cvoasx/wJRWMLw==
X-Received: by 2002:a63:1965:: with SMTP id 37mr8616474pgz.349.1611386976730;
        Fri, 22 Jan 2021 23:29:36 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:7a75:92bf:7a96:770e])
        by smtp.gmail.com with ESMTPSA id oa10sm10643546pjb.45.2021.01.22.23.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 23:29:35 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC PATCH v2] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Fri, 22 Jan 2021 22:49:11 -0800
Message-Id: <20210123064909.466225-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This RFC is a change in approach from my previous RFC patch [1]. It adds
"pinnux-select" to debugfs. Function and group on the pin control device
will be activated when 2 integers "<function-selector> <group-selector>"
are written to the file. The debugfs write operation pinmux_select()
handles this by calling ops->set_mux() with fsel and gsel.

RFC notes:
I'm not sure if this is worth including in the commit message but the
following is an example on the PocketBeagle [2] which has the TI AM3358
SoC and binds to pinctrl-single. I added this to the device tree [3] to
represent two of the pins on the expansion header as an example: P1.36
and P2.01. Both of these header pins are designed to be set to PWM mode
by default [4] but can be set back to gpio mode through pinmux-select.

	&am33xx_pinmux {

	/* use the pin controller itself as the owner device */
	pinctrl-names = "default",
			"P1_36_gpio", "P1_36_gpio_pu", "P1_36_gpio_pd",
			"P1_36_gpio_input", "P1_36_pwm",
			"P2_01_gpio", "P2_01_gpio_pu", "P2_01_gpio_pd",
			"P2_01_gpio_input", "P2_01_pwm";

	/* set hog for default mode */
	pinctrl-0 = < &P1_36_default_pin &P2_01_default_pin >;
	/* these will create pin functions for each mode */
	pinctrl-1 = <&P1_36_gpio_pin>;
	pinctrl-2 = <&P1_36_gpio_pu_pin>;
	pinctrl-3 = <&P1_36_gpio_pd_pin>;
	pinctrl-4 = <&P1_36_gpio_input_pin>;
	pinctrl-5 = <&P1_36_pwm_pin>;
	pinctrl-6 = <&P2_01_default_pin>;
	pinctrl-7 = <&P2_01_gpio_pin>;
	pinctrl-8 = <&P2_01_gpio_pu_pin>;
	pinctrl-9 = <&P2_01_gpio_pd_pin>;
	pinctrl-10 = <&P2_01_gpio_input_pin>;
	pinctrl-11 = <&P2_01_pwm_pin>;

	/* P1_36 (ZCZ ball A13) ehrpwm0a */
	P1_36_default_pin: pinmux_P1_36_default_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE1) >; };
	P1_36_gpio_pin: pinmux_P1_36_gpio_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_OUTPUT | INPUT_EN | MUX_MODE7) >; };
	P1_36_gpio_pu_pin: pinmux_P1_36_gpio_pu_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE7) >; };
	P1_36_gpio_pd_pin: pinmux_P1_36_gpio_pd_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE7) >; };
	P1_36_gpio_input_pin: pinmux_P1_36_gpio_input_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_INPUT | MUX_MODE7) >; };
	P1_36_pwm_pin: pinmux_P1_36_pwm_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE1) >; };
	P1_36_spi_sclk_pin: pinmux_P1_36_spi_sclk_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE3) >; };
	P1_36_pruout_pin: pinmux_P1_36_pruout_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE5) >; };
	P1_36_pruin_pin: pinmux_P1_36_pruin_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0990, PIN_INPUT | MUX_MODE6) >; };

	/* P2_01 (ZCZ ball U14) ehrpwm1a */
	P2_01_default_pin: pinmux_P2_01_default_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE6) >; };
	P2_01_gpio_pin: pinmux_P2_01_gpio_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT | INPUT_EN | MUX_MODE7) >; };
	P2_01_gpio_pu_pin: pinmux_P2_01_gpio_pu_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLUP | INPUT_EN | MUX_MODE7) >; };
	P2_01_gpio_pd_pin: pinmux_P2_01_gpio_pd_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE7) >; };
	P2_01_gpio_input_pin: pinmux_P2_01_gpio_input_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_INPUT | MUX_MODE7) >; };
	P2_01_pwm_pin: pinmux_P2_01_pwm_pin { pinctrl-single,pins = <
		AM33XX_IOPAD(0x0848, PIN_OUTPUT_PULLDOWN | INPUT_EN | MUX_MODE6) >; };

The following shows the pin functions registered for the pin controller:

function: pinmux_P1_36_default_pin, groups = [ pinmux_P1_36_default_pin ]
function: pinmux_P2_01_default_pin, groups = [ pinmux_P2_01_default_pin ]
function: pinmux_P1_36_gpio_pin, groups = [ pinmux_P1_36_gpio_pin ]
function: pinmux_P1_36_gpio_pu_pin, groups = [ pinmux_P1_36_gpio_pu_pin ]
function: pinmux_P1_36_gpio_pd_pin, groups = [ pinmux_P1_36_gpio_pd_pin ]
function: pinmux_P1_36_gpio_input_pin, groups = [ pinmux_P1_36_gpio_input_pin ]
function: pinmux_P1_36_pwm_pin, groups = [ pinmux_P1_36_pwm_pin ]
function: pinmux_P2_01_gpio_pin, groups = [ pinmux_P2_01_gpio_pin ]
function: pinmux_P2_01_gpio_pu_pin, groups = [ pinmux_P2_01_gpio_pu_pin ]
function: pinmux_P2_01_gpio_pd_pin, groups = [ pinmux_P2_01_gpio_pd_pin ]
function: pinmux_P2_01_gpio_input_pin, groups = [ pinmux_P2_01_gpio_input_pin ]
function: pinmux_P2_01_pwm_pin, groups = [ pinmux_P2_01_pwm_pin ]
function: pinmux-uart0-pins, groups = [ pinmux-uart0-pins ]
function: pinmux-mmc0-pins, groups = [ pinmux-mmc0-pins ]
function: pinmux-i2c0-pins, groups = [ pinmux-i2c0-pins ]

Activate the pinmux_P1_36_gpio_pin function (fsel 2):

Extra debug output that I added shows that pinctrl-single's set_mux()
has set the register correctly for gpio mode:

pinmux core: pinmux_select(): returned 0
pinmux core: pinmux_select(): buf=[2 2]
pinmux core: pinmux_select(): sscanf(2,2)
pinmux core: pinmux_select(): call ops->set_mux(fsel=2, gsel=2)
pinctrl-single 44e10800.pinmux: enabling (null) function2
pinctrl-single 44e10800.pinmux: pcs_set_mux(): offset=0x190 old_val=0x21 val=0x2f

Activate the pinmux_P1_36_pwm_pin function (fsel 6):

pinctrl-single set_mux() is able to set register correctly for pwm mode:

pinmux core: pinmux_select(): returned 0
pinmux core: pinmux_select(): buf=[6 6]
pinmux core: pinmux_select(): sscanf(6,6)
pinmux core: pinmux_select(): call ops->set_mux(fsel=6, gsel=6)
pinctrl-single 44e10800.pinmux: enabling (null) function6
pinctrl-single 44e10800.pinmux: pcs_set_mux(): offset=0x190 old_val=0x2f val=0x21

I would appreciate any feedback on this approach.  Thank you!

-Drew

[1] https://lore.kernel.org/linux-gpio/20201218045134.4158709-1-drew@beagleboard.org/
[2] https://beagleboard.org/pocket
[3] arch/arm/boot/dts/am335x-pocketbeagle.dts
[4] https://github.com/beagleboard/pocketbeagle/wiki/System-Reference-Manual#70-connectors-

Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Jason Kridner <jkridner@beagleboard.org>,
Cc: Robert Nelson <robertcnelson@beagleboard.org>,
Cc: Linus Walleij <linus.walleij@linaro.org>,
Cc: Tony Lindgren <tony@atomide.com>,
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinmux.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

v2 changes:
- rename debugfs file "pinmux-set" to "pinmux-select"
- renmae pinmux_set_write() to pinmux_select()
- switch from memdup_user_nul() to strncpy_from_user()
- switch from pr_warn() to dev_err()

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index bab888fe3f8e..326b3fc41b55 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -673,6 +673,55 @@ void pinmux_show_setting(struct seq_file *s,
 DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
 DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 
+static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
+				   size_t cnt, loff_t *ppos)
+{
+	struct seq_file *sfile = file->private_data;
+	struct pinctrl_dev *pctldev = sfile->private;
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	int fsel, gsel, ret;
+	// RFC note: two integers separated by a space should never exceed 16
+	char buf[16];
+
+	if (*ppos != 0)
+		return -EINVAL;
+
+	ret = strncpy_from_user(buf, user_buf, cnt);
+	if (ret < 0)
+		return ret;
+	buf[cnt] = '\0';
+	if (buf[cnt - 1] == '\n')
+		buf[cnt - 1] = '\0';
+
+	ret = sscanf(buf, "%d %d", &fsel, &gsel);
+	if (ret != 2) {
+		dev_err(pctldev->dev, "%s: sscanf() expects '<fsel> <gsel>'", __func__);
+		return -EINVAL;
+	}
+
+	ret = ops->set_mux(pctldev, fsel, gsel);
+	if (ret != 0) {
+		dev_err(pctldev->dev, "%s(): set_mux() failed: %d", __func__, ret);
+		return -EINVAL;
+	}
+
+	return cnt;
+}
+
+static int pinmux_set_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static const struct file_operations pinmux_set_ops = {
+	.owner = THIS_MODULE,
+	.open = pinmux_set_open,
+	.read = seq_read,
+	.write = pinmux_select,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
@@ -680,6 +729,8 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 			    devroot, pctldev, &pinmux_functions_fops);
 	debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
 			    devroot, pctldev, &pinmux_pins_fops);
+	debugfs_create_file("pinmux-select", 0200,
+			    devroot, pctldev, &pinmux_set_ops);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.25.1

