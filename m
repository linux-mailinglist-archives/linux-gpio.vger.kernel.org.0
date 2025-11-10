Return-Path: <linux-gpio+bounces-28317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D3C490AD
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1D7B188B410
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7F033BBB3;
	Mon, 10 Nov 2025 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2jxX/eM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BAC338902
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802954; cv=none; b=bpxedeCIYYUbczpJUne3QI1QVDy0nVHEJAGW3DL14dAqE3whV/Yth1SiLoLBQBzDp3ZoLO+XcFrezg4WFfHbCv/Xx5LkeHa2wABpdFkYF/PUq46USIrh6+xYMR9tBg6BMb2qG2c7Zy/K0peRHacrovD9RbLGOi3RfXaExhRC4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802954; c=relaxed/simple;
	bh=eYixXJGVDTdDGMYyrWgNtepN6ShNQjaLw58PX+iYDjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpqLFN5K9Lvn7UqL1m1ylFPQPiTzia2g7oWEfO9QWQdU4zM/Po2WPKoNWbOp1Jwp5hSw7NP5Us12NW23sWbf/hHv1wgOEaojYpBcmsqWdiJB1Pi+9aPTy9lg0Wxu19qGbj9EWOCTLkmO2z6tIXPM2p0UM0RgYw7iyIT+a5wU+Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2jxX/eM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b71397df721so373589466b.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802946; x=1763407746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fw7S55wozV8jZ+b5ptCozjuTZxOLQ9IoCnelwcEEJ6g=;
        b=g2jxX/eMjDunpBw0s6R7XkWXXwbUXstJrw7lON8/bNFHFDrPmq9F9IlSySFf62gbxv
         PMmVgIR0V8KvagjzqCIzU2sBqlI+d6cVB3Og3zrd37pdSCJYAr6y8GvfuC26hmMLJ94+
         5W9TTzsvzwjq9SpSfaeu3aXB6h5JOoNIJBYKRYStrwIHWz+QK7H6igzgFXF9Tqv9lNBv
         2a6QpdNh1EcoS0H5rJVGiWeSV8JzCW4D+SIwAl8T94UlRlo/BB+Y88jktboXMSjxCJEG
         ztXi3nmQqd90twEzUEIXZrmqm3m+g0uAt9jmqMqG/2tj1xR7BTrYD0p8xaw9qymfddZ+
         MtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802946; x=1763407746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fw7S55wozV8jZ+b5ptCozjuTZxOLQ9IoCnelwcEEJ6g=;
        b=UE8py+N6zKXdSGPgUo6Z/TuAjHO+7HNIDgTb5mgQiGeTrZJkG19rRECJM2do33DW3C
         yBoCkKtMNHVIjBzw5LVoLIhooEmZBkRpPlDDWWOukfi+DgmfYFRSjLc6Mt5dXm+Gv9WC
         35IvNrwjHTqhv0fGDziwfJ5a4dIRUwZFlqP0uc5sjr/iIS1DJlIJXs8tm7DqrJ8XZd+x
         4bFFJAF1FJyn1zoXfK8IeIurtqrzuUKrqu0ffuhaHe5hHchkylN9InZ+w59OSzI+jtvt
         0ZduJC84vUAC5I3+5e/NMlGthh83lBEoUnwgCQzMbguNj51sZbCGptLKF1eegdwWbBzo
         1fNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkmDfvUqoE4XxxaB9HERe1ud5X1nPLaYPQUQ54CacdmZ19BUDoUqixhEULQ2Ahqxk5VhojEggSFiQH@vger.kernel.org
X-Gm-Message-State: AOJu0YxskQoKDstYExM0FKeZQsymjTFXEIV4iIEJVJguK/u+d1WBdOLr
	dkq07n3GqtEzIUqeYAmozTgjWcR41WXtnvLkofzTQAJ2oXODt6NGR/G9YAHw0VPcgTk=
X-Gm-Gg: ASbGncszzJ4eGK1YesONBT39y2yhrOFpajwZzNgkoV1P8yoC1R/DQjgpOon87KnLsYN
	0YO0sUuwIvS5PXYgvzmp9E3Xy0H8NJ/na8F0eMbD6V/N3DbC1cNn4Um8u6gU1lUaGPW9/Ot+J9i
	6um7wLeHz2Hcq/DL5YwoCGX+dNp0xL1YTnvfHK3tW3spvM64PQB4OnMPXNDQt2YO8LgQdOwtzZn
	/uCpXfwNiy6KE9dWIxwfeB/NuML0+63lT1OlJew4Co+MeoXHMjxPPweR02bu+ItyrX31ppQucdn
	qjyXFnOFSTIDCBTB+b8bG4MV3i3Pfi8gdhyZqXOnkFXFGXGXNH+KZw6Ww3YM5iQVN9ZhpFFHJ1o
	uzMl/Lrn6zE1YTz4yhcvX0Zv7Yg/fo3VzAUUK7+fxIyXZY3I22A6fgmzSMMWOFFyMqCkv1lETMH
	iYNMBOZoyMir+35xq/mL7fs6PsI+p5WIfa6H0lsMsSK61t4pd5dYWBNISt5s8D+St/hNImwgQ=
X-Google-Smtp-Source: AGHT+IEZS7ecosIDuABVvoBOB9FJ0YBGdAO5O/xjrZmOLhiVmbjmci3066c+xARZ4iRtS1uRrcnaRw==
X-Received: by 2002:a17:907:7fa5:b0:b72:d56f:3468 with SMTP id a640c23a62f3a-b72e0490addmr962983866b.50.1762802945969;
        Mon, 10 Nov 2025 11:29:05 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:05 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:56 +0000
Subject: [PATCH v4 13/20] regulator: s2mps11: place constants on right side
 of comparison tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-13-94c9e726d4ba@linaro.org>
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

For the lines being changed, checkpatch reports:

    WARNING: Comparisons should place the constant on the right side of the test

Update the code accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- new patch
---
 drivers/regulator/s2mps11.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 30586e9884bfb998ff07e3148813344b307506c0..8a36ab67b73e4151c7f67af0555a6465ee1e7a04 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1221,32 +1221,32 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps11_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps11_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS13X:
 		rdev_num = ARRAY_SIZE(s2mps13_regulators);
 		regulators = s2mps13_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps13_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps13_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS14X:
 		rdev_num = ARRAY_SIZE(s2mps14_regulators);
 		regulators = s2mps14_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps14_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps14_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS15X:
 		rdev_num = ARRAY_SIZE(s2mps15_regulators);
 		regulators = s2mps15_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps15_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU02:
 		rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu02_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu02_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU05:
 		rdev_num = ARRAY_SIZE(s2mpu05_regulators);
 		regulators = s2mpu05_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu05_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,

-- 
2.51.2.1041.gc1ab5b90ca-goog


