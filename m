Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B9820483C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732090AbgFWECU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:19 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D31C061573;
        Mon, 22 Jun 2020 21:02:18 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 35so8570263ple.0;
        Mon, 22 Jun 2020 21:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=50A+57oNtWj42gOSg5v2EX3MIYnScq3Cr8E/fLbZgrE=;
        b=a29TlWyuZYksNnnu6UCD5wPNBTWA/ZbWASZ++9HVk0Yz7/uTAYodW+7upE9oXcIWxH
         a4wuNUrwOX2EgOyOQYZo0auqhWr1IcyFwp6eT+C18KIPGwdjyYXiJMxGIk9H5QYSFuxb
         yD9RfZUxOw0hcPwwMh/8FrA9SkqHOqyy6pjY5ddIxwkBJD41BpKAfAohI6Bldb1p87yV
         cvg9xUzTWOOWUj+ZhMJocYUmIzJdRfqvliOEC3Gb6uuQmFXOdjMXqmbdOdo0Hb0oEx1Z
         AL5EeowJZn1Qpkpj5e0K4qDPz7N7lIzqestp/TT9q+kahhioFHRsDlYbFB57jv0YyO8i
         5YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=50A+57oNtWj42gOSg5v2EX3MIYnScq3Cr8E/fLbZgrE=;
        b=XKi7P7j6Ot9zixEXSmUwl2xGVAvQdpXPZ6dkgvN3FIFNydflOtj+74IunzfquOYtfa
         W18Y8/xo09wgn+ds8pd/7TtIBJapdWK4SU4qYYWViJCnZtllKy6kiI4OR3k7PN/TL8ye
         mTYki8v7B18mLXA1oBQNvpx4rkiAChMiUtm00JK4M2a0knF2M8ZK+C7LFd1WzKrjjz9M
         Cia27/ees9ZuaApmoLGgzvXF5QofmofRziqG1P2tc9nGeIRuECBaJgPG2vXauQTy/piw
         leQtbDXd7WaTNQ4UR6yXABvgyTrYVdiUme6IuJ6B4SILElFQj1K0RStcIP868qb0Q9pv
         +r/w==
X-Gm-Message-State: AOAM533B4plB4QBdlfA6pl73MzHr/TbfbiXX3RTcGrbdCGUnh1b8B39t
        IA4QJLUmMEaB//igJsvKx8Q0PCwKF7s=
X-Google-Smtp-Source: ABdhPJznyk4BwGAFmlF51orHQoQIddHt3cvY2DHd4pRk4PYnLpSrBrxgE/tyQsPWEJnIW9oFhIa0HQ==
X-Received: by 2002:a17:90a:c797:: with SMTP id gn23mr20902231pjb.165.1592884937440;
        Mon, 22 Jun 2020 21:02:17 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:16 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 06/22] gpiolib: cdev: rename numdescs to num_descs
Date:   Tue, 23 Jun 2020 12:00:51 +0800
Message-Id: <20200623040107.22270-7-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
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

