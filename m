Return-Path: <linux-gpio+bounces-18440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13235A7F692
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1A73AE9B7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03260264620;
	Tue,  8 Apr 2025 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Nn8LGNts"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162C2641F5
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097797; cv=none; b=s9QOiES+/xCVZDKTlrLFfNaq6FzlSNhYB3ArqAb0/K3cn1m7kA/xZPupPWkafD+236LEx4HNnJba+F0q1Me+151pVJAVo+LDUlp7ums4Q6R7V5v0ofPMfiUHovcTGx8h2i39MGWUIxTb/q1NhWQYTHGvYU+PNvdbrru29xHybXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097797; c=relaxed/simple;
	bh=jYN84no5HfMrvCOtmNwOTquSUUgh/6PVglmv/98TzZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5kLRp8E2/pwuoxamPiV87kj8vK9n1vKlbPpBFn4W3XpDcNNRzSryRNSvy4QE5WrV5ExRYgdzPZRJXt8kTAtbK3wpc1Cy1ka7t4A6ffMWQVJUdGom0Jj72RCjtlLcppC+M/syHxKxB7mRYijQHYbsMn+z0Mm5q/r5+Bb8KtrGNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Nn8LGNts; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so23021345e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097794; x=1744702594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHis8ysDm+/ce9937f9eb+O8K3AUE5i9Qwr+5PKEGCI=;
        b=Nn8LGNtsvypMEqPk8ddjC+3x5t8Ln9kzsj9uChKAAk0L3htMeta8QGCYrem2z0V8ch
         ZaZXSX64D+z9NTpvhFAH8ZZzoT6vZqAKcz5N4WEI4t7wPC5xSDNjvT6+ASpVLLJOxMcd
         0ns+4jYZ72aohBaTzWrXVZuzo4jKqUZNvqvvR5xDRHDWMSpKUmt5QlhnKXNg01cBsMBH
         u+vIuLDrvbo2OcBGZU/DUkp99zlYzdigHH4oN16MiA/6q0WXf7ooOMlFVTtTe8LW/gL+
         v1lMzYlVatrhonk8Rha2SYPEZXDSjgxcdThefwpNZKZcKAoUfrhcELOCxpSE7ks14gqQ
         dP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097794; x=1744702594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHis8ysDm+/ce9937f9eb+O8K3AUE5i9Qwr+5PKEGCI=;
        b=eHikYT+PH0L/3+4LoUgu1IhVcPcwVrsc7i3u5HRzIDfSwshMyWfCzIV4VZk6rjAksO
         wKPD6tRvpgA3N9lOErSffA2WUSq1b9AJSqG4G62AtGn2fw7yNy2xl6U/giwPRKJ2xiN/
         FwI4iR0bk/rcMO+74GexGkYCIKHsO0t4EaU1eNCYlF71eZRT5MXkQ1hhd4oQ6N0C18U3
         lt1Sm3b73ChsTP6kM+Ii5QD03/6N51tgznEFIQQFn/jYXS77p8KSDkRLH4dPFFE4oJ6L
         DYwU613kkeafZzNRETUctNEpJpR3RYAVpfM5NRlVy+VMAcFbg8M9WnuBMY5ncIvMF9UR
         PbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVubnEZgaqVUt+Sa/mbnB4xZxtfZ+uFxYmbQGhbsfgkQuQzp5PUxYEF8zvtv5228NRse+lg5XUStWz@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfvRRYnTdBq28Xz6VSJQ16mU8eZS36o+GvfqFe2gkhRDduT45
	Xn93ElTiqCtjWN4v53/cScKxfqpqsFQFVRhwxYkdfLI4/plVlnFfMjjrukaoKJQ=
X-Gm-Gg: ASbGncsgAz/xoGShQp7TAEZIrteq8kLJG/1xvNuo794KzjHJetOFl3gOQ4vI4zeCxqF
	IgOp2jGCjnCkEUxkt/A5ns1m9w0H8YH6dR0dGr9c86QUYOV7xGxm4rdw+dGassS59GMipe65Fvf
	jTs2UhuPSSH4ZhzgkAw4CdvnD5E2dS5lhhUPZAmVD6XmNIirZ//th3vQMuvWifn1PL4hwfiZgGF
	XYWUyQVT1CfuwxeYLiZvANYuD1x2p+le3Qik0gexDy7wYHkwwwN1WQzAZSa5KSwdG3aMARO8SWM
	hYWOTb4cVo6+3loVLNEYH5R4N0yl3Pb7rhbJHQ==
X-Google-Smtp-Source: AGHT+IGHagAQNTtn2a+MuMwHyBshBsQtM9UgV2ixBg56P23KxFjIh375u0gTz/ubybm8RglkXY7FFA==
X-Received: by 2002:a05:600c:1382:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43ecf8231a8mr152102955e9.4.1744097794503;
        Tue, 08 Apr 2025 00:36:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm14287627f8f.61.2025.04.08.00.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:36:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:36:30 +0200
Subject: [PATCH 3/4] regulator: rpi-panel-attiny: use lock guards for the
 state mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-regulator-v1-3-a18b6154b31a@linaro.org>
