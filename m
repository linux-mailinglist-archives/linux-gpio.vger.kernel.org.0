Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406B95E5EF2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 11:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiIVJvh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 05:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiIVJv3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 05:51:29 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE2FD6934
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 02:51:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id r133-20020a1c448b000000b003b494ffc00bso997066wma.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 02:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Rb6Uqyu2WzSu+tRX/bDFi/OcXRyj4UgkaGzj9qUzolE=;
        b=mydLPdcLUohCzu0hbeaFRSooVdLuyge+vxFQ007ccw1+sbhoSEQgKtho2/RwWuJDi+
         HpFcWch8GoaEbnTculZHJDynzXkPeZlxwr14mklIJ90tNZW77F873v7JMCXJJnMi0y3g
         gCxO6uT92/OJczpGrRI/tRE1EytXK5AcuKY5Ft+3ZJ26wtrJ5jS5eUPSkNthxAywOnnV
         aHxhxEG3JV+S7bv3Hkhwc68hsEQxPwMDtur8jCiqqex82JX0VkyF3gx0ezoWrsKH/aFR
         g0NROJyChhz6U2k5NYjkSLzYdU7W/Q6xju1ktkoP9v8DilgD9xCOuSDooxltX+8BlTO2
         Ab2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Rb6Uqyu2WzSu+tRX/bDFi/OcXRyj4UgkaGzj9qUzolE=;
        b=xd5Mc3A1zkhFy523iOordXgdlvoGUi1momxdnPyLwB7o88kbNmjWLBJRaSpB1/nd7V
         eqlqNxfpTNmoFVxHAeBPYBbg1bznSYvl7+QMMEivznwnVPs9uu47BhqfyXYfh4j2cCsI
         Qbo/EY6oInUqclK2RnIg69Tbn+Dyd7lvqxtkM66HNEa4972vHNFaXxF0iCkig/x5AEso
         MIeyWZ80DjcXwnr9uHKf3U/Xiob/pXPkPxv7L0pnsNKc5S5L52QqdmuWCwLhwmKiyKfm
         CAtkphVFidq0koxnvMfbQfK3OUcTloWsgdEvUzdvzz3WAsROL8w/9FExstUpdSGPZ0TZ
         Py9g==
X-Gm-Message-State: ACrzQf3X6VNOFrs0vE7wUDx936aZSsWN+EyNFBg1wHD/2MvGRq9953to
        ycNsN6sPC+ut7m1StTfiAHC0PNKJvGe0Lw==
X-Google-Smtp-Source: AMsMyM4mLRf9XgS0jE921KojXuOJe3rRkOvcZYptbEnVTm6qkFm5bRmNQ7NSJ8ezshPP29S0Jq53uw==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id u7-20020a7bc047000000b003b4adc71ecbmr1699644wmc.144.1663840286468;
        Thu, 22 Sep 2022 02:51:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8b36:6d:2c67:43fd])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003a3170a7af9sm7139124wmq.4.2022.09.22.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 02:51:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2] gpiolib: cdev: add fdinfo output for line request file descriptors
Date:   Thu, 22 Sep 2022 11:51:24 +0200
Message-Id: <20220922095124.116116-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add fdinfo output for file descriptors created for user-space line
requests in GPIO uAPI v2. The fdinfo file now contains the name of the
GPIO chip that is the "parent" of the request as well as offsets of
the lines requested. This allows user-space to parse the /proc/$PID/fdinfo
entries and deduce the PID of the process that requested a specific line.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
v1 -> v2:
  - change `gpio-device` to `gpio-chip` in the fdinfo output
  - change deduct into deduce as suggested by Kent in the commit message

 drivers/gpio/gpiolib-cdev.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f8041d4898d1..01c15e9e6896 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1497,6 +1497,21 @@ static int linereq_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+#ifdef CONFIG_PROC_FS
+static void linereq_show_fdinfo(struct seq_file *out, struct file *file)
+{
+	struct linereq *lr = file->private_data;
+	struct device *dev = &lr->gdev->dev;
+	u16 i;
+
+	seq_printf(out, "gpio-chip:\t%s\n", dev_name(dev));
+
+	for (i = 0; i < lr->num_lines; i++)
+		seq_printf(out, "gpio-line:\t%d\n",
+			   gpio_chip_hwgpio(lr->lines[i].desc));
+}
+#endif
+
 static const struct file_operations line_fileops = {
 	.release = linereq_release,
 	.read = linereq_read,
@@ -1507,6 +1522,9 @@ static const struct file_operations line_fileops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl = linereq_ioctl_compat,
 #endif
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo = linereq_show_fdinfo,
+#endif
 };
 
 static int linereq_create(struct gpio_device *gdev, void __user *ip)
-- 
2.34.1

