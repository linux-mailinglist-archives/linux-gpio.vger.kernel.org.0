Return-Path: <linux-gpio+bounces-8501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF295943F43
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 03:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 850E71F25B28
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 01:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097151E2113;
	Thu,  1 Aug 2024 00:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5Q1Ij5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6B1E210A;
	Thu,  1 Aug 2024 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722472689; cv=none; b=mA9WGwU9cJ31uieqc7wFIXtayTzHF2lDb1B89op73aqoOdXFA3vB94s0F3RB7Gigf32FevNqwIOJug3EYqcfbHoOdpS01sdCLXLTMALx4XUCKB9ymXXapzAIZYt9JWCrnBaHbjuTUY/Zc6Zo7KVtbdxWCJZZmxMu0HVConTvL+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722472689; c=relaxed/simple;
	bh=Hw6n/w2pROwUoaVWOZb/d9PJzkOGzcDCe6x6DQ+loSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfC0J/I9GSd9CdqA+4pIpAZiyAChblmsyS9hZd/B0Cb00i2H5TeEHzJ8TrPNOqCr0zGmsrI8ZigxE0zq47tMwZaDIUJfTJp0+s0srSbXVac4tdoJv7VKnuj+uSHjm0L+bj5k/LJSAMAWo+8CJhhVy+iUHrrwmn+G2AVLXrns6fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5Q1Ij5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A5AC4AF11;
	Thu,  1 Aug 2024 00:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472689;
	bh=Hw6n/w2pROwUoaVWOZb/d9PJzkOGzcDCe6x6DQ+loSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5Q1Ij5eynx2FEojhkUVQVJ4Z0+c5rtEVf7jtooHilVgfjbGU7a4I9TftDTveSXBY
	 w4z1zMewIYQDA+BBPIYB4tIrhvA+Jc4k9eV39Fbjvx5Xhsb8DLDe3xdPKMHCd8i/Ig
	 9bhiJBHzsecutZF7ydA37WliAJiwQvm4Vk+YkIowzCweXD2lUgogfPjwJM+7erhDhS
	 OvIFC4lxTD3/BOMd3BtqRn76vh3PBPGxb715CpC+Dad0NVZ0nfF8SVIr+Aw6GevK6T
	 CiAtpf0j8oNZm8s65Dq2Z8dTa0Mf1mUdan3/SRs2INikfFoBRatIAmeLsaVUuNluO2
	 QUohALphKWhWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 21/38] gpiolib: cdev: Add INIT_KFIFO() for linereq events
Date: Wed, 31 Jul 2024 20:35:27 -0400
Message-ID: <20240801003643.3938534-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003643.3938534-1-sashal@kernel.org>
References: <20240801003643.3938534-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
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
index 95861916deffb..05ed8fd40cbfc 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1354,6 +1354,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
+	INIT_KFIFO(lr->events);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
 		lr->event_buffer_size = ulr.num_lines * 16;
-- 
2.43.0


