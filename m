Return-Path: <linux-gpio+bounces-25265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B0B3D80A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 06:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96231772CB
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 04:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9506022A7E6;
	Mon,  1 Sep 2025 04:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CelcEl63"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20BA229B2A;
	Mon,  1 Sep 2025 04:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756699208; cv=none; b=K9aJ2rdcZ3k0Uqy0ptVZoVCCVsmP2Z6moP/hhKOVGATTu2tam3JHsnmX7CGAe3fynfU6C0E/rvXV2Hm9AvXuoWJam49R5G5iAllsPqXFlDHUVSyL8luFz2fa/eC4vFfBDVbWbVmXyYcGjFP/D2UzU6aViC8l1tNXVK3ie8WgOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756699208; c=relaxed/simple;
	bh=mFdGiWYbHKTIQuZQ6JEvAvSFAMqV2qPA3NrIrGyHjfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oS6HSCukx8E70W8O/I/NOY5hXHmjNo9xUwGfD762K9gfB6EpC0gk+1sRiB0FD7jXV2AMKdOMPZQ2/pCf1Z3lj19VtQERz0d5LBIWAp3iTA25VEF4M7W5opTwBofJte3aKKtekIi0t9/8ATYj3Fie3noims4XYEx2/ikYEDxxDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CelcEl63; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7722bcb989aso1888374b3a.1;
        Sun, 31 Aug 2025 21:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756699206; x=1757304006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BY3llSyqjM8B31nJmpobImIA2OMX2oAjKosHTE3YLXc=;
        b=CelcEl63y4EhRqfz/gePH7RKKOSh/sZQzzcP/7FBwxLK8HW2YJYuhqWtiriKXxPdSj
         VbVrVIs4kZor8YKabQSLGxsSmSSTFF4YTHpyB0Z/ZvdvTEt4h78diVSq93gP01Peg9Hg
         CM3rbR9+saQyx0W/YjO4OX28bWLp3Pv+LduCIcY5BHztMRYnjLtbvT3ZM1AQL/N0CwB6
         +hTxr28X29yz2aZxz6joG3AEmON5o8Zo0Eu3mhTeCv8zMmFbZ/1SLRydo3DAivBf/H85
         oRGdqFcmEZ2+fKGBfFsPFIeufO0+37ykxdWAOgwtKZjnomqAohvA33mmHlUS8aj4g2Fh
         Nvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756699206; x=1757304006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BY3llSyqjM8B31nJmpobImIA2OMX2oAjKosHTE3YLXc=;
        b=JMELq8WgvgEcQpLLdlEHp+VDprqBLt+fS4sLq1THLU0hwKVUgptKaRDlD5nlctC9+e
         NCmwZS5sd8uL0DZMF3UEnZKFQXoes5LSBZZQQEXCfVUO76zHzDlCnAk7JRd972PcasA2
         uj99n1si9sxsGb+B682NipgPHoU5xZ9vOfFzqyEV5fKNxGoGdgG7T7+umXsKGCXTwafI
         D25N/puOV0HZ7EhdBBTCScGLAZXnv/g8H39FeZhY46lcWu/ZfWbHjP6LSzDrcl0xSRwz
         1tcTzurqmu8MgsNn5KBNW3kT1+WRwJ51wNPDKEbexKkG+ITZxMEgZ+guB7CpOT34+EGn
         wjNw==
X-Forwarded-Encrypted: i=1; AJvYcCU28F0pVn3TAXSEIru9LmbOGorDbrRDwQSArKC8xUMUJ5cCLZo9at3ygLga998NkCxUvUqNDEarCzVVBi4=@vger.kernel.org, AJvYcCUx5UsW+woVdWzA4L53nhERD6sbFcwFxCQRKcfAEQBnMi2tB7o/tVfhRs/L00t//yudCNlDJdJ0j28tTT2V@vger.kernel.org, AJvYcCW2bIuGrsft9Dk3hmSN+yCuzY5d1cKXLcdwp+150t1pNjQlO7CZXU4+ZwUKiomBMyi/3L4rKQq/49OS@vger.kernel.org
X-Gm-Message-State: AOJu0YxEw6OAZC6MJqLLsgBj0qyXhAA455VhY/jsSAlG8+rVtQ7n2K1a
	BRWFUnWHakI/oihZzhOz5nUAExt938wmCN7KxJOcAbAWYQHuKlNJMyzA
