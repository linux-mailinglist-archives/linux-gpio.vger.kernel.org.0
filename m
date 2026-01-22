Return-Path: <linux-gpio+bounces-30918-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHyWJKFGcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30918-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:47:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A655692A3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2623230000A2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF1E477E4A;
	Thu, 22 Jan 2026 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tO2LSVuG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAE844E02A
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096635; cv=none; b=mnEnOD0CaaSbQiJbelDd/6tdgIxFOCKdkDKpSYhj1CQ04qiQv4NtMHfYB26TT3EYL+Rdl/eEncM/GYVzGrGY7xfUokK/QMT5q05OlPugRAEZxy3i97b6Jee2d+kLF8wKQs+qCiATTfop65SenucOlz8yY5JytpQCdbMV81255FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096635; c=relaxed/simple;
	bh=nXl8zH7iFzy229o62R7F4gj8miBQeEJTl9anBMuQRqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayPJFxjjSBSTGowFj8ca+0qAdvzreriYg3iQTdw7acGyDB/g7Lz9S7pnshaG2natwRi05UhQkXZOqN2RzMrcLO7HdFCqVldfLDkgLw8O2yeFM6SlQP4ezVd9oJXy4lNv4DS0P4ms/0gPNMcCyQSslPomrChzqcSaK9yyvdGPW5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tO2LSVuG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65819e75691so2005976a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096625; x=1769701425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXknWTh3C9IVP1+uTVL0nex1jtU7FLYUPa9Q3sm6Lzo=;
        b=tO2LSVuGx5cP1FioAQVwAi0naXXshHkUE5pkByQqralZGQ/nhKQ9Pb3nEPMPB7qc3Y
         MOPAN8rDcaIh9bS7TxU9mm3YDfmZn6WzMP9xFQzutOBdf1xHmAicpbiSlUiaeZYrFmLd
         cdX/oFZW3Bl0oprKRuilltjCkuhd6H1qoAY9t3iRIYUC2X8nDO21OxNeWo843PyI3Ali
         sDg+fo4WYKlJInY7UUvHQN/QzmeiwWNO2KCiHJx4aBcBEGGZe6tJVG7xzOGLMX0YEif4
         GCfGwGyfGsY836+mdkIGvAmtHQXG6lqQOPBbc5hkx9p6AfwBSe8dEOE2gILP+/2ZOVDY
         Ih8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096625; x=1769701425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tXknWTh3C9IVP1+uTVL0nex1jtU7FLYUPa9Q3sm6Lzo=;
        b=PXkV1W1dd2qBEfyRKS7n/7BNtxskS/2tT95i+5q4cdrGpzPxFSWp7ZfL+sC5riBsR+
         nV38fKuV3JrugK3wK3FnnmSmVi+Uk7gQ2/W3eI0pAnuS7mAUmUwBfw7fdvWWNiomufBX
         3TbY09sV28EX/y+vYHiwGphjL9ZzxOZushtgxB8Rn3Wqp+ialUb6U/qoQxlP8BN/yYwW
         0JDoV+Ts5KpTqMxrYLmVVWcX0xvSMsnwXMboyl/V3rNms504Cr/jYk/6u+IPN0MfR2Gl
         OfwmHZpNySL5kepZD/1862hXiAY5QG2JTdAfs6Q425YuQPj4YtnhyJ4pZQSilmPt+Buq
         P5qg==
X-Forwarded-Encrypted: i=1; AJvYcCXThaTDiPGzLHc70dh6zXyTD5pbht+A3mFlNouHcoSzdy+OsRNSOQFIMYjI2ctToVJ2nhCldWWbuAia@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3vFgaaX2T1oxDz+h9gNBxB+IFtiDoFmLwraZfBk18O91DJU/
	yOrewliN/rEkBP+VV7qIfLx7Z8++32Su5bBO706ckLopaxxsLP9b32tzsvgKpk+KO+0=
X-Gm-Gg: AZuq6aJsLKGJ0JoqVroxn0d/xjHUygKi01GFBgD8cNbiqtlzmULI4zU8SIMM7yJ0NVS
	38/mATAm5F9vZlVQ/f59sEr+92QhBnIePfAHdb79LOl16J/G1yhn0wr50/jzu6YoN3k9kIiv48O
	heGySIg43sJPv4CZUcufDhe6eVY4y14ty/0lUYiwgA7u8o1jOvbaoa4kM0Ck1SumEMRE+uCZqhW
	UzGNFpCCko31OiMGrIm3hL7Sk/E7GmSzVjP4lppLymP9iwDGhj69DOY6pIG3awH0MMEOnd7fZnS
	4+Nyrj4PRzswF1yObr92VeUWcwmZ/uNvnnQ5QhZ6nBa1R2g6+q2CNSoz3QeaGVS88EQoN28grMf
	db5aF7BHiVkokr0K4PEpVoPNpkHQ32YLS5Ivu60DLwjGCJyDRPp52ZBbSKeQbA0IWszW9SH0PCy
	hQNflwneQsbBckjY9cc2XZA24ud7QH4EMZHq3JPlmTvSzKqvN4BF9UZgsztK994n4fzTD5KxFsc
	Cef0ytY6y0jtP9h
X-Received: by 2002:a17:907:724e:b0:b88:47b4:7626 with SMTP id a640c23a62f3a-b8847b48388mr122935766b.27.1769096625207;
        Thu, 22 Jan 2026 07:43:45 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:40 +0000
Subject: [PATCH v7 13/20] regulator: s2mps11: place constants on right side
 of comparison tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-13-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30918-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A655692A3
X-Rspamd-Action: no action

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
2.52.0.457.g6b5491de43-goog


