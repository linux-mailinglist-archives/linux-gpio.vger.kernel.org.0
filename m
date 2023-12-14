Return-Path: <linux-gpio+bounces-1446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CA812C57
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 10:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D9FEB210C5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF69381C0;
	Thu, 14 Dec 2023 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZslGmxTD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F45E93;
	Thu, 14 Dec 2023 01:58:35 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ba04b9b103so3676221b6e.0;
        Thu, 14 Dec 2023 01:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702547914; x=1703152714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gJi4LxvmNnRwy+ZXLJeCQFxn2HJX+TXcVbWnXB+RB0=;
        b=ZslGmxTDknzAIBVEHhviJPGEAKItCXpBjtQvU8th/J/RBFfVJ3zUQLH5OZv5Jnn2dH
         5jWqyiBvPU8NeVvd6TV3GM/p8U21q32Pt3F5OMJGXyHPcA75U24AIMhv/ixRyAWp4Hat
         HukkllAmefGb/Hu0AVeZYTCfR0YmLT2ioHm2n0w3bFZaU49qLCAGyOgQ3c5cUvk9UT2S
         PgM15zrrQ3lIofrP8J1t3/5PSrdilVTfN1gkljzG3sCWt3fGrvLPZRcOwAU/agYwoWyO
         j/a5bLhMT0O7Rn8SIkSDJgTbL9Kmrg4/4WB7x6Njn/3CRkLgpf4CR/XYtLHR6ouzxlZ5
         2XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547914; x=1703152714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gJi4LxvmNnRwy+ZXLJeCQFxn2HJX+TXcVbWnXB+RB0=;
        b=r2PtzdXSjt+qqmhunGaDv/smSeDbu6InASoqJrjR7EZRFM/8bMqZ/TmnQq7ciPZ/Gt
         lOIr7cYL+hrUac/0FczYPdbyqSDofmM8Bsdhj27VPaRfeIBLOQHInyw5atGkal9nzgHs
         rfKBMeVhCMppTOJxdwHPgO1aFDAPo+5zlPCTe3GR61iVRNIvB27Ex5Yrog6HOJKbm/q1
         vcmjYG8SDEPSez82hw6AZ4uWoqxGRdLncTHaWQGJ12ENeQcSWhB2powOkxLLUPWGJ3sz
         hqnqSljCVxwtOewssK+pEnu+2yUbVeGv6HAnVsj2bwMwM6IGu7gGWHcpaKiloGrpN5lO
         2ooA==
X-Gm-Message-State: AOJu0YzzrfTM9T90yUNGbVdHa2Vf8qq5bWxHLc3oVuiH0hcn2o84jsBV
	Yn50LEjSgypyrtsBRf7vwO+DFG7n5JU=
X-Google-Smtp-Source: AGHT+IF9JCW4aaRTiN+oCbIXxGVa2QxUq/ANw53mDpDLla2LTeF/YwQ3KRQibJtJ3QvHIayOfU1SPQ==
X-Received: by 2002:a05:6808:1443:b0:3a7:2390:3583 with SMTP id x3-20020a056808144300b003a723903583mr12511147oiv.38.1702547914214;
        Thu, 14 Dec 2023 01:58:34 -0800 (PST)
