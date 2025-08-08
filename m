Return-Path: <linux-gpio+bounces-24099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE36B1EBD4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534843AD9B6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154C1285C9D;
	Fri,  8 Aug 2025 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1o2Rd1n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7573285C91;
	Fri,  8 Aug 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666729; cv=none; b=A/6DYsnsVVsyuIEXxCWkarFAyEHSsmyewxitVtq3a0v2uFNLYbY+asQZJFIQIWpxeoJfzZwYxqEMyHak6FdIjXRBfuds9CEuVvVxFM9sxXyjSDzJJkcxOjuUaqWKBepeP3+mkOU72RbHGeTq7ls9VReslUWQrbQ2ORovyHxl9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666729; c=relaxed/simple;
	bh=ql43Pm5ZVVpFZkt/lmAyISGZXPuox8rw7R6mqwFTem0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qqNKYZHPIiKByXeF+LPTq9pekfEP7cAoDN6t/EoKK4ubGDuHonSTJJPPB0xiVMEdubuBJziWTpfgYftUpJFOoeNuKbxY/zDT/vapnqL2XKlpe1SbUeeKuWgX3SVAN0aZc30y+w3zDIQC/aooeHrm/wfKGAOHeMEEv+TLK10PGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1o2Rd1n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C25C4CEED;
	Fri,  8 Aug 2025 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666729;
	bh=ql43Pm5ZVVpFZkt/lmAyISGZXPuox8rw7R6mqwFTem0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1o2Rd1nJHSRYFCzylvP+3x9U8gc1HC0fXIU0YsQVx7xGvfqmXhr0IuqJsRnpv0Tk
	 nRHkvuOOLCFr8tAX2twv/foDjaDtd5bB3P62pK8RanglCpRoAF3UhTbPGsDquJjVsM
	 YnhVgSXaPTaY7/NrDnIo9XaYFyC3+e+N+gElNMZin1iMb3Baoweh+Ekj1fYoF7TZwr
	 M6qYj8IFllGuc/2eFH3faF/K84LpxFhw4YCNb7Us3cKHIOgqBJ7urKJdf1CJulU6aO
	 YNKq6Fvb4njTbSm7YegOPQmoYDAtj1OpwXd4NDQL0TQf2UrAcffq2kN8kCH1HWJYiV
	 8szml0eaARUgw==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/21] ASoC: pxa: add GPIOLIB_LEGACY dependency
Date: Fri,  8 Aug 2025 17:18:05 +0200
Message-Id: <20250808151822.536879-21-arnd@kernel.org>
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
---
 sound/soc/pxa/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index e026f9912a6d..e54abcd39f79 100644
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
2.39.5


