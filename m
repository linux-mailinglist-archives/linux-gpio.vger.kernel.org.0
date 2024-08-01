Return-Path: <linux-gpio+bounces-8498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128FB943D4B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 02:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3295287B26
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 00:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203781C461F;
	Thu,  1 Aug 2024 00:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6AMTSxd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87161C4613;
	Thu,  1 Aug 2024 00:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722471861; cv=none; b=ml6Ak2j7iTQ3Sx6wZTRNpQX0vxG3iZcvwB6Y5gh1KbogLfVyFaaRBFQgKSGXmtQfTDou0RJ/GfBWFYc0uAwIRyewX8LPL/a4mUs+ZPm01Lv1WyYBoZZ9j7Gi1100bP8uvveXY3T0ls2vnMeM1cxTY+RwsHs0IhZCFG/+NuBCQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722471861; c=relaxed/simple;
	bh=7ya/jMk4w9FtisSvlpnfylu0JSBrBUBhQgTzbZ2uyFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OC4zLf8C0SXBS0XObZ/R3CO5meF+KlWKWRiSIStQvu4UAf/H2scv4FjgB5C+KmY0A9JR7TmjV7qJJ+hIagLSPeP1UreXZ/bVwdNcFQQOVbVzc/Wf5DA7tjy/S2ag34+ox+UABGTuLUi/1b1sSFGXgB9U7Y1gTF2uUj4DQDlvbvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6AMTSxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2838C116B1;
	Thu,  1 Aug 2024 00:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471861;
	bh=7ya/jMk4w9FtisSvlpnfylu0JSBrBUBhQgTzbZ2uyFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6AMTSxdpg60BsFylspzTNXmVwATKNVNgaNFIKI5fPno0TrMmiQ7btKNDyTyxq6UB
	 p0xiCqTMtb+AFefBJLHiUH+Kfk3ycOC69K+6IkosjA95B9Wie6VTDWNuhfmPR/ZDla
	 4PEBa5aSS7Bi/YWPKEwFijZqqSUjJAQi3wdI1m3tn3DQF2MAs7WRQ7BeDOEk6trijH
	 KGlNMWU6gbBXQQfdzv6dX4/C62rlFtGuBzO+zVrrSPibEfUgL8CJm5O8ihZKr6X47l
	 sPaQJ5fPFQmMcUpmPE89dLCn5A7lu2GOcQchuN+qdJkwJCbjt+ft/QFohGuvkiKdB+
	 79+folYwmhoRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 42/83] gpiolib: cdev: Add INIT_KFIFO() for linereq events
Date: Wed, 31 Jul 2024 20:17:57 -0400
Message-ID: <20240801002107.3934037-42-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
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
index d526a4c91e82e..0b1531557f04f 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1855,6 +1855,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 	mutex_init(&lr->config_mutex);
 	init_waitqueue_head(&lr->wait);
+	INIT_KFIFO(lr->events);
 	lr->event_buffer_size = ulr.event_buffer_size;
 	if (lr->event_buffer_size == 0)
 		lr->event_buffer_size = ulr.num_lines * 16;
-- 
2.43.0