References: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-regulator-v1-0-a18b6154b31a@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3451;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Cm0XoajVTF7WGyfXVhXt5rXgkMBzUPTLlPuMZdlyTXc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NH9Pmx8NozKyr2Yh4useXvhNRl9MT5x7yLAm
 2Z1OrJBtJiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TR/QAKCRARpy6gFHHX
 cpdOD/0TJ2PvGhJPRb6muqCjVh6EsoEvWJ62CYpFC7GLKMbP9kosgqZRbg6EY6pbiQaREHAPLc0
 XF1Pgj4ipR5iKaieNqfJV11RL1vPr9dfZ4hjU/YoCtHeoQl/oG2MWXGVFsIcb8raL3xdQ87iTl8
 wQBrNOzOlMCpcnakqxkC1pmo366tNDO34hDb5X72FQ8QvevW9YT5J7Hu8L5fq/TwdnPWcuOKw6e
 Qs50ASLtjcbqOGpwwxJVBfD1j1cE+xhLBBd4svrqThG6TDn5Ks+ixcHLsnxkgQz9oY3jZUgDQQT
 EvOcHhSKwmSJ5BzuomgfCoGvJaLJ8lhQjU419CPlmSj/csMB5hVguJ0AqJB3DB8ALky5hyUcKAb
 vFZz2YhuGPWb91KW7RgyXQPumPh5yYsW+Sb5u6h/VOWRgtR1lE0H5WDpLs6s9vWeyV027Ed4MZW
 XZpN8Kffo2PSye8H+Oc7xzjF6L8XshROKx8DS2TFiD9jfWsdOs/k8RiRzRZtiqDS5PyvmwCisbV
 5qX1BSIw+syRhGirNNEm1LXlh45YEnetjuP2SXuqrMqq+L4hRmeixS6GXLJQDFZoqCTQR/0z7Lq
 DLBZOqybxUROocdeWM8s4oRAKN5i1SqgiByVzDL0v0eiQ71nsBAJ/HLH+SGwODtnXLEZvqUYWhM
 +8wA0vMGpZEWThg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use mutex lock guards from linux/cleanup.h to simplify the driver code.

Note that ret must be initialized in order to avoid a build warning as
scoped_guard() is implemented as a for loop.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 35 ++++++++++----------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 5ff348939560..43a7c4737cb4 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/backlight.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
@@ -94,7 +95,7 @@ static int attiny_lcd_power_enable(struct regulator_dev *rdev)
 {
 	struct attiny_lcd *state = rdev_get_drvdata(rdev);
 
-	mutex_lock(&state->lock);
+	guard(mutex)(&state->lock);
 
 	/* Ensure bridge, and tp stay in reset */
 	attiny_set_port_state(state, REG_PORTC, 0);
@@ -115,8 +116,6 @@ static int attiny_lcd_power_enable(struct regulator_dev *rdev)
 
 	msleep(80);
 
-	mutex_unlock(&state->lock);
-
 	return 0;
 }
 
@@ -124,7 +123,7 @@ static int attiny_lcd_power_disable(struct regulator_dev *rdev)
 {
 	struct attiny_lcd *state = rdev_get_drvdata(rdev);
 
-	mutex_lock(&state->lock);
+	guard(mutex)(&state->lock);
 
 	regmap_write(rdev->regmap, REG_PWM, 0);
 	usleep_range(5000, 10000);
@@ -136,8 +135,6 @@ static int attiny_lcd_power_disable(struct regulator_dev *rdev)
 	attiny_set_port_state(state, REG_PORTC, 0);
 	msleep(30);
 
-	mutex_unlock(&state->lock);
-
 	return 0;
 }
 
@@ -145,19 +142,17 @@ static int attiny_lcd_power_is_enabled(struct regulator_dev *rdev)
 {
 	struct attiny_lcd *state = rdev_get_drvdata(rdev);
 	unsigned int data;
-	int ret, i;
+	int ret = 0, i;
 
-	mutex_lock(&state->lock);
-
-	for (i = 0; i < 10; i++) {
-		ret = regmap_read(rdev->regmap, REG_PORTC, &data);
-		if (!ret)
-			break;
-		usleep_range(10000, 12000);
+	scoped_guard(mutex, &state->lock) {
+		for (i = 0; i < 10; i++) {
+			ret = regmap_read(rdev->regmap, REG_PORTC, &data);
+			if (!ret)
+				break;
+			usleep_range(10000, 12000);
+		}
 	}
 
-	mutex_unlock(&state->lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -190,7 +185,7 @@ static int attiny_update_status(struct backlight_device *bl)
 	int brightness = backlight_get_brightness(bl);
 	int ret, i;
 
-	mutex_lock(&state->lock);
+	guard(mutex)(&state->lock);
 
 	for (i = 0; i < 10; i++) {
 		ret = regmap_write(regmap, REG_PWM, brightness);
@@ -198,8 +193,6 @@ static int attiny_update_status(struct backlight_device *bl)
 			break;
 	}
 
-	mutex_unlock(&state->lock);
-
 	return ret;
 }
 
@@ -217,7 +210,7 @@ static void attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 	struct attiny_lcd *state = gpiochip_get_data(gc);
 	u8 last_val;
 
-	mutex_lock(&state->lock);
+	guard(mutex)(&state->lock);
 
 	last_val = attiny_get_port_state(state, mappings[off].reg);
 	if (val)
@@ -239,8 +232,6 @@ static void attiny_gpio_set(struct gpio_chip *gc, unsigned int off, int val)
 
 		msleep(100);
 	}
-
-	mutex_unlock(&state->lock);
 }
 
 static int attiny_i2c_read(struct i2c_client *client, u8 reg, unsigned int *buf)

-- 
2.45.2


