Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3952E217E1E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgGHEUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHEUX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:20:23 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC75C061755;
        Tue,  7 Jul 2020 21:20:22 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x72so9958995pfc.6;
        Tue, 07 Jul 2020 21:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UGbIGJBshzPLISykEztMgHEa0rXjOkE3qrOM3IAMwy4=;
        b=Dlxtv1kI/oaGzpjHEawhILekrWwQ4djkpA3JeUhxbUha9n2Y75u3bpjTqffdVYpA/U
         Y96XFZjF+1W9yj6KB8NGtvG4+u5USezNzWmYPiY21OMnoVnH6KrOsZCrixZCora3X1tI
         OTzmYfI05Y6GbTnvBs+To6UZ9Bb2H2EAISsEQdZKnLrSX9t2cwDtXDqU1WYSf4eSUwou
         lAxmbdDAhPASG0v7vKAQg6ZeGJXpaqpcC1zdmb85wzFeHKa+f+iA82BbMh/Dpcg453UT
         kqGQDsZYsFZHo5i/mP/tBWn+FSClA6tRoRhXho15ZfAIBwMjF9cgnEW53V3/p0B6Pm8G
         mPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UGbIGJBshzPLISykEztMgHEa0rXjOkE3qrOM3IAMwy4=;
        b=cap2VR+LHXdsZx5mtTMWl3CnemBXgDmGC40hI7tclSmFeFuQHUtEO4hfgAZ/B0FvJr
         u66m2V7XArBya8J+wfaLcEfWoaqiB7mC7gxAhPEZLTp0iNTOMpZkSzi4K6bW953p8aXE
         QQlm/ZCSOZmAbBjWMTKNk/2Cz2b3+FOIioAtPNjZ9h738hyGLE/WDydtNr2Xl7HZMWxP
         8n8EbFP52ARMj8JlA7Uu/yvwm0eqSr4hZKtXmp6QDK6+dkpVTUA9N6vReccJ38zB++sX
         FnXOfX/Q+JQI7+hZHLYAkmwI0t14tlM4neb9VDgIdpx6y/8bVtY51QitxcRPLvFUA+AA
         pJ8w==
X-Gm-Message-State: AOAM531BtoS93Tzgm0q+K1yK5ECDZLouXDxcJFnhL2uRnc4ydbndzQ0R
        gQ++rKB9b8xmwuyS+cto6fXSuOvj
X-Google-Smtp-Source: ABdhPJwBRdl6uFMDofXXmt/eyg6u6Y6C81uFfYjdGhWbanU7jaUcJ4pqiQQaIL2kEQAzVRizLIOpDQ==
X-Received: by 2002:a62:cd0c:: with SMTP id o12mr29870413pfg.70.1594182021646;
        Tue, 07 Jul 2020 21:20:21 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:20:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 13/17] gpiolib: cdev: refactor lineevent cleanup into lineevent_free
Date:   Wed,  8 Jul 2020 12:15:56 +0800
Message-Id: <20200708041600.768775-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Consolidate the cleanup of lineevents, currently duplicated in
lineevent_create and lineevent_release, into a helper function
lineevent_free.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 44 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d56b367239cc..e6c9b78adfc2 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -478,16 +478,20 @@ static ssize_t lineevent_read(struct file *file,
 	return bytes_read;
 }
 
-static int lineevent_release(struct inode *inode, struct file *file)
+static void lineevent_free(struct lineevent_state *le)
 {
-	struct lineevent_state *le = file->private_data;
-	struct gpio_device *gdev = le->gdev;
-
-	free_irq(le->irq, le);
-	gpiod_free(le->desc);
+	if (le->irq)
+		free_irq(le->irq, le);
+	if (le->desc)
+		gpiod_free(le->desc);
 	kfree(le->label);
+	put_device(&le->gdev->dev);
 	kfree(le);
-	put_device(&gdev->dev);
+}
+
+static int lineevent_release(struct inode *inode, struct file *file)
+{
+	lineevent_free(file->private_data);
 	return 0;
 }
 
@@ -612,7 +616,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	u32 eflags;
 	int fd;
 	int ret;
-	int irqflags = 0;
+	int irq, irqflags = 0;
 
 	if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
 		return -EFAULT;
@@ -663,7 +667,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	ret = gpiod_request(desc, le->label);
 	if (ret)
-		goto out_free_label;
+		goto out_free_le;
 	le->desc = desc;
 	le->eflags = eflags;
 
@@ -671,16 +675,17 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	ret = gpiod_direction_input(desc);
 	if (ret)
-		goto out_free_desc;
+		goto out_free_le;
 
 	blocking_notifier_call_chain(&desc->gdev->notifier,
 				     GPIOLINE_CHANGED_REQUESTED, desc);
 
-	le->irq = gpiod_to_irq(desc);
-	if (le->irq <= 0) {
+	irq = gpiod_to_irq(desc);
+	if (irq <= 0) {
 		ret = -ENODEV;
-		goto out_free_desc;
+		goto out_free_le;
 	}
+	le->irq = irq;
 
 	if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
 		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
@@ -701,12 +706,12 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 				   le->label,
 				   le);
 	if (ret)
-		goto out_free_desc;
+		goto out_free_le;
 
 	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
-		goto out_free_irq;
+		goto out_free_le;
 	}
 
 	file = anon_inode_getfile("gpio-event",
@@ -735,15 +740,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 out_put_unused_fd:
 	put_unused_fd(fd);
-out_free_irq:
-	free_irq(le->irq, le);
-out_free_desc:
-	gpiod_free(le->desc);
-out_free_label:
-	kfree(le->label);
 out_free_le:
-	kfree(le);
-	put_device(&gdev->dev);
+	lineevent_free(le);
 	return ret;
 }
 
-- 
2.27.0

