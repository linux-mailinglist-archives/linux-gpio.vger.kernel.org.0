Return-Path: <linux-gpio+bounces-2550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30883BB4A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 09:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B61D1F2412F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 08:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC53113FFD;
	Thu, 25 Jan 2024 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aDD1/FLa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BBA13AC6
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706169996; cv=none; b=bVj/rMozE8Ath3U44/SSMHOFXN/EX7nB93tq4BZ9Vwr5HRXboeV2tkZl/F5S3W5vjRShl1VnPqfUUjSksrAeJ4FARrcQYgS2bJMfw+NAx+KxN3K6Ol9MPA8vYMqMW+40iu3vHuxb7dHp5yKIEDyYooYWJ1Oc3JFrxMibRFjlU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706169996; c=relaxed/simple;
	bh=PxE/RRThry4h48/9aQyXoasoefOatWxEDrA7BrP8tCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nyiOMlQ4f0bhuSJRKm3XL7HvQFW8DEWjIsQHBeV89Na7jryFiBsGRKn5ns/UJd5ugqV8N2PRPD4fm7LM2h2tThjRf0SkeJpqwaPj4u06UBaWbsuX87RlUzUMfH99qG4B2NUiMo3rh3y4em0SP87U4hc55e97mqbw4CEOEqlcYFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aDD1/FLa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso70226805e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706169992; x=1706774792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=unyL0F6UYHKjRmNXliBOC5xCD62nDVoU8uVmxZuZrVc=;
        b=aDD1/FLaoKxeVN/U1rVn48phvXfFGsaDS7GUkRRN6GMVI6Qxgfsg17KE+j302yXER+
         6OqO4ERJ24q7i5/G3s5b9PU31kYhK8b9d0oOUyCdSAPG39E1G88lRfpaNKUmLczsXWiL
         W7Rzt/Tgx0/Q2WGChC6TIicO2VhiH9G47KWckSVdmfq2IHeMz8PrRv4ie4dVOcKmeaeH
         nktmQOfkadbRGaMD32CvWOMLSRdUvjnLKg8djBTHQ+Bs1NKlVv4dyVAaPPzB/Njdb7m/
         wTWeQssKmNiZ1tCFiNUd/BxJAYVxru5/wFZA/Po4caX7ThximinCnIn7IVAwdj7ACKDk
         FWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706169992; x=1706774792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unyL0F6UYHKjRmNXliBOC5xCD62nDVoU8uVmxZuZrVc=;
        b=MDl+nQt8rvsXfsRE8jU1cQONJgPieQT1WDv3+kSfVKFLie5kpDC2xpx7+wJL5ZfQjl
         uoY0/mEkEapyu07I/PH7Re+T46wo38Yuo3ovuG9fe7vAa5r9aWwRBLiSWJbGatFLG6bI
         afFqMaprENAjXZ6hlm0jEBxYfIhfkOVDp14eUjKERdI3IMPv2shX4hix6YnznV/zj2Q5
         aR06DV8KWl8ujgyzHZuLBE3CwldzeyQPaZJ34o4OQSwM0UX72hB66BcCJ9xAVe6sjXhg
         utM86kYfhN3bqzGxvG1bsavK0KJHAjXnOcV3kex9NQRsodCR1To38K1rek1Pc1cMmYff
         sc+w==
X-Gm-Message-State: AOJu0YxLj2q6Ujck6mmGLFm5gbKenkDkMTTLcSCr4ZZepZoJS2KgNiop
	jcA3pJlZc9otzwuEvFJT6saFdxpd+LnDv+drlPLNtkObCqSh3XsA2ynTSgdNpLc=
X-Google-Smtp-Source: AGHT+IFaARnbwey/zHVNb7+HKUdnnVGfAMILJJlz2vMVyp5q2TI2HMOyW99FxFPKIsT4IG0c6s0sIw==
X-Received: by 2002:a05:600c:1da1:b0:40e:b908:30f7 with SMTP id p33-20020a05600c1da100b0040eb90830f7mr93876wms.116.1706169992212;
        Thu, 25 Jan 2024 00:06:32 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5c05:1552:a486:c7ef])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c358d00b0040ea875a527sm1626637wmq.26.2024.01.25.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:06:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?UTF-8?q?Jos=C3=A9=20Guilherme=20de=20Castro=20Rodrigues?= <joseguilhermebh@hotmail.com>
Subject: [libgpiod][PATCH v2] core: check for positive values returned by calls to ioctl()
Date: Thu, 25 Jan 2024 09:06:29 +0100
Message-Id: <20240125080629.21161-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If the kernel GPIO driver (erroneously) returns a positive value from one
of its callbacks, it may end up being propagated to user space as
a positive value returned by the call to ioctl(). Let's treat all
non-zero values as errors as GPIO uAPI ioctl()s are not expected to ever
return positive values.

To that end let's create a wrapper around the libc's ioctl() that checks
the return value and sets errno to EBADE (Invalid exchange) if it's
greater than 0.

This should be addressed in the kernel but will remain a problem on older
or unpatched versions so we need to sanitize it in user-space too.

