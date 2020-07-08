Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C889217E13
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgGHETj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHETj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:19:39 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED21CC061755;
        Tue,  7 Jul 2020 21:19:38 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l6so619325pjq.1;
        Tue, 07 Jul 2020 21:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKScUwPwGR54SrXti/OUBW9OyQkiVzQWLR/5wWYtdeg=;
        b=tHsd7jIIfPjZ5BBjFVaaCM03jiFbtEUSAooYHOEhG8zK0p8G24GUCsrBjOUG/cEpy7
         YLMEKDJ310u9WdRVftrceL1nm0A/Y8YLsFrF9F2UlI+sqlsQf5ZXeZUW6L8ULsKk7iLi
         VvG7njPxe3mlrh0gurQ7i6KY32FMCbacxaM2aXV4wmuZjcaHxxC/Mi+qdf+ZimfBWaK9
         7ulRNwEJVR7Kg4SE/aAdtOff/jq5E/8+xcwnvuqfnYE0jE3RPsusyqVvCk6zyp87WJH/
         IF5YOanNE769jEE0WEmaV/M1PgI/LE+wm1Gp0G3dbNSU/8zGR16Xx0sYXmcy0nCienek
         QfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKScUwPwGR54SrXti/OUBW9OyQkiVzQWLR/5wWYtdeg=;
        b=Lbx0DbvoeVXr/ZnkOmUlR0eas3Gdv1I3qVwKFoaUXhVqtDI8+sB1ioLMwB/jkL1YPN
         XELsHuHSV2e5aUcnQZebpoMEghyiOSFCGt8Womj3LFuLZibP6GJ1i0MEhNXenOObZvaH
         vsHgUSx5VbpO4vkvLY9NXc7jmEJ2uoRwDro350vt4GGxcCaHgsmpEZ2LChWa8HVlP/YO
         vD6d9wjW4dYzc7xDMwhapB+K8PJDfQqV/TVHB0ZrjE/exDjyDfTNjSqkNj6bz6/rWfCJ
         p/OEXsrqgVIoRm2mzc8lHaqgsIx9anqY/9fE7Dy+R2/tHiVT5Wy05vEX54P5c5OrWAeB
         8MgQ==
X-Gm-Message-State: AOAM530/pbDXR+g/cFKcDqe1jcUh8miQfwKUe91/ltSgQLXolSF1sqzQ
        l9NHDx2NW8Sn08bBnoP9EVKN9wr1
X-Google-Smtp-Source: ABdhPJzqaYqPgvGqEHmilUqhCMINjWcXuAWMjpmKh9nnc2NuV06ECLbtLG+T5nNfA2FS6XFZhnkKcA==
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr7949625pjb.129.1594181978008;
        Tue, 07 Jul 2020 21:19:38 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:19:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 08/17] gpiolib: cdev: use blocking notifier call chain instead of atomic
Date:   Wed,  8 Jul 2020 12:15:51 +0800
Message-Id: <20200708041600.768775-9-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace usage of atomic_notifier_call_chain with
blocking_notifier_call_chain as the notifier function,
lineinfo_changed_notify, calls gpio_desc_to_lineinfo,
which calls pinctrl_gpio_can_use_line, which can sleep.

The chain isn't being called from an atomic context so the
the blocking notifier is a suitable substitute.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 24 ++++++++++++------------
 drivers/gpio/gpiolib.c      | 14 +++++++-------
 drivers/gpio/gpiolib.h      |  2 +-
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index d50339ef6f05..352d815bbd07 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -158,8 +158,8 @@ static long linehandle_set_config(struct linehandle_state *lh,
 				return ret;
 		}
 
-		atomic_notifier_call_chain(&desc->gdev->notifier,
-					   GPIOLINE_CHANGED_CONFIG, desc);
+		blocking_notifier_call_chain(&desc->gdev->notifier,
+					     GPIOLINE_CHANGED_CONFIG, desc);
 	}
 	return 0;
 }
