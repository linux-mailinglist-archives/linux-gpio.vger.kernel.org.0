Return-Path: <linux-gpio+bounces-13458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAF9E2740
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 17:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD238289801
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 16:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2CC1F8937;
	Tue,  3 Dec 2024 16:23:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD211F891F
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243007; cv=none; b=Ht+9z+bnfDwQWHj/ifCia6tvo+jO7PGRXsKGWIhgJJDrfVEn9RG1homNbGh3QZgnUriLA1szYtL+mL4RtLgPI/wAfhjyn4GReCiZTqMElND6RBIEXT8BG2jjbFcTmsCgUcwXNk2HtH+Taf2i339/G116zAY3su450uvpdyjFeDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243007; c=relaxed/simple;
	bh=ZqyW0L1EB/orMfWSWzepZrl4Pr+Mrz+PY7OowGt515U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K044y4Eyu6c2nyWpdLOgQgqCPo7DHhAX4K/51AmcJBujtQ0xTkDxrP5N/XopnWmJ/rIeXqZnEMXHgzNkFRtnyYDc58OsOjEAYeR0cE0NPAg7guzhwfyYPkXhEH4zf8DjlWD8/49/R5zfoxc+wwVt7rarNZKvy+LymnZ7qGLckCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by laurent.telenet-ops.be with cmsmtp
	id kGPJ2D00L3sLyzB01GPJFm; Tue, 03 Dec 2024 17:23:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVgE-000DSa-NC;
	Tue, 03 Dec 2024 17:23:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVgE-00AOqD-K5;
	Tue, 03 Dec 2024 17:23:18 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
Date: Tue,  3 Dec 2024 17:23:16 +0100
Message-Id: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merely enabling compile-testing should not enable additional
functionality.

Fixes: 956ee0c5c969c9ca ("gpio: mvebu: allow building the module with COMPILE_TEST=y")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f483201637062cab..d371ce2578ee9703 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -491,8 +491,9 @@ config GPIO_MT7621
 	  Say yes here to support the Mediatek MT7621 SoC GPIO device.
 
 config GPIO_MVEBU
-	def_bool y
+	bool "Marvell Orion and EBU GPIO support" if COMPILE_TEST
 	depends on PLAT_ORION || ARCH_MVEBU || COMPILE_TEST
+	default PLAT_ORION || ARCH_MVEBU
 	select GENERIC_IRQ_CHIP
 	select REGMAP_MMIO
 
-- 
2.34.1


