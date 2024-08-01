Return-Path: <linux-gpio+bounces-8499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B35943ED8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 03:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59D30B2B31A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 01:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7134C1D1724;
	Thu,  1 Aug 2024 00:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3XPw3lr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D791D1727;
	Thu,  1 Aug 2024 00:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722472219; cv=none; b=JtkLX5U30knz742lV2jRws3wEDSyyyKNp0RQZC4GovZpCmpIixZoL71Cb0GeoCI+z0vqqFjC4kgXH/NDtOfmOnBKbEWZywHPLkoHfza5rH05FLsMkpy55GxTdkNY+7MwXnOeeC4v8aDHcnS35SaBlWxalo6BranJm4l0/vSF84k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722472219; c=relaxed/simple;
	bh=cT734ZYDA0Jz+rKWc+j6YT2431NQG6GWzEm+gZfSA84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOHuIBckC2GmZLSLQHd+YI4+qXVHjR8kUkLggyrsLCEq5ZH+Jn0Skm/SlBaISZdEDQL5JOWQ+JafuQP4bbozsV6rcTeM6DPWwBsSdWrLITRUmrYK9qkOIeZUfGNcuy0d/96dnQQjXBSAhaVckqJQhXiF91PELGRHB4XXszIwDMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3XPw3lr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E471C116B1;
	Thu,  1 Aug 2024 00:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472218;
	bh=cT734ZYDA0Jz+rKWc+j6YT2431NQG6GWzEm+gZfSA84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j3XPw3lrR/N5QNxKekfpN/vL7ENZkh/mcJGxarDXtzLUlZyNwzPQRrSuL25hWzxae
	 dKPx9MaOeMD9j4bgegyaYGxFrfBrIzP+BoWrzHNPAzkGFkX3EnNWtujMXSJoAAYcbS
	 ymAbg/75PHNGCMuVDF4R8neawToLWs3uL4IH+JQwK2f+h5fxBe4KCJKN+3fA6WU0VC
	 /KIPLa/q6jvOi+oMbmTiD0Q3D1NKk2R45dfNq2b+ouI7EJvHXKt4p5CCewFqwl3Eir
	 iA2VJnClKJg36pt3ViD6dmeFFnTGE1oHseR3ZfoaOOQiku9bkhYAKlWpfpeIL/9qRQ
	 m5d6jEi/dEwbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 32/61] gpiolib: cdev: Add INIT_KFIFO() for linereq events
Date: Wed, 31 Jul 2024 20:25:50 -0400
Message-ID: <20240801002803.3935985-32-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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
index be51bd00d2fd2..d50b910080654 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1812,6 +1812,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
+	INIT_KFIFO(lr->events);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
 		lr->event_buffer_size = ulr.num_lines * 16;
-- 
2.43.0


