Return-Path: <linux-gpio+bounces-6645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC28CFF6F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 068461C212CB
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 11:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DF015DBB3;
	Mon, 27 May 2024 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7GALYZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5905A13AA31;
	Mon, 27 May 2024 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716810958; cv=none; b=Nl12LRGWhL40Hh/+Br2B/vrvbAKzPDe6/XqyT5YutsYc2kVZjX0vNtJMG2Z0VGJ7ThUnwY0/M57DI5X62sImE1JRxQvvljb6X+jxmRtjolxMlUBnrxiVWOb6YeoXDo2w7SxjBcT9/VolBFoekCIgZZtDHPdw4WGjFbllm9f48Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716810958; c=relaxed/simple;
	bh=XmO9cPon2zzzsUypK4aJv1Cb6tsJcKac4jB3cPU6A0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oEw1husUm5VJOhn1G7h9vqycE0oqYbpRKbCapMpz/P57mgHSqnW3/eK5LHgPX8+IAlY81wvpbt8FNVs38DDzkKmHvfldYSvuIa0Kua+I/0jH98bqY9IGIzoo7TcJqOdYDcq9wVge9rp7yYO8Vp5V0SG3Lfwbe29f3sjg/EIGNTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7GALYZP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70109d34a16so795446b3a.2;
        Mon, 27 May 2024 04:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716810956; x=1717415756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUX9Qc2CwQXtipTZ8HtlhuYljQCKpgoWARDk9odQFco=;
        b=l7GALYZP+OUhuHez1HW3VilpPi0IEi7Iw4MUFbWTlCXFXbKafHinjju8OL48MldMQf
         aVlzLg2bs8GdU/sQqn4C9BWWeMtBDiYSNAvtmIMfbJGSP7yjdiyO/h+mFdRKyvVSNa+p
         sGgWYCZUx8g203DXooncnMvmNhw2tXarBAqKtI8Cwv96KQV2oC2duLSi7NQa6SRbTs5m
         RmOEomb8suyYkdgEr3EUT3EGXqj8/yLSxVjmgzpObhw1y1BTnJmcLlItNraj2t3x9PxT
         WF+YvoeH+DHubZFspskoQCMSJG0pZoXyvGpfyLpfw0+MzYk3WVAzz60kCTiaMfp78B03
         eJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716810956; x=1717415756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUX9Qc2CwQXtipTZ8HtlhuYljQCKpgoWARDk9odQFco=;
        b=GbusqBkir1s5ji/IUuDNgNRmN1QcbKLB1NQ+kXQn348t+YqeE3gp8g+91EIXHL9cwM
         2G02K2iQ3oVrXzJdUSz/RlS9KTDqFYuN9KiEuItyaOM3PsXTKpMFlikJ3jSnlyKiFUmM
         xvc4m6eMGc5DerdnpiLMArL3T/vKcwM++AtzuF6yYWJbrUq2iu2UC5mCkmvJRT32/wI8
         Liy/P5TfSMG3FlMbpZCzAmbiGpmZOWhTtDjnFOKKwibiPr9BfhVl2wHwjEQLZweuLIbR
         1d6CzRT4eq/kHjKx8wnKCUQ0SqBliHFYtbxk0ohhmVvEGQXytKCfiMJkMZnpei0O7asr
         ffLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFfFPxmkHWK0Vc6GU9Yhse1HXlsBNgTfKcSAFfRxr5Pq/w/VExUCVPbSUqBcUymTCWL4XWdvmjGRbgkv7P/zSmpF5kiIt1TZ8DaA==
X-Gm-Message-State: AOJu0YxzjhTyzVRMyqzMQXpNQv+nvWJ35wnRfuAUYsMuRDPAVJkz52aX
	5tOlrTMze7JdrEBvvB0T9KoM5MKky1K79akUcOdjK4TdZWuPwrcQmtwHxA==
X-Google-Smtp-Source: AGHT+IGZUTwDxxXl3RLQDctVHB+qoPi1AFwLPqsOY6ZQkg0fTEVpKIgWAqbW7ykw4YpzLa3JbLh5TQ==
X-Received: by 2002:a05:6a20:8409:b0:1af:b0b6:a35f with SMTP id adf61e73a8af0-1b212ccf7d3mr11944205637.2.1716810956234;
        Mon, 27 May 2024 04:55:56 -0700 (PDT)
Received: from rigel.home.arpa (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcbea8a9sm4749256b3a.139.2024.05.27.04.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 04:55:56 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 3/3] gpiolib: cdev: Cleanup kfifo_out() error handling
Date: Mon, 27 May 2024 19:54:19 +0800
Message-Id: <20240527115419.92606-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527115419.92606-1-warthog618@gmail.com>
References: <20240527115419.92606-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The handling of kfifo_out() errors in read functions obscures any error.
The error condition should never occur but, while a ret is set to -EIO, it
is subsequently ignored and the read functions instead return the number
of bytes copied to that point, potentially masking the fact that any error
occurred.

Return -EIO in the case of a kfifo_out() error to make it clear something
very odd is going on here.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 47 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index c7218c9f2c5e..6a986d7f1f2f 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1642,16 +1642,13 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 					return ret;
 			}
 
-			ret = kfifo_out(&lr->events, &le, 1);
-		}
-		if (ret != 1) {
-			/*
-			 * This should never happen - we were holding the
-			 * lock from the moment we learned the fifo is no
-			 * longer empty until now.
-			 */
-			ret = -EIO;
-			break;
+			if (kfifo_out(&lr->events, &le, 1) != 1)
+				/*
+				 * This should never happen - we hold the
+				 * lock from the moment we learned the fifo
+				 * is no longer empty until now.
+				 */
+				return -EIO;
 		}
 
 		if (copy_to_user(buf + bytes_read, &le, sizeof(le)))
@@ -1995,16 +1992,13 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 					return ret;
 			}
 
-			ret = kfifo_out(&le->events, &ge, 1);
-		}
-		if (ret != 1) {
-			/*
-			 * This should never happen - we were holding the lock
-			 * from the moment we learned the fifo is no longer
-			 * empty until now.
-			 */
-			ret = -EIO;
-			break;
+			if (kfifo_out(&le->events, &ge, 1) != 1)
+				/*
+				 * This should never happen - we hold the
+				 * lock from the moment we learned the fifo
+				 * is no longer empty until now.
+				 */
+				return -EIO;
 		}
 
 		if (copy_to_user(buf + bytes_read, &ge, ge_size))
@@ -2707,12 +2701,13 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 			if (count < event_size)
 				return -EINVAL;
 #endif
-			ret = kfifo_out(&cdev->events, &event, 1);
-		}
-		if (ret != 1) {
-			ret = -EIO;
-			break;
-			/* We should never get here. See lineevent_read(). */
+			if (kfifo_out(&cdev->events, &event, 1) != 1)
+				/*
+				 * This should never happen - we hold the
+				 * lock from the moment we learned the fifo
+				 * is no longer empty until now.
+				 */
+				return -EIO;
 		}
 
 #ifdef CONFIG_GPIO_CDEV_V1
-- 
2.39.2


