Return-Path: <linux-gpio+bounces-8496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407A943B9F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 02:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40006283EC1
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 00:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB23518C91E;
	Thu,  1 Aug 2024 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbrAYCVY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458418B498;
	Thu,  1 Aug 2024 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722471299; cv=none; b=gin8u0QVu3D/FQfcQkbc4tB0ieAqXZFNbsdY6Qa5V8RnTWjUYtcN3NOJiG7FjPkBfYFfvKz2AQeRjrIq5zJciAP7V7qrjA47IqwZZIKRL4KkL3nawCD2NVvankABhViqMYrSTdNq4X0xFSyyz5T2U7z2rH1GMhGZnWP1uENnBCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722471299; c=relaxed/simple;
	bh=WD0AoDodMfXRZhATLIYNle/2CHmU9VT/Djh5YD8KUVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJ7CFT30qKWIyapcHYBjU3SozwdyK68CGv8o20UXSJRfa0NZbWJinscLdphv0fi490PRpDeCtRRM4+xhrOyqiebTU1p0//q7DywHlo+w0rIB61ewEKIDIMQtCk1/jM/SF1nTy/y9ty7jQUPTMnEhj3bMMqp9rOAcopB42Xk0AHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbrAYCVY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7ADC116B1;
	Thu,  1 Aug 2024 00:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471299;
	bh=WD0AoDodMfXRZhATLIYNle/2CHmU9VT/Djh5YD8KUVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbrAYCVYfEy8yajcGvwUYr8cJ1TJ1lBKCqb3X9jGEXV3lrCwpFLmnh54u4EMD+hrz
	 31/HfK3PPdPfb6feUXZMzh8evyca7jUbOhArsphAU+XUNw6BeBYM6b3+Dk66Ngssn2
	 jotqVx4bsgHRZSKrfL8wz5L0xkGpte26H0XdofrZsEIuhbeN6aqQLZnt9V8unGCN7I
	 9DoeXiDzUas0Ct/1xp+ztNtvm8vVh/HdVOLvISPn9bKpiQX6CmkueZF4bYy6NGT6WB
	 iVoBWKlYKCA16h3WEtPCEZkdS4YqcjVQRqyZhW6N3rlbiAomtwmqgQASXEaumLwgzf
	 PQrDu4u+4ff+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 062/121] gpiolib: cdev: Add INIT_KFIFO() for linereq events
Date: Wed, 31 Jul 2024 20:00:00 -0400
Message-ID: <20240801000834.3930818-62-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
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

From: Kent Gibson <warthog618@gmail.com>

[ Upstream commit 35d848e7a1cbba2649ed98cf58e0cdc7ee560c7a ]

The initialisation of the linereq events kfifo relies on the struct being
zeroed and a subsequent call to kfifo_alloc().  The call to kfifo_alloc()
is deferred until edge detection is first enabled for the linereq.  If the
kfifo is inadvertently accessed before the call to kfifo_alloc(), as was
the case in a recently discovered bug, it behaves as a FIFO of size 1 with
an element size of 0, so writes and reads to the kfifo appear successful
but copy no actual data.

As a defensive measure, initialise the kfifo with INIT_KFIFO() when the
events kfifo is constructed.  This initialises the kfifo element size
and zeroes its data pointer, so any inadvertant access prior to the
kfifo_alloc() call will trigger an oops.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20240529131953.195777-2-warthog618@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 5639abce6ec57..62a6af8e53d0e 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1780,6 +1780,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
+	INIT_KFIFO(lr->events);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
 		lr->event_buffer_size = ulr.num_lines * 16;
-- 
2.43.0


