Return-Path: <linux-gpio+bounces-24092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCDFB1EBD2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F705A40FB
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E62284B49;
	Fri,  8 Aug 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLTcRbPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F93B284B33;
	Fri,  8 Aug 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666601; cv=none; b=TZQ9oym1vsFhlisDGLyJkQHUnhYcPoO1c+MbzRFFR8mQMMDrMyRWziQGcTFWojRw4ZBZJWMkJ6HuF78rJilF3b7JwSZ0Z0jjEcaW/WIa7Ynfz5C/MGB6YRXL8AeKyp+JtuMtSkou18tRO9TT2YKN3GFa6wyNVCqC9QW2XFPc5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666601; c=relaxed/simple;
	bh=V4JmB2szthDEq+aKg+Xa7ToR9O5+5pVOjG/0EWTfRoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwUaM9Mi0Lkp/cck+1LQ6UM35wijI+UffNBRBu7fD1Y5PyKrYE0W81wI61bheOCVM8Ayty3RaAuKdhe1OfPeUstvc197PB/GxIl4KLjW9mgQfT1V3td+/r3XiWMFwEU2LvC6Oxlgbyk6plkxUpEiJcB9o6mhwyEQzRfZwPo3L8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLTcRbPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0FCC4CEED;
	Fri,  8 Aug 2025 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666601;
	bh=V4JmB2szthDEq+aKg+Xa7ToR9O5+5pVOjG/0EWTfRoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JLTcRbPF7331ZBxpI4Gi2vwix+7gV/qIKvuu0Dfq0K50q3gsKbWJX52Emvh2GcWsH
	 Y3oV4fC99Sxhyb9l+K8Fvj115XSpSxjcB+lI7bve2yUF4UnbyweYaMKq9mjTkkdFv3
	 r++MoM8BxAa4TZECJWmQ7/aVlKu7UA2VPulozs/zN4nqwWRnA2U6C9kHcIBY624306
	 h8lrrKo9Cc251MyOrEqd0wUQWP0vsLnJeCcP3shYuEpnA8xMbw7d+H63k8RJ/CLEaE
	 Fv1aaRQEbQfDnNStAaoSEJSzTU+teWbAGTrTy/G1YqHQuauSQDy/e7esmTZpa0j4Ek
	 y1fDROLoSs0cQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 13/21] mfd: si476x: add GPIOLIB_LEGACY dependency
Date: Fri,  8 Aug 2025 17:17:57 +0200
Message-Id: <20250808151822.536879-14-arnd@kernel.org>
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

This driver uses the legacy gpiolib interfaces to get gpio
numbers from platform data:

drivers/mfd/si476x-i2c.c: In function 'si476x_core_start':
   drivers/mfd/si476x-i2c.c:133:21: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
     133 |                 if (gpio_is_valid(core->gpio_reset))

There are no in-tree users of this driver, so nothing defines
the platform data.

Add a dependency on GPIOLIB_LEGACY for the moment to avoid the build
failure, and make sure the sound driver does not get built without the
mfd portion either pass that dependency along.

Alternatively, we could remove the mfd driver along with the radio and
sound portions.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507231653.UFlH2dMO-lkp@intel.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mfd/Kconfig      | 1 +
 sound/soc/codecs/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 425c5fba6cb1..6d52a3d22430 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1411,6 +1411,7 @@ config MFD_SEC_I2C
 config MFD_SI476X_CORE
 	tristate "Silicon Laboratories 4761/64/68 AM/FM radio."
 	depends on I2C
+	depends on GPIOLIB_LEGACY
 	select MFD_CORE
 	select REGMAP_I2C
 	help
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 759bcb8260cd..9d5b449fa747 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1903,6 +1903,7 @@ config SND_SOC_SGTL5000
 
 config SND_SOC_SI476X
 	tristate
+	depends on MFD_SI476X_CORE
 
 config SND_SOC_SIGMADSP
 	tristate
-- 
2.39.5


