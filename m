Return-Path: <linux-gpio+bounces-25236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0701B3D0CE
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 05:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83AB017FB66
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 03:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46DE1FDE31;
	Sun, 31 Aug 2025 03:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AY7N0m2Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D0133F6;
	Sun, 31 Aug 2025 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756609747; cv=none; b=m7dECT23Lfw9PS81YrWjfbQ5LKgVboXdy7VVstr+lAzU1EnWsejCrCyLrc5GI+wXrgIQWig8rvKZreo7JAAfIlasloQtj8wQvaAuPXrN3evnlqLdonl5RyxVyb39SlWzaoq4F62TvmqaYNelmJus+mkMqB+mi/Vf2YOpFSPJRIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756609747; c=relaxed/simple;
	bh=E/c5XwfqMNpQvNuG966dVUINQPSYJBF74IOw11jxbJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLoslo5fUlSy9REQYuxwpiWMYFujjP5IPn+yiWEpK2CAP8Q5bt/cIqu//frGp3PrkM+mDyjWCpnhMZs+rOlXtW08DQXd2BfwgrcD0m8hNGGm8vLOmX9PwTmwmj5WnkIEG2qgcDsF6PIVlpUKy6526OkvQJb0DaB61qHBm4gnm4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AY7N0m2Y; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7722e0ca299so1298904b3a.1;
        Sat, 30 Aug 2025 20:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756609745; x=1757214545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5GKm+qD3OfdrrZI3Jm4ON90CjWFsbCs/0REOVpBVHcM=;
        b=AY7N0m2Y1aaqdTYszBB/OfBbzlw5Cr3Jt5J9xn0DAMKiEjWKP6e69rECVkQgzgDnX+
         8/R/j/1DqkQ+iiiouM46PsNV7uBEMEDD3/ViJj+YgIzEwXiqupwXrP8pH1dI5EN5/ht3
         eWcys57sut+uDwYzRErMlFv+THTk5L8zSVkqG9Y8CVd+Q7NcaPmht/fj5cgygLYHCFsz
         To2GSC4kTcFUOf8AX+OzWH6DrSqVEXtzjhjWbYnWR3RsBFUhr6BmSoPQRIwaJvH3FiUm
         5WDfRZq28Qaiu/8p68HdmJITLKL06SuM3D5dVzCDXe/agD04z9ykLFzM03YNGUnPwxRI
         eU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756609745; x=1757214545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GKm+qD3OfdrrZI3Jm4ON90CjWFsbCs/0REOVpBVHcM=;
        b=CqS/Y+0ezT4r6yhTsOhOgym4u4er0bpoNTMhudbXU0CJRJwFfZjZVZluWLR8Ee1+TN
         kLQsgSzPWuTrmA6cckchOs3NQu02B+aMAy+MX5fVis6TVMKQtYjNKDGbGPe6K/Z52JCI
         03VEfRf3K2Vi8yMxRpvnsmKamn5a3daRQfg6CjMU0z7lfezv6QeiO9UMzqsupudvu2X9
         YF8y/aldM4TFve6PUiWHWMluRuvHC2eblhkuuIDBL0we7mxhFLSjBM7QmRDh0I/k3BMM
         WiheE+9tNpsiCRwmNOCtihv/twRyfWMf+lSWmklaHZBVHbdEbrhalpDrDwlpqZ2DJip8
         YjvA==
X-Forwarded-Encrypted: i=1; AJvYcCUQu/hsjp0iSAWOSiwR5gXAvK1poiDlBfa1KtFHRbPkZoiy7w/KSfd4ia6oucTwyAsKR1nqcAa6OhcUpXE=@vger.kernel.org, AJvYcCV35DqdR0mWbOx8ytyGONeKfXVynK5wBDhLdUebkzFDx94Xm8UXzvvVAqHPjHaKptjS6efN8qjTOKO7@vger.kernel.org, AJvYcCVwVc7KlcFF2fuDxBAru4Gbfd5eySshvooufzOEAuMqHnMlj14rpHzUcUm2E0H1a5J3MwcV65/ZN0WhWgrd@vger.kernel.org
X-Gm-Message-State: AOJu0YwJqtqrpHC9+gQwuK16w4Rx48PHbI+/mSNeL08iO2DrIuXAfz3f
	VoCr+gh9GpcLTcBCsHvNLo059XUwbvM19tMpKGEKx60L8YUYj5RJnTeF
