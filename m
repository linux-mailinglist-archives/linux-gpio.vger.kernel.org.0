Return-Path: <linux-gpio+bounces-12255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF899B334A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FCB2282E98
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503991DE2BF;
	Mon, 28 Oct 2024 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgcwGBWO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A51DD864;
	Mon, 28 Oct 2024 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125318; cv=none; b=nBSuFnLj3iWhMQO3DItfGiTanhNLvk+ejc07BILnNi3XKpmKvivFWk/vWtluTP5woCSyCkkIMyV5CYusI2R3Vg5+vysNWxaNEDhG+aB+G1HdoEffJ6Db11FXJmJRGjgZUe5taYFynufWijHEo7AkgYBcacRuUkjSnp3GdMxqXkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125318; c=relaxed/simple;
	bh=S25SV6u/GPrx7GE9MFEaFERmUzUCYR3MmlDeneBXni4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XIbyl66wzvqmu9OuKfJJPDZ0lHwuVTlHmcE//iDkd2m8hcHKGEBn17W5ZVUMMcTFBqBYwc4BryStVQFF0leYfm+U8wlws7QT3hGhFWDQEKvq6sqO1azp1vC0NNcTlK9RsALgNc6PcUa5/p+wszwNwAK/c/MYlmxWtcDWn7kUIvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgcwGBWO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CEDC4CEE4;
	Mon, 28 Oct 2024 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730125317;
	bh=S25SV6u/GPrx7GE9MFEaFERmUzUCYR3MmlDeneBXni4=;
	h=From:To:Cc:Subject:Date:From;
	b=jgcwGBWOZVSTGfp+NoCkhtAZtUmmzJf79s2uxQX6wEwJ0xaGHgazDGbUwea00Yq+B
	 v8zs1AZ4aihhjMb47OQk8hBQaYIClFg2xdLXRJxcnyNHK2AAyySBk5T8/6iByZgryy
	 yPE0blCM7ifPxRo2uGc/0EI+qhCvRTjfIfwJivOz1jbsjGFdlkHIjV1N/i7We48vWU
	 yis1GX9595RHkVbsFFDBGf/UyrR/tIC6VBjVVdIia6J1OZQi1D4jX4s+OGlNsqUIaX
	 nfd1Feb4B/+nMoy4DafhGVpYRdgyXRslNz+mI+pdgvGTbrQ2QaYHHAJC/7B4sarIZy
	 0LkRccUUbl+eQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] gpiolib: avoid format string weakness in workqueue interface
Date: Mon, 28 Oct 2024 14:21:46 +0000
Message-Id: <20241028142152.750650-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using a string literal as a format string is a possible bug when the
string contains '%' characters:

drivers/gpio/gpiolib-cdev.c:2813:48: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
 2813 |         gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
      |                                                       ^~~~~~~~~~~~~~~~~~~~
drivers/gpio/gpiolib-cdev.c:2813:48: note: treat the string as an argument to avoid this
 2813 |         gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
      |                                                       ^
      |                                                       "%s",

Do as clang suggests and use a trivial "%s" format string.

Fixes: 7b9b77a8bba9 ("gpiolib: add a per-gpio_device line state notification workqueue")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpiolib-cdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0ec162b0ea04..088201de9627 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2810,8 +2810,8 @@ int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt)
 	gdev->chrdev.owner = THIS_MODULE;
 	gdev->dev.devt = MKDEV(MAJOR(devt), gdev->id);
 
-	gdev->line_state_wq = alloc_ordered_workqueue(dev_name(&gdev->dev),
-						      WQ_HIGHPRI);
+	gdev->line_state_wq = alloc_ordered_workqueue("%s", WQ_HIGHPRI,
+						      dev_name(&gdev->dev));
 	if (!gdev->line_state_wq)
 		return -ENOMEM;
 
-- 
2.39.5


