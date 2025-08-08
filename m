Return-Path: <linux-gpio+bounces-24087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1910B1EBA7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6ADE44E49AA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E174285C86;
	Fri,  8 Aug 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwOAX1qu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969E2857E6;
	Fri,  8 Aug 2025 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666492; cv=none; b=u+zifwoHkPBNIyoKmApwzwrXneJKbyMXpvl45HRfdcc/HbNP1oCU1m7xPy5nvU/EaVC9OtQCqmUyu26OGbt6kdIVd32AcxlKtjlBkmRcxw+ZBrolcd0KmCRIvkVmVlbHKt4/DiRj8C+/kWifrKwhEBwIEpPHwShpg00TLy1of4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666492; c=relaxed/simple;
	bh=ThCgznpMMMWkgStDQHqjK9eBTfpDlqOS3nFKQ6zpP9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nFlMXpDxJKTR7JMDM9FDXsO0pOKFUR9F3Vm6K4JX3ZDB9zuelRF9WqXHerFKOwBnEtbAWlr8Z24UdrAnevFv42tCvX1NHOq2gn9y69jOiEbwBf9LDyYQ6a2Dh05Sd7FbkTXTVK+5uvoS/9CrNXkA78v1+PdZcABUM/B+tSF6FHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwOAX1qu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A17C19424;
	Fri,  8 Aug 2025 15:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666491;
	bh=ThCgznpMMMWkgStDQHqjK9eBTfpDlqOS3nFKQ6zpP9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KwOAX1qun9Vd1ACuNwj+0LT1IooLgenAvOLnlVpMJ7sB4PxvkfV33jlAWyP7x7Cib
	 4PRR1OkmAU9vytka5CZ4qzkB/0kzEzi2iL+LfWqJ/AtVfoQn5gz+ScFXQP+QT1brAt
	 OIFUpXJ6RkA6/xOZ8vBa6r9GLV7Mn7kh2BdlmpI2S2n4JVCvvaLCJhELywMHxxtQ1J
	 jdK+UTQ2ckOsJaVTcwxlfZeuE0hthmh4bcVgQgPZ9tf1rZz6+nHMlv9b4uVaIqQlu9
	 wHiIQPXlPAcpU1/VY+pLlpBBi4kEnZhVrfTPzoxB0Rzg89a6+xTVvq0gC/fOwcXmFX
	 R5HF6GjXlG5kA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Jack Yu <jack.yu@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Nuno Sa <nuno.sa@analog.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/21] ASoC: add GPIOLIB_LEGACY dependency where needed
Date: Fri,  8 Aug 2025 17:17:52 +0200
Message-Id: <20250808151822.536879-9-arnd@kernel.org>
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

In order to make the legacy gpiolib interfaces such as gpio_request()
optional, mark the three ASoC driver that rely on it today with a
dependency on the new Kconfig symbol.

The tlv320dac33 and ak4641 drivers have no in-tree users, while the
uda1380 driver is theoretically referened by two lpc3250 based boards,
but neither of them work because of the legacy gpiolib dependency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6d7e4725d89c..759bcb8260cd 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -622,6 +622,7 @@ config SND_SOC_AK4619
 config SND_SOC_AK4641
 	tristate
 	depends on I2C
+	depends on GPIOLIB_LEGACY
 
 config SND_SOC_AK4642
 	tristate "AKM AK4642 CODEC"
@@ -2175,6 +2176,7 @@ config SND_SOC_TLV320AIC3X_SPI
 config SND_SOC_TLV320DAC33
 	tristate
 	depends on I2C
+	depends on GPIOLIB_LEGACY
 
 config SND_SOC_TLV320ADCX140
 	tristate "Texas Instruments TLV320ADCX140 CODEC family"
@@ -2229,6 +2231,7 @@ config SND_SOC_UDA1342
 config SND_SOC_UDA1380
 	tristate
 	depends on I2C
+	depends on GPIOLIB_LEGACY
 
 config SND_SOC_WCD_CLASSH
 	tristate
-- 
2.39.5


