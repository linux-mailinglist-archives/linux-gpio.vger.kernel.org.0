Return-Path: <linux-gpio+bounces-27606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F3C094CF
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 18:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B33E04F65B6
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 16:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EF830499B;
	Sat, 25 Oct 2025 16:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijYrzgNR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52190304BB2;
	Sat, 25 Oct 2025 16:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408791; cv=none; b=WDKOgbTZ8InF2rhHfrrcv3tD9+oNU5//mOmFglQpIGX/FqHoDaS75Hjq0cw+UpsPKIS2a8eDTm/7yfcDqwXalojVYCcMZ6eUysFaeqyj5qbB7G3yfkQ59QoMix8qnctKKKElNmhZjGnM+SUer/TQrZFbLExBW2M9olD8B/Qjtw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408791; c=relaxed/simple;
	bh=SA476cL1oEZtSTZZYfW7hLhLpWqlSXC+EvyocnZrNYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RYZTUjR+0Y03pDNxv9gvQXoLYGfN4som0ha85gx5y/uTsolaUQRTLIRv7L5ja6hUb8CCvL+xJVsL0lBIsqQwVnckdghRQPk/FfIrCVXzqmKVT4OqdpQTvG9Rh20dJ324UMN1sArEYjtKGIcjA1Mnqwh+ut0ya42Np60sz5zQNA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijYrzgNR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBAFC116B1;
	Sat, 25 Oct 2025 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408791;
	bh=SA476cL1oEZtSTZZYfW7hLhLpWqlSXC+EvyocnZrNYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijYrzgNRkubHCKFEYph6jwXWzRMYkcIltW6h7moCuN0O59YPq1nNP+GOs2QSPrlw5
	 XS2HewEbWEaFY+dIiE7whZo3LgIaJ5Q4GhVmqJG9tTX3dBIvqH2Pcu1NkSarVKPQ34
	 C+pDRHteB25EF0+N2yFTcm7rehKgJwC4j+BT6MAS4L/akMXUkxdxv29XtrbvU5PGzd
	 RhFtYBNFuychcwRt0Msrc+hC5tN51+Ha0IfVyvDO5dWRNueH9b/4T8asRndLS9QEuj
	 KgQCV53OFHUW/xc6eUNdXNvZoi1ggSYZZ+4KTyoukUpIUyr5Ejsr4K57sVDoRaGKKK
	 NOQlyAcqKg7Kg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] ASoC: pxa: add GPIOLIB_LEGACY dependency
Date: Sat, 25 Oct 2025 11:55:02 -0400
Message-ID: <20251025160905.3857885-71-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 2d86d2585ab929a143d1e6f8963da1499e33bf13 ]

The pxa27x platform uses the legacy gpiolib interfaces, including
in its sound drivers:

sound/arm/pxa2xx-ac97-lib.c: In function 'pxa2xx_ac97_hw_probe':
sound/arm/pxa2xx-ac97-lib.c:374:23: error: implicit declaration of function 'gpio_request_one' [-Wimplicit-function-declaration]
  374 |                 ret = gpio_request_one(reset_gpio, GPIOF_OUT_INIT_HIGH,

Make sure we don't select those drivers for compile-testing unless
we are building for a pxa27x system, or CONFIG_GPIOLIB_LEGACY is
already enabled.

The SND_PXA_SOC_SSP driver accidentally used a dependency on PLAT_PXA,
which includes both ARCH_PXA and ARCH_MMP, but it is only used on
the former.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://patch.msgid.link/20250808151822.536879-21-arnd@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Rationale
- Fixes a real build failure during COMPILE_TEST when legacy GPIO APIs
  are disabled. The failure stems from `gpio_request_one()` in the PXA
  AC97 support code: `sound/arm/pxa2xx-ac97-lib.c:374` uses legacy GPIO
  (gpio_request_one/`GPIOF_OUT_INIT_HIGH`). When `GPIOLIB_LEGACY` is not
  enabled, these legacy interfaces are not available, leading to the
  implicit declaration error cited in the commit message.
- Targeted Kconfig gating avoids the bad configuration instead of
  changing runtime code:
  - `sound/soc/pxa/Kconfig:2` changes `SND_PXA2XX_SOC` from `depends on
    ARCH_PXA || COMPILE_TEST` to `depends on ARCH_PXA || (COMPILE_TEST
    && GPIOLIB_LEGACY)`. This ensures the PXA SoC audio stack (which
    selects `SND_PXA2XX_LIB_AC97` and builds `pxa2xx-ac97-lib.c`) is not
    compile-tested unless legacy GPIO support is present, eliminating
    the build break.
  - `sound/soc/pxa/Kconfig:27` changes `SND_PXA_SOC_SSP` from `depends
    on PLAT_PXA` to `depends on ARCH_PXA`. `PLAT_PXA` is selected by
    both PXA and MMP (`drivers/soc/pxa/Kconfig:2`, selected in
    `arch/arm/mach-pxa/Kconfig:13` and `arch/arm/mach-mmp/Kconfig:8`),
    which caused the PXA-specific SSP DAI driver (`sound/soc/pxa/pxa-
    ssp.c` includes `<linux/pxa2xx_ssp.h>`) to be selectable on MMP
    inadvertently. Tightening to `ARCH_PXA` corrects that misdependency.

Why this suits stable
- Small, contained Kconfig-only change; no runtime behavior or ABI
  change.
- Fixes a concrete build error affecting users of `COMPILE_TEST`
  configurations without `GPIOLIB_LEGACY`.
- Reduces accidental driver enablement on the wrong SoC family (MMP) by
  replacing `PLAT_PXA` with `ARCH_PXA` for `SND_PXA_SOC_SSP`.
- Minimal regression risk: only affects visibility of options under
  specific Kconfig combinations. It does not introduce new features or
  architectural changes.

Notes on applicability
- This backport is most relevant to stable series that already have the
  `GPIOLIB_LEGACY` split. Older stable trees that predate
  `GPIOLIB_LEGACY` either won’t need this change (no build break) or may
  require adjusting the dependency accordingly.

 sound/soc/pxa/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index e026f9912a6d1..e54abcd39f792 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -3,7 +3,7 @@ menu "PXA"
 
 config SND_PXA2XX_SOC
 	tristate "SoC Audio for the Intel PXA2xx chip"
-	depends on ARCH_PXA || COMPILE_TEST
+	depends on ARCH_PXA || (COMPILE_TEST && GPIOLIB_LEGACY)
 	select SND_PXA2XX_LIB
 	help
 	  Say Y or M if you want to add support for codecs attached to
@@ -26,7 +26,7 @@ config SND_PXA2XX_SOC_I2S
 
 config SND_PXA_SOC_SSP
 	tristate "Soc Audio via PXA2xx/PXA3xx SSP ports"
-	depends on PLAT_PXA
+	depends on ARCH_PXA
 	select PXA_SSP
 	select SND_PXA2XX_LIB
 
-- 
2.51.0


