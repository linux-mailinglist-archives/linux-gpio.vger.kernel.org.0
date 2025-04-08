Return-Path: <linux-gpio+bounces-18439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C0A7F690
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 535D93AADA2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC388264602;
	Tue,  8 Apr 2025 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CxmOxaoK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1842641EA
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097796; cv=none; b=WWJWwNfl+AYMuHlOn6EsQsoLMKbJKlOaVAUgjtNxJOJOPbKZUUIdQfVSlZjSPcy7xOmbMeQI5BePFGYBYkM17sZm1fVqp9dNcNXtJ4yTNFTJNfFD68vCXtZSy5HC/gYab0MjOLk79sKv7ngFPxWg+mFB4t9C1z72BnOw+QrcOYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097796; c=relaxed/simple;
	bh=zDVSLesP0T7A2McRjojWEmZkKOxXjOebJPoK+EP0dIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaZHwHwSivLzJPKM5a0GrM71y/hsjAORLSXfoHK0KGdr9VRgwdGc5pXMwoHYH+xFXyeiHGmOmVnhNqCB06GjJVb/30phU2EoFBPugvh2Y7iCbCAC1wHSmtvHY8qzf+yscbgNGciI5PivWUJ2kZJ7tFqiifFLRG+Uehikyctl2ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CxmOxaoK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso32767775e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097793; x=1744702593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieIGmxyhNPbpd78PJf2XL1UkaAJt0mspe5nebAeYm4w=;
        b=CxmOxaoKBFTGoVSi7HTcN9IFStWh7LTAYfj4vYbIhXI+wthwDY0lUl8P45zRKS6j1E
         sT3twl/MVfuHzIxyiXri+jcwDeRkmW6L42/oO3a+LzLrFgEG8IzxgwJCYGzx3WZxJLuR
         xg03sgWNUFZZ98zVGiii+Agb2aajGW0g7B8qdz1kWztO2UHFXY3jvoRZ+aSGrVuYPWGJ
         /MvBLSF+VDcCfGoGuq4j2C0PnVByHgCFhYaKVG2ihlZluWuZA3sTgbB5ygmji/Vwshw6
         kDYvNWyTeKPkcTELkCK44InzZpdCnLPCL5aiSAAQ3jv5x5L9sPNtd1iqfu8rVgatgLc4
         csAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097793; x=1744702593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieIGmxyhNPbpd78PJf2XL1UkaAJt0mspe5nebAeYm4w=;
        b=VQ2GzGIRTu6PYZugx/RcIGK3uYMBoF0+wmAk6VWfAEFCCYmStPcUsX5s4I6rhE6vmx
         jOmVFrblU9DoGsmrxfpJ6GvTlXciHXQvV6qvwOay89+AViU7GPAi9bHfsp/EAuwBuewr
         QIWXtJ6TK/78CK1GKiLZaKA8Xcl2F8rEcA8tsPHpQ1hQfpguG+PNyNxHS9aj/Dt2tFPE
         wzKLfygNecbKlJ6g5jeqReLMq2YUirU5ibvMzFV0jT6buW8R/jJAsGy9VubRVmrdjlgX
         fUsnEKSSkq+sICUAt7143UbHYD5ZZjTcsqTKHzI/RrSJPWFD0SpzahjENik/jqT1Ag2Y
         HLgA==
X-Forwarded-Encrypted: i=1; AJvYcCViXYYx9iu68+I15Yrwv5oHPTtCzRJZJg/6WULMkg6kgWljSLr60ARH6xZOkV5cWaTYnlxTRPJceetO@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+SOCaPtjG/QaAHTvZkiagzqyfzl7MVuMX8OX3+9pODWUeOtF
	/vlFsLwXDITvdmB1tzTRKAxxSbxHl9DeXzoihfOXYwdBjnAwrW6uUqAa/NzfsJs=
X-Gm-Gg: ASbGncv9DAHjNC7MVhBiJxbJTBWsi7LFgt4reVhlyiNhle6h0pVOxgyIiuxCxkiF8yh
	BBegZDCRas0q4pd5gOgalxJ3wLWfcuMh7hkngbuKlw75kgGGUACTtj+wyD75W9wVQ02iWedAj+q
	ScqiN2smbIUqS/Heg2RQbL3x7G675f5fRsGMo1gi8WQO7iSjBv29Je8semiBwAXk5IU7IbaWpBP
	pRBoc2+eI7qJGPLA6XkUY4m+I9z4O1cdymS5ZKnHdWTkp0WqELt6JTpaGALcvNOV10TJuCxaz9c
	xXecV90zyE+rTfOgyoQ9KYy/4SvyTKXu0MxKPA==
X-Google-Smtp-Source: AGHT+IHBeowJuxDcX5UF6gWDD+kUYBEUe0mJaKP7pQljslu07Q2/7r0/c5GOuYrPNr6M1Lh6Efwwug==
X-Received: by 2002:a05:600c:4f52:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43f0e5dda3amr16240405e9.10.1744097792929;
        Tue, 08 Apr 2025 00:36:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm14287627f8f.61.2025.04.08.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:36:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:36:29 +0200
