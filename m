Return-Path: <linux-gpio+bounces-12136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A129B1856
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 14:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD82E1F212A7
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 12:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8BC1D6DCC;
	Sat, 26 Oct 2024 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JGQowBE0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDED1D63F4
	for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729947523; cv=none; b=kene84lIyZs4esQLnCXV2Yj+GOiynR6x8ZJ+K+9x89FkseHKSvXwLSKR96boRpSM2L5AJT9ia8vRi31Yg9FAt5hkhTpHZnHTnWPspH9dToDxGMg5pxcdRMvibCUpXC0QiULh9YDRBj7eaiF0xQ+Lul2PtUUqeEEaqAdUUELGLIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729947523; c=relaxed/simple;
	bh=0QewVGxhisfsbuORbcYiI8x9rkEpWtfsWo4kKRmeYow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZXsh3CQuXmWVYd3DDvCRYLKgbn9LAc1BLHOdwU9PhF/zX9EI8/cgBn8r7aN7PQ0swyWZjXSA9nBINLh2egb3GIFvNd9H/+1wT82dTL13nIUcp3lx5a32wsYXjZC7z1Mqtcmav+D8/IR2pTEMu7CV8JsEjPzv6tZKQKJZ3yXX28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JGQowBE0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so29179315e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Oct 2024 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729947520; x=1730552320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Srd6xXt2v/gBTMIhpSGaiy2kaKtuGZrnXVtWyZIMWoo=;
        b=JGQowBE0Gxh0hjrgPJXRrWlx36PBpWbx/Vr1IfBqDIGPUG238/pOCK+eZHDJhiMcjs
         D8Zp6zl5oVRNEaPjVomPM8qbgrS7lOXoIjJQz0f1AfI9AmglGIWtDw0gzQ9+QVhr+I+V
         eZhZ3nLqEdWUP8d/W44cKE9hdLWciMFAsVOHWjgohzvwGbsEfvNlS5YpujFEfN1v/I4A
         MOtBPHkA2yizXiz4DgK1qW8gSSMgkjpXFvCA8K5ZSkQuCBtjghNi9QXUWujKvrFNyR4W
         Hbx3hD1sLvpeBqpFHc27eCoXfTjr2JiGPGuSQA5xCOqrqpUDcDGIXlJkNJVwA2rRkxJl
         lNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729947520; x=1730552320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Srd6xXt2v/gBTMIhpSGaiy2kaKtuGZrnXVtWyZIMWoo=;
        b=NmINu0zfJrfRxWoSBsGBsuqjXy/L29GqPR2ctxm+aZ+WJYBSIp9m1I+gUtw8iufD8K
         KKNksfPsa/PevyNISnWgM1H9+e4Gt7vPPZs17r426IYXHEgvr1V6n6qDA1ami76zc1Hk
         1pCJVCDTf5o7JSu9HStxTi8EWEsCjfaQA5Sty62t6WD+sTkB4RchlOWZ9GTAyS7IWaSX
         5qkQ8MeDHGEQEDZpS4JO6iaazIFycunUpV6XoTgcau4x9vadDtyAsVWC10jh+9qC8AOK
         hEnFeb6O8AlWWFEJRB4bp7fa4OHccsNwnLo5nPNNYx9EEgR1nBQemKHzjNTvhBHEGIaS
         POZA==
X-Gm-Message-State: AOJu0Yxz4IK31J2/5UTso1eJDwtv9jX03EoLaQHsaAEqx4pPs9SHcmUv
	ff1WG3z01sDiRPA2YKaSEDoXCNYgPL3Hsc5sqrjT/t5P/N2myCISVw4G+bSd4n4=
X-Google-Smtp-Source: AGHT+IGWHDhy7o0qBkG2Wr8LQqEtvotX3tdVXOmBd563NA5k/6+y2u2ytNwuIz881WXgje1qmpjGsw==
X-Received: by 2002:a05:600c:4e8b:b0:431:40ca:ce44 with SMTP id 5b1f17b1804b1-4319ad34a44mr18180445e9.30.1729947520292;
        Sat, 26 Oct 2024 05:58:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:617b:5770:df34:27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a3edasm47498535e9.22.2024.10.26.05.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 05:58:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 26 Oct 2024 14:58:31 +0200
Subject: [PATCH v3 3/5] gpio: sysfs: emit chardev line-state events on GPIO
 export
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-gpio-notify-sysfs-v3-3-ad8f127d12f5@linaro.org>
References: <20241026-gpio-notify-sysfs-v3-0-ad8f127d12f5@linaro.org>
In-Reply-To: <20241026-gpio-notify-sysfs-v3-0-ad8f127d12f5@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Fz1+WpmTJ92C+0rFC7RuiR9W6klOe83EubtpT2rv+ho=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnHOd6FBgaKfCk05jU2q4Nz0LLZshcVpT/CvkYd
 ZS2p1UhCDaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxznegAKCRARpy6gFHHX
 cmGgEACVCUsJ47lDsU8BgY94zc5DaD16/5LzyWYKdutNy75AckT51p3MalKpY3tGOEXfIKQGG5R
 6y3qv3t6LvVTRDe9vf1vWrQHiZgpeXUt0KhCsgN2b2dgPGNkSJQbFqJASZHRi/7qfXvLfZ54Ua0
 UEPwtQ2fFnEfVr4WZkQ/Ip5XZekUh0r6G507M29mXQhEhe/gi9MUVKh6R2Mn8qSK3CdB5ll1dYL
 4ui7x8qLH7TB/XZfadaHx0tP0W/hz/ikufp7CaZAqobt4BRPKYqfC9JwWIMt1NX9Pt6S/sa7MWf
 yxea6YJanT10FTcqIdgneWSgBzzBtLrq97b4w6o7i/yxqVW45ns6NAsiMLPNDh5OrtzTS2tTJJP
 mtve7114DBM82JXaLQFUxzU888CJn+MTxa/xaJ6LUxnxbHxKPGeqee+5douQzXUeiGssZYQOcpe
 XrHeNICZDypIP6xx9XXHuEjIAIdiweeKq2p4TTrpLmaR0rtKhcCNMjhclNXzLvy498v7Z7ac9K4
 7BLCuQZttXfgguL116HKb4s9oTDUyENwFg2hY0RDWDohbDXFT1B0F5RqB6MH4bH8i9tGAXFISj8
 4T4NNcUSyGe5fADF1zWjpDJLsU48uCsTUxujsd77oQN4UWbhRiaGpC6iEO9lrF2tGloV5x2rvxs
 rsnhnZ6/Td7Rr5Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We already emit a CONFIG_RELEASED event when a line is unexported over
sysfs (this is handled by gpiod_free()) but we don't do the opposite
when it's exported. This adds the missing call to
gpiod_line_state_notify().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 72617f929a2d..e1144d3c7645 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -21,6 +21,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 
+#include <uapi/linux/gpio.h>
+
 #include "gpiolib.h"
 #include "gpiolib-sysfs.h"
 
@@ -471,10 +473,12 @@ static ssize_t export_store(const struct class *class,
 	}
 
 	status = gpiod_export(desc, true);
-	if (status < 0)
+	if (status < 0) {
 		gpiod_free(desc);
-	else
+	} else {
 		set_bit(FLAG_SYSFS, &desc->flags);
+		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
+	}
 
 done:
 	if (status)

-- 
2.45.2


