Return-Path: <linux-gpio+bounces-8143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B992C0B4
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7831F242E4
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E895B21C179;
	Tue,  9 Jul 2024 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzapsQQG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D721C171;
	Tue,  9 Jul 2024 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542269; cv=none; b=F+roOAcrMqZcvECi6hIV3TXwX1wrqOkFOeeP+sRzs1EKVy9oVZZunB1rOJ0ogpEEjAoqX5w2Z4FDBZLmcZwSJ+6zX8BXTpqWungJv9iGIIops9nrDUAhNZhYzdoS8wm8wf4PgGdnk+ao4QpBTmjb8COltIeW5tJd/5TJqOZ/Ars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542269; c=relaxed/simple;
	bh=ad6y0JTKexjgukxVDwwsXe+6KKDdJC2SLtCwpJLlX6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjLD6NhPabqqh9niTHSQwYCJhky3hkUdEF81ih8JEfzojc02jo4koEFqezPtB2QltfK79w//UWjyT7gFRfPLHWUTA9ZKtOimMibW1F2/78LQIyz2n5MOxOCExyfRtBmRZ+M0+hM6bNCeaEEOmQwGIFN1sif4/BNkeC2SZbxqTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzapsQQG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574E5C32782;
	Tue,  9 Jul 2024 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542269;
	bh=ad6y0JTKexjgukxVDwwsXe+6KKDdJC2SLtCwpJLlX6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzapsQQG0AQof4ujscGMtwckCVw7041i00h/EYFkcwlxDPa2D/SXzYAEEFMkgmkZj
	 dKMyDU/H+jlR/JK1VK+a7bs9Pl+WNqztvcxvnN/pCUrW1p0q6QQgC/gEQSF9s5n5NV
	 rI8TfJa6owHWlMaqLTVjGBZSuZbdj59QMrt7kIG+C9dIok+dWV5BJiYwlUsyodKJPw
	 5Zq96TyFjivZEn5y0fZT+ZN4NQFFG55mw81dvvJLUD/erS15U4c/TbKzz0/p/1Sn0C
	 WGpVEV5iVwTUdNqsLZBu+ZdXDLF21FOXUn+2mWtXskjxO95+t1BCddCmCU1BOW0vQG
	 Md0crwKladWXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 13/27] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Date: Tue,  9 Jul 2024 12:23:27 -0400
Message-ID: <20240709162401.31946-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162401.31946-1-sashal@kernel.org>
References: <20240709162401.31946-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.97
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
index bf21803a00363..9ce54bf2030d7 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -768,6 +768,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	int level;
 
 	if (chip->driver_data & PCA_PCAL) {
+		guard(mutex)(&chip->i2c_lock);
+
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
-- 
2.43.0


