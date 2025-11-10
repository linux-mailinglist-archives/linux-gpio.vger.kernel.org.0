Return-Path: <linux-gpio+bounces-28316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83026C490AA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3203D188B410
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D5033C510;
	Mon, 10 Nov 2025 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ouyeRHYf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838E338905
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802954; cv=none; b=aYzdrdExcrW8RKXTptH8dRDBYBrhnV/E1OpwthhbZrIkUQL6LW+E7iaiMgkj3LR4H5icQxJPUQSzUv2s9Kd6Ybm6ee+GnRAHut6pLLPhpCCD1r5vfEhDEoCoNshpb2S84j0SBY3eIZKriOKahuhBafKu8nY5/Rkg5jPtVM5dLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802954; c=relaxed/simple;
	bh=QlgIZM6a8G7ebRRBr/Ymjzyq0EM2ZhxwbkcfrP/9WaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ydvedre4L7TbuY//4oMY3KYSlxWRGCzXp2Taw16OyeeC41i6YzaNuzWhyr8G8HgkUM7hhy84yJXi8awZYDnSyAHLFzay9w1EbNZMFs7RJ60gkGBTplCyT1MILcPrvtyjg66LXWJP9zmJ7GmulVkP8ZNzrPygvrfd7GkNYPB+oWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ouyeRHYf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7277324204so602709266b.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802945; x=1763407745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKonCPupUC+bG3BYmfoKbIV6pthcjc9BkK1iVxTRfG4=;
        b=ouyeRHYfaY0R0Ei9FUaOlbjh4ZAnqlZf7fSDPyt5fA0DXQZSrWa/OZORxLlcRtr0x5
         H+8s2r1YoWlQLFSoLtEzyjYdeKPbw2nPNJ0UyQwhOL/whm+5PhYG1IagxVLSXJC9god6
         1mqEXKKVAyyyARKA6F3ySTGGX1JguzyI/PAuQv7p5R+5zvLKABveJhfP1Y4iR+4ZnLZ+
         2zxGoCdGocXRChsGpxcWWWDVcq/oIX5HnifpbXMWeIPcMwb59yLIqTVAn0x8tqPbCFNT
         FnEHn+tC+PCWgoJ1la/zd3lVCEMFRnBS1lLNrCKfpZNzjkQLOhUjrs+RMrC5YfIRBJqN
         qTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802945; x=1763407745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zKonCPupUC+bG3BYmfoKbIV6pthcjc9BkK1iVxTRfG4=;
        b=PXAKHoBb/fhtMNI+SBbWxxqo4HViED+uYS/cXO/9oVPTWQnKuOY8ylgFputuX8uCZ6
         72cs6QVe0ModLvdJKvlIc5j0FQbZ6yUQRdOO/AQR13js6EQgtILh0/05nuviaTHoUOlK
         g6OOr9J7irA9PrqNzt0tfzu2MHHna7gRRfzerOO1kkCz81CdYHZows3q/Cf6CpinBrnX
         qRNbeibMvtnsZgZQKBQKzNlPIrQ1ydyMeZIb00KhnuJw1iTS1g6Ct2A2TK6t5UiLWH+s
         RA4J3XZUKFAnDZCY3z8EE7m6v0eaV5KFV2g4cL8U9j/rEewumbXgxnuxGl4QOOA/nNGI
         zQzg==
X-Forwarded-Encrypted: i=1; AJvYcCWQVWZlV8h8pJIHP8fKLvijYdH7TM4Y1/+DBaKdITzbTKG6iofca1W2kMQZdM4PGF/lxzhDOs1p/Xee@vger.kernel.org
X-Gm-Message-State: AOJu0Ywblc8qoIHuUTmQdcOL3OfaXPs3sZRheh3B5YXiH/fysEUmz3zu
	7QLIie+w7qRkU7CnLh/ImEBu9Zi/hoYEsOWYDGmgetS0wA9pX2Vif6yBXITKNtE4VpQ=
X-Gm-Gg: ASbGncvtYOD+9FRhEh9JDG/WrXcTqLW2j/0PRvjd3dIvFmGbeGiQ+YlEmtDU12hviK9
	JwOaw+6ZJHcCr18/gaw6Rjl++5yyk0GBMATIFw9KZ7cNN9Sd6xk1QmTVqhqxSYIPRiIFYVEz9J7
	f+Ub5tUkT5KUq7F/YIs0h6Q+pPTzDdEH/EFGkNyxRXug0Xw4X9HQ34P5DUg2QCtdJhCg2FK0u3X
	zlV/vw1pKoqprY/pmo56UDuAxHTDnu80WDI0mArzeU89ljdQ3JcGgSuTv9pndsLmJRmvtpFbm8/
	by9IJ+oz+rSzYHTY8GhM/pRp8OmWVlXpzyvwOzis9GdqqRL8m/YAqi269mMamirpZMGlYrYiB0h
	L71icK/bNyy3VRTJKPoU3rLIsrvQwhfoJNDl7M/x/MRJkUIJyo91BfrWWSrAFglVa7IBCWavVlV
	gPt3d0BWgOFTTc6zVYsrDxd7qvK7ZeKG4xUp783A9wco4wM5k7PyytNyvsUytX4/s0oxEFF6E=
X-Google-Smtp-Source: AGHT+IGociUEXCMH9EZnqdHW6O6NvooD0NFgtcVgxLnNvsoTMYo5GwswgzK23CjfOBC+ZZdaBDycIg==
X-Received: by 2002:a17:907:9412:b0:b3e:e16a:8cdb with SMTP id a640c23a62f3a-b72e02944e3mr990967966b.12.1762802945515;
        Mon, 10 Nov 2025 11:29:05 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:55 +0000
Subject: [PATCH v4 12/20] regulator: s2mps11: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-12-94c9e726d4ba@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages to add regulator name and ID
like in other messages in this driver, and update messages to be more
similar to other child-drivers of this PMIC (e.g. RTC).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 1f51fbc6c7b6e158f9707c04d9f030b9eee5e842..30586e9884bfb998ff07e3148813344b307506c0 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1249,9 +1249,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
 		break;
 	default:
-		dev_err(&pdev->dev, "Invalid device type: %u\n",
-				    s2mps11->dev_type);
-		return -EINVAL;
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unsupported device type %d\n",
+				     s2mps11->dev_type);
 	}
 
 	s2mps11->ext_control_gpiod = devm_kcalloc(&pdev->dev, rdev_num,
@@ -1290,21 +1290,20 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 			devm_gpiod_unhinge(&pdev->dev, config.ena_gpiod);
 		regulator = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
-		if (IS_ERR(regulator)) {
-			dev_err(&pdev->dev, "regulator init failed for %d\n",
-				i);
-			return PTR_ERR(regulator);
-		}
+		if (IS_ERR(regulator))
+			return dev_err_probe(&pdev->dev, PTR_ERR(regulator),
+					     "regulator init failed for %d/%s\n",
+					     regulators[i].id,
+					     regulators[i].name);
 
 		if (config.ena_gpiod) {
 			ret = s2mps14_pmic_enable_ext_control(s2mps11,
-					regulator);
-			if (ret < 0) {
-				dev_err(&pdev->dev,
-						"failed to enable GPIO control over %s: %d\n",
-						regulator->desc->name, ret);
-				return ret;
-			}
+							      regulator);
+			if (ret < 0)
+				return dev_err_probe(&pdev->dev, ret,
+						     "failed to enable GPIO control over %d/%s\n",
+						     regulator->desc->id,
+						     regulator->desc->name);
 		}
 	}
 

-- 
2.51.2.1041.gc1ab5b90ca-goog


