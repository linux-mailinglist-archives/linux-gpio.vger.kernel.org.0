Return-Path: <linux-gpio+bounces-30921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF1iKKxGcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:47:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D6692BB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 835E13000BA7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E7447AF54;
	Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W24v/O/6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8233044B695
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096637; cv=none; b=EZkZeJhjosyJBSMHxxqy5zSTsYNcP3VBdPVBu5vRwQql8f9SgGow3U+Rsl3KWgye4a63uU6J625BbGhb1j/Hwo/m1gX/tx/e98Mcem40GxhF0WYsmxk8Ae1IJse5tqH24/1z9hwZPTVoApsnTdtRBmeOp/ENl8v8VpImNLEdj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096637; c=relaxed/simple;
	bh=Uql4wLrPIchDLzM+Qxxz/zEpZfEFgb0aDGiWtLWAr5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acCz/q462bM7A2ZoeCpAmAtVFwJ5yc0IuA3r1+8Ef+gEGmZqDCvYZe1ddUXa6vZGFQxyK59/Y5DcE4699mjNt9Ibe+akLK1p62yb9umaSHnMCj4MYpPk0d3EhtDcrEb9MnHpXM+qHoVfDaf6Lju3K2eCTAj5+k+MNkqlv7NN83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W24v/O/6; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65832e566edso1639822a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096625; x=1769701425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bweKrz1EAxpVR/K3C13UOoNEyjPdH8YKZynfcS9WhMU=;
        b=W24v/O/6peMIUrlUcf8CRKAPI1riHUG+qu6g6zRwcglS9UEOX5aOsSdP6Z5k974Xx3
         D11Z6LiUKmo4Mn6Cpj9/YLCi2VjhrNe8LAo4U7xVcN5eW08++PdvzXGGMWKT9hozqSqE
         S3oA9udxnFa9749495UFEJTW+J37AE1/Fw2IhPYBt3U0EShBVL1zpw6a0QDy/0vwcioI
         ObgnSAhaHTSBHqTHyQAE43uYyGdokUGm3PsZkleQCXHzTF1HDVoQFlkOAFmxZh5RqYan
         K7o9g3aaHNS93+yfu8jSYPhnPSy4qQcY2yZk+7rzpc8iexrBtivcL3TQJyl+cKJ5fezy
         iISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096625; x=1769701425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bweKrz1EAxpVR/K3C13UOoNEyjPdH8YKZynfcS9WhMU=;
        b=Bfue/iDrGu8HstW87Gvm65kf5d7zfBuklGIyBN355gKESfHyBEVNn0H7WvSog9YBbV
         bDxrCH+rOz89Ka8eZI+QKVOfGzczSjvhMStH2hn3+Y4E9b9mx6fbmLc/tYFXZ3eYdZ76
         ZD/1goLr5keid2YSS3rqt/7GxSiuhsQil7vjJl1L0h7GrfJWgqn5bM6QmX0eGBoa/Cm4
         3Sn4e5tWfTioJA4KhlBJLyQMtIZH3oM4ab/LeApgaq0cPj8lCL/yo6UC+ol7nTIf3V4w
         pZyQCwOZBUIJs56h8/4PkdQUoC/cwnUq7dtexE1zRmx5MBuUruz5C6KljCwgi3duaqM5
         CWWg==
X-Forwarded-Encrypted: i=1; AJvYcCWUN7cNBA01pzgucvgCByPvWhMz8BlavfDt/Eu/+RIsoU8fvd+VF3ry6MrMt2jSV5HMld2V2ln629aT@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCfpf3zgGv4FOVhS3bpBe26Oc9WS0lzzgIVq2g16oZI/RjfeH
	PiUCVPQGqB2iQ3wXYUdK6hrlQL9+5xeujct0hrp53a5Zf6c6U1AWYQ1TRiPsxNMDNCw=
X-Gm-Gg: AZuq6aJUj1rs2OF1XN5s3ZfVeWGN4GZ4Wk3OD6O4gastpoOgPaOb57DTs2W70AJFHpz
	mWTufaxxRVs3UtV9opMM/OTDcw1H1ZmSmPk+c4KB7jPdRS9vNHBi32AHhmMOfDTA7IR8GJ7uNxX
	WbJREnV5MSFHXtH1nd0Ly1XHu0hcq1K9gag2BaJxIvhM1bt9Pu+JttRLWsUXBjEfXNUSusKIyJ5
	kt7CaFbc6+MV2AG4R584NXTOutkBOFYnlaraCY8UoMthe1H6Uqg5ERiyDgpliltbdSheYInayiM
	RxoQLw3N28F0DcrfdoViVc22cUhxdWoun5qbpopWdjZZX+aZNQTN/o2QKx6TkyX65waUrgPEbIj
	idXd71d8PYY+/X5DQqtXSJvSJIzHqp2FuL8BKMhTMRn7R+j5ZIA1X3b824rr+H6DBAb2hgW6mTQ
	UAo2CZZKtOHQfucBPukNbi3nHeHfTvV3UbThcWvsQcdulm3C5O35qGUiwLlrkgj+kZKeQqp1rbr
	onCbzUvPifjYWaJ
X-Received: by 2002:a05:6402:1468:b0:64d:ab6b:17cf with SMTP id 4fb4d7f45d1cf-658487d5f67mr15227a12.33.1769096624685;
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:39 +0000
Subject: [PATCH v7 12/20] regulator: s2mps11: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-12-3b1f9831fffd@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30921-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: C47D6692BB
X-Rspamd-Action: no action

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
2.52.0.457.g6b5491de43-goog


