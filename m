Return-Path: <linux-gpio+bounces-8500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2D943EC9
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 03:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0AA51C20AB9
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 01:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD211DAC5A;
	Thu,  1 Aug 2024 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nI5ek6gn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EF1DAC4F;
	Thu,  1 Aug 2024 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722472490; cv=none; b=vF5nk9xmDhYuWt72GrFqnJUHWZgFjqvIUrweX4Ttg+vW2iEGgoEBWolqp5q273Fw0HttpIcsJZhtXb3CRYJESMTkE+lF/8SN/T7BENaUhJtnRYWY8r/PViksKeoHfYZgNisGQ0G8Eyf+wmYi1n8zJiPwZQ5iVc3uhb0ZHGDOkeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722472490; c=relaxed/simple;
	bh=aJIcq9DyBcTZ6CEstHojdKv4tBo6t34vo3PjqiZntm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYWhxRUa6iQaap3p1uSg7lpFfKMcZ4Hy8OSPn2ceHsQFAOHFDhcs51r7K58XGwZ2E3F3pt5YIxyQZxkon/oRj5KRoqyqjYdoD+f5tTQiyWfG3pQpBAlD7WXj3mm4PDFhYc1ayIq9W6CE0UhBayJ3zMXr2EgErjEi8HBefCQnCl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nI5ek6gn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310E8C4AF15;
	Thu,  1 Aug 2024 00:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472490;
	bh=aJIcq9DyBcTZ6CEstHojdKv4tBo6t34vo3PjqiZntm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nI5ek6gnhf3k/xpOSTmXcIutInHs3eKZHJ/OVFQ9unHemeTi743jH1e3/suOJukZW
	 X5C34dA6Jmke0Si5i2Ta1iCmO16qAZYgMcMoaJA1H311NKF3Zl4R0CUIbUlsqMXs4H
	 FGqXW2t05PajQYP8guHozbCCd4CnnTcAo85l9PVLCsZrboO0Lsvz/aP6jNMKNJ1uRS
	 89EvqH3rz6q6sFuiuML1YAr0eRFJjZCaP3Lf0QpK3fnKol7u0JW19Zgkfp1RPe1d45
	 5Lq8UuZpMAQyUPRL40CbDEMjQndMXqLnk6MobRD4xxRECG8PhUCc+kX1LfSYmVF6eI
	 nVyWpAz/6mpJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 27/47] gpiolib: cdev: Add INIT_KFIFO() for linereq events
Date: Wed, 31 Jul 2024 20:31:17 -0400
Message-ID: <20240801003256.3937416-27-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003256.3937416-1-sashal@kernel.org>
References: <20240801003256.3937416-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
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
index c2f9d95d1086f..f65eb9bcecc78 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1454,6 +1454,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
+	INIT_KFIFO(lr->events);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
 		lr->event_buffer_size = ulr.num_lines * 16;
-- 
2.43.0


