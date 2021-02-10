Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA50C316059
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 08:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhBJHvi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 02:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbhBJHvW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 02:51:22 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F4BC0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  9 Feb 2021 23:50:41 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id b8so732839plh.12
        for <linux-gpio@vger.kernel.org>; Tue, 09 Feb 2021 23:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rBkqkZTd5g9iMpheqnnUlGoR1nH7kXohQFG15Ej9IvU=;
        b=AUxr9dYSK65v0KhZ89C0z56tmdMSZYJOxt1oncONInfyHwDhNqMUNFxvNMKMjl06Np
         qa63EmhI+yIK+bATCe8ESWDSluJvRMKrAkVnZVgPDyc9Qu6HSIOR+XQWnFwX9uq0gE/0
         mPottdu94hroAEIwnbltsnoOhx0u06q/FXhco/39hHBQzgCydMadUCt3Tr62B75XFqMU
         UnYUbHg6Z5tXxKDP30NdeSlsxvTplaS9BX7OhFPDvlNDr4oR27GVcBtj2xS7GJJGj4m5
         rDnM0VOJIW/YXCO8LYx75PIfUP5qASxk6t3LpuY7zmR/vY69eq2lwr3tFrM7PHkAmwfo
         1m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rBkqkZTd5g9iMpheqnnUlGoR1nH7kXohQFG15Ej9IvU=;
        b=eO4f+AAIu8RD+tsrnC9zla0Hu8xAXrc28dh/shFzVgc5evmNcavHhGJ9a+4loc7JOi
         FizFsb5oWH8BgrE1B1JYeRac4kZ1OAGzTS1emKXbfTW6VP/ieSc3V33G5P9XrZtOzw68
         uYGScV7zeNlS0oONnjhBMfMq4Aks9X/gdM5Ps3wEABC8zYW6ipg/AQUk+liK5MjZUNrh
         GSzqgHAD+HZh+/VA7vcXRgV9g+dv5oElpGffbMkYKs0jjRiAmwgbwPchzKw4yP419qHr
         PMSatFz6c5+8kM6tKNiibdOfjvhgTcEZAPykzMqy1HM0lO2BDxNtbkV+eUig9uvNcVnu
         SqVA==
X-Gm-Message-State: AOAM532r4zarZIpvzddIRuD692dTYt2j3usZAR80EzQc8WQuR43PoKjh
        MHDPHgcvC0/GObB8WCKlLDbXeQ==
X-Google-Smtp-Source: ABdhPJwfji02qAR4wJ8zRnPfrA1z+mEoNfqUrVfCc7Ut8CGf05a9allZfdSKg8liwjf9BQG3KGEMLg==
X-Received: by 2002:a17:90b:4a02:: with SMTP id kk2mr1945395pjb.115.1612943441296;
        Tue, 09 Feb 2021 23:50:41 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:7b19:df69:92d6:528e])
        by smtp.gmail.com with ESMTPSA id b25sm1261710pfp.26.2021.02.09.23.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 23:50:40 -0800 (PST)
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2 1/2] pinctrl: use to octal permissions for debugfs files
Date:   Tue,  9 Feb 2021 23:49:46 -0800
Message-Id: <20210210074946.155417-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210074946.155417-1-drew@beagleboard.org>
References: <20210210074946.155417-1-drew@beagleboard.org>
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
 drivers/pinctrl/core.c    | 6 +++---
 drivers/pinctrl/pinconf.c | 4 ++--
 drivers/pinctrl/pinmux.c  | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..c9c28f653799 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1914,11 +1914,11 @@ static void pinctrl_init_debugfs(void)
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

