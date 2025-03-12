Return-Path: <linux-gpio+bounces-17505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DDA5DE06
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 14:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70484169FBA
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 13:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B9E2459DC;
	Wed, 12 Mar 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MpXKQhev"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713424501B
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786324; cv=none; b=HXh/Veo2/lym9VS5Hz9mdbZBAUuBlooXKclehFGlXO84VjTo1cYZihSw5lYglG4r8njU9t/4pJSz6co053HWRMROimh2T6vL+L2YBDqw4vmnQ4fbNLxZnOyybkwhmdG83Hlk0RsTrfMrdeNuvyTt4PwzWjWbPZmUmSKl6c4UWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786324; c=relaxed/simple;
	bh=OKx2k02z23zEcvhATOXAT7P378GIrQR3T0tzoq4hdxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ns1QBAzdXRlJ3bR4kXOKFSs3YtnlwuWyd8ytGn4xN+mD9bofPbmTW8BF1zIIObxD2NsgmUABTf5XhS7dK0q1NnNkH+vzOS9gBhpgwl6SO4K8E8VgZ+A9U0Rvxc08bE3elGJkKJv56ug0N4fOoRc1oOxrBqCKgi6A7jZNjB2vmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MpXKQhev; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549946c5346so5440960e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 06:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741786320; x=1742391120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6227D3p3P0gwc0KnsTIE+k7HQimstZwQXxJIFYQCaY=;
        b=MpXKQhevzkYAPR0eiTFlGxAUeEUHi+1ZCHrtfun8JkgV4YDe9XVpNZl4Tg3c119fDF
         UwKviwTUlRAfnPPUFe5pNuShM2rNDVMG14wzbny/5RhJMg0+WMtOTbUKnS6P9d/2Kqg/
         8ScFb7/t0//ww/LvZ9lAb53Gw9yOJh94RLcssE879Y9zDSHpZ1td0YEBbqOJBNGdRh7a
         ZhK+vVcpYD117S/mw7jRKRCUW2E7z6bJrz9FY94DaTQA4qMxhufkGTt/Zrks2BRy9gcD
         a9iEJjozeYX+jEQK2wOApdJH6+0sFz2KzpEn/frOv8NrDEYmpwurgJQq54PQFEzPMTtO
         GaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786320; x=1742391120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6227D3p3P0gwc0KnsTIE+k7HQimstZwQXxJIFYQCaY=;
        b=tkPErltxDDHwjOjrqGbGfjmDuCEiWJkf4k4vewBDYsbYQwn6k0dwkxuE/srn/1AvI+
         j2sLkJCa7rXLnJdKg38/xAVMztt8+hCmcReIhS6xVSONhNu2i8/xDuIFOI5S+1iosnib
         6gKoRwO1Qyl4t+llz5b8EukuMc0vHzPXfrD4qkC7oesUCF5PBEdvZSuxn8wtyIkMP+PR
         05ksihxP+yGm0jWOatKvedUbHmWf1cQkZ8mKegVzfJ+dJ/mCqXcV8tbSHscIeYe3ZSEr
         wZc62mnBCzhipWfeA1wAgdf1i4HVjSiJBsn0HVnFtLQ4RXS+pbwhEfmUy/ga7ts0hFQi
         0SVg==
X-Forwarded-Encrypted: i=1; AJvYcCX0wwFMCsbwa2AGpv9j5/bFJkkUTy285HJAQvCPYZOgGAveQSC0aeNBLgZ+Yajsooa6kr/v+pHiX/w+@vger.kernel.org
X-Gm-Message-State: AOJu0YwkkwKFZOKq94cAC+7qbvkyZ1BfC/w++oNn7LJx6OyPu13QR7Ps
	9vV4tKI68BMGwGX6KvrA3AkPk7tOtE19RwifCFwzSQtY5+NDUSErTdNV+zJA340=
X-Gm-Gg: ASbGncsErTXJgi64J4Hktehf9aoTs01+TogeyrcIuYRpucIS9OQfvbEc50ThFReSznN
	zcuVTChNPXPOLzMAJxa8Tb69bKsiLQc6q4xMAOjpE1M38cmJLsH9eV9TrXQaUyaklDm549UVE1H
	EEFaVmQ0UZMfPVaszRgbNd3BPKUJLDM9jfjZxOtgYdCcH4AJI3F472s8gaC2/6V/LiorYX+JoDF
	78IwYFNi5CjI0vrXmUTQrElYYVHc6YwpSJPB/mEetjhpSwA00OVL3GKh8FsAirqYDDk3SSPH1Nl
	7zJA9CtUuL0wk/zIjIxpSKAfq/b+F3sWa9WYwbfJx/GxQLVcqcKxE3Gzz93pfaqE2g==
X-Google-Smtp-Source: AGHT+IG+ADSPCoGqvuEtats2T3CM9fitXUnTzvBoqRBCavMLmRzv5GI1OBEpjzCqM7eEbpTXVT3w1w==
X-Received: by 2002:a05:6512:3da4:b0:549:39b1:65c6 with SMTP id 2adb3069b0e04-54990eaa699mr7963530e87.34.1741786320407;
        Wed, 12 Mar 2025 06:32:00 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae460desm2121858e87.24.2025.03.12.06.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:31:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Mar 2025 14:31:52 +0100
Subject: [PATCH 3/3] ASoC: pcm6240: Drop bogus code handling IRQ as GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pcm-codecs-v1-3-41ffc4f8fc5c@linaro.org>
References: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
In-Reply-To: <20250312-pcm-codecs-v1-0-41ffc4f8fc5c@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

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
---
 sound/soc/codecs/pcm6240.c | 28 +++++++---------------------
 sound/soc/codecs/pcm6240.h |  7 +------
 2 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ff39e0b95b272c9c6b6f5cca50f595ae39ef056..b2bd2f172ae76e6baa7e6f4ef5fe894701ea4385 100644
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
index 1e125bb97286030f7e6006970d0be9f40348e952..2d8f9e798139ac7df30606c0e5381a7b24d84728 100644
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
2.48.1


