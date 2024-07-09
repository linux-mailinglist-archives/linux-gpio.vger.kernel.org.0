Return-Path: <linux-gpio+bounces-8145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5D92C178
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F686B21ABF
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2271B79D8;
	Tue,  9 Jul 2024 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6lzpP1R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D05F1B79CD;
	Tue,  9 Jul 2024 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542457; cv=none; b=cQIa2HUVfA2Fnv3uPdXGh7mZ0oxcXRy8NQ25fnOhyBkYOLihwx2ucE1yjUVve6vynvEcuiuo1BsjNH/p4wThZvR1zy7GlVLl+BbJq8XtL+YadVfyxBj1+5gnG+OANHo49dPqsYWivZv/KUKdw969kymP2WcL1IbDYaYCJfIhLts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542457; c=relaxed/simple;
	bh=4G8wuWb4Y8pS+ys/8Jvbl1C8xCNnuhIdKwc9u4vNSqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSk/4BdluC0YmGSegLZgzGzRp+GpwE3XN6+xvhvhCOaK8aLacl1nEwvl/dALnzXspu9ZvVq/yHCbd9ZTKy/30wTgIXQCHVfGn02MVLmD5ke5QMTzFgAIciqpE8qdz9rb1ZwtIa3+QUXFacrwsjRh+PCt0NFW8suKrQ2nsdq4Ztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6lzpP1R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F948C3277B;
	Tue,  9 Jul 2024 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542457;
	bh=4G8wuWb4Y8pS+ys/8Jvbl1C8xCNnuhIdKwc9u4vNSqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W6lzpP1RV/eb7eaHm0BJQaoVtCHy1XLcD/giqeBFwJCIN8iYLy6zhpVjEiMx9B2eC
	 vX+TKF0MV8//5lE0zr/tpnWrx6yYaclYIclgegBFKnbqhtKiHwBwVragbFm1043qPQ
	 aZPyDcRikypoLuaAy8/oIS0cltx3sGtQxfov8TnhNL1m0hPf0LWmZMX/O5pJfFQhzy
	 cmx2oBHuGzPbK5CoJwrCSXsHmJrHUozIjiZv8zL1CF/O6tF715eGm3NaeCGfp3r51C
	 H5jwAF/T8FdyPT9GS+h9ZewBNwmP5a7n7+Xsio45fB956QnJ777X6LdWYd4iD29RKO
	 c59fz/y4orBfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/7] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Date: Tue,  9 Jul 2024 12:27:15 -0400
Message-ID: <20240709162726.33610-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162726.33610-1-sashal@kernel.org>
References: <20240709162726.33610-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.317
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
index dc4088a47ab2d..5dcc31e5fb3eb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -489,6 +489,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	u8 invert_irq_mask[MAX_BANK];
 
 	if (chip->driver_data & PCA_PCAL) {
+		guard(mutex)(&chip->i2c_lock);
+
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
-- 
2.43.0


