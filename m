Return-Path: <linux-gpio+bounces-8400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D47C93E1A3
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2024 02:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF8131F217B9
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2024 00:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B8BA947;
	Sun, 28 Jul 2024 00:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHthgf2u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307F8C1E;
	Sun, 28 Jul 2024 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722127665; cv=none; b=W8ny64XU1ATKiRoygBpPrjlbohMxBOLRiFbQv0UysOMM7ziWjvU6QbK2jExXbYFZrXS3fWP1VW/Y3mAYP2/FvxwUQq9h7oYGMmA8k9PIsoeGwUrrD0ZoPzTY9GdyluyPXIpLy9f5Tp+sezjKyfSMDHvBLJcvW0b2Di5Z16LaW1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722127665; c=relaxed/simple;
	bh=/T9kGZYYGRgCXgH2L71BmXyr5L6wYgN/ahRYRI/439I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEFNmgiL25KN5W7YoR4U4+Qli1HPVJ+1uRQHwp5MgpLKvrAYXndM3xMfo1HLPNj19ZawUWxcP13nEJ2uZ4XLwgte0cSTA5gpWxZP2R2oyUqdDJ5DR6+eIqLdzRnOBErh0Ji0Yfpx4EcqcT+bTNqo5Eqj8OtDLY9kNfIPXu8fI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHthgf2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9301CC4AF07;
	Sun, 28 Jul 2024 00:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722127665;
	bh=/T9kGZYYGRgCXgH2L71BmXyr5L6wYgN/ahRYRI/439I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHthgf2u58wSYWsD8u0IwCyNVMepJAMFDjiWBH2GnM/PSAAAyMQtZEsRoUAWp7KL6
	 XuE2Oe6Ycen0Hgeo63qwFvFFFiMydaDhHzihWDCT9MZKiw74Oip3UnonfIp+2vt8MS
	 VQSS1F1pSMLJet/i48jo7NeLcdMQzhByNUtEcWaV/+h01QZU6gaI0j4Hadn9Tz6RYK
	 yMbyuIpKIxYH6a4dEz4hK5Ef4QFaNbKEvRrZH+Fl9MlE7aDIVr/8pKoRxgHXSxWjXI
	 xDLIG3yCGUTmzIh0zMSCjbb9GloLsUbcIn+EYwp7mpscNfX/2mJ4lq7wJWAECr/rXa
	 JHWaOdt/PfjuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hagar Hemdan <hagarhem@amazon.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 03/16] gpio: prevent potential speculation leaks in gpio_device_get_desc()
Date: Sat, 27 Jul 2024 20:47:20 -0400
Message-ID: <20240728004739.1698541-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728004739.1698541-1-sashal@kernel.org>
References: <20240728004739.1698541-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
index fa62367ee9290..1a9aadd4c803c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -17,6 +17,7 @@
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/seq_file.h>
@@ -198,7 +199,7 @@ gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
-	return &gdev->descs[hwnum];
+	return &gdev->descs[array_index_nospec(hwnum, gdev->ngpio)];
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_desc);
 
-- 
2.43.0


