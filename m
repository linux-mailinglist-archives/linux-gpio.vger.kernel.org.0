Return-Path: <linux-gpio+bounces-6849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B58D3775
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC11E287300
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CE210958;
	Wed, 29 May 2024 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caYOEQv+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBCF17C6C;
	Wed, 29 May 2024 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988863; cv=none; b=fBee5TYM0lasuzRr/txFeHnCjoqdtlTAq2wC03weSsh1CGDPEVka68/KMMxP7WkJHYUSWaalpVflyvWP04NZx+y5Z1CqBSabf/e69cnCUbioIpjG5eoNvCoUoC25G56t1yGW80cFK8038pMCLBTz9/v3xV2uWGOWiRKfOPgWEuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988863; c=relaxed/simple;
	bh=zYMiCwE56OohnrxrdgwAfg+qSxvgxoW4HoLHgQdpU2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T1m4CpXMvvrDLFu/LWepICN1Q5N+b8Qboiyxzyo0jmLZOQI+K0jyRcfn2HYqmt4baoEsD5htZeyOisHDvew4Ip9B4+YhboE0nti+GJshFpiOJe8EVoIRt8LnVOgISOC/R9974S9rvymnK+hxJK8rgDj0siO0CEyJCkaHL6+2k8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caYOEQv+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-701b0b0be38so1688492b3a.0;
        Wed, 29 May 2024 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716988862; x=1717593662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqqCp8YkE8QN0J5Hn1yUPom3eC9D/QLg0KIhmBD/bc0=;
        b=caYOEQv+6cBdBsFpJz7zx3It35IlIUIy0zs78abmKcrc+J426gs8OBhsN+5raYa1O1
         x1MxXwvewctzBBMwHBAxccypaF1G0ARTqxB0bQVlDp+liOwguywRmP49RB3BLgYDoE+I
         lM7a1a92nvHPPJgnq7RVKRL4ZJNLNntbi473eQNpOGSyeTnfXBKnm1nqs6N+Ycqc/Iqe
         mFwY9A38kdX5J6F/Ki27mDGzDUtRwDnFet1jj5gUejOs8Rcch5S8+UyhUamzTVwhHwVJ
         jBXEDyC2I/CvMXh9BB6xtN2EIfT0ESIQV7qdyxeh5Ua8vvY91KSAynRe0zEjNzPLcHIA
         ojfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716988862; x=1717593662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqqCp8YkE8QN0J5Hn1yUPom3eC9D/QLg0KIhmBD/bc0=;
        b=avphEtlWwz+i9WN4v7ILkp1kzQe3JDga2jo9+Js9eCMUbeIDS9P/JOaPN3PYliliZN
         3sYVcSZLwC8LzQ9tN83QGEiPYjZBFjYh94ZvYV1G8eCgiVZXZIjAi70xGOQizZvMZQzJ
         LgnAj8HO9heMnJmgW78fsPq1KpRnPiKZkO38cJ8I1AZkHrodvuiX9fQFypDlmB500e9i
         1pz2zq0Kmdp1FLpou+lS0HnmW8q5QL3QmQMyI64QKoYvrs/b/zssQAfTR+ZiEZqIritM
         QUmjJ3ajAVdg133XdDhUdQgv0GunPSLty5ikCs0G/B5mvJ8M9g314BgfRr+fm0VWQ9Vg
         T9fw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ08TGqY7rosQx9gT5J0PlzJh9MaLHO2hGfR7w1g289b1uhgUM5SZf8R4rOd52328NRdvcSQFoJiJqeXBAg0MgV0/2M+8JpadGig==
X-Gm-Message-State: AOJu0YxL/0/ZLyU5SzABUe7jAN6SoGfg7qCGEwaltYY9+Do+U6gBmFQd
	ClzfaawnKdqXB8fq4JwIaiKQGMmuTYUY9hb8YKvmAGuUNVfLMSUuKRLlNA==
X-Google-Smtp-Source: AGHT+IGMGvvlVB+CMTQa0lnvTQ+546THlA+9C2/oQn2PkU84e8LaVTdfCCoVMARv9KR3JYNe8GY/Tw==
X-Received: by 2002:a05:6a21:3a94:b0:1b2:1de2:7dfa with SMTP id adf61e73a8af0-1b21de27eb4mr17837121637.22.1716988861617;
        Wed, 29 May 2024 06:21:01 -0700 (PDT)
Received: from rigel.home.arpa (194-223-191-29.tpgi.com.au. [194.223.191.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682227f1838sm9121844a12.46.2024.05.29.06.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:21:01 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 3/3] gpiolib: cdev: Cleanup kfifo_out() error handling
Date: Wed, 29 May 2024 21:19:53 +0800
Message-Id: <20240529131953.195777-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529131953.195777-1-warthog618@gmail.com>
References: <20240529131953.195777-1-warthog618@gmail.com>
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

Log a warning and return -EIO in the case of a kfifo_out() error to make
it clear something very odd is going on here.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 53 +++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index c7218c9f2c5e..1cb952daacfb 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1642,16 +1642,15 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
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
+			if (kfifo_out(&lr->events, &le, 1) != 1) {
+				/*
+				 * This should never happen - we hold the
+				 * lock from the moment we learned the fifo
+				 * is no longer empty until now.
+				 */
+				WARN(1, "failed to read from non-empty kfifo");
+				return -EIO;
+			}
 		}

 		if (copy_to_user(buf + bytes_read, &le, sizeof(le)))
@@ -1995,16 +1994,15 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
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
+			if (kfifo_out(&le->events, &ge, 1) != 1) {
+				/*
+				 * This should never happen - we hold the
+				 * lock from the moment we learned the fifo
+				 * is no longer empty until now.
+				 */
+				WARN(1, "failed to read from non-empty kfifo");
+				return -EIO;
+			}
 		}

 		if (copy_to_user(buf + bytes_read, &ge, ge_size))
@@ -2707,12 +2705,15 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 			if (count < event_size)
 				return -EINVAL;
 #endif
-			ret = kfifo_out(&cdev->events, &event, 1);
-		}
-		if (ret != 1) {
-			ret = -EIO;
-			break;
-			/* We should never get here. See lineevent_read(). */
+			if (kfifo_out(&cdev->events, &event, 1) != 1) {
+				/*
+				 * This should never happen - we hold the
+				 * lock from the moment we learned the fifo
+				 * is no longer empty until now.
+				 */
+				WARN(1, "failed to read from non-empty kfifo");
+				return -EIO;
+			}
 		}

 #ifdef CONFIG_GPIO_CDEV_V1
--
2.39.2


