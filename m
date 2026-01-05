Return-Path: <linux-gpio+bounces-30128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E598CF29AC
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23596307444B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A46632E12F;
	Mon,  5 Jan 2026 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ScigQ+9p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C744D32ABDC
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603714; cv=none; b=RA+JJ7lB2sNxjB4kPA5AfsWlhFyonX4GY6DjTMb2JsSq5X1z38wq5dhGcdP8p/nFeYedhvziDbbwxvTF8zVipVuebcrxZHpETlAheqC2u+JpSBtHw9q90kHWztsLu8CdaBqFhBcK4liQV2UkwtYk3mcMKpi3v2FYN9IJgO757r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603714; c=relaxed/simple;
	bh=6XxroTSX6ceg285T/QjRgJPmV5ju4e9igmyPsFQygJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ho5rgTIyiMfpoeww84eT6u9PKYZiO+rWfezw617o4/TXmxnMEDXxsPF3dKXiTl3EngbwKTaR0KKDtH52aEA1kXIyE9DS/ejTa/uZHh3k+KLPc3fioD5lHLBxhEvSMl+Of5yVT2rHPTASQUVSfLN50tWMMWI//At7fyFXurJhGZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ScigQ+9p; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7355f6ef12so2651648066b.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603706; x=1768208506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=ScigQ+9pMifAw9W8DMfDGBzMdlpwmoLb1+sNTbTkpCOIDVI2GE/S003niyR/BJtQSv
         6p/MhFEhIcR2GLTGwYXtK/9Aalc/nCoTXaEpc4mQtASS1o4gq8ns4wRrmKtJKmEgdPX0
         A6FlWtoqhgv2nuxARWh1yWjAiAHeyyydLA864oLP/GvZCMQwCA9QQGn89enbovn4vO8b
         cCxBIRzZB0e+b7L9a0P5FUeE7j45CMq2/gpVM7Vau6ytS2aynJPyhfhAYlqyHSKlvbRP
         +NTZozWVf8P1Y2ZReRRr/vJPohxI/g1VL/uoKSJCWITKgx5h/gry3w7xchdPUsgvSCLC
         WnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603706; x=1768208506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=eQZ3lnPbbA2VEihrvxTukhrMdciEmd5+RppFJ9zIqzidUxbfYB8kH8Zbf+f2R5hLuw
         eR9BV4rZRvruNoaxFIpS0BFzAkLEzo+JpHO4jXjtfd27CyrSJ5Tcpri35ATuuda411Zg
         vFuNaoE139d9BVXmOLaMWuQACVlYtSN36CPoHS09gHx3mC4YUCbEfX6Xo0S62SZEl/qi
         A83EchbYhn7lNmjpNbZZZlK/Am+lZ/OjJSayoVW1WSJnaeWV2B4lYzlyUQDpqko0hYif
         KsSUORVBHXWMvzhSFTBLCJp0K5vbmLKYAGk/7Z4D3OpZneGzWEsEruye8H49oi1zjwiE
         lf0g==
X-Forwarded-Encrypted: i=1; AJvYcCVnoMhJ+5ocnz1kEkCOcqLqsOXCr61xHy0sgEtd3b2lXcJLQYfzsxto62ZSOKQhK2zdW+KWhxzZ+KQ8@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxXahgO+84um7ZXpxOIdcTegG15qcqTGA46rdsyiQY8xYbwCQ
	p3HX1qQiruTgbrFOrObmxGYN+OKHyZ6BD510nY4xtgw4wRrUElehKA4lEOp2EXI03Jw=
X-Gm-Gg: AY/fxX7GmjUO9+/zELTu/RM82nnKDAQg1RctSqpRQn6qS36SGjB51Ojxgstx1Z16wwK
	Sobk3meYSpT3k8iWr8yq1NrGTPWBejBAn84s+QHubN5dsjYIqSgz1hWvQqDxthhpbSdHqxM5RR1
	gVINHK8Ucu1aqZR+hGKz7pRwfKgiQb4z+hfUkg/FlFT3JB+MzT+VupCLdeFJJHeguVYOq6oKKBd
	ubtzeHhYKQdrPKiCZ4IsDuS0a7MVuQ+TzKZn9mozQnhTkPL018ilg1Xj2sgVbdZWTwulPYcIXhR
	WIBektyq2Pu7P3bttr7OlXtoUF0EdiqCBvfxxcueCtomtlzuomyZsMYrVUtWHrE3gzA6Op1oQUm
	ytLc7ewT6EcKof+EII+X76XDDEpgPtvHykkmeS6V/nHpQM36sCDUSBetsFbU+u1seSjx0qIFIXU
	mz+MJtqIWSzNPEXENlBY/cqiYNWRb/Pn1VocJtVb2W3AAuj2mzhXpAatLWVRwfxr+44ki+YeY09
	GeNJg==
X-Google-Smtp-Source: AGHT+IGqO2/A6qUft2Ty36ZkoKJQ250NpUeCgwtCUExj2hkku7DKz2zpfH5WwcKxMWgUdFnRgc8Tpw==
X-Received: by 2002:a17:906:730d:b0:b73:b05c:38fd with SMTP id a640c23a62f3a-b8037183211mr5065467166b.50.1767603706149;
        Mon, 05 Jan 2026 01:01:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:45 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:47 +0000
Subject: [PATCH v6 11/20] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-11-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 04ae9c6150bd5ae9dba47b9b3cfcfb62e4698b6d..1f51fbc6c7b6e158f9707c04d9f030b9eee5e842 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1207,8 +1207,8 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct s2mps11_info *s2mps11;
-	unsigned int rdev_num = 0;
-	int i, ret = 0;
+	unsigned int rdev_num;
+	int i, ret;
 	const struct regulator_desc *regulators;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),

-- 
2.52.0.351.gbe84eed79e-goog


