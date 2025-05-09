Return-Path: <linux-gpio+bounces-19865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BF4AB172E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 16:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29ED5A082B6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 14:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91A32135DD;
	Fri,  9 May 2025 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="hewAkBeu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA50A1E5B82;
	Fri,  9 May 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800328; cv=none; b=f7DqV+bgijkh/7+8KDUQMmbPRANVU5SlRGLbLFHxewFO0b+kIziIaGoQU5ySoiE4DIFOUhhFnzkG63PT+zeCI4d9P9otC2o2zdcQhAK0Auar1B0noa+CvZQnkh1OWFREB7FlGD9RL52qzyh5gHrLsuY25H7UOIupPEdwka9Bg+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800328; c=relaxed/simple;
	bh=K/Qfs3+JXPjQFxdXIhUR3acZ/8Eb5wwetSO8CwTUPJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vAaY+lJP23CXoEfjSklucd8o11c5s4BUCfo/DHB0kv8nFjsyrdWDW1iCCB3XL98HtAOSjBu7VtbtyuxjPzszxypFy2Cq6QNBKRh3FnePzmnzpxGMHgb+sidooEhdn2s/ADdmrndfXxZopB9HzgyKAP+gAqlVBy1bs7mIwTRap7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=hewAkBeu; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7250722206;
	Fri,  9 May 2025 16:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746800324;
	bh=WiABciZh5JeYfdXWgF7so0KTIPIEJer4ove2V2q8QQI=; h=From:To:Subject;
	b=hewAkBeuJ/GBJorEuaZV7kTk3/dGRf/27fx6mM11wyI2t4CFdRNLQEUNE2k2tOCHv
	 fhZDttEFj04i1OHoJ5pOgUM/m2gwn8+iwuXQGvMqqfxbH6k/FWcenBg4khGwpduwBI
	 ozCGUv+EPGklAZWX3gDsEkL1Gj4vQqdeFgV8WMIURJ8BEKGcT/jTd1tyqAp7Zcx1gx
	 6ld1+xt0Tz+xNCnPfkwklyEWevf7wVvObsbsSK6KJF+0KP7xr85JPeNRqDIbSJmaY0
	 9fNuzPQRoopUviExzdX3Y8uExJafjosb1JmnGL5JUzT2yKRxjAyGK2U6vjLLWu4I3+
	 PG4VJFXCcgtxA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Marek Vasut <marek.vasut@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2] gpio: pca953x: fix IRQ storm on system wake up
Date: Fri,  9 May 2025 16:18:28 +0200
Message-Id: <20250509141828.57851-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

If an input changes state during wake-up and is used as an interrupt
source, the IRQ handler reads the volatile input register to clear the
interrupt mask and deassert the IRQ line. However, the IRQ handler is
triggered before access to the register is granted, causing the read
operation to fail.

As a result, the IRQ handler enters a loop, repeatedly printing the
"failed reading register" message, until `pca953x_resume` is eventually
called, which restores the driver context and enables access to
registers.

Fix by disabling the IRQ line before entering suspend mode, and
re-enabling it after the driver context is restored in `pca953x_resume`.

An irq can be disabled with disable_irq() and still wake the system as
long as the irq has wake enabled, so the wake-up functionality is
preserved.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Cc: stable@vger.kernel.org
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v1 -> v2
 - Instead of calling PM ops with disabled interrupts, just disable the
   irq while going in suspend and re-enable it after restoring the
   context in resume function.
---
 drivers/gpio/gpio-pca953x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index ab2c0fd428fb..b852e4997629 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1226,6 +1226,8 @@ static int pca953x_restore_context(struct pca953x_chip *chip)
 
 	guard(mutex)(&chip->i2c_lock);
 
+	if (chip->client->irq > 0)
+		enable_irq(chip->client->irq);
 	regcache_cache_only(chip->regmap, false);
 	regcache_mark_dirty(chip->regmap);
 	ret = pca953x_regcache_sync(chip);
@@ -1238,6 +1240,10 @@ static int pca953x_restore_context(struct pca953x_chip *chip)
 static void pca953x_save_context(struct pca953x_chip *chip)
 {
 	guard(mutex)(&chip->i2c_lock);
+
+	/* Disable IRQ to prevent early triggering while regmap "cache only" is on */
+	if (chip->client->irq > 0)
+		disable_irq(chip->client->irq);
 	regcache_cache_only(chip->regmap, true);
 }
 
-- 
2.39.5


