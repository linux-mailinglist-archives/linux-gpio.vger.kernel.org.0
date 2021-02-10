Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FC931726E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 22:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhBJVf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 16:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhBJVfy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 16:35:54 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7B3C061788
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 13:34:36 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id cl8so1900032pjb.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 13:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JfzPRn0smx1X0bwrbbLGl5ibsIc3skfpmEQCK6QDBoA=;
        b=qi3xlsU/JgsSiXc7YqTY6c1QKaVb09wkTPP5vGp4OY35gMAH1cR4+pSjK1ogMMJEvH
         XtXgUHUmfa5i6ya6uLt+KAzVWpZDZp322DQsb8NahcNEgh+ilqn6leTQobtPPJWeQlwY
         2ybLNNi3RgDSoPhcwlZFtW0RsoTRxsYqe9g1VP49c2x8oughvMOKxzuLvNyigiEqB/ZQ
         YKhQMzFof0LfLYko8hUdK5QEh2CqCKmZyuTXs8gpVfMbyNOVElgvtlldHFh4boNtE/UT
         QFTgB46VGmWC5fSNL8yp35WNE1US738RzRftv2I8ua/nMqBtR4m3mceEO2+1lLysz31z
         nltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JfzPRn0smx1X0bwrbbLGl5ibsIc3skfpmEQCK6QDBoA=;
        b=CvMtTj6Q6st+himTV1h6CYXv89rYaiAJNUBpLAVPu1qg7u583WQ270YfEbiyOZBomz
         kmDbiC6+EDCN9r9llu2ngFNjWyICQFSSs5OIeyzWQBlh0T8IFANxC7aOYc8+trHID6J0
         Qu44WZmPoRz+SxFH5NUsPhoLa/FNBcBHyRGlfd20WLosJIBMRkDDlqYdmx1YeVy2trYi
         3x1dCgx8TJe7QKI//E3aMEc9FKb3nC+otlznLg1vaRIv0kefggmnLBmJKnTJq4hhEoJw
         rmnLtpWuHWocB+n/i33CpIeBKyhZFclUxskHYjQkAcoogN41v0XdLHDFE1UTAAX/IlXX
         Mpog==
X-Gm-Message-State: AOAM5329IFs/PAfIn8pj/m5OwbnX4XkR2FRwlv57jFmOS49ZwXJzNaXT
        SM67ascVeFUu/w6AYHT5hBRpdw==
X-Google-Smtp-Source: ABdhPJxHFIMX/VD2j3TmcZnktIQuoyb6ikBVBsiJ4AHlkUldpqIQc2V3Fidhws+JdM5EaKfkhfbN1Q==
X-Received: by 2002:a17:902:e812:b029:de:57c4:f6f2 with SMTP id u18-20020a170902e812b02900de57c4f6f2mr4846246plg.37.1612992876007;
        Wed, 10 Feb 2021 13:34:36 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id h8sm3006928pfv.154.2021.02.10.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 13:34:35 -0800 (PST)
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
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Wed, 10 Feb 2021 13:34:20 -0800
Message-Id: <20210210213419.227285-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210213419.227285-1-drew@beagleboard.org>
References: <20210210213419.227285-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add "pinmux-select" to debugfs which will activate a function and group
when 2 integers "<function-selector> <group-selector>" are written to
the file. The write operation pinmux_select() handles this by checking
if fsel and gsel are valid selectors and then calling ops->set_mux().

The existing "pinmux-functions" debugfs file lists the pin functions
registered for the pin controller. For example:

function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
function: pinmux-spi1, groups = [ pinmux-spi1-pins ]

To activate function pinmux-i2c1 and group pinmux-i2c1-pins:

echo pinmux-i2c1 pinmux-i2c1-pins > mux-select

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinmux.c | 107 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c651b2db0925..23fa32f0a067 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -673,6 +673,111 @@ void pinmux_show_setting(struct seq_file *s,
 DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
 DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 
+#define PINMUX_MAX_NAME 64
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
+	if (len > (PINMUX_MAX_NAME * 2)) {
+		dev_err(pctldev->dev, "write too big for buffer");
+		return -EINVAL;
+	}
+
+	buf = kzalloc(PINMUX_MAX_NAME * 2, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	fname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
+	if (!fname) {
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+
+	gname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto free_fname;
+	}
+
+	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "failed to copy buffer from userspace");
+		goto free_gname;
+	}
+	buf[len-1] = '\0';
+
+	ret = sscanf(buf, "%s %s", fname, gname);
+	if (ret != 2) {
+		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
+		goto free_gname;
+	}
+
+	fsel = pinmux_func_name_to_selector(pctldev, fname);
+	if (fsel < 0) {
+		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
+		ret = -EINVAL;
+		goto free_gname;
+	}
+
+	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
+	if (ret) {
+		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
+		goto free_gname;
+
+	}
+
+	ret = match_string(groups, num_groups, gname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "invalid group %s", gname);
+		goto free_gname;
+	}
+
+	ret = pinctrl_get_group_selector(pctldev, gname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "failed to get group selectorL %s", gname);
+		goto free_gname;
+	}
+	gsel = ret;
+
+	ret = pmxops->set_mux(pctldev, fsel, gsel);
+	if (ret) {
+		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
+		goto free_gname;
+	}
+
+	return len;
+
+free_gname:
+	devm_kfree(pctldev->dev, gname);
+free_fname:
+	devm_kfree(pctldev->dev, fname);
+free_buf:
+	devm_kfree(pctldev->dev, buf);
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
+	.read = seq_read,
+	.write = pinmux_select,
+	.llseek = no_llseek,
+	.release = single_release,
+};
+
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
@@ -680,6 +785,8 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 			    devroot, pctldev, &pinmux_functions_fops);
 	debugfs_create_file("pinmux-pins", 0444,
 			    devroot, pctldev, &pinmux_pins_fops);
+	debugfs_create_file("pinmux-select", 0200,
+			    devroot, pctldev, &pinmux_select_ops);
 }
 
 #endif /* CONFIG_DEBUG_FS */
-- 
2.25.1

