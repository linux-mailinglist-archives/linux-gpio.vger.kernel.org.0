Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB7C31D2C7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 23:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhBPWq0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 17:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbhBPWqY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2021 17:46:24 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD56C0613D6
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 14:45:43 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id o63so7206055pgo.6
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2021 14:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=crc+oaPBwmJLuhdzYhxtkJDRIfu/BQGupIafKHnaRI8=;
        b=NgI7gJ4JI1UkXnfzOj1d5e0puXKF0CFg5Ngwr26Ty+v0cMPjzuLPsHdrG1oxucrm3j
         +qDzFszW5aAftxhA+MBdTDgM0RhSVHxeOfUOpfzqA1QVD1pNsY1qK9R8vC/HKQsbBfkJ
         Ru8buAsLA7VJWd14gjMPRtG5p88u5VX9ARV6LlxCMRFC5c2Gnz+7CEUV4gnMpjLE6znV
         4j4wQ9Zqf7+K3uhBo/3pfZogIoxFC3kKCz2LQkJ1z4obiPElkq3MCMNuS37Q3jLRVBTF
         YgObZYAintFp3QgQs5m/9Tp/PPcKg+7OUd56e/X8nEKmLlr/elq34Jwm58W25pMhvP9J
         w81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=crc+oaPBwmJLuhdzYhxtkJDRIfu/BQGupIafKHnaRI8=;
        b=FJ+HwIfhnLwjaJUVIF/CaDq6tfQStvSldMm1XV3VoGY0281YrnmKAvqIDo4L09uuDj
         12MWj0XdEqypy9dJteZuMthP308tHrdap/mDofqjuYk6rBFeVSj6OfnRx+gr+6BWLjDY
         V1lqZZ592X7LTP20XfOaDLddxEcQUhn8QH9J8LGTcdOlbp8cIFkCaZlP93blCOjUQA+q
         AlB+qZeffXr8VGebYHnQNBEeo7N3GxkP+k01M5filmD7yMLK1a86h0fGMDk0PD3zRHSd
         lDXMv8Ie26w8bnXvIpUH9t3cF4cSju86ZyCTjuGduSN4uEbEvghy4d8m8EW2vxcclUlQ
         p/TA==
X-Gm-Message-State: AOAM530a/qx1tC8i4qIqAiWmXOIVSLm1MNvHhiPCaWTEvdwGPv7ikcri
        zsxanexQfZbq6et0b+srLJN49w==
X-Google-Smtp-Source: ABdhPJxLnXNsoWH1JjMoI3/wIgr2kpc3vJgMQ2414V+PTKVmYjyIGY60cN5fpVQ5AXErrjL6rdRVNA==
X-Received: by 2002:a63:2b82:: with SMTP id r124mr21093120pgr.310.1613515542849;
        Tue, 16 Feb 2021 14:45:42 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:4e06:8d2c:6f9:5b31])
        by smtp.gmail.com with ESMTPSA id 184sm1922465pfc.176.2021.02.16.14.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 14:45:42 -0800 (PST)
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
Subject: [PATCH v6 1/3] pinctrl: use to octal permissions for debugfs files
Date:   Tue, 16 Feb 2021 14:44:53 -0800
Message-Id: <20210216224455.1504008-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216224455.1504008-1-drew@beagleboard.org>
References: <20210216224455.1504008-1-drew@beagleboard.org>
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

