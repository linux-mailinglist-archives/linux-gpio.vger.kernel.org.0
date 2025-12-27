Return-Path: <linux-gpio+bounces-29940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 016ECCDFAEC
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7F99303E3FD
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC755331A61;
	Sat, 27 Dec 2025 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5D2lvHh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB63C32E748
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838288; cv=none; b=XbpHsfBhdeQv6JYkqRSSr5y1TWLUyxquZOsXzpLsNlUnFBwDVcdq8UWitHDDo47aYCC0HRZj1S7IMRucXaggi4Q2SkuesqceIlT1CYT8K/xvDiyt5akgkDvbgCy5dQAWvFS+SxtAdovq69rGEOKtPE4gG8qDeDVnsrh38tWnCFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838288; c=relaxed/simple;
	bh=ZtimU7gm1PrFcEfk0MV7OaApuuKINQ3TVVyW7YAfhJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Db6am2AaOg7F3xbVOTeRdy8HZ46dhboJykuN96XZW7NMwvSfNjeUK9zen6MkhlGRzSQG00vCRddvx9D4MkC1WvnVA9bGe5p7+bzMSpIlCdajmh0OUg86D2ghdJ3rBdTN/mqwMo48mz8ThH4EhRl4Bpg4QOxVajZoAQbOFCVn1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5D2lvHh; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso8881561a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838279; x=1767443079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqjJPQ+Kki9Vjm0bw/2XeIC3VM9xGuMuLb0QgtHhylQ=;
        b=a5D2lvHht8oyyQOW/Q3Ixnu7h8kTS2EvkzTL3e+uzTSWZl5rcG99yzWmr2RV85MGag
         mOGcmnNIBOYxsP0sb/ElwrPjtazrr8DzV9SxwkxDgGZ9mOYSGc6B1tZ3D48bWlchpYDa
         YCBhOYc+1OLDktZ+PvAXVPqViAORGU/rdkC+za3nOe8HqeGWik9bneFxuHm8rks5oU2u
         9kNjb3yC56rRC+gef1xI3/czxoFFh7hWZwOJqJRGgHSegl6qFiEvJLBBTUTSjszGyeDY
         DyB8Rwtr/IgEa9mWH5xMwfeiQ2xr/NRia1uNx73et+uW8X0ZeDsRT95dQL5zP29hjMwW
         zaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838279; x=1767443079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqjJPQ+Kki9Vjm0bw/2XeIC3VM9xGuMuLb0QgtHhylQ=;
        b=QBcMBOdFjRfcR/+iZ/5A5HLYQwozSMc6NtMLdWp86xRHmzmjgwQuUgMj6DXupwa311
         P9ItAHFEp+zYSdANeBCy9uME1crcClmoB8U0JBUU4Ern3OkiUrFouFtUcMWsTShXM5xI
         w4rVC2ZeUH23JfprKBezvL68zDkCGzHpJXqi274G54Y0d8gSTa8An3AnKwusyfXpwcde
         sias9VuWrqw2PbWBedjqO2ReK3egncrtyske4UsAwmUo+h2V2AuSz/ucM7dMW06hTAPc
         SwFhNNyFJYe113kyQEkXhgrSb0KjmXYESaOd37oVbCYavqhlaryIqvLKPRjsy+231gsy
         Cqlw==
X-Forwarded-Encrypted: i=1; AJvYcCVBzNwgMabMXHkVnYsyF5RybtvjElPV7vygJn2lzykde4ajSTnqUIGAiX0dJwBvtyLWKZYUN8JH72aO@vger.kernel.org
X-Gm-Message-State: AOJu0YzJwxY1gaZH2ggeac9ONlhgl3sF4YJxpVmzOfRjJQkFkj73fDEX
	GiypyuPYhLF+JpMaqpeaqQ4U4GD8k9Kv4FFh3YMK9JKzrhHmeuePmuI6JulASEe0yEk=
