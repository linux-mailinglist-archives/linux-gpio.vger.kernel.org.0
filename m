Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6459C217E1C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgGHEUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHEUP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:20:15 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0F6C061755;
        Tue,  7 Jul 2020 21:20:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 207so19201054pfu.3;
        Tue, 07 Jul 2020 21:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DIvxW6NTvtcgRygXCnNgm6ihM/xzXyllojs+21+/QHA=;
        b=FxZvmyUhiQS+eZk0doFEfyYWBptooh0Dl2lC4e8LBL5vFDGl7WA3Ij5BJc2xjXNnQY
         9f7u+u8aue29ilRcJmETn5eB09yrtX+EbOEnl/jG7VOB4kr7nPAXtvA0egIBLozqlGur
         QJ59gKSyD6DylelPjXRq3m7qUxgcRxuM9qdqL9Yakda40P2d/vxGfhR8Nr1et4dWz9Ls
         g9sqwCb/q6d1GbgBRgj51sU0jPgdS8EEaiCGvo1TAuRFOlbu1KMAlt1N0jbUVZvhr601
         DUFB/195mBA4JeTJqx/aM5eLZ0cJW/u7ma9TBnD/+c54n6rd5b5UtSV5Kw4+InO6Lfrn
         bj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIvxW6NTvtcgRygXCnNgm6ihM/xzXyllojs+21+/QHA=;
        b=nObWP5SuviCzcSRCvq20UnX7NrdXjjH/37Hwl7bw6NvvrxGh6kpFx0QQjhTl2tnXxu
         H/VGmBoAIwgU8agX5HmQPtzdJO5pjgEGqph6Hs9bULXZx2b/NEoSIzUu2D44pG5cUHDu
         EuqPZAhVdqFsm5gAsJv602J861Otqzkoi8yRqBOn57H1wF7q8JjCedpR25g3Ls7mhVwv
         bCZboosf8USTbnHZhoApNY7dehYOOXry2LhKwWb8yR1qFn1mQh4p1rgADao9j2gH0Hs5
         8zOGJUVwxCpEECIVO6Hox9zPGOgiD9ZUyJHppfFUO9wx9layuOPtBsTRQa8mlLdUJx+t
         jfAw==
X-Gm-Message-State: AOAM531UjGob/KciugW2dJsuSIB4g2YwzqKtLh4yW9Kptr+IUh9NcaEB
        1Mk0dd/NB6bx5e0JNag/2ZncJbc/
X-Google-Smtp-Source: ABdhPJxBBAQA8aepjonxxxHNRWzPcmRxuQJFw/achaMRFzAeAyUN6qUBF7W8JO0jJ2sb+OSx9l7p0w==
X-Received: by 2002:a62:7a07:: with SMTP id v7mr46136013pfc.76.1594182014766;
        Tue, 07 Jul 2020 21:20:14 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:20:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 12/17] gpiolib: cdev: refactor linehandle cleanup into linehandle_free
Date:   Wed,  8 Jul 2020 12:15:55 +0800
Message-Id: <20200708041600.768775-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Consolidate the cleanup of linehandles, currently duplicated in
linehandle_create and linehandle_release, into a helper function
linehandle_free.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 39 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index c86fb9305681..d56b367239cc 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -228,17 +228,21 @@ static long linehandle_ioctl_compat(struct file *file, unsigned int cmd,
 }
 #endif
 
-static int linehandle_release(struct inode *inode, struct file *file)
+static void linehandle_free(struct linehandle_state *lh)
 {
-	struct linehandle_state *lh = file->private_data;
-	struct gpio_device *gdev = lh->gdev;
 	int i;
 
 	for (i = 0; i < lh->num_descs; i++)
-		gpiod_free(lh->descs[i]);
+		if (lh->descs[i])
+			gpiod_free(lh->descs[i]);
 	kfree(lh->label);
+	put_device(&lh->gdev->dev);
 	kfree(lh);
-	put_device(&gdev->dev);
+}
+
+static int linehandle_release(struct inode *inode, struct file *file)
+{
+	linehandle_free(file->private_data);
 	return 0;
 }
 
@@ -257,7 +261,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	struct gpiohandle_request handlereq;
 	struct linehandle_state *lh;
 	struct file *file;
-	int fd, i, count = 0, ret;
+	int fd, i, ret;
 	u32 lflags;
 
 	if (copy_from_user(&handlereq, ip, sizeof(handlereq)))
@@ -288,6 +292,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
+	lh->num_descs = handlereq.lines;
+
 	/* Request each GPIO */
 	for (i = 0; i < handlereq.lines; i++) {
 		u32 offset = handlereq.lineoffsets[i];
@@ -295,19 +301,18 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 
 		if (IS_ERR(desc)) {
 			ret = PTR_ERR(desc);
-			goto out_free_descs;
+			goto out_free_lh;
 		}
 
 		ret = gpiod_request(desc, lh->label);
 		if (ret)
-			goto out_free_descs;
+			goto out_free_lh;
 		lh->descs[i] = desc;
-		count = i + 1;
 		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
-			goto out_free_descs;
+			goto out_free_lh;
 
 		/*
 		 * Lines have to be requested explicitly for input
@@ -318,11 +323,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 
 			ret = gpiod_direction_output(desc, val);
 			if (ret)
-				goto out_free_descs;
+				goto out_free_lh;
 		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
 			ret = gpiod_direction_input(desc);
 			if (ret)
-				goto out_free_descs;
+				goto out_free_lh;
 		}
 
 		blocking_notifier_call_chain(&desc->gdev->notifier,
@@ -331,12 +336,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
 	}
-	lh->num_descs = handlereq.lines;
 
 	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
-		goto out_free_descs;
+		goto out_free_lh;
 	}
 
 	file = anon_inode_getfile("gpio-linehandle",
@@ -368,13 +372,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 
 out_put_unused_fd:
 	put_unused_fd(fd);
-out_free_descs:
-	for (i = 0; i < count; i++)
-		gpiod_free(lh->descs[i]);
-	kfree(lh->label);
 out_free_lh:
-	kfree(lh);
-	put_device(&gdev->dev);
+	linehandle_free(lh);
 	return ret;
 }
 
-- 
2.27.0

