Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112872FE17B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 06:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbhAUFV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 00:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbhAUFTS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 00:19:18 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188A5C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 21:18:38 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id lw17so4259322pjb.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 21:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eymIJQ/bZBaf3IO0jY0y/0sV9R1X6umj5ImReKGy4zQ=;
        b=v/BOJVU+waAj4qk228cSCiYrx8ufdpjn0kEWYQGpGmP5OpXmdK8AHPwQNaPCs99swK
         /tE19e7oqpnMq6HugKov4FVzRXjMJblVrPmor4SU9yR5g+PZ5lXZv5TN0b2i4MgatNzl
         lH9s+qeu6ograFIzOXmYt/vqVivViSCtU51JHqhl/izb9MULwKFZlegUcX55HfIQ0Czg
         nJbP+5HabEGerUHLrMntJAlFtq5jcJToFG3JOETiJyGhnWM/U7PZ3SPYTNvgLfPTggkF
         YeDtkiR6ROAhwDWkSNAjnAhSZEtUJEfse1EKmTi7wDA0VK9nZcRKGOcK0wBDk9ZwZr+b
         mhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eymIJQ/bZBaf3IO0jY0y/0sV9R1X6umj5ImReKGy4zQ=;
        b=PF0Mc6AX9ZzZoG4RndLpmsj1UXUqu1YkKEFB7tL+MBkhCvjKhOYsPXF4gtq7XK0fcO
         SwelC+V4VdP8afT/GjlRwmWvLXc6KPIg9BByl83LOQRBJ/xfjiGGemP5TLCVvR0uyODc
         2boenSBHjG/NzL3FLg2SAJTWkgN9PVL3DrRCww/e9JNgks7d3G4K22/YM8J+INQ0F+rv
         xYPwyfk8sP2qSf97wysXHiz8iO3iLeCM60OcRmS57C0KE7oFJEtsiICBbO7bIg4VLr2t
         qol+yFprgec9pKR8pxZqfhCh3naVe0WdPdxZCqm8DICwdiaWitbmWwU4wod4ggTr+GQV
         Jdnw==
X-Gm-Message-State: AOAM533ZwJNKSOYxLHbToWfvrz9mFXdHHkVPhPFqqrtN+X8Ze1JoAMGe
        2Sbiy7oEVPkX7aKKQATaQVOdztyqI61aFNVz
X-Google-Smtp-Source: ABdhPJywd+m6KsXdeJhxe8d0WULkMNsq9hCkrTUs4JVA5GkXZXWKJEzdNkI9Is6Wzcqi1l2eZGsgFQ==
X-Received: by 2002:a17:90a:470f:: with SMTP id h15mr9925097pjg.179.1611206317169;
        Wed, 20 Jan 2021 21:18:37 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:d139:25ba:c4c6:2929])
        by smtp.gmail.com with ESMTPSA id b7sm3907184pff.96.2021.01.20.21.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 21:18:36 -0800 (PST)
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
Subject: [RFC PATCH] pinctrl: pinmux: Add pinmux-set debugfs file
Date:   Wed, 20 Jan 2021 21:18:07 -0800
Message-Id: <20210121051806.623743-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This RFC is a change in approach from my previous RFC patch [1]. It adds
"pinnux-set" to debugfs. A function and group on the pin control device
will be activated when 2 integers "<function-selector> <group-selector>"
are written to the file. The debugfs write operation pinmux_set_write()
handles this by calling ops->set_mux() with fsel and gsel.

RFC question: should pinmux-set take function name and group name
instead of the selector numbers?

The following is an example on the PocketBeagle [2] which has the AM3358
SoC and binds to pinctrl-single. I added this to the device tree [3] to
represent two of the pins on the expansion header as an example: P1.36
and P2.01. Both of these header pins are designed to be set to PWM mode
by default [4] but can now be set back to gpio mode through pinmux-set.

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

root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# cat pinmux-functions
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

root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# echo '2 2' > pinmux-set

Extra debug output that I added shows that pinctrl-single's set_mux()
has set the register correctly for gpio mode:

pinmux core: DEBUG pinmux_set_write(): returned 0
pinmux core: DEBUG pinmux_set_write(): buf=[2 2]
pinmux core: DEBUG pinmux_set_write(): sscanf(2,2)
pinmux core: DEBUG pinmux_set_write(): call ops->set_mux(fsel=2, gsel=2)
pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): call pinmux_generic_get_function() on fselector=2
pinctrl-single 44e10800.pinmux: enabling (null) function2
pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): func->nvals=1
pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): offset=0x190 old_val=0x21 val=0x2f

Activate the pinmux_P1_36_pwm_pin function (fsel 6):

root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# echo '6 6' > pinmux-set

pinctrl-single set_mux() is able to set register correctly for pwm mode:

pinmux core: DEBUG pinmux_set_write(): returned 0
pinmux core: DEBUG pinmux_set_write(): buf=[6 6]
pinmux core: DEBUG pinmux_set_write(): sscanf(6,6)
pinmux core: DEBUG pinmux_set_write(): call ops->set_mux(fsel=6, gsel=6)
pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): call pinmux_generic_get_function() on fselector=6
pinctrl-single 44e10800.pinmux: enabling (null) function6
pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): func->nvals=1
pinctrl-single 44e10800.pinmux: DEBUG pcs_set_mux(): offset=0x190 old_val=0x2f val=0x21

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
 drivers/pinctrl/pinmux.c | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index bab888fe3f8e..300e2b3d0ea8 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -673,6 +673,69 @@ void pinmux_show_setting(struct seq_file *s,
 DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
 DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 
+static ssize_t pinmux_set_write(struct file *file, const char __user *user_buf,
+				   size_t cnt, loff_t *ppos)
+{
+	int err;
+	int fsel;
+	int gsel;
+	int ret;
+	char *buf;
+	struct seq_file *sfile;
+	struct pinctrl_dev *pctldev;
+	const struct pinmux_ops *ops;
+
+	if (*ppos != 0)
+		return -EINVAL;
+
+	if (cnt == 0)
+		return 0;
+
+	buf = memdup_user_nul(user_buf, cnt);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	if (buf[cnt - 1] == '\n')
+		buf[cnt - 1] = '\0';
+
+	ret = sscanf(buf, "%d %d", &fsel, &gsel);
+	if (ret != 2) {
+		pr_warn("%s: sscanf() expects '<fsel> <gsel>'", __func__);
+		err = -EINVAL;
+		goto err_freebuf;
+	}
+
+	sfile = file->private_data;
+	pctldev = sfile->private;
+	ops = pctldev->desc->pmxops;
+	ret = ops->set_mux(pctldev, fsel, gsel);
+	if (ret != 0) {
+		pr_warn("%s(): set_mux() failed: %d", __func__, ret);
+		err = -EINVAL;
+		goto err_freebuf;
+	}
+	kfree(buf);
+	return cnt;
+
+err_freebuf:
+	kfree(buf);
+	return err;
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
+	.write = pinmux_set_write,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
@@ -680,6 +743,8 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 			    devroot, pctldev, &pinmux_functions_fops);
 	debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
 			    devroot, pctldev, &pinmux_pins_fops);
+	debugfs_create_file("pinmux-set", S_IFREG | S_IWUSR,
+			    devroot, pctldev, &pinmux_set_ops);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.25.1

