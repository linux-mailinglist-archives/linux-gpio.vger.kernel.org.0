Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196683057D2
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313175AbhAZXIL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbhAZE42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 23:56:28 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF55C06178A
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 20:55:48 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id g15so1519811pjd.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 20:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A+xo3PRCK79jj+xfn6kKZjOBkB350fZ6rhjD6DI0rxM=;
        b=kaKvwXbFyAqpP+UiSlZHnfAvyZd0+zaC9/ULW7J9CZ8k5c5TNv3C/A5++Y44n26s2y
         hjR+apqEBKBZXB81WFZKHS3B4MrT3rJf+NCxEwUQuTcgwX8I2Ic5fekdrEA+1Nmktf4D
         ZjscnZ/ois3yHlG1tx/J3ou6WFyFi/ShtabzjPw7uaX0CfEImEwIq9bbuv+bOzc1v26B
         MaxopG4mbe+Nf01wgTfNinsgom/t/Dl348pl+S6eJ456SV+hMs0hKsvPRGWX4MuLWkQJ
         PQw6plwMCJcVk9/2fYBEzB8ZzgVReqky4YRsB6E4oBiU4dubvhCEsAzFGYmfZZGYGpT8
         tFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A+xo3PRCK79jj+xfn6kKZjOBkB350fZ6rhjD6DI0rxM=;
        b=o0jpbQxsYxbdgVYg+ji3tZ/1P27z/dLA7+qq/wsIAalLIWov8oj096ucdUEcfROJ3q
         8uXvBvPO/RntT4o01t0a05bycdmtYzW8XGnC9vEx+rqLNCOnJ9yGw9cnt35sQbiZgWwZ
         nngmlueStIPPD/Lzgeirecrep+NiYSl1VfNcLfrm34L/Wgwf/+ncEYZ34DRrDpLeYbTt
         +DYINa/Kp/SngJUp2u71IaoMB3uyxy4jkEh1k6j2k0m4lqa0x/N1Ws+yNqZgf/nueyWy
         4Bw2siInIOCsTJgGgtLTAkGyZf0BV2CRTvbTWfwSh90jORq+pN64XgGWnMgHDryrtwzG
         3BCA==
X-Gm-Message-State: AOAM531mFmzHK0Op37AvTZWa7VQNvQs0tnfEX8tl8R0crVfx4ZxvKIKD
        fgtyAU+UKYn745hTgOC656061A==
X-Google-Smtp-Source: ABdhPJzGaQNqQSbwwVJst9Y81nAQYuzD6OpiAagKOy8cC6gsdFxH1ECju1m1y4NgqCYatHDW0DptLA==
X-Received: by 2002:a17:90b:3682:: with SMTP id mj2mr4029939pjb.9.1611636948198;
        Mon, 25 Jan 2021 20:55:48 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:dd5e:ff29:33fe:cad2])
        by smtp.gmail.com with ESMTPSA id gw20sm858796pjb.55.2021.01.25.20.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 20:55:47 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] pinctrl: use to octal permissions for debugfs files
Date:   Mon, 25 Jan 2021 20:47:43 -0800
Message-Id: <20210126044742.87602-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch over pinctrl debugfs files to use octal permissions as they are
preferred over symbolic permissions. Refer to commit f90774e1fd27
("checkpatch: look for symbolic permissions and suggest octal instead").

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
Patch note:
- I learned about this preference of octal over symbolic when I created
  an RFC to add a new debugfs file ("pinmux-select"). I am submitting
  this patch to switch existing entries in pinctrl over to octal before
  I submit a proper PATCH for the "pinmux-select" functionality in which
  I will use octal permissions for the new file.

 drivers/pinctrl/core.c    | 6 +++---
 drivers/pinctrl/pinconf.c | 4 ++--
 drivers/pinctrl/pinmux.c  | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9fc4433fece4..791736b2de77 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1916,11 +1916,11 @@ static void pinctrl_init_debugfs(void)
 		return;
 	}
 
-	debugfs_create_file("pinctrl-devices", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-devices", 0400,
 			    debugfs_root, NULL, &pinctrl_devices_fops);
-	debugfs_create_file("pinctrl-maps", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-maps", 0400,
 			    debugfs_root, NULL, &pinctrl_maps_fops);
-	debugfs_create_file("pinctrl-handles", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinctrl-handles", 0400,
 			    debugfs_root, NULL, &pinctrl_fops);
 }
 
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 02c075cc010b..f005921bb49e 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -370,9 +370,9 @@ DEFINE_SHOW_ATTRIBUTE(pinconf_groups);
 void pinconf_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
-	debugfs_create_file("pinconf-pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinconf-pins", 0400,
 			    devroot, pctldev, &pinconf_pins_fops);
-	debugfs_create_file("pinconf-groups", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinconf-groups", 0400,
 			    devroot, pctldev, &pinconf_groups_fops);
 }
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index bab888fe3f8e..7f6190eaedbb 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -676,9 +676,9 @@ DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
 void pinmux_init_device_debugfs(struct dentry *devroot,
 			 struct pinctrl_dev *pctldev)
 {
-	debugfs_create_file("pinmux-functions", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinmux-functions", 0400,
 			    devroot, pctldev, &pinmux_functions_fops);
-	debugfs_create_file("pinmux-pins", S_IFREG | S_IRUGO,
+	debugfs_create_file("pinmux-pins", 0400,
 			    devroot, pctldev, &pinmux_pins_fops);
 }
 
-- 
2.25.1

