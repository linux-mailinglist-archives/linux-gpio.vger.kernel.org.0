Return-Path: <linux-gpio+bounces-11303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5365D99C9BC
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 14:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7ACD1F22C7B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 12:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694AA19F420;
	Mon, 14 Oct 2024 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mjFRADXh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090B819F422
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907861; cv=none; b=ud+SDnNwSSGcdV8GqquTC5WdQ4ykH2TuLpLRMPHU3BSDru5Anwog1r7s5qcuIU+o8P2dSmwxtGnCF0RKfc5V7gM2x5tS4+yelv5hFAlBHezJZZ8OlqqloiDq/HgvcVEgpCtYxiX6ffHy1WMjqcJ352vklNXSG6H/kWageT9ZU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907861; c=relaxed/simple;
	bh=MAGG964wSqBBGvfN2gkQRcPSC4Jh32ykYvn1v9uylUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fM7lG40Iz5zxfofA2sGP4wW6RH+YZaAnx7daKAcpo3FEm0tu/g0ee8NjSuiEY29Ot+LQ1jV/+ZqFmeF9Rtg1AzIEBbLzBguGSACDQAMRMBaVsivKqZK5tHrpRdIeSzNjLhb/R5XhJATqpyyF1UrpHre3xipoNwWOzFY4N5prm4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mjFRADXh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d447de11dso3065264f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728907857; x=1729512657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHqGv8Lx3OOsn0SdIgGngKrSbiNHpUwz8bHSBJ5/2o4=;
        b=mjFRADXhZN0q3c53nKnN3TdaKx6qW2IP5taFJ210EjbGNJqaTKHg8jLmubfEm9sg3H
         8RlEnMlreL0oYnWo+FMK8odGiP4ZSQvf2RV621mInJGCErQXjdxLu0W5lDY8xEiVDgJC
         IQvbWpuM82QB3HcBuc2YW2SR+FfvkQEEaPb+M+qVgvHl7JmET9GIzdnhOh73zJca9nAV
         l4qLZcFxygkisMoPUZlzYGojuQhwCaFfUoFM1GimGPYSN1xSgWwB1nw5qjKUn/+0HLM7
         onbsxB1foTgx+j04xMJ07QKe479gQUxZbewTDWCkGJHsbuiukhYWNrKhIMt2BVgxRR0Q
         Nm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907857; x=1729512657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHqGv8Lx3OOsn0SdIgGngKrSbiNHpUwz8bHSBJ5/2o4=;
        b=uEyqCCaOIUDvroYAOWJr+rWmOJO2NEX/ncPtDSJkLF6WJOTlj59+eWOxHO4woP5Zy1
         oKtNFyR0kiTvWDPaGFa8Gfe8l0gfmjinL7guZRsEuc51+O7lKdcWZLHfzlKMmFIgOIbe
         AcOiLUIFdWWLSm3tdukHTw0k+OE5yi9wSJzCArQv+hx8mudKqZHSPFAMijk6pywYlfrg
         vAm0f+vj7gkFtBJBvBzBbjs05DZoKxSd6EPA9PJiYyqEOod9qL7KP6Z6LvcvGk52SbYc
         OJXq2yD75j32go6zUcOC/NcaUPbVaClgcwR1X1hiPoiHms7WmeAjMWRV9+rR/FHR3xY/
         ZxmQ==
X-Gm-Message-State: AOJu0Yzn6cM4QPN/peMIqnV0yUolayDv0Js+RFL/fnfQ4/spPpgbudtP
	Lkodsnuq4atGjPavjCHSuk37TXfjJ3Cg5o4yU9eEApy/aES0XZs3pmdhu2d8ywk=
X-Google-Smtp-Source: AGHT+IG0nxVjRJCMkcP5M0tmUD6o2f3LnjKkllYtEnJqJKa+IaCOklrGMkK8LDYkkJ5ccGjistBgCg==
X-Received: by 2002:a05:6000:1866:b0:37d:4e5:bac7 with SMTP id ffacd0b85a97d-37d551986acmr10778918f8f.11.1728907857031;
        Mon, 14 Oct 2024 05:10:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d793fsm119036805e9.9.2024.10.14.05.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:10:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: create empty /sys/class/gpio with SYSFS disabled
Date: Mon, 14 Oct 2024 14:10:47 +0200
Message-ID: <20241014121047.103179-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

User-space may want to use some kind of a compatibility layer for the
deprecated GPIO sysfs ABI. This would typically involve mounting
a fuse-based filesystem using the GPIO character device to emulate the
sysfs behavior and layout.

With GPIO_SYSFS disabled, the /sys/class/gpio directory doesn't exist
and user-space cannot create it. In order to facilitate moving away from
the sysfs, add a new Kconfig option that indicates to GPIOLIB that is
should create an empty directory where the GPIO class interface would
exist and enable it by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
As I've mentioned under a different patch, I'm working on a user-space
compatibility layer for the sysfs GPIO interface. FUSE allows us to
emulate almost all its functionalities using libgpiod except for
mounting it under /sys/class/gpio if GPIO_SYSFS is disabled. User-space
cannot create directories in sysfs so if we want to allow users to mount
the FUSE emulator under the old location, we need to create an empty
/sys/class/gpio directory from the kernel and this is what is patch is
for.

 drivers/gpio/Kconfig   | 18 ++++++++++++++++++
 drivers/gpio/gpiolib.c | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bfa6b5a2c537..f2e7163cb46c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -69,6 +69,24 @@ config GPIO_SYSFS
 	  use the character device /dev/gpiochipN with the appropriate
 	  ioctl() operations instead.
 
+config GPIO_SYSFS_CLASS_DIR_STUB
+	bool "Create empty /sys/class/gpio directory" if EXPERT
+	depends on !GPIO_SYSFS
+	default y
+	help
+	  Say Y here to create an empty /sys/class/gpio directory.
+
+	  User-space may want to use some kind of a compatibility layer for the
+	  deprecated GPIO sysfs ABI. This would typically involve mounting
+	  a fuse-based filesystem using the GPIO character device to emulate
+	  the sysfs behavior and layout.
+
+	  This option makes GPIOLIB create an empty directory at /sys/class/gpio
+	  where user-space can mount the sysfs replacement and avoid having to
+	  change existing programs to adjust to different filesystem paths.
+
+	  If unsure, say Y.
+
 config GPIO_CDEV
 	bool
 	prompt "Character device (/dev/gpiochipN) support" if EXPERT
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 97346b746ef5..31efb580beb8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4873,6 +4873,12 @@ static struct device_driver gpio_stub_drv = {
 	.probe = gpio_stub_drv_probe,
 };
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_CLASS_DIR_STUB)
+static const struct class gpio_class_stub = {
+	.name = "gpio",
+};
+#endif /* CONFIG_GPIO_SYSFS_CLASS_DIR_STUB */
+
 static int __init gpiolib_dev_init(void)
 {
 	int ret;
@@ -4899,6 +4905,12 @@ static int __init gpiolib_dev_init(void)
 		return ret;
 	}
 
+#if IS_ENABLED(CONFIG_GPIO_SYSFS_CLASS_DIR_STUB)
+	ret = class_register(&gpio_class_stub);
+	if (ret)
+		pr_err("gpiolib: failed to create the empty gpio class directory\n");
+#endif /* CONFIG_GPIO_SYSFS_CLASS_DIR_STUB */
+
 	gpiolib_initialized = true;
 	gpiochip_setup_devs();
 
-- 
2.43.0