Subject: [PATCH 2/4] regulator: rpi-panel-attiny: use devres for mutex
 management
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-regulator-v1-2-a18b6154b31a@linaro.org>
References: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3420;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yvLD6k1WGtmY4t8wzqLA9DATPQj/XYYaQSOinVOC51g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NH9iCFL/+9CwkxFsk8fCeOL2QEwfNyUME5KE
 SP5vozMZd2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TR/QAKCRARpy6gFHHX
 cuQ0D/4n5UrRuykA0JBWm33mmjOt6Hmtv+7ILDXOQ9I1h2BDUcgCquGpH+tPCEElmgEgtR5ClDT
 xlacF7jxLrPiPU5ZkqGP96Q/f/Mp/VPXLQr0yKmoivXY+C9Vze+fcv52jPZmzIWFIKZBZv4vXyV
 6TtxIUNBxlN2o/UgPw9uBVlHPtr53+AWG9aeRO8kDysDDMOOB3I0vmR/sq2qlAtbUFiEAMjiXFq
 QLa3q3FD6ZWkDv0gaddU+nR3QIOeTujNQF6dSyAqyRAWPpcAgon46q6ItdTra0y9RQSI06LmNwi
 jOnxDNO+bk8a6VHYUxXnse/0qvetnHBT8jcJ5IPzLLblxzblxjha0oLvvVQ4J+V31XeZ3XOOGce
 /rNm3dHuQPRdDT5C6rwTzcl6IXj3sb4T6Rm1zI+sgAS9hIBVmRcYM6KtxEQuJCA2XA7psOo5z/n
 EFLSrS9LeL8c+EJXQ90Sv079lLvXJhVxp23hf0y/pDTR85nYH+BWjjQgW1KZfBegs5o3CwC8Zyd
 bCq1GSpn2Bt3uqkvP814n4ANuzqxxWeC3VzlMGIzh1dCOEV1Ylk91BpWMbD5PE6HHsVrHlXfyzC
 BJVP0FJlMeJg/bs5HOlJd3MHzekYtM+hPLrP1qUhVa9x5eH6b4wznDzsCkpPlHV2XTuaMtSUD2Z
 2bQV4wh6y/inKhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the probe() code and remove the remove() callback by using
devres to manage the mutex resources.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 39 ++++++++------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index f5ce50ced294..5ff348939560 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
@@ -293,7 +294,10 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 	if (!state)
 		return -ENOMEM;
 
-	mutex_init(&state->lock);
+	ret = devm_mutex_init(&i2c->dev, &state->lock);
+	if (ret)
+		return ret;
+
 	i2c_set_clientdata(i2c, state);
 
 	regmap = devm_regmap_init_i2c(i2c, &attiny_regmap_config);
@@ -301,13 +305,13 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 		ret = PTR_ERR(regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		goto error;
+		return ret;
 	}
 
 	ret = attiny_i2c_read(i2c, REG_ID, &data);
 	if (ret < 0) {
 		dev_err(&i2c->dev, "Failed to read REG_ID reg: %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	switch (data) {
@@ -316,8 +320,7 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 		break;
 	default:
 		dev_err(&i2c->dev, "Unknown Atmel firmware revision: 0x%02x\n", data);
-		ret = -ENODEV;
-		goto error;
+		return -ENODEV;
 	}
 
 	regmap_write(regmap, REG_POWERON, 0);
@@ -333,8 +336,7 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 	rdev = devm_regulator_register(&i2c->dev, &attiny_regulator, &config);
 	if (IS_ERR(rdev)) {
 		dev_err(&i2c->dev, "Failed to register ATTINY regulator\n");
-		ret = PTR_ERR(rdev);
-		goto error;
+		return PTR_ERR(rdev);
 	}
 
 	props.type = BACKLIGHT_RAW;
@@ -345,10 +347,8 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 	bl = devm_backlight_device_register(&i2c->dev, dev_name(&i2c->dev),
 					    &i2c->dev, state, &attiny_bl,
 					    &props);
-	if (IS_ERR(bl)) {
-		ret = PTR_ERR(bl);
-		goto error;
-	}
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
 
 	bl->props.brightness = 0xff;
 
@@ -363,26 +363,12 @@ static int attiny_i2c_probe(struct i2c_client *i2c)
 	state->gc.can_sleep = true;
 
 	ret = devm_gpiochip_add_data(&i2c->dev, &state->gc, state);
-	if (ret) {
+	if (ret)
 		dev_err(&i2c->dev, "Failed to create gpiochip: %d\n", ret);
-		goto error;
-	}
-
-	return 0;
-
-error:
-	mutex_destroy(&state->lock);
 
 	return ret;
 }
 
-static void attiny_i2c_remove(struct i2c_client *client)
-{
-	struct attiny_lcd *state = i2c_get_clientdata(client);
-
-	mutex_destroy(&state->lock);
-}
-
 static const struct of_device_id attiny_dt_ids[] = {
 	{ .compatible = "raspberrypi,7inch-touchscreen-panel-regulator" },
 	{},
@@ -396,7 +382,6 @@ static struct i2c_driver attiny_regulator_driver = {
 		.of_match_table = attiny_dt_ids,
 	},
 	.probe = attiny_i2c_probe,
-	.remove	= attiny_i2c_remove,
 };
 
 module_i2c_driver(attiny_regulator_driver);

-- 
2.45.2


