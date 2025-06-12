Return-Path: <linux-gpio+bounces-21433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60AAD7009
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7F817E58E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2662622173D;
	Thu, 12 Jun 2025 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w9z3Chpc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD017A303
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730803; cv=none; b=PYvagE/R/UjWz+yuK9d7DR1wXi8I3ccmj3ZtsaLlJQsgn+yw0RGUYO81b5ggSvQgqge46eLhXKawAiF6grB/6eD4s5aECe9fNCk1KBkDuTHeL1AwLv0vmCkcTBayr/NOmBhcj6O4Osn4q8HfAmzDH9F0ntDQG/DH54xR5a3hXAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730803; c=relaxed/simple;
	bh=MV7WWD7aP8zFL9/6zwq/QPgx9aLD7ksdtanRoWWcMBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mF6THju8wJf4uNA+/U0RzXj5wzx4YP7ilOJPMnnasBGPt88fXLQIyMBhCURU7nz/T0hpjxdvXvoh/McRa4LpbSszTTjj9oWouMP/jEZQcn6R1tjm7IKom7plhPeanZwE6gI/FlVoqCt/+WwXsjnwiat4Wft9iiKKwK4wRHI6to0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w9z3Chpc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450dd065828so6338515e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749730801; x=1750335601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slXKp62oEtgpENi4ky0sxbAPYZFOc+4308ih6+B94Jk=;
        b=w9z3ChpcvibKFmibGw8M1aBpntXSuT/9Oakxq6Tjgde9SPioNoMGeD9nFt3afHRBif
         ZYcnqEjgljXcnG5hbI2DKTR/vSLPylEpdMRh2gwuvHNrxPaWTjmXmj7q5LDk32kI57Xg
         oFRectMypS+w/Wra4NmbEdF4d8Y89g33/3h/MuoiTxZrSgHGx6AVAjbGRQKMM9oM5bqj
         HUkYz4BsmZeJp5rcxuxWppx01XiIwIXCca17Bw4CNXb3GrJnmOjDlmNZaNHIkfbed2at
         aPjcsqrwEI7e/PM8lGudKsX0Tk5v3CQ1VREsh/qv6BNLnYcpM4W2svg9E8cMDQqkw9ne
         qpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730801; x=1750335601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slXKp62oEtgpENi4ky0sxbAPYZFOc+4308ih6+B94Jk=;
        b=Cx7rzouBcyxGtG5tzB6/2K2TDOLrncYtSw8Jw7FS1EVDekZW5vdYbRDgJ01RoWKaqz
         MpaYDeKltv27mbdNCnQ6sJOyiVZaSS9vKP9hKnpXNy86a6pBKCJLqVaGTaI17iVlaD3L
         JA/t/CGENDrF+G0dQZ0e2CpjMLhfUkabt36v4tZQyaN+RGpCA9BoYORAjHH2ule9rEMt
         z++IaliU1D3kSpW+sb+1QLDZAKPIok61vzTd3L+WpZ+6JJZQbWF4bb6xutOyckn2Duc+
         tMsbe7x97XrJb15AGwr+s6/kno6a3SMy8V3vmE4n9xOw5/GdCQv8tkXfsDcNQhnAguMn
         tuOw==
X-Forwarded-Encrypted: i=1; AJvYcCWbs206cdbLjssViLRlIHI6HUPTk8DRMXqESpqyl6NvynDuoQ58ozmEKCPl3pn/WgZjXhJo0xZpDAYQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4EhXJBoTq7tEsU3qrQpWzxHBb86iaEXD/PMyFom0HU3yPPIB
	35Arr+pG7GUhrLHUrCQz63Bb9X6H8vrgJYKwePDs9vvmWnQftEMKRW6402hvj6lTv7k=
X-Gm-Gg: ASbGncuK0dxVt0eJkC/8iQI7sbDhFSTFtdUDKWU8ugTKxp2bXo4Osuyb7UlO/jwVOdc
	cLVi6x9bVgmKspaHRGv/6ATYuxZ5Fg2tXj+DveqefarjBZsHMUWGpCmC5KERhUMNvnHiWlvfHdO
	3Hp7NAigc4kloGaPTFJXE5Ad+T13gmEpdfeJ1ZsykyUGIw18voIduDf6NzP7bvmpLL4/PKTjazO
	ih6KTJeiNmj8X7q+3ncMSeBwmFx7INMSrQgd+i7XGbyAimb+nROidXa8F2l9pWJo/o5A0b2Kvnq
	aK5TgMlNT+/AT8ci99LkdMoEAUYXrPYvarzL8B+qDJPiZauniy3n1ONx
