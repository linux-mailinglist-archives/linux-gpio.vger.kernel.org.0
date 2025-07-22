Return-Path: <linux-gpio+bounces-23630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE7B0E0AA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 17:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75D7F5610F7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 15:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47642279327;
	Tue, 22 Jul 2025 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ea8/2Rlk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0060A278E5D;
	Tue, 22 Jul 2025 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753198604; cv=none; b=K2y9hxjto/aDlZNgU3NPf69WZPIF6oRbM/3G3ClRbCYv5QBhhngHrd17ODZIc6F9RyoUjdxSFGlKzUmgswvnrOAklJ2sU2O6U8WxgR4jGCp2FlvAMap05cIjrvvMMq/nRWN79zhPQTFP+Lt9wkbhwW7N+fCJ/fqIFMDl5bzKwEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753198604; c=relaxed/simple;
	bh=sKE1I+XBnE0OVrhlro0vxqyA8Rd8ZCj8d4EvJPENldc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bCOdNW4+51HoeYXlHJYMD2T89/w9AZsSyhlC1czQmcLLxOG1jD0LS0DiV7CB2rroBWvWM+ULSPSxfh9ancr9zCq0eodTlus4UAsLyV6+sScgtdydApXrbxRrfQef8vtPg9P6NmvpQdNCaFdh1+YzrD5cHqoja02qm9+dmO0J8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ea8/2Rlk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C05C4CEEB;
	Tue, 22 Jul 2025 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753198603;
	bh=sKE1I+XBnE0OVrhlro0vxqyA8Rd8ZCj8d4EvJPENldc=;
	h=From:To:Cc:Subject:Date:From;
	b=ea8/2Rlk91FRdAAqv98bM28Jq5h4boF22SuZ5+pwDxDpCGQ5NMS8djQ681nuT93fB
	 evgaKLkPqHItRzR9X4M2LK3ZLRqu55YDSEfIQVVYFc57TFFODU+WRllrQb8KmaIYHc
	 yiEz9sSG2EIIrOcSaxki4XlQ4Ipk4KuOXKFoydnprBTemcC+uVaKV4YNQ4MruKY04N
	 5LSyZ2iiYEgrz2HCLei4+J1DqfPHCMZk3vYO+K8QRkwjDNxHzGT1Wr8Ue554ctn0HH
	 ntX3JWLbTw4UQC4Wf3+/6tijbC66B20Nfe5W4MNJ3cJm4M63w87dyCZ44tKnqtGb7a
	 Pzg9lLsp1qTUA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: make legacy interfaces optional
Date: Tue, 22 Jul 2025 17:35:43 +0200
Message-Id: <20250722153634.3683927-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The traditional interfaces are only used on a small number of ancient
boards. Make these optional now so they can be disabled by default.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is the first patch of a series to turn off the legacy interfaces
by default. If we can still have this one in linux-6.17, we can more
easily merge the other patches for 6.18.

See for the longer series:
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=config-gpio-legacy

I'm sure there are still problems in the other patches, but it
does pass my randconfig build tests on the three architectures
I'm testing on. I plan to post them after some more testing
once -rc1 is out.

 drivers/gpio/Kconfig  |  3 +++
 drivers/gpio/Makefile |  2 +-
 include/linux/gpio.h  | 10 ++++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 12bdf6e965f1..8bda3c9d47b4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -14,6 +14,9 @@ menuconfig GPIOLIB
 
 if GPIOLIB
 
+config GPIOLIB_LEGACY
+	def_bool y
+
 config GPIOLIB_FASTPATH_LIMIT
 	int "Maximum number of GPIOs for fast path"
 	range 32 512
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88dedd298256..b01ff2b68bf6 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -5,7 +5,7 @@ ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
 
 obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devres.o
-obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
+obj-$(CONFIG_GPIOLIB_LEGACY)	+= gpiolib-legacy.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_CDEV)		+= gpiolib-cdev.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index ff99ed76fdc3..8f85ddb26429 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -13,6 +13,11 @@
 #define __LINUX_GPIO_H
 
 #include <linux/types.h>
+#ifdef CONFIG_GPIOLIB
+#include <linux/gpio/consumer.h>
+#endif
+
+#ifdef CONFIG_GPIOLIB_LEGACY
 
 struct device;
 
@@ -22,9 +27,6 @@ struct device;
 #define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
 
 #ifdef CONFIG_GPIOLIB
-
-#include <linux/gpio/consumer.h>
-
 /*
  * "valid" GPIO numbers are nonnegative and may be passed to
  * setup routines like gpio_request().  Only some valid numbers
@@ -170,5 +172,5 @@ static inline int devm_gpio_request_one(struct device *dev, unsigned gpio,
 }
 
 #endif /* ! CONFIG_GPIOLIB */
-
+#endif /* CONFIG_GPIOLIB_LEGACY */
 #endif /* __LINUX_GPIO_H */
-- 
2.39.5


