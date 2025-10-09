Return-Path: <linux-gpio+bounces-26947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E976BCA131
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 18:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5BC418988AB
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 16:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8662F1FEA;
	Thu,  9 Oct 2025 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdzeUlOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD521B918;
	Thu,  9 Oct 2025 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025667; cv=none; b=cgwL5U/ndtDNQxNC3JDR3pX2gJO1rdbdXL6ePfnUz18uHtBNDxmcc4VSGRMQZyQoZ79zS2CQX+mtn3jkubXZnfV06OftWusCDUxRsE3kz4SmFOnu3X8C9ogBKf/bVnRI6hjXDrcYVn//PAJeQ9JxoaUWpVaWNyYv1P9bcXrWflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025667; c=relaxed/simple;
	bh=UB2GnfsiFBHW8JzrRjiWAxrH6N4Rdt3aRZPnBT47xlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shkjgklJt1gI/D25HCCKo4UsQ0iW6sarGHjT5zcC61sacZZ/sA2nFvidI+9Kd3NxZ3TXoDOrERY2kbfj7pnw0zQ7uH85N6SqmWu8gvDrydxaDdNDDU9oT9bHXJW3VlHwduVS/qovQDyjJ50k6E6rqFCyJtzDfKTg9QhgCIZ+GA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdzeUlOE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418DDC4CEE7;
	Thu,  9 Oct 2025 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025667;
	bh=UB2GnfsiFBHW8JzrRjiWAxrH6N4Rdt3aRZPnBT47xlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdzeUlOE+ai49HxJ5WhpEiJtOYcnrlK10ntJ7w5RyCPpkXUFGVKyOXTPKT3bBc0WG
	 SD07PDF0CzypeYnLWLScu03N9wOezBmAyVgMjMwyPCgwM78ENbbBmNQLPl+ygrvAx5
	 1h9jkIjXa64+O11WF7J3qBvyznlSC4ni7DnjyiYK2Pk7CD4OPkT0dHmgZpgIQiaQUH
	 paIvjF5TUu2dZ0TXzdSHLbHVgSAMy3V+TEpFuOZKx1ZpUpkfjt4aVewSvhBSfEZ19v
	 m3KsLm5eJ8bv8pKgwvzrA85o1ctockgH0JQu5yNnyKp842cQYdEAOuvCRJv2lJvte3
	 Qn5tH8F0z8C/g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	cy_huang@richtek.com,
	wangweidong.a@awinic.com,
	nick.li@foursemi.com,
	rf@opensource.cirrus.com,
	alexey.klimov@linaro.org,
	niranjan.hy@ti.com,
	shenghao-ding@ti.com,
	linux@treblig.org,
	nuno.sa@analog.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] mfd: si476x: Add GPIOLIB_LEGACY dependency
Date: Thu,  9 Oct 2025 11:56:08 -0400
Message-ID: <20251009155752.773732-102-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit e399d779c9acf277488c5b306b71dcbc71e160ca ]

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
Link: https://lore.kernel.org/r/20250808151822.536879-14-arnd@kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Prevents a reproducible build failure when the legacy GPIO number-
    based API is disabled. The si476x MFD core calls legacy helpers such
    as `gpio_is_valid()` and `gpio_set_value_cansleep()` in
    `drivers/mfd/si476x-i2c.c:133` and `drivers/mfd/si476x-i2c.c:200`,
    which come from `linux/gpio.h` and are only provided when
    `CONFIG_GPIOLIB_LEGACY` is enabled. With legacy interfaces fenced
    off, the build hits an implicit declaration error as reported by
    kbuild test robot.

- Why it’s needed in stable
  - The GPIO subsystem recently made legacy interfaces optional/fenced
    off, which exposed drivers still using global GPIO numbers. This
    patch is part of that follow-up hardening: it gates the si476x core
    on `GPIOLIB_LEGACY`, avoiding invalid build combinations. It is a
    pure Kconfig fix with no runtime behavior change, directly
    addressing a regression introduced by the gpiolib changes and thus a
    textbook stable backport candidate for trees that have those gpiolib
    changes.

- Scope and risk
  - Small, contained Kconfig-only change; no functional code altered.
  - No architectural changes; only dependency tightening to avoid broken
    builds.
  - No known security implications.
  - Very low regression risk: there are no in-tree users of this driver,
    and the change merely prevents selecting an invalid configuration.

- Code references
  - Legacy GPIO API use causing the build error:
    - `drivers/mfd/si476x-i2c.c:133`
    - `drivers/mfd/si476x-i2c.c:200`
  - Legacy GPIO API is only provided under `CONFIG_GPIOLIB_LEGACY`:
    - `include/linux/gpio.h:1`
  - Kconfig dependency added to ensure the MFD core only builds when
    legacy GPIO is available:
    - `drivers/mfd/Kconfig:1443` adds `depends on GPIOLIB_LEGACY` to
      `MFD_SI476X_CORE`
  - Kconfig tightening to avoid building the codec without the MFD core
    (and by extension, without legacy GPIO):
    - `sound/soc/codecs/Kconfig:1945` adds `depends on MFD_SI476X_CORE`
      to `SND_SOC_SI476X`

- Stable backport guidance
  - Apply to stable series that include the GPIO changes making legacy
    interfaces optional/fenced (e.g., the 6.17 cycle and derivatives).
    It is not needed for older stable trees where legacy GPIO interfaces
    were always available (or where `GPIOLIB_LEGACY` is not
    present/always-on).

 drivers/mfd/Kconfig      | 1 +
 sound/soc/codecs/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 425c5fba6cb1e..6d52a3d22430f 100644
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
index 6d7e4725d89cd..dfe907c62604c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1902,6 +1902,7 @@ config SND_SOC_SGTL5000
 
 config SND_SOC_SI476X
 	tristate
+	depends on MFD_SI476X_CORE
 
 config SND_SOC_SIGMADSP
 	tristate
-- 
2.51.0