X-Google-Smtp-Source: AGHT+IFZVpd5SwvZHQ4okUJl1+kNStWK8IPREbWyVuykBKixK1maYyY1mYCnG8ZMwjAexY1NUKEBVQ==
X-Received: by 2002:a05:600c:8b24:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-4532b89f9d3mr37876645e9.4.1749730800576;
        Thu, 12 Jun 2025 05:20:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm19636035e9.6.2025.06.12.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:19:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:19:54 +0200
Subject: [PATCH 2/2] pinctrl: cirrus: cs42l43: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-2-2d45c1f92557@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tmlGLFVmhKjDpoU/ZmO0d5G9GS9wdTU82foN7cuVU5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsXtu3oZc0ggE1YHtNR4R3YGb7xFBvTHq9kYc
 14My9ZeF/KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErF7QAKCRARpy6gFHHX
 ct97D/4qhEmc4z/89NnKEQrPpK8Fy8UnbOlTAiCKLbzWSAEAizaZZZ/Adgu1Juld+LTarpSOq3S
 o8yk6FrwEkCtAjm/ihdwG7DLfVqfM8/nCtArkQDUl5lK8jeKAfczaC+cXvgXf92i+HHAIFWY2ad
 o7BgDUSTcBKE//9ZlgqqZmtgMne/9pAnmrMXSi7D7a4WoRb2WJiWTHKuTdT/aX8ZuBMkuX7wTIg
 WLCjf13ASOtlVK3A+/XTAY/BMCqdA5f8y1gy5MEet3jygXtRoDzQWT1ooGvX6p+n2WRs9lKd1X4
 GFWwtOKiQIvHk5Ob0rN3DRno///+snNx+Ec/aPVANt34nqOq5YL7q8rxpt11cyJCRTY1shK278o
 64F1FML+G1swIkLjfCnosjVhgSIbRBNmS7iQ+teIKDmTtGutdHlwvDtlU3aP/k/MwdCX3jyoLmR
 6ma3LOofueXY2b+S+jSHtTL7D+Mr9pa4jP0DbTdqUrEcGr1JiMOTfAL0S0tPCN6NSbkfccly6Wz
 AloSFmnvIlmmRkp+cMn7R30cStcJkxUasvfL18vgs5RHl/wkTw7WTDcyXd8FkW7POLgsP03KMwA
 6GceY3eVSLwIuMOy3/08U93k4oU7AdLxrCOVTDQvgrWUXNM7emBHylRYvEvNnWEZOmsgM9i+ymq
 K7dmCSKqqsLuquw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 628b60ccc2b07dc77e36da8919436fa348749e0c..29ed985273eb47d06f6cf5e6e41078deae4cc2bb 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -483,7 +483,8 @@ static int cs42l43_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct cs42l43_pin *priv = gpiochip_get_data(chip);
 	unsigned int shift = offset + CS42L43_GPIO1_LVL_SHIFT;
@@ -493,23 +494,27 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 		offset + 1, str_high_low(value));
 
 	ret = pm_runtime_resume_and_get(priv->dev);
-	if (ret) {
-		dev_err(priv->dev, "Failed to resume for set: %d\n", ret);
-		return;
-	}
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL1,
 				 BIT(shift), value << shift);
 	if (ret)
-		dev_err(priv->dev, "Failed to set gpio%d: %d\n", offset + 1, ret);
+		return ret;
 
 	pm_runtime_put(priv->dev);
+
+	return 0;
 }
 
 static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
 				      unsigned int offset, int value)
 {
-	cs42l43_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = cs42l43_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, offset);
 }
@@ -550,7 +555,7 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 	priv->gpio_chip.direction_output = cs42l43_gpio_direction_out;
 	priv->gpio_chip.add_pin_ranges = cs42l43_gpio_add_pin_ranges;
 	priv->gpio_chip.get = cs42l43_gpio_get;
-	priv->gpio_chip.set = cs42l43_gpio_set;
+	priv->gpio_chip.set_rv = cs42l43_gpio_set;
 	priv->gpio_chip.label = dev_name(priv->dev);
 	priv->gpio_chip.parent = priv->dev;
 	priv->gpio_chip.can_sleep = true;

-- 
2.48.1