Reported-by: José Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- add a wrapper around ioctl() that sets errno to EBADE in case of
  a positive return value

 lib/chip.c         | 17 ++++++++---------
 lib/internal.c     | 13 +++++++++++++
 lib/internal.h     |  1 +
 lib/line-request.c | 11 ++++++-----
 4 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/lib/chip.c b/lib/chip.c
index 7c05e53..611eb32 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -7,7 +7,6 @@
 #include <gpiod.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/ioctl.h>
 #include <unistd.h>
 
 #include "internal.h"
@@ -72,7 +71,7 @@ static int read_chip_info(int fd, struct gpiochip_info *info)
 
 	memset(info, 0, sizeof(*info));
 
-	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, info);
+	ret = gpiod_ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, info);
 	if (ret)
 		return -1;
 
@@ -87,7 +86,7 @@ GPIOD_API struct gpiod_chip_info *gpiod_chip_get_info(struct gpiod_chip *chip)
 	assert(chip);
 
 	ret = read_chip_info(chip->fd, &info);
-	if (ret < 0)
+	if (ret)
 		return NULL;
 
 	return gpiod_chip_info_from_uapi(&info);
@@ -111,7 +110,7 @@ static int chip_read_line_info(int fd, unsigned int offset,
 	cmd = watch ? GPIO_V2_GET_LINEINFO_WATCH_IOCTL :
 		      GPIO_V2_GET_LINEINFO_IOCTL;
 
-	ret = ioctl(fd, cmd, info);
+	ret = gpiod_ioctl(fd, cmd, info);
 	if (ret)
 		return -1;
 
@@ -150,7 +149,7 @@ GPIOD_API int gpiod_chip_unwatch_line_info(struct gpiod_chip *chip,
 {
 	assert(chip);
 
-	return ioctl(chip->fd, GPIO_GET_LINEINFO_UNWATCH_IOCTL, &offset);
+	return gpiod_ioctl(chip->fd, GPIO_GET_LINEINFO_UNWATCH_IOCTL, &offset);
 }
 
 GPIOD_API int gpiod_chip_get_fd(struct gpiod_chip *chip)
@@ -192,7 +191,7 @@ GPIOD_API int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
 	}
 
 	ret = read_chip_info(chip->fd, &chinfo);
-	if (ret < 0)
+	if (ret)
 		return -1;
 
 	for (offset = 0; offset < chinfo.lines; offset++) {
@@ -235,11 +234,11 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 		return NULL;
 
 	ret = read_chip_info(chip->fd, &info);
-	if (ret < 0)
+	if (ret)
 		return NULL;
 
-	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
-	if (ret < 0)
+	ret = gpiod_ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
+	if (ret)
 		return NULL;
 
 	request = gpiod_line_request_from_uapi(&uapi_req, info.name);
diff --git a/lib/internal.c b/lib/internal.c
index c80d01f..56cb8b9 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -7,6 +7,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
 #include <sys/types.h>
@@ -121,6 +122,18 @@ int gpiod_set_output_value(enum gpiod_line_value in, enum gpiod_line_value *out)
 	return 0;
 }
 
+int gpiod_ioctl(int fd, unsigned long request, void *arg)
+{
+	int ret;
+
+	ret = ioctl(fd, request, arg);
+	if (ret <= 0)
+		return ret;
+
+	errno = EBADE;
+	return -1;
+}
+
 void gpiod_line_mask_zero(uint64_t *mask)
 {
 	*mask = 0ULL;
diff --git a/lib/internal.h b/lib/internal.h
index 61d7aec..420fbdd 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -38,6 +38,7 @@ struct gpiod_info_event *gpiod_info_event_read_fd(int fd);
 int gpiod_poll_fd(int fd, int64_t timeout);
 int gpiod_set_output_value(enum gpiod_line_value in,
 			   enum gpiod_line_value *out);
+int gpiod_ioctl(int fd, unsigned long request, void *arg);
 
 void gpiod_line_mask_zero(uint64_t *mask);
 bool gpiod_line_mask_test_bit(const uint64_t *mask, int nr);
diff --git a/lib/line-request.c b/lib/line-request.c
index e867d91..b76b3d7 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -6,7 +6,6 @@
 #include <gpiod.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/ioctl.h>
 #include <sys/param.h>
 #include <unistd.h>
 
@@ -153,7 +152,8 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 
 	uapi_values.mask = mask;
 
-	ret = ioctl(request->fd, GPIO_V2_LINE_GET_VALUES_IOCTL, &uapi_values);
+	ret = gpiod_ioctl(request->fd, GPIO_V2_LINE_GET_VALUES_IOCTL,
+			  &uapi_values);
 	if (ret)
 		return -1;
 
@@ -218,7 +218,8 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 	uapi_values.mask = mask;
 	uapi_values.bits = bits;
 
-	return ioctl(request->fd, GPIO_V2_LINE_SET_VALUES_IOCTL, &uapi_values);
+	return gpiod_ioctl(request->fd, GPIO_V2_LINE_SET_VALUES_IOCTL,
+			   &uapi_values);
 }
 
 GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
@@ -271,8 +272,8 @@ gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 		return -1;
 	}
 
-	ret = ioctl(request->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL,
-		    &uapi_cfg.config);
+	ret = gpiod_ioctl(request->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL,
+			  &uapi_cfg.config);
 	if (ret)
 		return ret;
 
-- 
2.40.1