@@ -325,8 +325,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 				goto out_free_descs;
 		}
 
-		atomic_notifier_call_chain(&desc->gdev->notifier,
-					   GPIOLINE_CHANGED_REQUESTED, desc);
+		blocking_notifier_call_chain(&desc->gdev->notifier,
+					     GPIOLINE_CHANGED_REQUESTED, desc);
 
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
@@ -674,8 +674,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		goto out_free_desc;
 
-	atomic_notifier_call_chain(&desc->gdev->notifier,
-				   GPIOLINE_CHANGED_REQUESTED, desc);
+	blocking_notifier_call_chain(&desc->gdev->notifier,
+				     GPIOLINE_CHANGED_REQUESTED, desc);
 
 	le->irq = gpiod_to_irq(desc);
 	if (le->irq <= 0) {
@@ -1049,8 +1049,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	priv->gdev = gdev;
 
 	priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
-	ret = atomic_notifier_chain_register(&gdev->notifier,
-					     &priv->lineinfo_changed_nb);
+	ret = blocking_notifier_chain_register(&gdev->notifier,
+					       &priv->lineinfo_changed_nb);
 	if (ret)
 		goto out_free_bitmap;
 
@@ -1064,8 +1064,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	return ret;
 
 out_unregister_notifier:
-	atomic_notifier_chain_unregister(&gdev->notifier,
-					 &priv->lineinfo_changed_nb);
+	blocking_notifier_chain_unregister(&gdev->notifier,
+					   &priv->lineinfo_changed_nb);
 out_free_bitmap:
 	bitmap_free(priv->watched_lines);
 out_free_priv:
@@ -1085,8 +1085,8 @@ static int gpio_chrdev_release(struct inode *inode, struct file *file)
 	struct gpio_device *gdev = priv->gdev;
 
 	bitmap_free(priv->watched_lines);
-	atomic_notifier_chain_unregister(&gdev->notifier,
-					 &priv->lineinfo_changed_nb);
+	blocking_notifier_chain_unregister(&gdev->notifier,
+					   &priv->lineinfo_changed_nb);
 	put_device(&gdev->dev);
 	kfree(priv);
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d267c69482c..80137c1b3cdc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -615,7 +615,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
+	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->notifier);
 
 #ifdef CONFIG_PINCTRL
 	INIT_LIST_HEAD(&gdev->pin_ranges);
@@ -2049,8 +2049,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 	}
 
 	spin_unlock_irqrestore(&gpio_lock, flags);
-	atomic_notifier_call_chain(&desc->gdev->notifier,
-				   GPIOLINE_CHANGED_RELEASED, desc);
+	blocking_notifier_call_chain(&desc->gdev->notifier,
+				     GPIOLINE_CHANGED_RELEASED, desc);
 
 	return ret;
 }
@@ -3927,8 +3927,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 		return ERR_PTR(ret);
 	}
 
-	atomic_notifier_call_chain(&desc->gdev->notifier,
-				   GPIOLINE_CHANGED_REQUESTED, desc);
+	blocking_notifier_call_chain(&desc->gdev->notifier,
+				     GPIOLINE_CHANGED_REQUESTED, desc);
 
 	return desc;
 }
@@ -3995,8 +3995,8 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		return ERR_PTR(ret);
 	}
 
-	atomic_notifier_call_chain(&desc->gdev->notifier,
-				   GPIOLINE_CHANGED_REQUESTED, desc);
+	blocking_notifier_call_chain(&desc->gdev->notifier,
+				     GPIOLINE_CHANGED_REQUESTED, desc);
 
 	return desc;
 }
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2dee4e1e12dc..6709f79c02dd 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -56,7 +56,7 @@ struct gpio_device {
 	const char		*label;
 	void			*data;
 	struct list_head        list;
-	struct atomic_notifier_head notifier;
+	struct blocking_notifier_head notifier;
 
 #ifdef CONFIG_PINCTRL
 	/*
-- 
2.27.0

