Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04B6217E0F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgGHETT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHETT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:19:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEB5C061755;
        Tue,  7 Jul 2020 21:19:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id f16so619673pjt.0;
        Tue, 07 Jul 2020 21:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=205+60/P7OwdA5V7AIyIGdUsYZG8liqbjg0Asic3sG4=;
        b=Se4REoZmEtf7kttzrO20zaVgBQyXl9LdfHvbvtR0poQ6wDTW1HSMzF3h4Rp/PdxIrs
         LlXFfyNSXvNRsSf3t/wezL92iYbyOp++thAbtqnZFDnamOJ5DYSTLxgBYrStMWwReMH9
         0st1vaIZrqSOWm5pwuyUCiJo2188yMVLO7WK4y4pOefPiaa3jALGTYxAvF6IFdFL/FkN
         uuinij9EoTjKFMptUEm+bepEbw1EMtjs3hV+lqs9XkLGxMcdYsu5cWal++clJgbO33n+
         BL5Z66GKUTvmlzyNit3ODyfGRjQyxBPNHJvIRg7szK9PgbwBbcMsyPa+LkzTnHxPOwzg
         g4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=205+60/P7OwdA5V7AIyIGdUsYZG8liqbjg0Asic3sG4=;
        b=lp91ECWgjW9jyA+MLMzL95XajvgJZu6nyrWM/FNol9YpnQ5tS6FAnr3lLadgWYkqyc
         r7g+95OdVRNLbXzTYGXqTwYOx0NA/Eu3eyoHeJ6zA8b0YqSBKFAXcNl511x35M/+fQOO
         Zpgy6X7r3szEg1H9SFDfbUSztIVMVyH6fX+vJjzt5u6ZmeKXJwyR0OHSxu0RVT8bzE/I
         oYr5ZiN7GcKLKyXYKdgmyfe5J0JNGrSSpHvR8UnSJOaYRlcIbiqk8wzgFiyTzzhZQSFw
         xHR52kZaMt21slQzKJC4c6TmUorREbD39hy8h9/3EJP9XZ5TrIXm84zzOPSjiaClYYRI
         MrXg==
X-Gm-Message-State: AOAM530uziCxBvfCQneeimBG/sBPsdMWitCONVonItPHJKEygk5AA39F
        aH3dsOXoBeFsLsVflrdG0XQa8Zyl
X-Google-Smtp-Source: ABdhPJxL2zLFZXurx3OlwWmk1TZXmW9NpRRKZeEKCPHoZmiobSjDKX/34tr87rLFd8rn04Xk8yUvPg==
X-Received: by 2002:a17:90b:2350:: with SMTP id ms16mr7932377pjb.224.1594181958201;
        Tue, 07 Jul 2020 21:19:18 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:19:17 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 06/17] gpiolib: cdev: rename numdescs to num_descs
Date:   Wed,  8 Jul 2020 12:15:49 +0800
Message-Id: <20200708041600.768775-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rename numdescs to num_descs to be more consistent with the naming of
other counters and improve readability.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0d3a799e09ae..b39e7ef8c0d4 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -39,13 +39,13 @@
  * @gdev: the GPIO device the handle pertains to
  * @label: consumer label used to tag descriptors
  * @descs: the GPIO descriptors held by this handle
- * @numdescs: the number of descriptors held in the descs array
+ * @num_descs: the number of descriptors held in the descs array
  */
 struct linehandle_state {
 	struct gpio_device *gdev;
 	const char *label;
 	struct gpio_desc *descs[GPIOHANDLES_MAX];
-	u32 numdescs;
+	u32 num_descs;
 };
 
 #define GPIOHANDLE_REQUEST_VALID_FLAGS \
@@ -138,7 +138,7 @@ static long linehandle_set_config(struct linehandle_state *lh,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < lh->numdescs; i++) {
+	for (i = 0; i < lh->num_descs; i++) {
 		desc = lh->descs[i];
 		linehandle_flags_to_desc_flags(gcnf.flags, &desc->flags);
 
@@ -177,7 +177,7 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 		/* NOTE: It's ok to read values of output lines. */
 		int ret = gpiod_get_array_value_complex(false,
 							true,
-							lh->numdescs,
+							lh->num_descs,
 							lh->descs,
 							NULL,
 							vals);
@@ -185,7 +185,7 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 			return ret;
 
 		memset(&ghd, 0, sizeof(ghd));
-		for (i = 0; i < lh->numdescs; i++)
+		for (i = 0; i < lh->num_descs; i++)
 			ghd.values[i] = test_bit(i, vals);
 
 		if (copy_to_user(ip, &ghd, sizeof(ghd)))
@@ -204,13 +204,13 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 			return -EFAULT;
 
 		/* Clamp all values to [0,1] */
-		for (i = 0; i < lh->numdescs; i++)
+		for (i = 0; i < lh->num_descs; i++)
 			__assign_bit(i, vals, ghd.values[i]);
 
 		/* Reuse the array setting function */
 		return gpiod_set_array_value_complex(false,
 						     true,
-						     lh->numdescs,
+						     lh->num_descs,
 						     lh->descs,
 						     NULL,
 						     vals);
@@ -234,7 +234,7 @@ static int linehandle_release(struct inode *inode, struct file *file)
 	struct gpio_device *gdev = lh->gdev;
 	int i;
 
-	for (i = 0; i < lh->numdescs; i++)
+	for (i = 0; i < lh->num_descs; i++)
 		gpiod_free(lh->descs[i]);
 	kfree(lh->label);
 	kfree(lh);
@@ -333,7 +333,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	}
 	/* Let i point at the last handle */
 	i--;
-	lh->numdescs = handlereq.lines;
+	lh->num_descs = handlereq.lines;
 
 	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
@@ -364,7 +364,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	fd_install(fd, file);
 
 	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
-		lh->numdescs);
+		lh->num_descs);
 
 	return 0;
 
-- 
2.27.0

