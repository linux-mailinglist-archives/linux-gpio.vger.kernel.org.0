Return-Path: <linux-gpio+bounces-19622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC1BAAA940
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 03:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E62B176090
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 01:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6AA35EB8F;
	Mon,  5 May 2025 22:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elFFnAXt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576FD359E0D;
	Mon,  5 May 2025 22:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484983; cv=none; b=H0B8/pVqaH072QgtlCHbHTFZ8TfPHtZQnGxIAz/aL/5Yf1FIElbB/80syGZS+fMLJ9m6EBHCI3P5+Evb4G7MlewcdaeWf9OTlK2dzaf4xvYcQGr7SM6PXfT2okMGi5lxzmNL2NLvdhia5hezX7hkcFMexu/lqH4d2gFl62CPmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484983; c=relaxed/simple;
	bh=F2KqhxkSRiofNeqyBd4iGrONug03FrSeDKVfz3ky+iM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LvQW/YbjASBFczMcrANW/2ronvQ3CH243D4cNHrnFuGrfJOaEOJm80iZ2GW2zLpZZ4p/v7YEAtAGhtpmP4k55TWjzBvVWwESl1P4k4Rl/k3D/LrFtNWnCYUjmXyLv21VeCbRPdY3Vo7OD7RpqWzZ555gyzCQtvv93FVrxPYXXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elFFnAXt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D8EC4CEE4;
	Mon,  5 May 2025 22:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484982;
	bh=F2KqhxkSRiofNeqyBd4iGrONug03FrSeDKVfz3ky+iM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=elFFnAXtvQVYTO2HYJ5l3apcNM/qCNAxh+tGv0Q9v1ksu8WkCYxdxjXYiPEAD6FRt
	 3e+9b8C0qnk2soO2XZGq5hTdcESG6Lj+cAvrWm9zOyIKQk+OjwLNg0q1MprGCC9hy1
	 HXRA0pme40ICaZouIkQ2WeOquwvgYlrav4P7CPEAlwrf9UiZrGjhE0z4zHqBmkvFvJ
	 mErCGtMBHhezYGjbPHJo/oh5IZxQZbhdSgfxTLPRVnB1uZa8EqCPnvW5epGpH69KkN
	 npsNRtu0o9TN2GTEuAIlz4XeyGQvTopB1EQcGm53jZnmFgcy26vSIjMszaGOHO5Unx
	 y/AmgRBlEgzbw==
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
Subject: [PATCH AUTOSEL 6.12 109/486] ASoC: pcm6240: Drop bogus code handling IRQ as GPIO
Date: Mon,  5 May 2025 18:33:05 -0400
Message-Id: <20250505223922.2682012-109-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 5d99877f88397..e59bb77edf091 100644
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
 
@@ -2110,7 +2108,7 @@ static int pcmdevice_i2c_probe(struct i2c_client *i2c)
 		ndev = 1;
 		dev_addrs[0] = i2c->addr;
 	}
-	pcm_dev->irq_info.gpio = of_irq_get(np, 0);
+	pcm_dev->irq = of_irq_get(np, 0);
 
 	for (i = 0; i < ndev; i++)
 		pcm_dev->addr[i] = dev_addrs[i];
@@ -2133,22 +2131,10 @@ static int pcmdevice_i2c_probe(struct i2c_client *i2c)
 
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


