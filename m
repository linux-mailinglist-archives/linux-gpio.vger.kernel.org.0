Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C41320713
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Feb 2021 21:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhBTU31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Feb 2021 15:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhBTU3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2021 15:29:20 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46539C061797
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2021 12:28:06 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id s16so5291396plr.9
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2021 12:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2DbGvfOj1DMYYHtWVJxAg+wtPMMn58r4EIDpHlv7W5Y=;
        b=Jjg2S9zgZ9rJEUpTipvB1+dDZ+1g3igQyTwdVLvVatZxlAkJLLcIiBT1jNYbwcdK+J
         bE+lKDcmxXN5jbthPYQImB7jISOiP2DhEJ0y7lPgQBAb73oRxAnR6Wt6/T2Uf/+hgydx
         tRLJqfXygEzAwKGcjUG6kmpDNrUgwKxIa6AwjGcxcQzf4Y+2vNKaG8AukW4ut3jglE9q
         6kOe95HoAiakgvEvUwWM6Duw1QM0c7x7ceBMTm9gR9hXLRHrfi9YmiWnxKqZbCznNF5m
         Fk3iaUUspX8unGq4YlvqIzNfMGk2v6oDp8ZObB/ejeWA79bD1f6IvHxGnXJEgwK0Pz5c
         qCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2DbGvfOj1DMYYHtWVJxAg+wtPMMn58r4EIDpHlv7W5Y=;
        b=MAU3flDMFIFtVvFa/uNFa0qe4tJSoPA4dQ05mRi5J/eEVplRAYJ1kBxTNoH2P/K1q+
         kfTuyzAGrSSdUMYVeKJu0sz0mrbGgPNm6Yk5Zm3ole/c8K89yzmF6/Vj3yZSx3wZTGWP
         7MyLF0DLSMqM8PIOH4mQeViZ0KqpMd+5Vjaz2mOnelmOUyvAv93X2M5tM+wQMxp1wbW5
         ERVHYhM4N3D/zvsZ+FAjO2q6u3vmCTKWInsduSK6Iig1z5LBQDVhV2im5R9+p8vb1Y5y
         6Qzjo0JoC/SwLS2y2HDlLu1cbGr3VrFToOWwQ0+Yft5CFqyfKS4OYRtyIiRnTDDLcQ9w
         TMOw==
X-Gm-Message-State: AOAM532lE09N5IZNvbDoJnUoQAU59qVqMSpDzCHIQA60EQT6bkpmEPrM
        qeF+R5zU6vckepjqhbaGU5Bj4w==
X-Google-Smtp-Source: ABdhPJyhQ81DkOewuk585ucZasKLkG1HgMZrwtS4cuSYWVfF8Ym7Nr+KdCToh5ruiRACGHhzskvqxg==
X-Received: by 2002:a17:90b:4a89:: with SMTP id lp9mr15415212pjb.170.1613852885762;
        Sat, 20 Feb 2021 12:28:05 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:3902:ca9d:7b75:1d0c])
        by smtp.gmail.com with ESMTPSA id 125sm13497871pfu.7.2021.02.20.12.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 12:28:05 -0800 (PST)
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
Cc:     Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v8 2/3] pinctrl: pinmux: Add pinmux-select debugfs file
Date:   Sat, 20 Feb 2021 12:27:49 -0800
Message-Id: <20210220202750.117421-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220202750.117421-1-drew@beagleboard.org>
References: <20210220202750.117421-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add "pinmux-select" to debugfs which will activate a pin function for a
given pin group:

  echo "<group-name function-name>" > pinmux-select

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

To activate function pinmux-i2c1 on group pinmux-i2c1-pins:

  echo "pinmux-i2c1-pins pinmux-i2c1" > pinmux-select

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinmux.c | 102 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c651b2db0925..f4abfaecfc5c 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -12,6 +12,7 @@
  */
 #define pr_fmt(fmt) "pinmux core: " fmt
 
+#include <linux/ctype.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -673,6 +674,105 @@ void pinmux_show_setting(struct seq_file *s,
 DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
 DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 
+#define PINMUX_SELECT_MAX 128
+static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
+				   size_t len, loff_t *ppos)
+{
+	struct seq_file *sfile = file->private_data;
+	struct pinctrl_dev *pctldev = sfile->private;
+	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
+	const char *const *groups;
+	char *buf, *gname, *fname;
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
+	gname = strstrip(buf);
+	if (*gname == '\0') {
+		ret = -EINVAL;
+		goto exit_free_buf;
+	}
+
+	/* find a separator which is a spacelike character */
+	for (fname = gname; !isspace(*fname); fname++) {
+		if (*fname == '\0') {
+			ret = -EINVAL;
+			goto exit_free_buf;
+		}
+	}
+	*fname = '\0';
+
+	/* drop extra spaces between function and group names */
+	fname = skip_spaces(fname + 1);
+	if (*fname == '\0') {
+		ret = -EINVAL;
+		goto exit_free_buf;
+	}
+
+	ret = pinmux_func_name_to_selector(pctldev, fname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
+		goto exit_free_buf;
+	}
+	fsel = ret;
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
+	ret = pinctrl_get_group_selector(pctldev, gname);
+	if (ret < 0) {
+		dev_err(pctldev->dev, "failed to get group selector for %s", gname);
+		goto exit_free_buf;
+	}
+	gsel = ret;
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

