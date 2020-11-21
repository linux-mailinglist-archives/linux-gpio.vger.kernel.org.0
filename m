Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B090E2BC00A
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Nov 2020 15:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgKUOo0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Nov 2020 09:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgKUOoZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Nov 2020 09:44:25 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4772DC0613CF
        for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2020 06:44:25 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so13882821wrx.5
        for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2020 06:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7tqKH/B97sPiSPakt94MsUQcK2ELR9h6fzduTEc5Hh8=;
        b=bxHRbcOroOoCIlaEp20tsh2l3AZTgU2y07B8jy9Njloz/jnTY+NsRi9h0HgQ5bpH85
         tShopdRIatHP3tSwZxPBM9HjfdANf62HJPeZjEGxS8xQ91j4UWLRJBSAzEaEuCZnclMp
         tVZK5UiQIxoXyd9/PlDQpMQBUmgKwuV2nTNaMfpPYA35+L8C9SU4m25KhKkAz6e4i6uM
         w+bLhm2f6uVoT4G+P2ErvdJJGTMCNeWsuAxZKdSyJjcpsPN0i7y+WVVgAkvEEFWHjugD
         uq8/hWA7o6xIGzmZC2q7Twe8boHTfJ6IU4m+lgCyxTSDzAaxDRA/Tr0nH3/R4aIWXFwo
         2+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7tqKH/B97sPiSPakt94MsUQcK2ELR9h6fzduTEc5Hh8=;
        b=Di0D7fpohZUI8K/UTUpL52nJTr1rtfKHh1HFBJ6kHDp/vAtx59nKmjtR6NniyqCbhd
         2321eYDnFiO/FcHTOeWg71tvtaJXg4gdJGuuLaNOHS9LfM8mLRDQ0hh2EDBmeEacGlze
         u1a2cK3xAo+EqVDGNkf4yfWzh0UDff8l9UPJ33LGId0X8Y4Lk9qPCwl0IIO94i/cyU3P
         H+30zLUBFCIgT3leCWqtOClK+WlqW4QEBlwZhRHI4Q9J4Jpf3V0DZ1ljUy94aAK+cSqj
         +ZgIef1NNaQm/Xi3b1xELLxKEaPzCO5R5cft/a86jB/C4r6xSE57VmUzhNRtlaHdP0pm
         DCtg==
X-Gm-Message-State: AOAM5316nVjjj4JSLcejr7BcH7Y/3rn1LSd/FBrvqHePgBecMXAD1nxa
        d35bso6eT/z3I1Mg4S/O4DJK0Q==
X-Google-Smtp-Source: ABdhPJylZU1/3ukIkYide/4GljRyVzk9XCm2nCe6BP4bdvZNN7hT7CPmUayqj7ivLF/jh86PXYJH6A==
X-Received: by 2002:adf:a549:: with SMTP id j9mr21578353wrb.199.1605969864062;
        Sat, 21 Nov 2020 06:44:24 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u5sm7428850wml.13.2020.11.21.06.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 06:44:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH v2] build: allow building with pre-v5.5 kernel headers
Date:   Sat, 21 Nov 2020 15:44:19 +0100
Message-Id: <20201121144420.13806-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

libgpiod v1.6 requires at least v5.5 linux kernel headers to build. This
is because several new symbols have been defined in linux v5.5. In order
to allow building with kernel headers v4.8 and on, let's check the
presence of the new symbols and redefine them if needed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- the minimum kernel version should be v4.8 not v4.6

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
index cd337ff..9823359 100644
--- a/configure.ac
+++ b/configure.ac
@@ -95,13 +95,21 @@ AC_CHECK_HEADERS([sys/sysmacros.h], [], [HEADER_NOT_FOUND_LIB([sys/sysmacros.h])
 AC_CHECK_HEADERS([linux/gpio.h], [], [HEADER_NOT_FOUND_LIB([linux/gpio.h])])
 AC_CHECK_HEADERS([linux/version.h], [], [HEADER_NOT_FOUND_LIB([linux/version.h])])
 
+AC_COMPILE_IFELSE([AC_LANG_SOURCE(
+#include <linux/version.h>
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0)
+#error
+#endif
+)],
+[], [AC_MSG_ERROR(["libgpiod needs linux headers version >= v4.8.0"])])
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

