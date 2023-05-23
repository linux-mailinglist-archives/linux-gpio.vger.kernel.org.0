Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2785870E0FB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 17:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbjEWPvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 11:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237544AbjEWPvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 11:51:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8116D130
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 08:51:22 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30957dd7640so3243734f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684857065; x=1687449065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFhOPyHhLH6S5WQRz4qZfiECpWpktNJWuxewg6N6IXY=;
        b=FX1KdUod4qn2Tt2Kkwc4gS8423CSwDjjXMwCx5aW9z0Mnc6IyRbvna7GjvwEFf+nBH
         4SD+JvkjXbk4Hs9RD5ea2DQnqssxQp2VlWt0UTnsBiBF2NgMJWfRT5S4G7/+uwUn0mN7
         7b1PTNM/H8zNf+95YZ2OkM7gIv47XH6ylJ5VhGcpFbjbkq4ze4SNOCqrLe2i83ipwtb3
         vcGTo7t9AbYkkeQwQcfhaImi1JdaFZ699VT2MSutq7xKoETXSmZq7c0yWtMvj1p2aCNA
         mlDvcCm9SxahPZQhMUnh/qLJ17RUvC3qJqZh0u0hwOXZDkIN8uRVNzFL8tkbkvmFXSnY
         OClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684857065; x=1687449065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFhOPyHhLH6S5WQRz4qZfiECpWpktNJWuxewg6N6IXY=;
        b=Dh13S0LSwMDgXXwsWg6NverzCM2EyBgV+Z+L22emIFfKFyX5k1ZF/MVM/4ihZakFua
         /IXSpVuI6jT2UmBYRFS7DnM6aSyDAfmKKviitJPK5Fj+S45yhUp5li2IUPubLl2rHFaq
         SWeCvHdPUNaiDmFN1P73/9b+L15Zf01mH6MQCyHZuAEArBnV+ObfzzvqrfyjY5QE5pWV
         S3IH8jLhh2o7DwZ2IPOhBPODtX3g2h8/R2glQ9q87t+uM/wIUH14LkFUJqp/AIBvwZCL
         +rGuD89x/r9zS517DNu32w7dpnx8ysyGZeVp/luQJduJLEScd9OKrscvHKJOfSkMKLi5
         TizA==
X-Gm-Message-State: AC+VfDz2DzHhVvy9T/7Uy35dxfuLNSid9uQeJEQMwCiyUoH0SW0W4e2l
        MV/ieEE9LRAua3XeV5NURXAteA==
X-Google-Smtp-Source: ACHHUZ733LhblIwWJGaG+EyLuxGA2QiNjQeXabahP2K/M87pbYfmG3qopcIvtqdxbwq72fL2x7QEyw==
X-Received: by 2002:a05:6000:118d:b0:309:41f7:e40e with SMTP id g13-20020a056000118d00b0030941f7e40emr9968237wrx.28.1684857065664;
        Tue, 23 May 2023 08:51:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3c9:a1c2:c486:3efd])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4243000000b002cea9d931e6sm11434149wrr.78.2023.05.23.08.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 08:51:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: cdev: fix a crash on line-request release
Date:   Tue, 23 May 2023 17:51:01 +0200
Message-Id: <20230523155101.196853-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When a GPIO device is forcefully unregistered, we are left with an
inactive object. If user-space kept an open file descriptor to a line
request associated with such a structure, upon closing it, we'll see the
kernel crash due to freeing unexistent GPIO descriptors.

Fix it by checking if chip is still alive before calling gpiod_free() in
release callbacks for both v2 and v1 ABI.

Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
Reported-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib-cdev.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0a33971c964c..6830f668a1b0 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -315,13 +315,19 @@ static long linehandle_ioctl_compat(struct file *file, unsigned int cmd,
 
 static void linehandle_free(struct linehandle_state *lh)
 {
+	struct gpio_device *gdev = lh->gdev;
 	int i;
 
-	for (i = 0; i < lh->num_descs; i++)
-		if (lh->descs[i])
-			gpiod_free(lh->descs[i]);
+	for (i = 0; i < lh->num_descs; i++) {
+		if (lh->descs[i]) {
+			down_write(&gdev->sem);
+			if (gdev->chip)
+				gpiod_free(lh->descs[i]);
+			up_write(&gdev->sem);
+		}
+	}
 	kfree(lh->label);
-	gpio_device_put(lh->gdev);
+	gpio_device_put(gdev);
 	kfree(lh);
 }
 
@@ -1565,17 +1571,21 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 
 static void linereq_free(struct linereq *lr)
 {
+	struct gpio_device *gdev = lr->gdev;
 	unsigned int i;
 
 	for (i = 0; i < lr->num_lines; i++) {
 		if (lr->lines[i].desc) {
 			edge_detector_stop(&lr->lines[i]);
-			gpiod_free(lr->lines[i].desc);
+			down_write(&gdev->sem);
+			if (gdev->chip)
+				gpiod_free(lr->lines[i].desc);
+			up_write(&gdev->sem);
 		}
 	}
 	kfifo_free(&lr->events);
 	kfree(lr->label);
-	gpio_device_put(lr->gdev);
+	gpio_device_put(gdev);
 	kfree(lr);
 }
 
-- 
2.39.2

