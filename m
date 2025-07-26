Return-Path: <linux-gpio+bounces-23843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419EB12C90
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 23:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89583AECC6
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 21:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281A2244668;
	Sat, 26 Jul 2025 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvZDLUzT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0521A44C;
	Sat, 26 Jul 2025 21:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753564259; cv=none; b=dUhOKm4YEH6R2O7dDZs+3k39YqtAkTgCLRV85MBLrpyxWOru/egAeLIsX87gc3HsHMAy3OY6dlf2jFs5xEf3EbHgmDcPmg25l93L9gUW7toIKZG6uh+EiMUlsert38bunikl4Tji4Mwx3QmUUHmpNVe3mCuqOAACvtgehS0dtT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753564259; c=relaxed/simple;
	bh=2u3S4e4rv5paFn9+5Na5ep0eYJteuUVXRknfB/8/yto=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bfXVPHyksDNhN/f1wj/1p2v3RTTd+KqpaiMMqLvRV5vGW700uh2PIN9Uh8A97jCy6CSBqCb2xKBCR5jB1sHXDNFZG6BC/dTNU5LlV3+lW5EPiq6PZwCFHawrqDORq4LHVSGyUXJkVeogq1SObnx+5LW75xljQUNk3mQtbOJlMQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvZDLUzT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA48C4CEED;
	Sat, 26 Jul 2025 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753564259;
	bh=2u3S4e4rv5paFn9+5Na5ep0eYJteuUVXRknfB/8/yto=;
	h=From:To:Cc:Subject:Date:From;
	b=XvZDLUzTK6neBEqoL89w2V4qlUkmRfkzqs/Axl3PsuqDSlwetzA4RBBh6VY1hFLeo
	 eidyk2DDW9u80+Bjq2L5kObXlF1S8U9Gb4I8YvySHcGGQmHmZEiqbi4S/byZCBy/Ng
	 +TxRCLK1ws37vfbvWrMmoQrAEDcndL+zalReyg68txQjiPV9nVvZs48AkeWkSYVylp
	 YL1svlG/NlYkagOs2gtlR7QKBygE9kZuyDYet929VwDI+TF+iCo1Oyi5ZRMHL3n4TT
	 8Sk6jmwn1JqjzIdJ8/W/SmT6ZnVSk7f1dkfG0VZmpWlFRxwIvFxJblHT3JATxK6aS9
	 AJg9IhfCoV2fQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
	Peng Fan <peng.fan@nxp.com>,
	Koichiro Den <koichiro.den@canonical.com>,
	Lee Jones <lee@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Yixun Lan <dlan@gentoo.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
Date: Sat, 26 Jul 2025 23:10:43 +0200
Message-Id: <20250726211053.2226857-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A few drivers that use the legacy GPIOLIB interfaces can be enabled
even when GPIOLIB is disabled entirely. With my previous patch this
now causes build failures like:

   drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
        drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]

These did not show up in my randconfig tests because randconfig almost
always has GPIOLIB selected by some other driver, and I did most
of the testing with follow-up patches that address the failures
properly.

Move the symbol outside of the 'if CONFIG_GPIOLIB' block for the moment
to avoid the build failures. It can be moved back and turned off by
default once all the driver specific changes are merged.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507261934.yIHeUuEQ-lkp@intel.com/
Fixes: 678bae2eaa81 ("gpiolib: make legacy interfaces optional")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8bda3c9d47b4..c48f9badb513 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -12,11 +12,11 @@ menuconfig GPIOLIB
 
 	  If unsure, say N.
 
-if GPIOLIB
-
 config GPIOLIB_LEGACY
 	def_bool y
 
+if GPIOLIB
+
 config GPIOLIB_FASTPATH_LIMIT
 	int "Maximum number of GPIOs for fast path"
 	range 32 512
-- 
2.39.5