X-Gm-Gg: AY/fxX63gERIkL+MngXduDkJYbmk0hDCD+pqilBOCyvtnc0mcHgmik6dRFn174TlELK
	6GWziwRYBLOOSCPVcfkOLH0PM6QtRJMaiXbqfmEuvfYwtdKjO7jBI1coTxql3mL6+7NxiZ6FKl4
	drSFuDAg3N2W5MeermY+/gOp427BdBfg0k61eFemnfCg7dH5dl8gd6ayKCOg6WjiwMdkhGzG3j+
	2gj9ZlIB6koKSPQP1X4zfq3a3SxgqJwBWJtIcPnSwzyxdoK9YgSdqtED/yOh90ED/9sxu4xlx5+
	nrOCyd93TYxGcJOVZwhZAPriQ4p7qJDKJOTVPR1/UcxWEXA9s4wYQklmbSX8/PuMfhTeoKsVbKj
	sMMRgnsOm3ObnESVkCpMW6F65zTJf6ESobIp77fhLCvisojL8YMAeujPZD4HF9kmpL1baDLbeoE
	9yeBQVECNVs4eMLHH5JrDe8jhITcvQ0UczZKtr/0lh3ZaMBfSaf6xc0kocoGVLbhVkgWFuTwtfa
	7TtpQ==
X-Google-Smtp-Source: AGHT+IE+QRrVPaBCy56QCbI4QkrRX7vUwMKYczTApOAlpziFFNN55uPCnxuQ1egJcYibXo+YhY/13A==
X-Received: by 2002:a05:6402:2755:b0:64d:4894:774c with SMTP id 4fb4d7f45d1cf-64d48947a3emr18801609a12.7.1766838279224;
        Sat, 27 Dec 2025 04:24:39 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:39 +0000
Subject: [PATCH v5 17/21] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-17-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The upcoming S2MPG11 support needs a similar, but different version of
::set_voltage_time(). For S2MPG10, the downwards and upwards ramps for
a rail are at different offsets at the same bit positions, while for
S2MPG11 the ramps are at the same offset at different bit positions.

Refactor the existing version slightly to allow reuse.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 4924c48ee7502c63f7a1fc620a2d252b7d8ed828..beff85c72580efaa0bbfaaefe6b4386edcb00919 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -560,26 +560,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
 		+ DIV_ROUND_UP(curr_uV, s2mpg10_desc->enable_ramp_rate));
 }
 
-static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
-						   int old_uV, int new_uV)
+static int s2mpg1x_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV,
+						   unsigned int ramp_reg,
+						   unsigned int ramp_mask)
 {
-	unsigned int ramp_reg, ramp_sel, ramp_rate;
+	unsigned int ramp_sel, ramp_rate;
 	int ret;
 
 	if (old_uV == new_uV)
 		return 0;
 
-	ramp_reg = rdev->desc->ramp_reg;
-	if (old_uV > new_uV)
-		/* The downwards ramp is at a different offset. */
-		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
-
 	ret = regmap_read(rdev->regmap, ramp_reg, &ramp_sel);
 	if (ret)
 		return ret;
 
-	ramp_sel &= rdev->desc->ramp_mask;
-	ramp_sel >>= ffs(rdev->desc->ramp_mask) - 1;
+	ramp_sel &= ramp_mask;
+	ramp_sel >>= ffs(ramp_mask) - 1;
 	if (ramp_sel >= rdev->desc->n_ramp_values ||
 	    !rdev->desc->ramp_delay_table)
 		return -EINVAL;
@@ -589,6 +586,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
 	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_rate);
 }
 
+static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_reg;
+
+	ramp_reg = rdev->desc->ramp_reg;
+	if (old_uV > new_uV)
+		/* The downwards ramp is at a different offset. */
+		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
+
+	return s2mpg1x_regulator_buck_set_voltage_time(rdev, old_uV, new_uV,
+						       ramp_reg,
+						       rdev->desc->ramp_mask);
+}
+
 /*
  * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
  * only if the latter is != NULL, the regulator core will call neither during

-- 
2.52.0.351.gbe84eed79e-goog


