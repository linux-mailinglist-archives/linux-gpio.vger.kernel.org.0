Return-Path: <linux-gpio+bounces-29933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9B7CDFAB3
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C663030900
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FD732E750;
	Sat, 27 Dec 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2jzbZK8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559133032F
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838280; cv=none; b=q4lU4ULp6oln5jrfY3H3Z9nxTgj/9+iGa+xvbf5cwohWWdanEBE/9nLc+coUDMHEuWBlk85XU92YFyaqQekPs7Swaxjd6teLEvtziCf93SLbDcaeBK7qNlqQIW9i1HaZJLVqFWlQ4AcSt+NRaU/+yStQsJHJla1+VzDT9T13r9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838280; c=relaxed/simple;
	bh=y3nbh6FW3xPkaxUMs+BETGo9YjxcJnI/N944yZIYtZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzVPQ1GppUOgxckXuV2fm6k50MgH33Rafk8rrDKvbB9DE6iNh92FxIAeOIJZ5NtCCQIJn1Ms0/ZcBy43wdYJOf37E+joBINA9ZnZVJwsAZTN2kT/fogP20FxuG7z05HSJ8Fm3GOSw6frthWXTiTRKWD0UXqABUYsLpfoqsCp9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2jzbZK8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7697e8b01aso1440302866b.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838274; x=1767443074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpM30Q4ohHxRfzIKhAO8xW+sYH95+aq2w1aPYa726rI=;
        b=C2jzbZK81UiGsI1lDuNBdt0fgLmHIFIQLKPg8kJo+9ZDUL4D68w4Q1uotX/lVetswv
         tboRZLnnl/NdMkc/R+SaxdNJ/TLnOO4NVjrQ/PzLz5YuHb/bLNBtrFW17n/+89AQBmfc
         Fhc7ehamvwf0mSkv/+6A7kC4bf7Je5biKMvqG/ZafmsxDma/SBvMEelrTXd4s3XdPChJ
         Ap+wI/qhWTgShZtiER/nhoygEtjejgBqQNAOomc/KmjEHwjUx8gw7HFPcok2QuTyHifn
         KqFsc5X7gl2yWYjL/Lv3J1pNrkBPuqLo3ED+RazwrqY09Ta+SE27+XZIIn/+FwmjSdwL
         6Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838274; x=1767443074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QpM30Q4ohHxRfzIKhAO8xW+sYH95+aq2w1aPYa726rI=;
        b=nUX5y8PcAkkcwxae4RdPeuuEvminRgvWdrqB2GZl9gGCexMAOhoPii7F5720wUzCbG
         +R/o3EM4j42xEvFd059Bi26k/JDhAvgkm50O7TjrmrPmHVBpMegBrIneb8jI87Uw9xi1
         SjHbl3lEjlF/5ll0Ue7zwG22IK5uhsTzgyqViGdGJnh2JZqbh+dkTjAAGjWjhDxInE1o
         m0jBhAkBSa6R/qH3uMjw11SavRu6TXQxscIriJlkwSNMVkqg6wVpL0o8RG4xj6cdyNI7
         VEPWLCU0v4BGfMeJqZ06+S6KyHise9WHCXjadrOY0Ec+fqkTwXA2RSkdBVKJuTJ6M+93
         W13A==
X-Forwarded-Encrypted: i=1; AJvYcCXhzgJk8jj9jqKujAXyOds6qs6xvk6H7IxIkgZHJF8CFYj6+/r9gWy+V5mLe90FLogjN2SQogW2XjUv@vger.kernel.org
X-Gm-Message-State: AOJu0YwfIb0iJSpFWQVjJ5FNObi7DICRG9QDRW+ZNpkQnG4/aoIzqce+
	5DcMDUkggqkuZfReR8HLDty0MSZrZbypzwm/H2jALcqentjDdn5PQMcS9LTKOamnJHs=
X-Gm-Gg: AY/fxX4jnsaRAmrO/inFdc1pdh5YGGJk7ZY7ZIQhiuFaA282J82js6ZuL9CBm4tjCOX
	DxMvD3Q1tgsPtfuUMyDe2MDXNRPnXYpSm45gMcY9fdvNfjMdNLCcPqXWqySAYVxmuePM2Ex2OlW
	tiS9Y/cI7YSVQyvbMve1w2JAwwOPBuFo+n07HmMVGII9w8zbf9TUrKQdBQyMBukr4df6E3OkFt+
	qElUZ74kA7k9abaVzv4DROn5JWiiMHeoQzkmNYz1NaaIa5IG/vDqhV6vZ5SEZnYqys5WIpCprSw
	JHUGoLq5aL4op5R79oCcztjsLbFClVmBT9l2bbAhuHW70dukUwE2CJ1h7+QDSk2Cbu4ZUIscpV1
	M+DFYJKoKXm50qlsYDJgwqWWsa89XRWuUBVHgpKj7FuYPf3DyPL1lB5z6o9zWHR4RROtH7SnrNR
	+trQBMoAMHU0ZBd/F0BpaoOuGqcAuCfCPcJRaVVdpDO8nyPftz16rSw/bSHGBaIlrNtA+Cx9h4v
	atAeA==
X-Google-Smtp-Source: AGHT+IHtdsEKevcGZACNYlScwlHYSPODCqmM2Kf20iK43UH8EKdkTB+qjN++AicNMGPFsLLBY/Fh2g==
X-Received: by 2002:a17:907:97cf:b0:b79:e99d:913d with SMTP id a640c23a62f3a-b8037058bb0mr2497508866b.42.1766838274376;
        Sat, 27 Dec 2025 04:24:34 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:34 +0000
Subject: [PATCH v5 12/21] regulator: s2mps11: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-12-0c04b360b4c9@linaro.org>
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
2.52.0.351.gbe84eed79e-goog


