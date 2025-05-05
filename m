Return-Path: <linux-gpio+bounces-19613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44EAAA19D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 00:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253861883E82
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 22:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A8B27F4F7;
	Mon,  5 May 2025 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXuDSdWh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4346B2BFC72;
	Mon,  5 May 2025 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483602; cv=none; b=ppTirX6tu7qUe0W6D7fEUgwRR+Fy1i/iFitP/eBrI2CiHG/NQ/Gwt0WnplqBeRS310g7N1cYsYCYH4jwf7x5fQxWKdk1L9UBh2KEF29hjYPMJ+SheU1q043FnffO8Rx6C8U+qzC5sWb83SHqW9qip6lfazqcnDFCKkogxsFi/ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483602; c=relaxed/simple;
	bh=ND8ed1luOqfEIsbMxce0N4FcAEg4PUo+x3DsLi+mG94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CumjybNTvmUa9TFe/A2ZoeqfSoNaLj55cKv1w6ahfh4hvPlNjvxhn9sfwzj9ByLJ5+ulwmoZ21nafQLcSdB+mmI4SoAkZTfM/q+ntMF6my7zSo6kKsdy1TpEfEvrI2pcKj/ZyMarWuLsf8X3L70r34iXWRVj5jUgVN4sUGpvaWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXuDSdWh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FB3C4CEE4;
	Mon,  5 May 2025 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483601;
	bh=ND8ed1luOqfEIsbMxce0N4FcAEg4PUo+x3DsLi+mG94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXuDSdWh876X/U1DrvQ43537Mp95Vo6iBxf9pwutIknTk9fWqYaw9cpiOlhXgwJ8P
	 RW9WFb61GwU8ckN2lJ0jw9XFaXCXI4tKKQ1pQLk8t3Zr1DVTeyVRYKEbdPaBHJOrw6
	 iuVHkFVpyKsEUCZoKZfK5mSbZ5u03S86M+ck2Ln+P8tRFSXWfv2XqD9BAMUvFDP4rK
	 Pkve1B4wdFzA1muWPM0X0BAMIK4xRXYPG/hAcf3hiTdohEi5DvME7AfxzohP2Kfd4t
	 x0K9ekWl5v2oCCTFS0Yt+G8kYWcaSdl+6ho79pc5CLorTOfwZCFmF6hWj2v2KqXsg/
	 //HMKSVR0nyrQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	brgl@bgdev.pl,
	afd@ti.com,
	gehao@kylinos.cn,
	shenghao-ding@ti.com,
	viro@zeniv.linux.org.uk,
	robh@kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 137/642] ASoC: pcm6240: Drop bogus code handling IRQ as GPIO
Date: Mon,  5 May 2025 18:05:53 -0400
Message-Id: <20250505221419.2672473-137-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit 17fdf318f5fbe5c27353ae917c0c5a2899d9c259 ]

The current code for the IRQ in pcm6240 makes no sense:
it looks up an IRQ with of_irq_get(), treat it as a GPIO
by issuing gpio_request(), gpio_direction_input()
and gpio_to_irq() on it.

This is just wrong, if the device tree assigns the IRQ
from a GPIO number this is just incorrect: it is clearly
stated that GPIO providers and IRQ providers are
orthogonal.

It is possible to look up an IRQ to a corresponding GPIO
line but this is taking an IRQ and pretending it's a
GPIO, which is just semantically wrong.

Drop the offending code and treat the IRQ that we get
from the device tree as any other IRQ, see for example
other codec drivers.

The DT bindings for this codec does not have any in-tree
DTS files, which may explain why things are weird.

As a bonus, this moves the driver away from the legacy
<linux/gpio.h> include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://patch.msgid.link/20250312-pcm-codecs-v1-3-41ffc4f8fc5c@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/pcm6240.c | 28 +++++++---------------------
 sound/soc/codecs/pcm6240.h |  7 +------
 2 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ff39e0b95b27..b2bd2f172ae76 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -14,7 +14,7 @@
 
 #include <linux/unaligned.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
@@ -2035,10 +2035,8 @@ static const struct regmap_config pcmdevice_i2c_regmap = {
 
 static void pcmdevice_remove(struct pcmdevice_priv *pcm_dev)
 {
-	if (gpio_is_valid(pcm_dev->irq_info.gpio)) {
-		gpio_free(pcm_dev->irq_info.gpio);
-		free_irq(pcm_dev->irq_info.nmb, pcm_dev);
-	}
+	if (pcm_dev->irq)
+		free_irq(pcm_dev->irq, pcm_dev);
 	mutex_destroy(&pcm_dev->codec_lock);
 }
 
@@ -2109,7 +2107,7 @@ static int pcmdevice_i2c_probe(struct i2c_client *i2c)
 		ndev = 1;
 		dev_addrs[0] = i2c->addr;
 	}
-	pcm_dev->irq_info.gpio = of_irq_get(np, 0);
+	pcm_dev->irq = of_irq_get(np, 0);
 
 	for (i = 0; i < ndev; i++)
 		pcm_dev->addr[i] = dev_addrs[i];
@@ -2132,22 +2130,10 @@ static int pcmdevice_i2c_probe(struct i2c_client *i2c)
 
 	if (pcm_dev->chip_id == PCM1690)
 		goto skip_interrupt;
-	if (gpio_is_valid(pcm_dev->irq_info.gpio)) {
-		dev_dbg(pcm_dev->dev, "irq-gpio = %d", pcm_dev->irq_info.gpio);
-
-		ret = gpio_request(pcm_dev->irq_info.gpio, "PCMDEV-IRQ");
-		if (!ret) {
-			int gpio = pcm_dev->irq_info.gpio;
-
-			gpio_direction_input(gpio);
-			pcm_dev->irq_info.nmb = gpio_to_irq(gpio);
-
-		} else
-			dev_err(pcm_dev->dev, "%s: GPIO %d request error\n",
-				__func__, pcm_dev->irq_info.gpio);
+	if (pcm_dev->irq) {
+		dev_dbg(pcm_dev->dev, "irq = %d", pcm_dev->irq);
 	} else
-		dev_err(pcm_dev->dev, "Looking up irq-gpio failed %d\n",
-			pcm_dev->irq_info.gpio);
+		dev_err(pcm_dev->dev, "No irq provided\n");
 
 skip_interrupt:
 	ret = devm_snd_soc_register_component(&i2c->dev,
diff --git a/sound/soc/codecs/pcm6240.h b/sound/soc/codecs/pcm6240.h
index 1e125bb972860..2d8f9e798139a 100644
--- a/sound/soc/codecs/pcm6240.h
+++ b/sound/soc/codecs/pcm6240.h
@@ -208,11 +208,6 @@ struct pcmdevice_regbin {
 	struct pcmdevice_config_info **cfg_info;
 };
 
-struct pcmdevice_irqinfo {
-	int gpio;
-	int nmb;
-};
-
 struct pcmdevice_priv {
 	struct snd_soc_component *component;
 	struct i2c_client *client;
@@ -221,7 +216,7 @@ struct pcmdevice_priv {
 	struct gpio_desc *hw_rst;
 	struct regmap *regmap;
 	struct pcmdevice_regbin regbin;
-	struct pcmdevice_irqinfo irq_info;
+	int irq;
 	unsigned int addr[PCMDEVICE_MAX_I2C_DEVICES];
 	unsigned int chip_id;
 	int cur_conf;
-- 
2.39.5


