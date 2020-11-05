Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179982A7C0C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgKEKlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKEKlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 05:41:12 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365F3C0613CF;
        Thu,  5 Nov 2020 02:41:12 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id t22so584809plr.9;
        Thu, 05 Nov 2020 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W3gnZyAmXTZVbhb7LKm3sXbvwT/SP+v0RFw1GtMWZEY=;
        b=QNMc1AYzlOPIB/liIT2N1ErCmfxMFn1NCL2emcN8pRZOJeuFwroV+yfR5Aeqm0pvha
         PwAXn8uRQIx1NKmD6/QJ67moDVSjf4o43neKGS1uUmI+WXID9abYTVzGyRJcHkqKEGFE
         lunXYbm9K+NdyNiArvGzWpHaE13raq/FoDQ/KhuGijfYjvCTLJ9+1VGDEXUpOuptNOoC
         JvDwhM+6KN9dw/L0aLNUt5zOFY/3g9WjMLNNYSyF8kR3rOikq/sscJOXkiN7wTW85rSE
         SOQQGF8wn+sTvH92Jdn9PKvq/+NXb77qLakLHieVjMrRtH9SXqOpuvTNWtYZs1WhSpoa
         LyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W3gnZyAmXTZVbhb7LKm3sXbvwT/SP+v0RFw1GtMWZEY=;
        b=ITx48TxQY3Glgq0B+bK0+6kFLn6ru2TVVjzurI+lMQckMmaGllWoVGi131Opj/dxOy
         lrUI+VapSyxy2UtIs1YZJgXYTj+pClxzwu6bPyNjTl9Ccl4bA33iFuGsjhmUFoaKnwUS
         3FHaRGhSde1mJwe4h74K7eUgPrAuRf8ncNbFxSbmveGWTH0cVaZi9647K95V3RlD/KMi
         2/3Ued847HFnExQiW8DL+Rm8wzbJjI4HVnSiyPKKwp5NLtgh+w8EEp0k8HAJXjvvCv23
         2kTieWyEacvWMg7fMCQZ1NVHJCPIQCy/WrH3YZHTIDwOjm/3ui2qod8AetyCLHj0wm7o
         Dyyw==
X-Gm-Message-State: AOAM531zmxAtx68xSvmmsGS4Ffjq7dUvOCENVR3haGGm6lGT743PEjnN
        bxNIvK6LWKUSsazyrhy5haQkWSmqUneJrg==
X-Google-Smtp-Source: ABdhPJwP10PA1Cn+4qHlossF98IQc+6Etq+eMVs1qDsn4o7YRK6XQfxxHAR/yI0opAWZu81/HZSNoQ==
X-Received: by 2002:a17:902:82c3:b029:d6:c377:c87e with SMTP id u3-20020a17090282c3b02900d6c377c87emr1687122plz.85.1604572871236;
        Thu, 05 Nov 2020 02:41:11 -0800 (PST)
Received: from sol.lan (106-69-171-141.dyn.iinet.net.au. [106.69.171.141])
        by smtp.gmail.com with ESMTPSA id j13sm2055855pfd.97.2020.11.05.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 02:41:10 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        Nicolas Schichan <nschichan@freebox.fr>
Subject: [PATCH] gpiolib: fix sysfs when cdev is not selected
Date:   Thu,  5 Nov 2020 18:40:49 +0800
Message-Id: <20201105104049.91077-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In gpiochip_setup_dev() the call to gpiolib_cdev_register() indirectly
calls device_add().  This is still required for the sysfs even when
CONFIG_GPIO_CDEV is not selected in the build.

Replace the stubbed functions in gpiolib-cdev.h with macros in gpiolib.c
that perform the required device_add() and device_del() when
CONFIG_GPIO_CDEV is not selected.

Fixes: d143493c01b7 (gpiolib: make cdev a build option)
Reported-by: Nicolas Schichan <nschichan@freebox.fr>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.h | 15 ---------------
 drivers/gpio/gpiolib.c      | 18 +++++++++++++++---
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
index cb41dd757338..b42644cbffb8 100644
--- a/drivers/gpio/gpiolib-cdev.h
+++ b/drivers/gpio/gpiolib-cdev.h
@@ -7,22 +7,7 @@
 
 struct gpio_device;
 
-#ifdef CONFIG_GPIO_CDEV
-
 int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
 void gpiolib_cdev_unregister(struct gpio_device *gdev);
 
-#else
-
-static inline int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
-{
-	return 0;
-}
-
-static inline void gpiolib_cdev_unregister(struct gpio_device *gdev)
-{
-}
-
-#endif /* CONFIG_GPIO_CDEV */
-
 #endif /* GPIOLIB_CDEV_H */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8e29a60c3697..c980ddcda833 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -480,11 +480,23 @@ static void gpiodevice_release(struct device *dev)
 	kfree(gdev);
 }
 
+#ifdef CONFIG_GPIO_CDEV
+#define gcdev_register(gdev, devt)	gpiolib_cdev_register((gdev), (devt))
+#define gcdev_unregister(gdev)		gpiolib_cdev_unregister((gdev))
+#else
+/*
+ * gpiolib_cdev_register() indirectly calls device_add(), which is still
+ * required even when cdev is not selected.
+ */
+#define gcdev_register(gdev, devt)	device_add(&(gdev)->dev)
+#define gcdev_unregister(gdev)		device_del(&(gdev)->dev)
+#endif
+
 static int gpiochip_setup_dev(struct gpio_device *gdev)
 {
 	int ret;
 
-	ret = gpiolib_cdev_register(gdev, gpio_devt);
+	ret = gcdev_register(gdev, gpio_devt);
 	if (ret)
 		return ret;
 
@@ -500,7 +512,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 	return 0;
 
 err_remove_device:
-	gpiolib_cdev_unregister(gdev);
+	gcdev_unregister(gdev);
 	return ret;
 }
 
@@ -825,7 +837,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	 * be removed, else it will be dangling until the last user is
 	 * gone.
 	 */
-	gpiolib_cdev_unregister(gdev);
+	gcdev_unregister(gdev);
 	put_device(&gdev->dev);
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
-- 
2.29.2

