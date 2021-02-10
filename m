Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F264D317363
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 23:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhBJWbv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 17:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232204AbhBJWbt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 17:31:49 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B565FC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 14:31:09 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id t2so2024860pjq.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 14:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/XYPeyR2vRFmwC1dUrzuhuASZmzYtfr/DToN2nYAQ80=;
        b=JYu+9KU8OR3CRBu+ZQaE8wJn23ZIbkLjdlwgnV1EWOim2EUy4SoX7HUHD1uJxRfTXV
         cEAQtPZ5efXsYCZGY83A+0Sjs8fqSm59x5WGTrwv3CMjy/z393lM+FqP6LVc5GrmjU9N
         LxTVh55i/QTBVfXREXIux9blFUkBcwen//hFOoc8nSHyXEkn8YGNIAF9M+886/aQgdKl
         9PV6+EBgvjqaK7+y04wwsNU9+9L8uGUeOynqlFDY4Tm+/GSV6FPm4QQ4byYJDzMZH/mT
         tkDgDWzygS0mkr6kPs/ypbj+izckCvEIoRlyNs7mNEUtGUCmll0JK8eufivhPQJUnJ+o
         Pfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/XYPeyR2vRFmwC1dUrzuhuASZmzYtfr/DToN2nYAQ80=;
        b=aM5pzbfWdFtQfQJm7GX0GurKFRL4rz3Gb5Kez2ptBIonN4PkhXCzIIe086MTxbmAvO
         KqXuI2sik747VvYQsv+/wCQ5vE9r+wBbf6HtU3BNYOyYLV7vJX/QrsC8MsOeW4kA4ZEz
         YplIK6qRwIRqFN0eeqgRYE8SvrIQYfaw+HjAabeUDvMELwoxRusa/+WIbRKanjoJ9U07
         TSSfsiLmHO3FcoXgXJcpPrvGXZXA//ZmQgs/nsVPzyfMmTypiWvr8uaiFXnNSicQUasn
         aRe9Uutegfu6GwAY2/KC2XDvgDbDI+pXBzqFVS7yUvuwsMLIHq719SIvAvqoBYb6eBr8
         3eJA==
X-Gm-Message-State: AOAM531uarcpbtVRINBV6uyTSHyQL+q7bKvUcmocBvX1oSVpBLD6pEYL
        IU5RTVnhzIThxyRdCKHQcJvz+g==
X-Google-Smtp-Source: ABdhPJxi6Q1gIU2BXYaAO66vfIws12E9CsQfWvOFXnSZpcq7+bqxY2RQMhhpM15MtGl3abyExMUMgA==
X-Received: by 2002:a17:90a:67ca:: with SMTP id g10mr1123718pjm.28.1612996269324;
        Wed, 10 Feb 2021 14:31:09 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id t17sm3686307pgk.25.2021.02.10.14.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:31:08 -0800 (PST)
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
Subject: [PATCH v4 1/2] pinctrl: use to octal permissions for debugfs files
Date:   Wed, 10 Feb 2021 14:28:52 -0800
Message-Id: <20210210222851.232374-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210222851.232374-1-drew@beagleboard.org>
References: <20210210222851.232374-1-drew@beagleboard.org>
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
 drivers/pinctrl/core.c    | 6 +++---
 drivers/pinctrl/pinconf.c | 4 ++--
 drivers/pinctrl/pinmux.c  | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..02f8710afb9c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
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

