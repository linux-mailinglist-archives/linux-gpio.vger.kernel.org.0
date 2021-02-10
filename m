Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA77317269
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 22:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbhBJVfU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 16:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhBJVfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 16:35:15 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0D3C0613D6
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 13:34:35 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g3so1967082plp.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2021 13:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Sw86Fw64A6zVC6bvmJLt8R/MCo0gpO6vGj4YT6gm0c=;
        b=F8yLIDTlrYUbGOMDNCbzhCpPSCj4bU5bKXB1Boh+5r6WomBezpuFUJ2sH50CZViba0
         SotOFDjVWxcWvGuopPeDNVz0p2N775qMp/8ruqmY/uFte4S3XCRlc9PGpsXhUZSafiFw
         4jc2Azh7hNaaqWZP2+GmqfQNlkcMgGWwjmjIMAIUETVJocTa7aPOgmGN4OH3gZD9MlqS
         RmbITIdr/V7u8NNw9E34+RG2RJE0vrNR6EHKwQM6QjNKC4Zz+AhZgpO7UN3EgSveqcpZ
         YnIKWcXtjPbYcFTWFHQQB+jBl9TOo2JhsK0BS71ABgE8e8qzu0ahpCSa+AVLrOPSATb4
         iqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Sw86Fw64A6zVC6bvmJLt8R/MCo0gpO6vGj4YT6gm0c=;
        b=ZjCWXFNI8+BMvsUfXtkTQKYAkH3nb5VeWM++l2qwPEbqtd21GgshWGudT1GNH/TKmc
         yayBU3rPshbe7NO4CZ5pbMMPGFfAA/tbMCxbQ88LjY++T5AvktgyLPBHkT+1jjDNBxFQ
         NRQ6pvMzn+cS3Z1+LntAPLUK5ob5foBE4PUK0dnaRd4y4xCvVhAoDcH2PbgbAEj5w6Ix
         Q9HX/WestrvlcbC6jbEAXNMRaPo77dBBEZ3tXXu2FgWVeWaAD+nDmUJ+kHvQ7mJ2fybE
         uXNT+LkpOMCRvlRGhSJr+VIbQcVzQVxVeYoQr0eErAgDC3aDuQ813awUCTtw5yCwn15v
         yanA==
X-Gm-Message-State: AOAM5338Py82FVExCTD+zYkb11u412lrbEp2Fs0H0kWLwk8nCGASX51t
        1veUs20NaAl9nPScQ/Z8O73Y6A==
X-Google-Smtp-Source: ABdhPJyT0wycVnNudvU5sXajnTIMYwA/vMyehvM5JSizAicyQyrq2+8FdSqlI23cy3Q0GTngZmY1Jw==
X-Received: by 2002:a17:90a:a794:: with SMTP id f20mr818418pjq.185.1612992874722;
        Wed, 10 Feb 2021 13:34:34 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id h8sm3006928pfv.154.2021.02.10.13.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 13:34:34 -0800 (PST)
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
Subject: [PATCH v3 1/2] pinctrl: use to octal permissions for debugfs files
Date:   Wed, 10 Feb 2021 13:34:19 -0800
Message-Id: <20210210213419.227285-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210213419.227285-1-drew@beagleboard.org>
References: <20210210213419.227285-1-drew@beagleboard.org>
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

Thank you,
Drew

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