X-Gm-Gg: ASbGncvoUI0SQAVoluJIHUY2VkH2LQfKn22Yrh4gwlMT9OKX5fS85iwApGw5LRTdVzQ
	Nh83hrUBcZy7hVztPBhGvF0op4QMCNYFjzOylQi23Gt3havWRrisp78bpn63ZPwO5iOSumjz/ef
	URdKsN5DIkPpmHGgZhpOAm+Vbg3P5zDF2/yAKF+VPJvBGGIB7vTQ3Z1BhcoLicGjVyfUDOnF7Pz
	4KIXK+OvlQb8bOQZ03ECOBlPTIZpEwCj26KswMECg6rSMWqJAGBAC+XLFS3MQcXSdF0gWWnx6hw
	d6qLQH/JxJNhlU4crc7Xl0qhZFjvEcTUFYotsOj7kagLW4Z7oN1WlxCq3HH5N4sWfLWmErL6T0q
	HrJRopGRjHRqBfYbLZSGPnAkfh7RV1N9745RQitlQw1pw+ibbIo2OMI4R1+i+bIUeljX9ax/JBw
	==
X-Google-Smtp-Source: AGHT+IFcLVYmrJizvyocgktBhoV7mRWwFCCVmmsoY3/ZEYiNbh2oYbcrjRBtAe+sPHCs6PID8NxLLg==
X-Received: by 2002:a05:6a20:3d06:b0:243:c581:10a0 with SMTP id adf61e73a8af0-243d6f03294mr8635387637.30.1756699205755;
        Sun, 31 Aug 2025 21:00:05 -0700 (PDT)
