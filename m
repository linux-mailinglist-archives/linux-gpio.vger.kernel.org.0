Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0169B2E31C4
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Dec 2020 17:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgL0QLx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Dec 2020 11:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgL0QLw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2020 11:11:52 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363B7C061794;
        Sun, 27 Dec 2020 08:11:12 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id lj6so4703070pjb.0;
        Sun, 27 Dec 2020 08:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i6p2UW6EU9A0PrBwXfl5XYJJzkMNaCXZS8epnLsn3ok=;
        b=RYuHqlL0dFX9Qh6WEEygfDRzTxRVDmehq6WmSzRP/vuxtuaXlci0wWT336CqG8GHXz
         XBIcGxAcIvgehUbX040bEHqMoipoPYJ+KDQxSxSRjgU46hdZB6bLFOAF/VQW5D5X3zav
         9N3lRcJUzuKqE1Jk6+1F/rDz4u66dpqzbcG0Krnj6pHniA3DNX4nQihtlr9hLYkM5v6R
         n4CneO+4tH+GNhRHhCYHuzdyVg16d6eVdBKsWuKxDZO27UPuwJgAfdfc+AAHO0LEYo+j
         0p9wjQJGH4iTe4phWzqqMWcH7KeZ9cU+EKi0qkg+QYr63zc7I7IPAU3BV01WGbQphTGg
         VJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i6p2UW6EU9A0PrBwXfl5XYJJzkMNaCXZS8epnLsn3ok=;
        b=WZ3N1NU6ddNi65chrO9qeCPwfnSuCQyr2G3v45zwJ25h4o4aTJ99WTjcpJyp8bv4np
         Uk398Szqx0my60bsO7mE7K2D5Jyk1WXVY6XuA09RPN4sl3e+wdnkYEiKImtpEeg3KPij
         TrZp/1mjhV5CdEEIJxRZot4+0ai5QD0z2k0kzLY70JCASLH+ybHusZ46P5HG1UXeTvEo
         L9/HKQHZQciBuoCp6qCAkJBynIyX2AmxUAW5o8OZbCzCU2NwEHttkea+OwB3IhshYmJG
         a9rpWDP9Ba6dTF3kd959lMg6M5vqKjRkJrFPlPyrEQ+FPc5+QWcvIfndOTA1e8QG3jc9
         ghJQ==
X-Gm-Message-State: AOAM530sVt4JCCujCCNuUbnRpzNvrUUQ1xOy8Aw1Ftv4R9HPE7vVFF+U
        x2pPlauddz3taOtZuyleh0ngyOrkNRV/Qw==
X-Google-Smtp-Source: ABdhPJySr4lDS7f9d3hG5U784+2D6SIId6P08R5eULUhqSQuzxhPHBBS4cPCAirC+/rK8Ma02D6NFQ==
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr17099366pjx.0.1609085470981;
        Sun, 27 Dec 2020 08:11:10 -0800 (PST)
Received: from sol.lan (106-69-181-20.dyn.iinet.net.au. [106.69.181.20])
        by smtp.gmail.com with ESMTPSA id t7sm33801507pfe.179.2020.12.27.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 08:11:10 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] gpiolib: cdev: fix frame size warning in gpio_ioctl()
Date:   Mon, 28 Dec 2020 00:10:40 +0800
Message-Id: <20201227161040.1645545-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The kernel test robot reports the following warning in [1]:

 drivers/gpio/gpiolib-cdev.c: In function 'gpio_ioctl':
 >>drivers/gpio/gpiolib-cdev.c:1437:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Refactor gpio_ioctl() to handle each ioctl in its own helper function
and so reduce the variables stored on the stack to those explicitly
required to service the ioctl at hand.

The lineinfo_get_v1() helper handles both the GPIO_GET_LINEINFO_IOCTL
and GPIO_GET_LINEINFO_WATCH_IOCTL, as per the corresponding v2
implementation - lineinfo_get().

[1] https://lore.kernel.org/lkml/202012270910.VW3qc1ER-lkp@intel.com/

Fixes: aad955842d1c ("gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 145 ++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 72 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 12b679ca552c..1a7b51163528 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1979,6 +1979,21 @@ struct gpio_chardev_data {
 #endif
 };
 
