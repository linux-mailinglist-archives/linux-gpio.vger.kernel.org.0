Return-Path: <linux-gpio+bounces-8401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 183F093E1D0
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2024 02:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83E628143B
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2024 00:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93EC76056;
	Sun, 28 Jul 2024 00:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zig39kj0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129C75817;
	Sun, 28 Jul 2024 00:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722127697; cv=none; b=bj6wFDrTtlKYRqG0l/T0Pn7FOsd0E/plzllrqeD44TJXadbCs2Pyfq47EOK4hIVK37e6ZsxIOt/1+zBwxPNrCld+UIy3ZOC7c60lAsiagfglb/QvCjlOCHO+VfAFm/ec30ebkcg1m0QYr6UmYQ+babReQUIthZQVVjQDOY8gblg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722127697; c=relaxed/simple;
	bh=06EgB3bJk6nmJAH/dgXehgiFdXfXMAAzetLqDY+TjrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkhOLHiIo7pwbHA9WyYD3hWvbWN2OD14vew/LBpkfj58+uy09cgqkCWrVmaWuGP+lCA1Zch37Xu0JF1X2291w9zkp7WBu5jhyho7R3+HQ1HozJbi0F5eZzhbC1Mrg3vdmN9+PY71Y+LhaVyJkCMKiABAnaRyp1adS/FXZHhDOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zig39kj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37017C4AF09;
	Sun, 28 Jul 2024 00:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722127697;
	bh=06EgB3bJk6nmJAH/dgXehgiFdXfXMAAzetLqDY+TjrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zig39kj0/OCqqNFnA8wOgcksNNZmMj48Flu9cbj0mmMRNvlNgmzgwQkC24w8bmJix
	 LsAQ/5BFwlGEJMmiSy7tWlJpBDie87+/3YFWWbOHddkZCi1Gh4sYjqg2OLhnarm5fN
	 Hig4hjP5tlRfFfEIqa8BDVPGIO4VUoB0CfwVkcWtj6ZW2TMA4Dxw9Z5DOP4BQ6cyId
	 YM0ddpDJpTGOAWkub1qpN9w5vs4UT5Z1+4eN0+/rUf1uKFu3+KBJF6Tm2eCTBCRxke
	 9vGnNptzGziBVdBSeSk5qWa9QjfFHXggPeOnLahqZs1PqRw0WzA6Tx4I8wZSKCCh9E
	 JaUe3kTZ0WNZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hagar Hemdan <hagarhem@amazon.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 2/9] gpio: prevent potential speculation leaks in gpio_device_get_desc()
Date: Sat, 27 Jul 2024 20:48:03 -0400
Message-ID: <20240728004812.1701139-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728004812.1701139-1-sashal@kernel.org>
References: <20240728004812.1701139-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
Content-Transfer-Encoding: 8bit

From: Hagar Hemdan <hagarhem@amazon.com>

[ Upstream commit d795848ecce24a75dfd46481aee066ae6fe39775 ]

Userspace may trigger a speculative read of an address outside the gpio
descriptor array.
Users can do that by calling gpio_ioctl() with an offset out of range.
Offset is copied from user and then used as an array index to get
the gpio descriptor without sanitization in gpio_device_get_desc().

This change ensures that the offset is sanitized by using
array_index_nospec() to mitigate any possibility of speculative
information leaks.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Hagar Hemdan <hagarhem@amazon.com>
Link: https://lore.kernel.org/r/20240523085332.1801-1-hagarhem@amazon.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1c512ed3fa6d9..5c0016c77d2ab 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/seq_file.h>
@@ -164,7 +165,7 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc,
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-	return &gdev->descs[hwnum];
+	return &gdev->descs[array_index_nospec(hwnum, gdev->ngpio)];
 }
 EXPORT_SYMBOL_GPL(gpiochip_get_desc);
 
-- 
2.43.0


