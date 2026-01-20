Return-Path: <linux-gpio+bounces-30765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56ED3C3C3
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 10:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 09689522766
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 09:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223F73D1CBF;
	Tue, 20 Jan 2026 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BafyZcZh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF543A9631;
	Tue, 20 Jan 2026 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901226; cv=none; b=ZqptnWQl92ypnJU7W9R0LuqH5UW0wMRzReyeh+VUXYWNrPqH5f+rSbqxC2QybgcagqQOR3y0a5YghkzNmonOLkjnICGv+5H85zSI2wJEBEvgdXGIJvMO+H1QdNra69p/eIl+VWeojeReeRUf0Aegh64TuoZFmCSC+dnJ/FtfcB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901226; c=relaxed/simple;
	bh=sqpcdKhNOtbJ2u6veMvJWBoH2LFMHIVqkrp+WjtPSU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iSqOVnQUC1YNShp6H9EA2keLAQMi6DFN9wPFoZqjAgALCG4lfRaUKeKhH3smZWKSMwmN545RZnzdubtEITJhh4fsqiRPYNZHQY9g9LCdsrS3GnkZ3PkTl/4ZOuNfyBrdCkx/MEE1B0C7hDypM3NkDsTG/BHFJKQwc1HkpJpWErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BafyZcZh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FF2C16AAE;
	Tue, 20 Jan 2026 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768901226;
	bh=sqpcdKhNOtbJ2u6veMvJWBoH2LFMHIVqkrp+WjtPSU0=;
	h=From:To:Cc:Subject:Date:From;
	b=BafyZcZhHy0R7H9d//LTmIORyKZko0VNjepACcPJpBhJsohMtGekjJaDp9e56TiKh
	 YbDghdLnxD8V81Sgm9ly424iKKHAyoNjPugFNBeXAfGjC2LJpRTM4VYzIkzLp7GPIR
	 5tHq8IYVrseM/htvE0/ZjshsglAgiNklZn3LVR1z4ukPLgLpiT529/qlA7YbG9WCFj
	 Xu+wirWdDiRQOt7ihojePQajHaFBy0qpN13nTfUCAPd9v1AnSWa81/84bi5Rtha1dX
	 OKeZRRihbYzzi0BIYsexJVB6fN7rWtuk3mSNb0WArrWfcCLZZM1Jn3Iuvn+dG3hD/O
	 aRLiE5TGTzQug==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: tzungbi@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] gpio: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
Date: Tue, 20 Jan 2026 09:26:50 +0000
Message-ID: <20260120092650.2305319-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On error handling paths, gpiolib_cdev_register() doesn't free the
allocated resources which results leaks.  Fix it.

Cc: stable@vger.kernel.org
Fixes: 7b9b77a8bba9 ("gpiolib: add a per-gpio_device line state notification workqueue")
Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Fix the jumping over guard() issue reported in
  https://lore.kernel.org/linux-gpio/202601200022.ZFwz8K6u-lkp@intel.com/T/#u.
- Title prefix: "gpiolib" -> "gpio".

v1: https://lore.kernel.org/all/20260116081036.352286-3-tzungbi@kernel.org/

 drivers/gpio/gpiolib-cdev.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 3735c9fe1502..b8b6e1873b51 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2796,13 +2796,18 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 		return -ENOMEM;
 
 	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
-	if (ret)
+	if (ret) {
+		destroy_workqueue(gdev->line_state_wq);
 		return ret;
+	}
 
 	guard(srcu)(&gdev->srcu);
 	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
+	if (!gc) {
+		cdev_device_del(&gdev->chrdev, &gdev->dev);
+		destroy_workqueue(gdev->line_state_wq);
 		return -ENODEV;
+	}
 
 	gpiochip_dbg(gc, "added GPIO chardev (%d:%d)\n", MAJOR(devt), gdev->id);
 
-- 
2.52.0.457.g6b5491de43-goog


