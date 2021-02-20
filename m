Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CF2320711
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Feb 2021 21:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhBTU2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Feb 2021 15:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhBTU2o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Feb 2021 15:28:44 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06F9C06178C
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2021 12:28:03 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b15so1207240pjb.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Feb 2021 12:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBtTzri1cScqDnwkEDlkQhcrUhTCJcMkyhXW4hdMGZI=;
        b=zmRlVRwyqIdZyO5J2dle6JUjid7RjcLyGcWR77bvZwb+Rl4DdAeYYH72ZL1i82pFDz
         M1qXAvOUmLAsg4ClDoqctzOnHRIEspEU5yqgTy6Dee5urYA2d9RDfNZaohOptWvKCUMS
         U7pI75ldQwGXI+KNAI/Fi4+BG4NrDZeWKLcuDOPPmVgd2ffJWeTf5YcY0vTQBvBmJt48
         alBZ1Z+LzUHBHfafYJThAlgYjMM0fcQsrFy6ZZH5TWm5Vkd/+KTe1yUF5+dc1j3L6U+R
         bYAQtTdyILgnEXksyO8GvrgGKj2czIW2Zq8LWDWCRrl1XK+DaTVNdm9MNQ8DxgRsSswV
         muWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBtTzri1cScqDnwkEDlkQhcrUhTCJcMkyhXW4hdMGZI=;
        b=MYUsr/ePJropUs2YTK2AqofQap3GKyMJgkGi7AZuLUMjeSnvBcfXRlnVBATFVJBBVB
         4wmDhRUopGTrA0eHxCO3b3RV5ejK2gAS4y27XK+sdhy/gQ0cc4jZTJoK+ADJIytaeBOc
         p8TioyyR60jv6IZvujPMSJBS0Lz+lTFd62960EAcBZsBf9MlO5Xk4VyFD3lYTNdf7CLM
         SLPv8RQo6ZTUeVauDQoSuPQg6Dr6utEpP0Fs0mwFOCGHJVkzy3VVhv3tPRshzikQCZY/
         X757jvj7ujv3nqOda7JOmXXZfqrmqzB6JwEz84LaDXOJ7ywH+/8J2mC5M17hl0Am8yh7
         mR8w==
X-Gm-Message-State: AOAM5321YHAlDqJd40nxaGWYEeLIqfALbvaC+dFVI9nWPAMK7ro5r8qw
        qaXlIrW5cowftEL+1ksfL8q4Gw==
X-Google-Smtp-Source: ABdhPJyCnWL4tfnCf5iMQxfLoYhXdN4fbL+c4Roh79SV+1CtzWmvVtHqODPPHLdyNRGUmqB3VQr8DQ==
X-Received: by 2002:a17:90a:7e94:: with SMTP id j20mr15894904pjl.8.1613852883189;
        Sat, 20 Feb 2021 12:28:03 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:3902:ca9d:7b75:1d0c])
        by smtp.gmail.com with ESMTPSA id 125sm13497871pfu.7.2021.02.20.12.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 12:28:02 -0800 (PST)
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
Subject: [PATCH v8 1/3] pinctrl: use to octal permissions for debugfs files
Date:   Sat, 20 Feb 2021 12:27:48 -0800
Message-Id: <20210220202750.117421-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220202750.117421-1-drew@beagleboard.org>
References: <20210220202750.117421-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch over pinctrl debugfs files to use octal permissions as they are
preferred over symbolic permissions. Refer to commit f90774e1fd27
("checkpatch: look for symbolic permissions and suggest octal instead").

Note: S_IFREG flag is added to the mode by __debugfs_create_file()
in fs/debugfs/inode.c

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/core.c    | 12 ++++++------
 drivers/pinctrl/pinconf.c |  4 ++--
 drivers/pinctrl/pinmux.c  |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..07458742bc0f 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1888,11 +1888,11 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
 			dev_name(pctldev->dev));
 		return;
 	}
-	debugfs_create_file("pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pins", 0444,
 			    device_root, pctldev, &pinctrl_pins_fops);
-	debugfs_create_file("pingroups", S_IFREG | S_IRUGO,
+	debugfs_create_file("pingroups", 0444,
 			    device_root, pctldev, &pinctrl_groups_fops);
-	debugfs_create_file("gpio-ranges", S_IFREG | S_IRUGO,
+	debugfs_create_file("gpio-ranges", 0444,
 			    device_root, pctldev, &pinctrl_gpioranges_fops);
 	if (pctldev->desc->pmxops)
 		pinmux_init_device_debugfs(device_root, pctldev);
@@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
 		return;
 	}
 
-	debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-devices", 0444,
 			    debugfs_root, NULL, &pinctrl_devices_fops);
-	debugfs_create_file("pinctrl-maps", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-maps", 0444,
 			    debugfs_root, NULL, &pinctrl_maps_fops);
-	debugfs_create_file("pinctrl-handles", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-handles", 0444,
 			    debugfs_root, NULL, &pinctrl_fops);
 }
 
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 02c075cc010b..d9d54065472e 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -370,9 +370,9 @@ DEFINE_SHOW_ATTRIBUTE(pinconf_groups);
 void pinconf_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
-	debugfs_create_file("pinconf-pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinconf-pins", 0444,
 			    devroot, pctldev, &pinconf_pins_fops);
-	debugfs_create_file("pinconf-groups", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinconf-groups", 0444,
 			    devroot, pctldev, &pinconf_groups_fops);
 }
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index bab888fe3f8e..c651b2db0925 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -676,9 +676,9 @@ DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
-	debugfs_create_file("pinmux-functions", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinmux-functions", 0444,
 			    devroot, pctldev, &pinmux_functions_fops);
-	debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinmux-pins", 0444,
 			    devroot, pctldev, &pinmux_pins_fops);
 }
 
-- 
2.25.1

