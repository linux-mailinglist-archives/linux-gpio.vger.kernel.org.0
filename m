Return-Path: <linux-gpio+bounces-24100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F6B1EC14
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB390562871
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E91285C92;
	Fri,  8 Aug 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORwDYNVG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75598284B33;
	Fri,  8 Aug 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666746; cv=none; b=s//zVN3vvLlInJGH4lkcaiph3hHQ0xesF9fnimDAmF19G5srvlW8zrFwbhfw1pp3eBeqst/m+p6L/pVVzglF3vmYvLXDeVL3mcJw3m3GKJltEmaeeVxl4mtN1pjtCl9kRkQBKb0wVJOqEPNX8PG21mGCIziVWdedsmilwgC612Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666746; c=relaxed/simple;
	bh=Q7LJqYntC3C0kPPrvn7+7VaNuFpGlm/sR/DRdUSA6H0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JVGnJVtDi+nB7FERHd0ZzXOIpFwqB1fhylC8E+3o7+Ecba7XYdvvHo7x7TaEhE3EauKqJTzqGMHkv3bW0xOvmknfZlUxAlxmUS0CuPIlDCm6vUr15XSRtmCM/+1vrrRNi4kfe1+dmbVQG3EdlmQkCj3UQbzkyHuL3UX4V0KUR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORwDYNVG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BE3C4CEED;
	Fri,  8 Aug 2025 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666746;
	bh=Q7LJqYntC3C0kPPrvn7+7VaNuFpGlm/sR/DRdUSA6H0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORwDYNVGaH/T0ODn+KGGXIMdkJ0mdcA6ZaPRahTP4I1kcEGH+cJ+g0hybo4niIij5
	 oHAp2+IyZt9aMHwB11WQ+m57WDqT0qZbL+szNmKt2K7cGIrTpB/TMFeOLLBFk+7DUi
	 5EfrZzEYORNmIx7+ZX4Jt/6mWSiw17I2/a8rVWdmboaZMuJTU6TOnTAhu7viNLmxBk
	 fbyIrjY8haWR9vvU9qMZQU76GGp6rwxPwQ7urtTciHLcHieqym9DQlsegTh+WONr99
	 AN4YOVZ8zd9u+wths+Ad8GEsMOpEW9ac1r/8qIbD4lXYMzX16cHw/mmEZL63Ip096H
	 ahnaJWnqipT3Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koichiro Den <koichiro.den@canonical.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/21] gpiolib: turn off legacy interface by default
Date: Fri,  8 Aug 2025 17:18:06 +0200
Message-Id: <20250808151822.536879-22-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
so it can be turned off by default.

Allow turning it on manually for compile testing, in order to keep
the build coverage of the legacy drivers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e43abb322fa6..2b57ba776c13 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -12,10 +12,17 @@ menuconfig GPIOLIB
 
 	  If unsure, say N.
 
+if GPIOLIB
+
 config GPIOLIB_LEGACY
-	def_bool y
+	bool "Legacy GPIO interfaces" if COMPILE_TEST
+	help
+	  There are a few legacy platforms that use the traditional GPIO
+	  number based interfaces instead of GPIO descriptors.
+	  Say Y here to enable build testing drivers that are specific
+	  to those platforms.
 
-if GPIOLIB
+	  If unsure, say N.
 
 config GPIOLIB_FASTPATH_LIMIT
 	int "Maximum number of GPIOs for fast path"
-- 
2.39.5


