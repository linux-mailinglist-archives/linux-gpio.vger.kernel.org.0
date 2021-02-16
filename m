Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA53C31D2CF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 23:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhBPWrF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 17:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhBPWrD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2021 17:47:03 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9368FC06178A
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 14:45:44 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id c19so236227pjq.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 14:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6QiOBS6BUHnryLZxvzeTgumc3kOt1flt/TgOQxcQpDo=;
        b=kV4K7oarDSe88yNGSyGvoITKYZU54zXvY7GsEyS8DnsftNPPZfbg1g0/rtvJVnh9RY
         6QTaB4SWs4YPF5SrcGS71Qj2L54rAScd8G/3AYkqDMyFBzXrx9gd26Ma4UbybqayzaQU
         e9Q0O67rsuWN/2z/zhH0wP1zAiR35inm0baLQ+F1Dkc5VB4j+9GsD9xvuxYFw0ywv8uF
         B+S0PYt+CNb5gl3C6DCxlEoTeTFVQr+O6t9Q6/1F5ixSSHZk01d4wI7tYNYpqD1OzMsB
         OgQt0HB5K0aNT0mtaEkmg9iPzrm6WBoV2DT5tHHzP/Q/6Flk1Kwcua1rXV5iNNKOP7Ns
         60Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6QiOBS6BUHnryLZxvzeTgumc3kOt1flt/TgOQxcQpDo=;
        b=aHrnUVXBMu/OO9mX3VQaxpRdmKe7CucsSy2C1/ny33S1qViBrI7evwrG+MSXLyiNt1
         zPtYQQcWkRaPc4bjx3Y3YLOpm00NOksrSA802RDdrIXMIHWdSEd3xSJdBI08ed4qUwv2
         JnWC/VIDo6Cs/HTsB/X4R0TrBLqHgG7WJUbWcO8+1dw6xPA0JrauL81lF7SOm9bM7F4q
         EK5vqRYXFU1BpTeweso4bRM+G5Kt6Ejicrk+uGRBg6/iX/V2CLVuWD6KbCAcMV6MCifq
         zJ6/I83Oddc4Gi73jm6nhxNTUBmnwoacCqDKgduUh1ZDJLD0c9+/wIsR5RUj3hukqrrm
         y6Pw==
X-Gm-Message-State: AOAM530BQUfqpFKcDR2/ZgoeG3TvFRZMby3KipqqBbLrjm1OHx5PGbiX
        GOt7CfAhEcFSNRF/IjMu5zG7ng==
X-Google-Smtp-Source: ABdhPJzq/fFJMriHhU/Nmr6DX3rLr81/13JNJCvYn1uEDQonGF+8w6lCIuWe0oq37UVG/ukUxxko/w==
X-Received: by 2002:a17:902:a714:b029:e3:1cd:a033 with SMTP id w20-20020a170902a714b02900e301cda033mr21198535plq.27.1613515544167;
        Tue, 16 Feb 2021 14:45:44 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:4e06:8d2c:6f9:5b31])
        by smtp.gmail.com with ESMTPSA id 184sm1922465pfc.176.2021.02.16.14.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 14:45:43 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v6 2/3] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Tue, 16 Feb 2021 14:44:54 -0800
Message-Id: <20210216224455.1504008-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216224455.1504008-1-drew@beagleboard.org>
References: <20210216224455.1504008-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add "pinmux-select" to debugfs which will activate a function and group:

  echo "<function-name group-name>" > pinmux-select

The write operation pinmux_select() handles this by checking that the
names map to valid selectors and then calling ops->set_mux().

The existing "pinmux-functions" debugfs file lists the pin functions
registered for the pin controller. For example:

  function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
  function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
  function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
  function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
  function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
  function: pinmux-spi1, groups = [ pinmux-spi1-pins ]

To activate function pinmux-i2c1 and group pinmux-i2c1-pins:

  echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinmux.c | 102 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c651b2db0925..08f336e4246c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -23,6 +23,7 @@
 #include <linux/string.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/ctype.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinmux.h>
 #include "core.h"
@@ -673,6 +674,105 @@ void pinmux_show_setting(struct seq_file *s,
 DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
 DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 
+#define PINMUX_SELECT_MAX 50
+static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
+				   size_t len, loff_t *ppos)
+{
+	struct seq_file *sfile = file->private_data;
+	struct pinctrl_dev *pctldev = sfile->private;
+	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
+	const char *const *groups;
+	char *buf, *fname, *gname;
+	unsigned int num_groups;
+	int fsel, gsel, ret;
+
+	if (len > PINMUX_SELECT_MAX)
+		return -ENOMEM;
+
+	buf = kzalloc(PINMUX_SELECT_MAX, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = strncpy_from_user(buf, user_buf, PINMUX_SELECT_MAX);
+	if (ret < 0)
+		goto exit_free_buf;
+	buf[len-1] = '\0';
+
+	/* remove leading and trailing spaces of input buffer */
+	fname = strstrip(buf);
+	if (*fname == '\0') {
+		ret = -EINVAL;
+		goto exit_free_buf;
+	}
+
+	/* find a separator like a space character */
+	for (gname = fname; !isspace(*gname); gname++) {
+		if (*gname == '\0') {
+			ret = -EINVAL;
+			goto exit_free_buf;
+		}
+	}
+	*gname = '\0';
+
+	/* drop extra spaces between function and group name */
+	gname = skip_spaces(gname + 1);
+	if (*gname == '\0') {
+		ret = -EINVAL;
+		goto exit_free_buf;
+	}
+
+	fsel = pinmux_func_name_to_selector(pctldev, fname);
+	if (fsel < 0) {
+		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
+		ret = fsel;
+		goto exit_free_buf;
+	}
+
+	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
+	if (ret) {
+		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
+		goto exit_free_buf;
+	}
+
+	ret = match_string(groups, num_groups, gname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "invalid group %s", gname);
+		goto exit_free_buf;
+	}
+
+	gsel = pinctrl_get_group_selector(pctldev, gname);
+	if (gsel < 0) {
+		dev_err(pctldev->dev, "failed to get group selector for %s", gname);
+		ret = gsel;
+		goto exit_free_buf;
+	}
+
+	ret = pmxops->set_mux(pctldev, fsel, gsel);
+	if (ret) {
+		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
+		goto exit_free_buf;
+	}
+	ret = len;
+
+exit_free_buf:
+	kfree(buf);
+
+	return ret;
+}
+
+static int pinmux_select_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static const struct file_operations pinmux_select_ops = {
+	.owner = THIS_MODULE,
+	.open = pinmux_select_open,
+	.write = pinmux_select,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
@@ -680,6 +780,8 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 			    devroot, pctldev, &pinmux_functions_fops);
 	debugfs_create_file("pinmux-pins", 0444,
 			    devroot, pctldev, &pinmux_pins_fops);
+	debugfs_create_file("pinmux-select", 0200,
+			    devroot, pctldev, &pinmux_select_ops);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.25.1