Received: from fedora ([172.59.162.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e24e3sm8955545b3a.78.2025.08.31.21.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 21:00:05 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	tiwai@suse.com,
	perex@perex.cz,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2] ASoC: codecs: tlv320dac33: switch to gpiod api
Date: Sun, 31 Aug 2025 20:59:56 -0700
Message-ID: <20250901035956.1195081-1-alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Changed reset GPIO setup that uses 'gpio_request' and
  'gpio_direction_output' to use 'devm_gpio_request_one' instead 
  for legacy support.
- Convert to gpio descriptor for use.
- Better error handling with 'gpiod_set_value'.
- Removed cleanup of reset gpio as gpiod api is now used.


- Performed full conversion to gpiod with 'devm_gpiod_get_optional'.
- Removed struct 'tlv320dac33_platform_data' as it is
  not used in the kernel.
- Removed file 'tlv320dac33-plat.h' as it was not included
  anywhere outside this driver.
- Removed 'power_gpio' and added 'reset_gpiod'.
- Added default value for dac33->burst_bclkdiv as it can't be 0 (2-17).
  See <https://www.ti.com/lit/ds/symlink/tlv320dac32.pdf>

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 include/sound/tlv320dac33-plat.h | 21 ----------
 sound/soc/codecs/tlv320dac33.c   | 68 +++++++++++++++-----------------
 2 files changed, 31 insertions(+), 58 deletions(-)
 delete mode 100644 include/sound/tlv320dac33-plat.h

diff --git a/include/sound/tlv320dac33-plat.h b/include/sound/tlv320dac33-plat.h
deleted file mode 100644
index 7a7249a89..000000000
--- a/include/sound/tlv320dac33-plat.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Platform header for Texas Instruments TLV320DAC33 codec driver
- *
- * Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
- *
- * Copyright:   (C) 2009 Nokia Corporation
- */
-
-#ifndef __TLV320DAC33_PLAT_H
-#define __TLV320DAC33_PLAT_H
-
-struct tlv320dac33_platform_data {
-	int power_gpio;
-	int mode1_latency; /* latency caused by the i2c writes in us */
-	int auto_fifo_config; /* FIFO config based on the period size */
-	int keep_bclk;	/* Keep the BCLK running in FIFO modes */
-	u8 burst_bclkdiv;
-};
-
-#endif /* __TLV320DAC33_PLAT_H */
diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 423b9264a..43d372dd6 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -14,7 +14,7 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <sound/core.h>
@@ -24,7 +24,6 @@
 #include <sound/initval.h>
 #include <sound/tlv.h>
 
-#include <sound/tlv320dac33-plat.h>
 #include "tlv320dac33.h"
 
 /*
@@ -80,7 +79,7 @@ struct tlv320dac33_priv {
 	struct snd_soc_component *component;
 	struct regulator_bulk_data supplies[DAC33_NUM_SUPPLIES];
 	struct snd_pcm_substream *substream;
-	int power_gpio;
+	struct gpio_desc *reset_gpiod;
 	int chip_power;
 	int irq;
 	unsigned int refclk;
@@ -383,14 +382,26 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			goto exit;
 		}
 
-		if (dac33->power_gpio >= 0)
-			gpio_set_value(dac33->power_gpio, 1);
+		if (dac33->reset_gpiod) {
+			ret = gpiod_set_value(dac33->reset_gpiod, 1);
+			if (ret < 0) {
+				dev_err(&dac33->i2c->dev,
+					"Failed to set reset GPIO: %d\n", ret);
+				goto exit;
+			}
+		}
 
 		dac33->chip_power = 1;
 	} else {
 		dac33_soft_power(component, 0);
-		if (dac33->power_gpio >= 0)
-			gpio_set_value(dac33->power_gpio, 0);
+		if (dac33->reset_gpiod) {
+			ret = gpiod_set_value(dac33->reset_gpiod, 0);
+			if (ret < 0) {
+				dev_err(&dac33->i2c->dev,
+					"Failed to set reset GPIO: %d\n", ret);
+				goto exit;
+			}
+		}
 
 		ret = regulator_bulk_disable(ARRAY_SIZE(dac33->supplies),
 					     dac33->supplies);
@@ -1462,16 +1473,9 @@ static struct snd_soc_dai_driver dac33_dai = {
 
 static int dac33_i2c_probe(struct i2c_client *client)
 {
-	struct tlv320dac33_platform_data *pdata;
 	struct tlv320dac33_priv *dac33;
 	int ret, i;
 
-	if (client->dev.platform_data == NULL) {
-		dev_err(&client->dev, "Platform data not set\n");
-		return -ENODEV;
-	}
-	pdata = client->dev.platform_data;
-
 	dac33 = devm_kzalloc(&client->dev, sizeof(struct tlv320dac33_priv),
 			     GFP_KERNEL);
 	if (dac33 == NULL)
@@ -1488,26 +1492,21 @@ static int dac33_i2c_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, dac33);
 
-	dac33->power_gpio = pdata->power_gpio;
-	dac33->burst_bclkdiv = pdata->burst_bclkdiv;
-	dac33->keep_bclk = pdata->keep_bclk;
-	dac33->mode1_latency = pdata->mode1_latency;
+	if (!dac33->burst_bclkdiv)
+		dac33->burst_bclkdiv = 8;
 	if (!dac33->mode1_latency)
 		dac33->mode1_latency = 10000; /* 10ms */
 	dac33->irq = client->irq;
 	/* Disable FIFO use by default */
 	dac33->fifo_mode = DAC33_FIFO_BYPASS;
 
-	/* Check if the reset GPIO number is valid and request it */
-	if (dac33->power_gpio >= 0) {
-		ret = gpio_request(dac33->power_gpio, "tlv320dac33 reset");
-		if (ret < 0) {
-			dev_err(&client->dev,
-				"Failed to request reset GPIO (%d)\n",
-				dac33->power_gpio);
-			goto err_gpio;
-		}
-		gpio_direction_output(dac33->power_gpio, 0);
+	/* request optional reset GPIO */
+	dac33->reset_gpiod =
+		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(dac33->reset_gpiod)) {
+		dev_err_probe(&client->dev, PTR_ERR(dac33->reset_gpiod),
+			      "Failed to get reset GPIO\n");
+		goto err;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(dac33->supplies); i++)
@@ -1518,19 +1517,17 @@ static int dac33_i2c_probe(struct i2c_client *client)
 
 	if (ret != 0) {
 		dev_err(&client->dev, "Failed to request supplies: %d\n", ret);
-		goto err_get;
+		goto err;
 	}
 
 	ret = devm_snd_soc_register_component(&client->dev,
 			&soc_component_dev_tlv320dac33, &dac33_dai, 1);
 	if (ret < 0)
-		goto err_get;
+		goto err;
 
 	return ret;
-err_get:
-	if (dac33->power_gpio >= 0)
-		gpio_free(dac33->power_gpio);
-err_gpio:
+
+err:
 	return ret;
 }
 
@@ -1540,9 +1537,6 @@ static void dac33_i2c_remove(struct i2c_client *client)
 
 	if (unlikely(dac33->chip_power))
 		dac33_hard_power(dac33->component, 0);
-
-	if (dac33->power_gpio >= 0)
-		gpio_free(dac33->power_gpio);
 }
 
 static const struct i2c_device_id tlv320dac33_i2c_id[] = {
-- 
2.51.0