+static int chipinfo_get(struct gpio_chardev_data *cdev, void __user *ip)
+{
+	struct gpio_device *gdev = cdev->gdev;
+	struct gpiochip_info chipinfo;
+
+	memset(&chipinfo, 0, sizeof(chipinfo));
+
+	strscpy(chipinfo.name, dev_name(&gdev->dev), sizeof(chipinfo.name));
+	strscpy(chipinfo.label, gdev->label, sizeof(chipinfo.label));
+	chipinfo.lines = gdev->ngpio;
+	if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
+		return -EFAULT;
+	return 0;
+}
+
 #ifdef CONFIG_GPIO_CDEV_V1
 /*
  * returns 0 if the versions match, else the previously selected ABI version
@@ -1993,6 +2008,41 @@ static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
 
 	return abiv;
 }
+
+static int lineinfo_get_v1(struct gpio_chardev_data *cdev, void __user *ip,
+			   bool watch)
+{
+	struct gpio_desc *desc;
+	struct gpioline_info lineinfo;
+	struct gpio_v2_line_info lineinfo_v2;
+
+	if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
+		return -EFAULT;
+
+	/* this doubles as a range check on line_offset */
+	desc = gpiochip_get_desc(cdev->gdev->chip, lineinfo.line_offset);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	if (watch) {
+		if (lineinfo_ensure_abi_version(cdev, 1))
+			return -EPERM;
+
+		if (test_and_set_bit(lineinfo.line_offset, cdev->watched_lines))
+			return -EBUSY;
+	}
+
+	gpio_desc_to_lineinfo(desc, &lineinfo_v2);
+	gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
+
+	if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
+		if (watch)
+			clear_bit(lineinfo.line_offset, cdev->watched_lines);
+		return -EFAULT;
+	}
+
+	return 0;
+}
 #endif
 
 static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
@@ -2030,6 +2080,22 @@ static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
 	return 0;
 }
 
+static int lineinfo_unwatch(struct gpio_chardev_data *cdev, void __user *ip)
+{
+	__u32 offset;
+
+	if (copy_from_user(&offset, ip, sizeof(offset)))
+		return -EFAULT;
+
+	if (offset >= cdev->gdev->ngpio)
+		return -EINVAL;
+
+	if (!test_and_clear_bit(offset, cdev->watched_lines))
+		return -EBUSY;
+
+	return 0;
+}
+
 /*
  * gpio_ioctl() - ioctl handler for the GPIO chardev
  */
@@ -2037,80 +2103,24 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct gpio_chardev_data *cdev = file->private_data;
 	struct gpio_device *gdev = cdev->gdev;
-	struct gpio_chip *gc = gdev->chip;
 	void __user *ip = (void __user *)arg;
-	__u32 offset;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!gc)
+	if (!gdev->chip)
 		return -ENODEV;
 
 	/* Fill in the struct and pass to userspace */
 	if (cmd == GPIO_GET_CHIPINFO_IOCTL) {
-		struct gpiochip_info chipinfo;
-
-		memset(&chipinfo, 0, sizeof(chipinfo));
-
-		strscpy(chipinfo.name, dev_name(&gdev->dev),
-			sizeof(chipinfo.name));
-		strscpy(chipinfo.label, gdev->label,
-			sizeof(chipinfo.label));
-		chipinfo.lines = gdev->ngpio;
-		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
-			return -EFAULT;
-		return 0;
+		return chipinfo_get(cdev, ip);
 #ifdef CONFIG_GPIO_CDEV_V1
-	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
-		struct gpio_desc *desc;
-		struct gpioline_info lineinfo;
-		struct gpio_v2_line_info lineinfo_v2;
-
-		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
-			return -EFAULT;
-
-		/* this doubles as a range check on line_offset */
-		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
-		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
-		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
-
-		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
-			return -EFAULT;
-		return 0;
 	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
 		return linehandle_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
 		return lineevent_create(gdev, ip);
-	} else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
-		struct gpio_desc *desc;
-		struct gpioline_info lineinfo;
-		struct gpio_v2_line_info lineinfo_v2;
-
-		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
-			return -EFAULT;
-
-		/* this doubles as a range check on line_offset */
-		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
-		if (lineinfo_ensure_abi_version(cdev, 1))
-			return -EPERM;
-
-		if (test_and_set_bit(lineinfo.line_offset, cdev->watched_lines))
-			return -EBUSY;
-
-		gpio_desc_to_lineinfo(desc, &lineinfo_v2);
-		gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
-
-		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
-			clear_bit(lineinfo.line_offset, cdev->watched_lines);
-			return -EFAULT;
-		}
-
-		return 0;
+	} else if (cmd == GPIO_GET_LINEINFO_IOCTL ||
+		   cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
+		return lineinfo_get_v1(cdev, ip,
+				       cmd == GPIO_GET_LINEINFO_WATCH_IOCTL);
 #endif /* CONFIG_GPIO_CDEV_V1 */
 	} else if (cmd == GPIO_V2_GET_LINEINFO_IOCTL ||
 		   cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
@@ -2119,16 +2129,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	} else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
 		return linereq_create(gdev, ip);
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
-		if (copy_from_user(&offset, ip, sizeof(offset)))
-			return -EFAULT;
-
-		if (offset >= cdev->gdev->ngpio)
-			return -EINVAL;
-
-		if (!test_and_clear_bit(offset, cdev->watched_lines))
-			return -EBUSY;
-
-		return 0;
+		return lineinfo_unwatch(cdev, ip);
 	}
 	return -EINVAL;
 }
-- 
2.29.2

