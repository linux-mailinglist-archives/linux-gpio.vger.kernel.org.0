Return-Path: <linux-gpio+bounces-32343-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCGLBFrqomlG8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-32343-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 14:15:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CF1C32EE
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 14:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E871330205DC
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 13:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA50443E9C1;
	Sat, 28 Feb 2026 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFmmrMAj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5EC43E499;
	Sat, 28 Feb 2026 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284495; cv=none; b=g8O7f0LQU/VgnJlvmqS/e+znnYgc0mvqBaKIMZCGKHYZcQyxPGMj6YAhcc5RnLrixnKmgdYu7kP6TITk/31XsPnf3tTNMIQSp/ghYF0W5/Aqv2CrAopHW9fQnH1bYmsHVdUQ3t3aJ3vJZ4db/J8+VzNBat6wvKn99SF23QxOIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284495; c=relaxed/simple;
	bh=qA8U8SexRG4+N0RJnGy3EmK6kVD0iSiu4oBY0ZzsegQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awik+ka/UkzSK4IfUNiRoTO3U9wMGlZOpOe58aAdTIMfclmemTSNku2YE1L3TwFlvz1oY4SI8gMdVF9ls2XmawNhMWqKx9rIrsiiOq4bfQV2o2cPrmGQrwpaimoQAytOx1qHpG8veAxoPpW5JUPtGD1gOtbfFbTAOxtihCo7r74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFmmrMAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43166C116D0;
	Sat, 28 Feb 2026 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772284495;
	bh=qA8U8SexRG4+N0RJnGy3EmK6kVD0iSiu4oBY0ZzsegQ=;
	h=From:To:Cc:Subject:Date:From;
	b=GFmmrMAjfk3dyBbORZGyzyxFR2GxEm3+vCJYeO3vdyE/CBh83D6iSnIAO/uJT49+2
	 JQRUaRt2L4xDX1gdoWpxOZE2VqjrqAchG0Sl+J5xSxSCAv2lb4mW6DIYHE9z7Q+r2K
	 7919WvDABaRzZrAuj1t7RqhUFOJllaz+zBkZrAAbL9hD7kme8JHTORo5CFkBeikHjj
	 3cSigtNXExw/AaYqCT9etNq1NKyXT6Rw/QiGS5zq5QDgXlOfdTOgBNe+1VRst6AhdP
	 pHDaRxSiGhW5z0uJZ/0Zxmt7eUc2zyw3JXZzUd3rd6HrKpM/PJIUtw6ZCwLPsMCDMQ
	 AgNLoYjUNdS9w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: tzungbi@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] gpio: Fix lockdep warnings in gpiolib_{cdev,sysfs}_register()
Date: Sat, 28 Feb 2026 21:14:30 +0800
Message-ID: <20260228131430.102388-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32343-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,samsung.com:email]
X-Rspamd-Queue-Id: 816CF1C32EE
X-Rspamd-Action: no action

A lockdep warning is reported in gpiolib-cdev driver:

  WARNING: drivers/gpio/gpiolib-cdev.c:2735 at
  gpiolib_cdev_register+0x114/0x140, CPU#1: swapper/0/1
  Modules linked in:
  CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
  7.0.0-rc1-next-20260227-00065-g6af4b9cfeded #12259 PREEMPT
  Hardware name: Samsung Exynos (Flattened Device Tree)
  Call trace:
    unwind_backtrace from show_stack+0x10/0x14
    show_stack from dump_stack_lvl+0x68/0x88
    dump_stack_lvl from __warn+0x94/0x210
    __warn from warn_slowpath_fmt+0x1b0/0x1bc
    warn_slowpath_fmt from gpiolib_cdev_register+0x114/0x140
    gpiolib_cdev_register from gpiochip_setup_dev+0x4c/0xd0
    gpiochip_setup_dev from gpiochip_add_data_with_key+0x960/0xad4
    gpiochip_add_data_with_key from devm_gpiochip_add_data_with_key+0x20/0x5c

This is because the SRCU wasn't held in gpiolib_cdev_register() when the
caller is from gpiochip_add_data_with_key() instead of
gpiochip_setup_devs().  gpiochip_sysfs_register() shares the similar
concern.

Given that both gpiolib_cdev_register() and gpiochip_sysfs_register()
are only called from gpiolib but no external users.  Remove the lockdep
checks to fix the warnings.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/506ce9b3-d492-4fce-9d02-330e411911e2@samsung.com/
Fixes: cf674f1a0c98 ("gpio: Ensure struct gpio_chip for gpiochip_setup_dev()")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/gpio/gpiolib-cdev.c  | 2 --
 drivers/gpio/gpiolib-sysfs.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 7ebdb4993a74..f36b7c06996d 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2732,8 +2732,6 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 	struct gpio_device *gdev = gc->gpiodev;
 	int ret;
 
-	lockdep_assert_held(&gdev->srcu);
-
 	cdev_init(&gdev->chrdev, &gpio_fileops);
 	gdev->chrdev.owner = THIS_MODULE;
 	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 748a3eb1bf35..fc06b0c2881b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -990,8 +990,6 @@ int gpiochip_sysfs_register(struct gpio_chip *gc)
 	struct device *parent;
 	int err;
 
-	lockdep_assert_held(&gdev->srcu);
-
 	/*
 	 * Many systems add gpio chips for SOC support very early,
 	 * before driver model support is available.  In those cases we
-- 
2.51.0


