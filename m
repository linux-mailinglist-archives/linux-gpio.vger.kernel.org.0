Return-Path: <linux-gpio+bounces-8140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F169F92BFE7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A13DA1F23728
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461DB1ACE68;
	Tue,  9 Jul 2024 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooNJP2cK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B41AC45C;
	Tue,  9 Jul 2024 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542061; cv=none; b=XY/DXp1sRjpkV7dM1qQ9HH9lMYFU+/m2xJ6P2oLp3dfB15XqVEdnSjRtYinrcwk2kM8H9xizo5oP56LxXpQV1Av30/CcxkNA6KZO4JCXjkV9L5Sl/eR9T7Jf6lSOdNJeNdpQp7nFEAgqKamVGCXt9kEEsJbgkqKh7EyRZqaM/40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542061; c=relaxed/simple;
	bh=1P3Npn3mh2RmgZy5z8jWNbyPq/9BixdfLRnEu8Vc2QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stoXZdbnJzzorC88XNk9m7Bkb3jR+KdXrXQl04Q+LZHd3/NG2+vsDh3+k+GFsbRhqFc9khJnpmdjsT7tautAM7ynpPwlcKrDN0NAVmx5I8LOBXR/BB/M+7mxryPMk2qM+ci2I58WIZl3yrKPg5IIDRWMuR90xxghGQsYhGr2CdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooNJP2cK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9969AC3277B;
	Tue,  9 Jul 2024 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542060;
	bh=1P3Npn3mh2RmgZy5z8jWNbyPq/9BixdfLRnEu8Vc2QA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ooNJP2cKXLQCkMuaOh4ClcPUkv6xfVLC0QSdCayrA/ev9Oscwj/BPZ7eNGaXyYVBX
	 IclpRd1CPp/4Mkdb4e+ErYgeduWBth3yRLPAGiyv20UyPQczFoapwfqOtHW8rf5pFR
	 7UFhDnIIrYn1oNongetL0hcrvh/SGo2psp/3CC6q06wiAMgPYYdxbTzK3QOKzbVbm+
	 f6usCDvcqjKMRb+klznIAp/tZmhLHlRfnbr/0aUAfzTxaDUTf5NxrUvEOlrr83yLqr
	 CP9LtqsK8GjI7RQejyp4QZJDv6dUiY9Aj2FaTHCER5saIGrV1yV//9EhIL/Divfd8w
	 SSegq855zZaGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 23/40] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Date: Tue,  9 Jul 2024 12:19:03 -0400
Message-ID: <20240709162007.30160-23-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
Content-Transfer-Encoding: 8bit

From: Ian Ray <ian.ray@gehealthcare.com>

[ Upstream commit bfc6444b57dc7186b6acc964705d7516cbaf3904 ]

Ensure that `i2c_lock' is held when setting interrupt latch and mask in
pca953x_irq_bus_sync_unlock() in order to avoid races.

The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
lock is held before calling pca953x_write_regs().

The problem occurred when a request raced against irq_bus_sync_unlock()
approximately once per thousand reboots on an i.MX8MP based system.

 * Normal case

   0-0022: write register AI|3a {03,02,00,00,01} Input latch P0
   0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0
   0-0022: write register AI|08 {ff,00,00,00,00} Output P3
   0-0022: write register AI|12 {fc,00,00,00,00} Config P3

 * Race case

   0-0022: write register AI|08 {ff,00,00,00,00} Output P3
   0-0022: write register AI|08 {03,02,00,00,01} *** Wrong register ***
   0-0022: write register AI|12 {fc,00,00,00,00} Config P3
   0-0022: write register AI|49 {fc,fd,ff,ff,fe} Interrupt mask P0

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
Link: https://lore.kernel.org/r/20240620042915.2173-1-ian.ray@gehealthcare.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-pca953x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 00ffa168e4056..f2f40393e3695 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -758,6 +758,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	int level;
 
 	if (chip->driver_data & PCA_PCAL) {
+		guard(mutex)(&chip->i2c_lock);
+
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
-- 
2.43.0


