Return-Path: <linux-gpio+bounces-13483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE59E39C4
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 13:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E77B1644DA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 12:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580981ABEDC;
	Wed,  4 Dec 2024 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Uom3x20N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E1126C10
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733314921; cv=none; b=WJ/dwIWtSJWyn0ygWBLeJ0ZdDLigRhkbgvjoNo3aB7+u5Bk2aMmyqviDYBE3Q91VN1ux/CEBZ6Niw8raJQ0/pAd41Qc0aOXfDfQ3rhg5AXVxJU9Ys36c7bpcDrWm07msWCX8wXUPx7KKN6VvUaF+CDSF7wTYZUcSy2/HBg0CfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733314921; c=relaxed/simple;
	bh=O0+CZXRHoLhsOSEitRRDTKgkAC79kSRwtnY1L0/yYNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lspUtLt1Ei2tHUKYUYvvqIa3QYQZs5yTyKSSpQhL5njmX4bzxe85o4SnbhI6Sr+IeD7wZdR4KLhdRqhgOFFRZTbrBnzEvf1QstE2VAQJ6juDJGdA506+gvBKdTWLz72oLAeuE7MuyPM/O7R/qlH00LI0EL7UwzWXa07jAonh2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Uom3x20N; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-724e113c821so6025473b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2024 04:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733314918; x=1733919718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vA7Nd2pT2tcxnsmGLiZWmOqELHFvQ7VmLEwSYWG5byM=;
        b=Uom3x20N/wRCatZIo5qxOgDMxpVvqWqctpgu1vM4kGOggIFOE0C7S45/X8XHanmLQD
         ufLgoFCVpmiwWWOzNI6sicUt98JGziNUrFxs0vLZv3IG/ZCozrinZ6d3QAVx8fhO+ibI
         QqkmxRMR7o43jPtLXaNMFMJ+YCOGMjjVtL7o2e6Gh+mrBO+H9mqQebbxIEQxhMf9/A+a
         RrOPWtdA9xBcEnLyXEfJgpWOwUoFAVvTvCiCB4Fxd8Ar6GzVMPzHUtWyf/A8vYpnMQXY
         ZcWCzi9tCy+FxLAquRZw9XD3X1jzArK5kWYF1q4Un+Zir0/+pRi40cUWpOn6qCiE5PFB
         QuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733314918; x=1733919718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA7Nd2pT2tcxnsmGLiZWmOqELHFvQ7VmLEwSYWG5byM=;
        b=qcXQwnQbpeSX73B/9CTG3ZWuMJAHTn6mp59iGGcZpKRfD9ZB8E02ufcMLfns6PbB4z
         SCSIj7tVXZf4WlCFdd8cxYVI2WSD9DR7u1x91qcGaEDqmf5GJBPA1EoVDQzZeT1VljMo
         19klq1prQeyHtRjXwY9qk1y5Exh+Nj0S5ueVSt5KkblrYtt7DI2s50wrclS3NWC+sbQl
         2ToliQ25DoTzXIO0SSNMdipvMoFPqwWW/OZPISFO9oqMojJQcnzyYmSYk1vVSOiuuJJW
         3H+Aj/CnErAsxRCrNC4MTmqFCk8+DcAI0E2isZqNScLSuoeLrjxF6djRbsd3jdxzdGRd
         0Q+w==
X-Gm-Message-State: AOJu0YxL2EsBQgpOfWdJlCfeKtvMyaa3mOq9OXo7I6hcdIC3z7jW2KJS
	bRhYYowGdaoYb5Sz2zuagqiqRaaI3ZF4OarfdmWfSgSVzoy6sA2i7AudF9CCAqc=
X-Gm-Gg: ASbGncvfnZGVmfLHx52lDG7zhQT8zuQlbc1UnIbdONI8/yYt1kl9mqJpdtMZ9t9eqAO
	m6J/F9Io9LBO/cg+shjDfaAW2dijNCFg0AMEK7Uqew3Jn/YhfnWUHbZBB+iQxec/P673hguwHie
	Jr3qFTxaJbc66UiQgLFyb8hA20OiU4k0izgVkDjZqh/vvlcLNv8icmS+HSKpnr1C3wv1iO2oZlm
	AUjCDSi7DxE3wtgzTtgrVUz5TRzO4+5uEkp8mBG6h/WLzuY3Y/FeDgQ5NhvtQxfA8mBxV/QQwFA
	TLZJGv6Pi58e0amKppEq7DKcrt+BnL1+6qI3
X-Google-Smtp-Source: AGHT+IHjQkOdo46dmxaDZzTFvvOlHVd6WgqkQozubtunjnmQmCHM94rOAR6GNhK32SZ25ae6Gc6QXw==
X-Received: by 2002:a05:6a00:cc4:b0:725:389:3e11 with SMTP id d2e1a72fcca58-7257fcac089mr9684155b3a.20.1733314917674;
        Wed, 04 Dec 2024 04:21:57 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176fd6fsm12664606b3a.62.2024.12.04.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 04:21:57 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] gpio: gpiolib: fix refcount imbalance in gpiochip_setup_dev()
Date: Wed,  4 Dec 2024 21:21:52 +0900
Message-Id: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gpiochip_setup_dev(), the refcount incremented in device_initialize()
is not decremented in the error path. Fix it by calling put_device().

Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/gpio/gpiolib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 679ed764cb14..6b2d50370ab7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -800,7 +800,7 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 	ret = gcdev_register(gdev, gpio_devt);
 	if (ret)
-		return ret;
+		goto err_put_device;
 
 	ret = gpiochip_sysfs_register(gdev);
 	if (ret)
@@ -813,6 +813,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 err_remove_device:
 	gcdev_unregister(gdev);
+err_put_device:
+	put_device(&gdev->dev);
 	return ret;
 }
 
-- 
2.34.1


