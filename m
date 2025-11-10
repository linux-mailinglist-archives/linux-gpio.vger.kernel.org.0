Return-Path: <linux-gpio+bounces-28318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 691DDC490BC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C47F4ED106
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6323385B9;
	Mon, 10 Nov 2025 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDz8IoDU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6BC338F23
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802954; cv=none; b=MQ4k3Mu4Va7C/topOhGKPztaQqykovjIpPs3AAN6m3eVEDzOJJadP4v3JZlm/TmiyVkNnJF0Q3jEbXYUnQs/ltIjoEdx+53sQ/dJZvNrdR1/Hw2HEeY6WKrT21Oz3BxGoEnvOT9R4nlwUtYiYuH5xvAHG/dcu4unZ17OmhvD+us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802954; c=relaxed/simple;
	bh=Rkw9WFZoXp+5InFPPXxrxAJqP9DWE+hJyBAEvtT6sRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2exDtN3MmGAmH8mXrCaCaIS5m+eNUYJrAk5OnG24F+eVEJZcs2W26cwKZN5X5y1ZxBsgjF34lwxdtIFb9FCAumYzuESu0uuiMIKYarFr7zaZwDCAQO5Q+ft4kze7NVfVyKxkEYz+KTmkbM+XS4+PxPs70U2rLJvSbfhHNgOeVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDz8IoDU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b728a43e410so732797266b.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802948; x=1763407748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GRGFlvExyifoBhuyafidhUoY1iG6eXyVZefzJBFYOs=;
        b=oDz8IoDUazH9p5kgYCIvBiK1g0HMsJ6aUJpQ3ZpW4XziCtpineqk2MaQAkJzO59x5b
         IyazJNUSQ04oMKvPXIsg/0yIHjGCOZkMF5NJ/avKdMLuf6tW/2A/LrK77BPkvEG+MSC2
         83YyPf3Dsso/suNWZfKgahuwhmQuacIrYKuZqHQ2kiGaWMXhiBcrEfi8pDYWxM0KURrx
         aZz4hk8eK15/JkNWOD1y0goJtYCb1rF2Hn3g9/eZlSYO+W+oegHmu6FyPw9S1GdRtWYA
         p9eRJF8H2BQmSO0igetho3Du5aW2xQ8cNymjioAxW6hGxJYmlYWpUjrvIZTCqmwLo2N9
         VCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802948; x=1763407748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9GRGFlvExyifoBhuyafidhUoY1iG6eXyVZefzJBFYOs=;
        b=E2O4zsqnKWd6p76esxoXipaYKrVhIM9CrUdxGowSlhGGIxXxUcZiOdZqGgK0gGV2oD
         Bx8EKbgaSeb8phLIKQtQboWSc8s/1M/xQlMGZhlG7c4sPqpQgkiB6Jlcngp9lCUfbqyW
         XQhJd2E5hnQxnv9uM7mkiuD+12haOEpe3QtPpcvJ8Nx2ePIdUAFfoQuWOiIfDzmeX+FL
         yH0O7ZSZI07q7jn6HAmd5plkQqHfSO7EOoOFl3t1NCpXQ/R9KWuSl39gVIHdpgeBUD97
         JSk6nNhAt6xm4c9icIz2RYOWmrLOxQ4313kv2oa6dmxWekQJ6xYU2jV2RMibz+UhymN2
         rN+g==
X-Forwarded-Encrypted: i=1; AJvYcCUSMdPwawxo1EfZQ/D+3iNePav2x5KRuNKImc5rqaH5Y20s4yhO+GoNVDJuEWzsQiwzT1vHiWIjbkVI@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgHtoPSJCbi+g/CPCK2agf+JQRlJf/QQM+9ltPx0aV1qwcDGc
	K7PkVFHonJ3G/gRITKV46FbcNOt7iHeFiS+GWkUbtCyhaMfUTxm2WPAM/cm7YTlJFLU=
X-Gm-Gg: ASbGnct1no2UWaB0rnWp/9HOK8jsmcQoA4WGGXxvf9rJdvhgE1XGO9KMwnmrYMF2KMz
	voTp9d4uTKZJH1dIPE3hlSpd4k+EOXGewCwPGRjspm8wKPWLiCFmMgftrNKmoqBj/EmKawW70G5
	bMbzbLt3XG84zXTDZTBP0JD/PrdjsBYn+AhbT8jnuB0O4kBeXNCnC13VXAHDIYGbNnCnXiJVdBc
	ijdxrQvE7h0sBhK4pTEhu/dfuv4vsGK35vCr3cTqAZJOvE4WZbDUImYbnhXbqeGLNcXnjoP0R3F
	I0a7emEK/BKvblIZ490gXm8CruZaHdHpmOa+6XY7EStluKo1+7qMezs5ZBHWWgD7vxJ0qp0W6UM
	DiAL1qb4cnklqXKRjv9Kw//MXSiMBzOlq8E0/cTajdwkxcS/LhX60+VRgLdo2XWz2LitBh5RX00
	7CV3RpyOBWjIYYNxoJL5o0Xrag5N8tXmGW0RzXrDwgy+1C0AEJE+5PRF1f+YbnQtKHRmIndEE=
X-Google-Smtp-Source: AGHT+IECpKLFUmLjNWELv2Vm5UCSytpZeRz/kU6StwzL1uQ1NedMDX8f/lYYWPod5BD9l7i7CF9NzQ==
X-Received: by 2002:a17:907:7fa6:b0:b72:b6ae:266 with SMTP id a640c23a62f3a-b72e036bc01mr885816066b.10.1762802948072;
        Mon, 10 Nov 2025 11:29:08 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:07 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:29:00 +0000
Subject: [PATCH v4 17/20] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-17-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
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
index aff85138fa5da4cff83bdec5cdb3086a58afc7ce..d840aec236dcbdc8b460f89b4cd04e42e3b3da7d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -561,26 +561,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
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
@@ -590,6 +587,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
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
2.51.2.1041.gc1ab5b90ca-goog


