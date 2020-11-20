Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5A02BABB6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 15:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgKTOPr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 09:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgKTOPq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 09:15:46 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565C8C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2020 06:15:46 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id p1so10134224wrf.12
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2020 06:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HAutSBNtNBwp7vgNrxmIP2Dv8vvHz+JAXNrFXkeXW8g=;
        b=s+B1PUMKQfgMiqwZqa6l82JZ+DOMpuK+eH0TiYl02ghBzVGfLJNqUz1y6sgV4p/m9A
         rsFPmK1eJs9fj4ny7tgzMrj1PGOVs13bHqUH0RaASYf7ZiEWonR92n5EEmbQgp97kX/L
         Wj27QrX9kSjrswZIVaAmFX8OgVPP1a2DCEHmx8kOzSKRm9qEm6xuUNoHnkrkIdex+6Wp
         uyrSFUHtQFEuyhNHGCEWc3dO+4SMT/WdZRWGltWbyIRESNDRourN0/13m3vPDp81UHPY
         /54sFaJzD4C+xWcNlZmV7rkWaImbHjsLrKOPVahJ5wLQ3PhZd3CxVuE5fExSrW7/m8Ry
         zYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HAutSBNtNBwp7vgNrxmIP2Dv8vvHz+JAXNrFXkeXW8g=;
        b=s68SqQpb8n6iIF8lxthgWWrfXl1fUKZqDoahMPdTn0E1D5vdotTg/glfqH+ZBY0cCm
         WyrSe0oSK4yr9x4geTc+IpToNdOn1v3tlVFiSOV6Mi6ewvsiP7A8E1VuymSD34gbPYe9
         +3xHkS3pRTduGieYMRT9mqmIh3B6Xna4SNj/W/N1HCqb55MKSrrTT5X5Y1zH4gRAjRuu
         4nEIji3ndjuej2BhoXJgX7t1X3Vp8Hb53lj8QjmkI6URmoeRGBzxlHXTQYSvaw1ektt4
         pU6JbdzSgNO5aNpCpVaTAt0dcyYhAjTWuDTkfKiq1D4TR2VAWo3nVbYElELslCHyfhLR
         Umng==
X-Gm-Message-State: AOAM5337ReyG+mCF/Qi8hvIJDtwyGw8G1AQfq8oPZ5Nyn/GcByFsjPHn
        w+bEZYw4aQgRMdGakgrCIExvWA==
X-Google-Smtp-Source: ABdhPJyc6q9FmKoHj/AY130tvFzbbDtR3Uz6QtwEBNGz7fA6DVupjZ3tzOgdVDpHpKiQS9onxpp/9w==
X-Received: by 2002:adf:fc41:: with SMTP id e1mr16021710wrs.406.1605881745043;
        Fri, 20 Nov 2020 06:15:45 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id z189sm4642001wme.23.2020.11.20.06.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 06:15:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michael Nosthoff <buildroot@heine.tech>
Subject: [libgpiod][PATCH] build: allow building with pre-v5.5 kernel headers
Date:   Fri, 20 Nov 2020 15:15:39 +0100
Message-Id: <20201120141539.11025-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

libgpiod v1.6 requires at least v5.5 linux kernel headers to build. This
is because several new symbols have been defined in linux v5.5. In order
to allow building with kernel headers v4.6 and on, let's check the
presence of the new symbols and redefine them if needed.

The new features won't work on kernels pre v5.5 but the build won't fail
anymore.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
---
Downstream complains a lot about libgpiod v1.6 not building with kernel
headers pre-v5.5. We've had a discussion on that over at buildroot[1].

For libgpiod v2.0 we need to figure out a better way of dealing with new
kernel features added after the release of v2.0 but for v1.6 let's just
redefine the symbols if needed.

[1] http://lists.busybox.net/pipermail/buildroot/2020-October/295314.html

 configure.ac | 10 +++++++++-
 lib/core.c   | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cd337ff..6aef289 100644
--- a/configure.ac
+++ b/configure.ac
@@ -95,13 +95,21 @@ AC_CHECK_HEADERS([sys/sysmacros.h], [], [HEADER_NOT_FOUND_LIB([sys/sysmacros.h])
 AC_CHECK_HEADERS([linux/gpio.h], [], [HEADER_NOT_FOUND_LIB([linux/gpio.h])])
 AC_CHECK_HEADERS([linux/version.h], [], [HEADER_NOT_FOUND_LIB([linux/version.h])])
 
+AC_COMPILE_IFELSE([AC_LANG_SOURCE(
+#include <linux/version.h>
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 6, 0)
+#error
+#endif
+)],
+[], [AC_MSG_ERROR(["libgpiod needs linux headers version >= v4.6.0"])])
+
 AC_COMPILE_IFELSE([AC_LANG_SOURCE(
 #include <linux/version.h>
 #if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
 #error
 #endif
 )],
-[], [AC_MSG_ERROR(["libgpiod needs linux headers version >= v5.5.0"])])
+[], [AC_DEFINE([KERNEL_PRE_5_5], [], [We need to define symbols added in linux v5.5])])
 
 AC_ARG_ENABLE([tools],
 	[AC_HELP_STRING([--enable-tools],
diff --git a/lib/core.c b/lib/core.c
index b964272..f49743b 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -22,6 +22,24 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#ifdef KERNEL_PRE_5_5
+#define GPIOLINE_FLAG_BIAS_PULL_UP		(1UL << 5)
+#define GPIOLINE_FLAG_BIAS_PULL_DOWN		(1UL << 6)
+#define GPIOLINE_FLAG_BIAS_DISABLE		(1UL << 7)
+
+#define GPIOHANDLE_REQUEST_BIAS_PULL_UP		(1UL << 5)
+#define GPIOHANDLE_REQUEST_BIAS_PULL_DOWN	(1UL << 6)
+#define GPIOHANDLE_REQUEST_BIAS_DISABLE		(1UL << 7)
+
+struct gpiohandle_config {
+	__u32 flags;
+	__u8 default_values[GPIOHANDLES_MAX];
+	__u32 padding[4]; /* padding for future use */
+};
+
+#define GPIOHANDLE_SET_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct gpiohandle_config)
+#endif /* KERNEL_PRE_5_5 */
+
 enum {
 	LINE_FREE = 0,
 	LINE_REQUESTED_VALUES,
-- 
2.29.1