X-Gm-Gg: ASbGncuivsLv81mu+5RlAFw6EdwDxkX+4dMgnnxpoPXuahE2NRJUC4QPtFLTYZ2q7r3
	OYVAq0HzLU0Urcxog/3ajoOKKBZN+ll6F3uojdaSCLDddmTseaqWckw37mG1N0ACOfXlhoxS/95
	uYZKSHoJmgRzOdZTvWB/Ztbqkq4UqCSa9B2gaRINR2crnXhchjdJHlQW1EIs5ntuxqqhJyXIWP+
	LAnp8f9S8ASLDEdztyhkG8L/M/z1tyBYhcjrTqlHR00u/aYJn5glaqwnfp1DxNz0Rdw84uSkAmI
	dq5kPgKQWfn8u6MRjiVN7Iw6ZXiNpOJtItPqoRv6NhoH7QzUge3VQ79cD65B84HeF1h28yVa2+9
	oeFM/cswNaCKdcl4ddy1yw1fen+0MvUoiwLLeI0lqsm2xSESx0AiSLolPVafTkmY=
X-Google-Smtp-Source: AGHT+IGWcf0zGjc7ekfR5RDDXj0auhJkplR/XcYdwIEgVWpW8E0z0NQn117liJ9d1gc0MGX41p/OTA==
X-Received: by 2002:a05:6a00:3d4d:b0:76e:7aba:cb43 with SMTP id d2e1a72fcca58-7723e3ce95amr4798677b3a.15.1756609745251;
        Sat, 30 Aug 2025 20:09:05 -0700 (PDT)
Received: from fedora ([172.59.162.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm6593312b3a.18.2025.08.30.20.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 20:09:04 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH] ASoC: codecs: tlv320dac33: switch to gpiod api
Date: Sat, 30 Aug 2025 20:08:55 -0700
Message-ID: <20250831030855.957707-1-alex.t.tran@gmail.com>
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

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 sound/soc/codecs/tlv320dac33.c | 56 +++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 423b9264a..b8e833efb 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -15,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <sound/core.h>
@@ -109,6 +110,8 @@ struct tlv320dac33_priv {
 
 	enum dac33_state state;
 	struct i2c_client *i2c;
+
+	struct gpio_desc *power_gpiod;
 };
 
 static const u8 dac33_reg[DAC33_CACHEREGNUM] = {
@@ -383,14 +386,28 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			goto exit;
 		}
 
-		if (dac33->power_gpio >= 0)
-			gpio_set_value(dac33->power_gpio, 1);
+		if (dac33->power_gpio >= 0) {
+			ret = gpiod_set_value(dac33->power_gpiod, 1);
+			if (ret < 0) {
+				dev_err(&dac33->i2c->dev,
+					"Failed to set reset GPIO %d: %d\n",
+					dac33->power_gpio, ret);
+				goto exit;
+			}
+		}
 
 		dac33->chip_power = 1;
 	} else {
 		dac33_soft_power(component, 0);
-		if (dac33->power_gpio >= 0)
-			gpio_set_value(dac33->power_gpio, 0);
+		if (dac33->power_gpio >= 0) {
+			ret = gpiod_set_value(dac33->power_gpiod, 0);
+			if (ret < 0) {
+				dev_err(&dac33->i2c->dev,
+					"Failed to set reset GPIO %d: %d\n",
+					dac33->power_gpio, ret);
+				goto exit;
+			}
+		}
 
 		ret = regulator_bulk_disable(ARRAY_SIZE(dac33->supplies),
 					     dac33->supplies);
@@ -1500,14 +1517,22 @@ static int dac33_i2c_probe(struct i2c_client *client)
 
 	/* Check if the reset GPIO number is valid and request it */
 	if (dac33->power_gpio >= 0) {
-		ret = gpio_request(dac33->power_gpio, "tlv320dac33 reset");
+		ret = devm_gpio_request_one(&client->dev, dac33->power_gpio,
+					    GPIOF_OUT_INIT_LOW,
+					    "tlv320dac33 reset");
 		if (ret < 0) {
 			dev_err(&client->dev,
-				"Failed to request reset GPIO (%d)\n",
-				dac33->power_gpio);
-			goto err_gpio;
+				"Failed to request reset GPIO %d: %d\n",
+				dac33->power_gpio, ret);
+			goto err;
+		}
+
+		dac33->power_gpiod = gpio_to_desc(dac33->power_gpio);
+		if (!dac33->power_gpiod) {
+			dev_err(&client->dev,
+				"Failed to get reset GPIO descriptor\n");
+			return -EINVAL;
 		}
-		gpio_direction_output(dac33->power_gpio, 0);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(dac33->supplies); i++)
@@ -1518,19 +1543,17 @@ static int dac33_i2c_probe(struct i2c_client *client)
 
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
 
@@ -1540,9 +1563,6 @@ static void dac33_i2c_remove(struct i2c_client *client)
 
 	if (unlikely(dac33->chip_power))
 		dac33_hard_power(dac33->component, 0);
-
-	if (dac33->power_gpio >= 0)
-		gpio_free(dac33->power_gpio);
 }
 
 static const struct i2c_device_id tlv320dac33_i2c_id[] = {
-- 
2.51.0


