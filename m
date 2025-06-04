Return-Path: <linux-gpio+bounces-21006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77071ACE164
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14ADF3A911B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816221F416B;
	Wed,  4 Jun 2025 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMK8MFW/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43891DB34B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050762; cv=none; b=gyDGuu7KE9d/vjQdmqdI9qT6mAUquB5oEVhhUVksyVl8m18AXRZUaGHkNP3HgtwbSZ/Jjf++QPL8AmWxiKjPzZQA/ObnC5A/3lm8HNuluCi77uC8KlIaAFq5ADLtX1lz7ICQQVZZvkTWZ+FW3fI9U6U21GgUHh4wLc0R5y0lMiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050762; c=relaxed/simple;
	bh=xiw3+9QQT1R6rACHzAcfRAzeIULsoWcavNAe3lOvbNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjKIqh6wKLqPwLflihdYaJV/xBDkJrOkV0OY7BlvJiFPQ37EeQzqLmAheGMVF4OOzeFLyKaFWRxxNBcKkyJYS0PKcmEscELLhkcoD2NPBuP9xalVhhLxt6Tw2Qw4f5qLsb01n7wiBcXHNukTd6/JADkXzZneOEbkkgY3TLusoTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMK8MFW/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so13165015a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050753; x=1749655553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqcmeBNmmkfD7/7jkYs7xVbtGf9PYopW68JKLRAxWfQ=;
        b=WMK8MFW/jB1UTk5SjsLI8Pnx5mlvvop51NaNR4erhtjqe/Jln5vG1fHsZPybL3arIi
         8nMVbNBbJobJebxhxDzshVLVxLW7FxPsP/q4Ju/JJ9LEyTOgvzeN+nRxWLpm6O5BrWiB
         a786fS7jh6DHr4RE38zKFzVSlcDbnIY5hsMUhNvGJ+DOuGaJmcMuFnVekAHfKjKVvgRu
         v++2ywKlQWUlmgRb1CAlPLQptYaO7ct+3cQGviIMcyWkAvM2UxWwZ2UxjgEV53Nr5NKT
         L73Am5YQ27wD7PunsyxnnZCQ1wKprAX4XOc5xykIjA52XeiTtgkDGnYs9lKikTlrIhBu
         MDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050753; x=1749655553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqcmeBNmmkfD7/7jkYs7xVbtGf9PYopW68JKLRAxWfQ=;
        b=c3YyhNPWYgJ4W6u9f1n7sXVOt30hk2AqhDjQXNZa2DaBzqc5urJzS1NpE/+ZyjCWoc
         N5lm2UH3QbE/hSnq80QDGxph7DKmf3KpQ3eXLKWmG2QsnMiLuhuSjMc1cA5VpAK8zgUL
         dBUHiNCOwiJN0rrLLXMW6A9fiQbzk3uP7dW6IevbChd2oTo4FmtqXIfEqMrxSXBlq3S9
         v32JqYgpaitR/7zOOBNUjwa15vXy+9ur61vAJTiqnts9qvTIl23YZsh71+ZyShZ0HIps
         jp0cK6lh+d7n1BHZuCxr6p1grjiVJxuVXuwnMJ2yfVPbKMEJX8Ax98fWQ9uwJJF2JQ5+
         mJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy+mkXogLznuP9tBDbxY22XmUHVtCClbuyF/JWf7GoD/tNObg22J3hzdukhoOl2ogQlsfnmDV0Foq5@vger.kernel.org
X-Gm-Message-State: AOJu0YxjBYGF/tfGDoRGxh4m1a0CWr0UsOs3WongUgtcoO+mOIBIhC9N
	hJSb67Qjewglcw10tHSSZr8e69e2tsxIfTtrw8gXZRMp45OPJfPhJnxPHdceXQh6Ons=
X-Gm-Gg: ASbGncvrCFOOhOOWDGZgA+dMP5bpS/leNemc28sDuu8P9a4O8FS/pRAoTTQnH9MQHKQ
	R6mEbXXPHdQVB/NqgNLKHPozsyAQofX7k8pRrxmyqms7N0fitlStBcamYhd35GeqEuDpaTUzT7Q
	RaziYgq06beNVBcpWD7yAhbsOhdILMNWLvesZ6a7SaTahEee6MZloiSjbWjAu/67XJhS6jspRG3
	FlrQga3ihSbzL7siDJI5T+GQgzbgd0Zrk/4Q8WyINBIpDSpXY+HNkvUj4gtSl/o0HlpTZV13RCS
	HpbXh0sRhZSc0PSiDAaujxgtOdkVrES3uGfkEKttsrmZWTq9yE+gFzWM5k4Ssb1Owazymq7F3pd
	lgLHTo82zLhI1mkiqnL5nVmQSD/6d13MPinY=
X-Google-Smtp-Source: AGHT+IGtfaNvbOgLxL63zDuI4O0A+DETos0BCLMRQDwmpSXX87hd3C1qMtwAXr3zW2EH0X8wSGXcrg==
X-Received: by 2002:a05:6402:2547:b0:604:c4fc:70c with SMTP id 4fb4d7f45d1cf-606ea5bd9c5mr3000623a12.31.1749050753425;
        Wed, 04 Jun 2025 08:25:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:53 +0100
Subject: [PATCH 14/17] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-14-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
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
index 6fe6787044c40216f7a0355119981b74a8f56e58..f427895637a32f26e2960ce7c7879632f0bc2dcb 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -562,26 +562,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
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
@@ -591,6 +588,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
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
2.49.0.1204.g71687c7c1d-goog


