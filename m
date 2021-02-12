Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5550731A7B9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 23:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhBLWdh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 17:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbhBLWbG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 17:31:06 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C12C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 14:30:25 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id j5so549019pgb.11
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 14:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EtGVAUlLf8aLYkc++oRhj8gK5LOTNM2SSYR/xCv8u5o=;
        b=tiZXYcAs/7pEhDBWa/gzuvr3n5oQyF+cibs0ROTtAobCeuLquR/2BazkGfRA/USeV8
         tj+kIdYVtytTaLDNcm+lTH+ZiF1LLUx1n3YId4boywCo1GuxlpdJvKZSxu5SzFUloCxl
         RM8vIlbzRUyYB7/jPKyz73lU4l2z0sf4nTcxmJaquvhFAZrftgUO0xpzcR+lvWXv+Y9/
         XnyFsWa/hkUCxelLhwpq7g/nCMoCwSeknqu2os7Ngrtg4evsR6Ly+osAswM7J5dnEp4l
         EOGLUOfaQdgZvVfJ/iG+zdv2uDwZovJRdZqaCOnqpFbDbAVnpEG6mR5vzS0Ztf3L7iDP
         YyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EtGVAUlLf8aLYkc++oRhj8gK5LOTNM2SSYR/xCv8u5o=;
        b=Rrr+4PY7r5+F2GRcVcfBlW/Fk34O2wMCbHLJrk9Ve7UKedCcJHJzadwbfrbf5mWvgS
         IpslIcllH6TmKnYYD1MCCGX5Q4S0YbwVIlhVl0CIx4O95J6foYKJavLygXZWmp9rdSCM
         6U6gx+Vl1JPKvDFDeb6LXziIvQ/G/ZIY/09dScuOTeXKwUPlAMOWA2tH7duxCYfGpgrp
         /NLLYLh6l/mdLBQJWnh3OMmkmLCh8Z4VhhNAqMV1WgphKM92RnFpNvdhzc7P5CBy7gcy
         OTp5pE9A8NhvUtLGwjw4aFS+Kh5xRjDP3rwqDVspPhzbIYDOho/IgpSzvE8Y1uewd3DK
         W+fw==
X-Gm-Message-State: AOAM533gs3lj3G+tztNv3ULnIApeA/5echMx1oIa2KOt4dDxFfBtXrbV
        RJSOku9FAlaIrxBUMMopAY1i7w==
X-Google-Smtp-Source: ABdhPJx9s6yB+OiH8aWGiuJbGVqiY1TxOQvV7BStuuz/GiVNX6liPQng4hWGb25cWjhZFlscov4mAQ==
X-Received: by 2002:a63:1d4d:: with SMTP id d13mr5089194pgm.103.1613169023575;
        Fri, 12 Feb 2021 14:30:23 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:55c2:10c0:c1dd:8558])
        by smtp.gmail.com with ESMTPSA id j26sm9530351pfa.35.2021.02.12.14.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 14:30:22 -0800 (PST)
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
Subject: [PATCH v5 1/2] pinctrl: use to octal permissions for debugfs files
Date:   Fri, 12 Feb 2021 14:30:14 -0800
Message-Id: <20210212223015.727608-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212223015.727608-1-drew@beagleboard.org>
References: <20210212223015.727608-1-drew@beagleboard.org>
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

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

