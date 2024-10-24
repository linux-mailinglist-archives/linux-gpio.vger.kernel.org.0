Return-Path: <linux-gpio+bounces-11941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E919AE3FC
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 565E7B23051
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597761D5AD3;
	Thu, 24 Oct 2024 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3T9wC91G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DBD1D0DD5
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769582; cv=none; b=ZDDsYdfcLtPl++jtshXOeSwojqpbjOJyL0ODDDEhiW59t/25ZmJ3v272MTt/jp77bDrCS7Ir0GACgeB+0Lz2GzBU3OZif28lBVeNlXaw7AG1Avd9kKBnkDUIEDsj9P48bvh/ZqysANrA4a37HUf4qqB4rAcMx5oLAQbpamNIjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769582; c=relaxed/simple;
	bh=U27NwsOlcsHUnyX5fd50gH6i+uOe0vRVGONCZxUCxtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ey0eM83luVjhR3dUQhLgFL7i6jGIIDBak9rYBGYPMpiI1Rxyv8jToHCryxHxJvyUdRe+tR9QL3RcdXRmlyEZGJwcObx9WZ+mYHqJ7XUekoRx/HdHsJpf23ktYMhwf/r8RO3SsKW4Y5fM7Sq4gtxlvBAYV91/LVQGEbkiqMRT1RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3T9wC91G; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so8334435e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729769578; x=1730374378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yo2F086X03vDK4v4HIxfZTPhSHiiOHsxDuitRvtDxBM=;
        b=3T9wC91GA3q+chkvYBDN/gxexslb87+UiiaxrCLNFZPHeZ8yHB4RRJGbMpGUsUs2nm
         wcTUrYH7jSzGfZQgzfpEcs9gHf5cfbXXHPbJIWeUjxrm4tJOvTqnD//KaK3nxCQB19DX
         FX/Cbh4y2bRARw61in8WryOZOLC5pdUUOpE3aAOSniZUkBVJlDn9zTfBMFOA5z0dCm0s
         3Bt0SuKUhc639tnBO1kX3pHGCbOhheWZetnKV94tT4yOYDxnaz4XdoBM3vPIfvAbZlTZ
         iOMnTgCSvL7r6ydggC0IRBH5bUvA4o6Ggg/cg61xIY1zs5iPaf98tnL035y6kJM9vSDa
         oVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769578; x=1730374378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yo2F086X03vDK4v4HIxfZTPhSHiiOHsxDuitRvtDxBM=;
        b=fwrcF492pyMjj8ijh712kOLixgfPB3f5scgGUhKKLnKe6jiFFsQFQA0zrPsUf46GgC
         UjlARMcD36D5J70b8IoqkU9X7OhtmQJPcOKm3zyDj1uS6HvldQIQrD3kOlranYniZS3d
         Q/F7i3VoZjZpiQyxZ7k/8k/3cBddEMtfCCVCal7aaPuu9F0lVkiR+rmjOxGztV/ds8HX
         kcyC3OCuEef1ZirXCqphMGdkjk8iBjJ/j3e010oJK91AnW54cE5Wd6EZ0vDvuWvk7AyI
         tAkfIrJBC9a4+3mi8N2YDveSkkc1iauH0LZ9OYZ8igBzWGuoOFDiBJrv1ihKNAaT3GHn
         Vs2Q==
X-Gm-Message-State: AOJu0YzEJa0vu8IVVOIp8BAMUou+RAKCE+YjlZ2GZiDVDLgeHpx1VrE2
	KdLhDVuNIF87lCvS88ONW6a02q+hZbLNnsqvUItRGp9Jk5wZpZcmIk9j0le5vwM=
X-Google-Smtp-Source: AGHT+IE6+QMCz2x9j9j4XF+SLSco9806pGLmjIXM+yZNAW6oDXw6qPS7BlFhrpdWX5vIVxu91aJk0Q==
X-Received: by 2002:a05:600c:4fd4:b0:431:7c78:b885 with SMTP id 5b1f17b1804b1-431841341ccmr43071255e9.4.1729769577330;
        Thu, 24 Oct 2024 04:32:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:17a2:e679:56a4:a25a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f484sm14592705e9.13.2024.10.24.04.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:32:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 13:32:46 +0200
Subject: [PATCH 3/5] gpio: sysfs: emit chardev line-state events on GPIO
 export
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-gpio-notify-sysfs-v1-3-981f2773e785@linaro.org>
References: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
In-Reply-To: <20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QdbVjjJq9AljOJ1NVlDiLyI0Sj07rkOhyPjJJMW5vcA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnGjBl9M8uueSCSt9bwVmONrgpP6XVzockfOTDK
 hoxzYSvztCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxowZQAKCRARpy6gFHHX
 coiFEACuX1TsZETKpTUl3+YqbrG6vReDr1LXksU2PJiX3b/klEX2TJYubIdVfonwL4ksrEri6Lt
 3IlSaPHqgTDptIL55/Gibq+2zxia6gynsZ9jq9aqVemMRjLmAUtXGuQBRJ6TzyYXxbWSpy1Zbn1
 nsPcWViQv3Ff2eim+bPZVUbD6avJUAotddx4SyfNRWYSppr8KrB6xv+C9b8JOh+BnFgof9pggSb
 3SBxumhwircKYx3ZLV4I6OGlhwS0AO+ZW2JX5lQcvv+0jX32XbPush1FNR6Wb9Gbdz+nYeni7sB
 0ZyPRlsN8ob58BuUxEGDhjFjRF4GT5Nt0bTQ7zWMdtQOUfyw0k1CieglOiKQmm0xqmXBzne96WN
 ewVWhtIBHtUaTnukNApcVuFCeEC2AEgXPuK2v2Fd9TBt36n1B9+NjtmVkaMa3iZyzNlDewxhOIX
 M+vpHs6SPzKOrti44wH5LTh0xSEFkoCB2zqPXc33LaG2M/h8KyFj8oC1LslLMneQN/UZC0Wn06H
 6FtB9b8A9GRGa1Pz4yjVunCgVznsFP/2RSBi5qaUhQR96ClFL9bkk+cSnrsr5JJ16Gz7Gp5GqHt
 YRDwCAVTLcLxHgGFnUXqc9D6i5li4C0rcuegO2HfdOgdR19HSxmv0lrZdEq+/8t+J7tRNFkifyn
 kfjff5kPZqGWq6Q==
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
index 096f79bbfe42..3f24bf278b77 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -21,6 +21,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 
+#include <uapi/linux/gpio.h>
+
 #include "gpiolib.h"
 #include "gpiolib-sysfs.h"
 
@@ -470,10 +472,12 @@ static ssize_t export_store(const struct class *class,
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