Received: from rigel.home.arpa (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id r2-20020a1709028bc200b001bc6e6069a6sm922807plo.122.2023.12.14.01.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:58:33 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	andy@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 1/5] gpiolib: cdev: adopt scoped_guard()
Date: Thu, 14 Dec 2023 17:58:10 +0800
Message-Id: <20231214095814.132400-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214095814.132400-1-warthog618@gmail.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scoped_guard for critical sections rather than distinct
lock/unlock pairs.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 140 +++++++++++++++---------------------
 1 file changed, 57 insertions(+), 83 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 02ffda6c1e51..d03698812f61 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -625,13 +625,13 @@ static void linereq_put_event(struct linereq *lr,
 {
 	bool overflow = false;
 
-	spin_lock(&lr->wait.lock);
-	if (kfifo_is_full(&lr->events)) {
-		overflow = true;
-		kfifo_skip(&lr->events);
+	scoped_guard(spinlock, &lr->wait.lock) {
+		if (kfifo_is_full(&lr->events)) {
+			overflow = true;
+			kfifo_skip(&lr->events);
+		}
+		kfifo_in(&lr->events, le, 1);
 	}
-	kfifo_in(&lr->events, le, 1);
-	spin_unlock(&lr->wait.lock);
 	if (!overflow)
 		wake_up_poll(&lr->wait, EPOLLIN);
 	else
@@ -1370,11 +1370,8 @@ static long linereq_set_values(struct linereq *lr, void __user *ip)
 	if (copy_from_user(&lv, ip, sizeof(lv)))
 		return -EFAULT;
 
-	mutex_lock(&lr->config_mutex);
-
-	ret = linereq_set_values_unlocked(lr, &lv);
-
-	mutex_unlock(&lr->config_mutex);
+	scoped_guard(mutex, &lr->config_mutex)
+		ret = linereq_set_values_unlocked(lr, &lv);
 
 	return ret;
 }
@@ -1434,11 +1431,8 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 	if (ret)
 		return ret;
 
-	mutex_lock(&lr->config_mutex);
-
-	ret = linereq_set_config_unlocked(lr, &lc);
-
-	mutex_unlock(&lr->config_mutex);
+	scoped_guard(mutex, &lr->config_mutex)
+		ret = linereq_set_config_unlocked(lr, &lc);
 
 	return ret;
 }
@@ -1522,28 +1516,22 @@ static ssize_t linereq_read_unlocked(struct file *file, char __user *buf,
 		return -EINVAL;
 
 	do {
-		spin_lock(&lr->wait.lock);
-		if (kfifo_is_empty(&lr->events)) {
-			if (bytes_read) {
-				spin_unlock(&lr->wait.lock);
-				return bytes_read;
-			}
-
-			if (file->f_flags & O_NONBLOCK) {
-				spin_unlock(&lr->wait.lock);
-				return -EAGAIN;
+		scoped_guard(spinlock, &lr->wait.lock) {
+			if (kfifo_is_empty(&lr->events)) {
+				if (bytes_read)
+					return bytes_read;
+
+				if (file->f_flags & O_NONBLOCK)
+					return -EAGAIN;
+
+				ret = wait_event_interruptible_locked(lr->wait,
+						!kfifo_is_empty(&lr->events));
+				if (ret)
+					return ret;
 			}
 
-			ret = wait_event_interruptible_locked(lr->wait,
-					!kfifo_is_empty(&lr->events));
-			if (ret) {
-				spin_unlock(&lr->wait.lock);
-				return ret;
-			}
+			ret = kfifo_out(&lr->events, &le, 1);
 		}
-
-		ret = kfifo_out(&lr->events, &le, 1);
-		spin_unlock(&lr->wait.lock);
 		if (ret != 1) {
 			/*
 			 * This should never happen - we were holding the
@@ -1888,28 +1876,22 @@ static ssize_t lineevent_read_unlocked(struct file *file, char __user *buf,
 		return -EINVAL;
 
 	do {
-		spin_lock(&le->wait.lock);
-		if (kfifo_is_empty(&le->events)) {
-			if (bytes_read) {
-				spin_unlock(&le->wait.lock);
-				return bytes_read;
+		scoped_guard(spinlock, &le->wait.lock) {
+			if (kfifo_is_empty(&le->events)) {
+				if (bytes_read)
+					return bytes_read;
+
+				if (file->f_flags & O_NONBLOCK)
+					return -EAGAIN;
+
+				ret = wait_event_interruptible_locked(le->wait,
+						!kfifo_is_empty(&le->events));
+				if (ret)
+					return ret;
 			}
 
-			if (file->f_flags & O_NONBLOCK) {
-				spin_unlock(&le->wait.lock);
-				return -EAGAIN;
-			}
-
-			ret = wait_event_interruptible_locked(le->wait,
-					!kfifo_is_empty(&le->events));
-			if (ret) {
-				spin_unlock(&le->wait.lock);
-				return ret;
-			}
+			ret = kfifo_out(&le->events, &ge, 1);
 		}
-
-		ret = kfifo_out(&le->events, &ge, 1);
-		spin_unlock(&le->wait.lock);
 		if (ret != 1) {
 			/*
 			 * This should never happen - we were holding the lock
@@ -2613,38 +2595,30 @@ static ssize_t lineinfo_watch_read_unlocked(struct file *file, char __user *buf,
 #endif
 
 	do {
-		spin_lock(&cdev->wait.lock);
-		if (kfifo_is_empty(&cdev->events)) {
-			if (bytes_read) {
-				spin_unlock(&cdev->wait.lock);
-				return bytes_read;
-			}
-
-			if (file->f_flags & O_NONBLOCK) {
-				spin_unlock(&cdev->wait.lock);
-				return -EAGAIN;
-			}
-
-			ret = wait_event_interruptible_locked(cdev->wait,
-					!kfifo_is_empty(&cdev->events));
-			if (ret) {
-				spin_unlock(&cdev->wait.lock);
-				return ret;
+		scoped_guard(spinlock, &cdev->wait.lock) {
+			if (kfifo_is_empty(&cdev->events)) {
+				if (bytes_read)
+					return bytes_read;
+
+				if (file->f_flags & O_NONBLOCK)
+					return -EAGAIN;
+
+				ret = wait_event_interruptible_locked(cdev->wait,
+						!kfifo_is_empty(&cdev->events));
+				if (ret)
+					return ret;
 			}
-		}
 #ifdef CONFIG_GPIO_CDEV_V1
-		/* must be after kfifo check so watch_abi_version is set */
-		if (atomic_read(&cdev->watch_abi_version) == 2)
-			event_size = sizeof(struct gpio_v2_line_info_changed);
-		else
-			event_size = sizeof(struct gpioline_info_changed);
-		if (count < event_size) {
-			spin_unlock(&cdev->wait.lock);
-			return -EINVAL;
-		}
+			/* must be after kfifo check so watch_abi_version is set */
+			if (atomic_read(&cdev->watch_abi_version) == 2)
+				event_size = sizeof(struct gpio_v2_line_info_changed);
+			else
+				event_size = sizeof(struct gpioline_info_changed);
+			if (count < event_size)
+				return -EINVAL;
 #endif
-		ret = kfifo_out(&cdev->events, &event, 1);
-		spin_unlock(&cdev->wait.lock);
+			ret = kfifo_out(&cdev->events, &event, 1);
+		}
 		if (ret != 1) {
 			ret = -EIO;
 			break;
-- 
2.39.2


