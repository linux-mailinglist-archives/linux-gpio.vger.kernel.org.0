Return-Path: <linux-gpio+bounces-19924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D41AB3414
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 11:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF2773B6876
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 09:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4B425EF8D;
	Mon, 12 May 2025 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="RWps8doe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6E78C91;
	Mon, 12 May 2025 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043722; cv=none; b=u6wONzgqF9xrgZxTrJWSI6kAzkBhRa+O68xHG55lHgA8Xakr/3rG0DVwWwpVlSqIJtGPDW5EvRn63baYoHjvs6gKRXYBmx1yZxX+nLDb2uSRo8mwmA0+vsGxHNVdx7WI/wTwW6e88VciJ9u9tyZMOxggdYsYTMYq3ZC/qbP5oPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043722; c=relaxed/simple;
	bh=lFDSoNC0sMKrrqiFBKoJHQ0fiMqxBkLQFGxP2ENyndY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gmzg/Z7N+MWEzdfgrLwRH7M80Ne+VGHmG8mQ9vMSfq146ECy03u6SZdBa6R2Gcds3/U8wbj/Uu01JGjQmxAuP/Fdph2VNhGnIBWCOgSbVa+2ShCXLyfv7PDIPweHGJJMeeJYjhoBjS8Wwin71WGlRZlrOaPZ5B7AXhY1gVvMjew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=RWps8doe; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 459EA1F93F;
	Mon, 12 May 2025 11:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747043708;
	bh=IJBW41hRfmWiDm9qdKYT5jwbJNvX98RAdJkHKkuV7Ok=; h=From:To:Subject;
	b=RWps8doerMmsbQxK0uOsscLdBNkOlJqPFCRRs38CgAP7qcRSbWr82vGK3uw94FJZC
	 77hvtAuq6Fml7Muhylq8sXXQL+Wj+vu4Ohw8JZuzLYUjys2IH/pyJiTeKXuIIKwz6k
	 LQC8Ub3Ovqmr41IoBQ4la83hRkuwkkqJNWxmcZ96XlXWs0fCOZ+oBnsJGx/1gnjgaG
	 +SWy73tQ5SRU8EqV1eIuovR5QpNXVbcsFqQfNOX6gnxcDztBXEcLPXDi2ZdW7bOBIw
	 +JQcCCIncJkEx4De6EQVh2ksX8MajPhoUjRPoPxFGnjsqJRZbJiT2G+Jsrp70sWkwM
	 1oLSawN2ck7tQ==
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] gpio: pca953x: fix IRQ storm on system wake up
Date: Mon, 12 May 2025 11:54:41 +0200
Message-Id: <20250512095441.31645-1-francesco@dolcini.it>
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
"failed reading register" message, until `pca953x_resume()` is eventually
called, which restores the driver context and enables access to
registers.

Fix by disabling the IRQ line before entering suspend mode, and
re-enabling it after the driver context is restored in `pca953x_resume()`.

An IRQ can be disabled with disable_irq() and still wake the system as
long as the IRQ has wake enabled, so the wake-up functionality is
preserved.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Cc: stable@vger.kernel.org
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2 -> v3
 - add r-b Andy, t-b Geert
 - fixed commit message

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


