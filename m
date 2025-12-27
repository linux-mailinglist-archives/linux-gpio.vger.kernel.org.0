Return-Path: <linux-gpio+bounces-29934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA4CDFAB0
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3416302FA35
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9241A33067D;
	Sat, 27 Dec 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKW5uqxf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D14330330
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838280; cv=none; b=izVgqDKkbyOkqpJ2+JPeWD79nKnUSP0ufF+BBvY1svGsBjmWtjqflnNQjAMItJB+jyvwFaZ/jfiqkcIfqIRIyodJNvRR2evXVEEl6PW4SzgQu+UftouhLxWEhz7PGpIolVeaDb0hhbv5kFQxBJOAde91oMIw9RKraYgQikn28gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838280; c=relaxed/simple;
	bh=6XxroTSX6ceg285T/QjRgJPmV5ju4e9igmyPsFQygJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hurLXua8c3AqzFNA6E2Dr+rMrhM6j7WRUx4imJfYETFo3n9jnk8K88C+2/P+4ajk7X7Z+DOu1OLJl6hz4to/jCXJvHcKldIPTEQOe40WnCyKrkZUQiFX2zesRVg55EoSKdh6VM1hUR+3hD/yK+nvEwrew7UcnQ6NmD2xylOiW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKW5uqxf; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso11233010a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838274; x=1767443074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=WKW5uqxfAOHdjS47fUJahRY6oBRnl6oCH6WDe2Joob5HexBYd8+jzLtVn0dIyVS/LE
         3xjeoeibbEWe4enf8XFK4/bBQuZjL6FRLFkjKlQgXpEH0SkEM/KGzzQsynRi4odLCtxX
         fStYkmCL9fsPGfh2apnelE073KVs1pL0UggD+/7gsTj0oeKcHHX0w4bCfIama1cR1hsi
         jo8JbamkGgILyOlW3lWs8jOzu0IWHxWVVoS03DE91W4uF0s08S8t+0fOp2I81R/tPKLx
         iS7MFhQVZmCRIXbjEy4RQyoVjppKXeZOULYJhdWik5DIX2hErfAS3ThqR4DGxTQ1B0Bj
         CbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838274; x=1767443074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10d9MioQ6PzKJr2vkHmOG0REtU2UfuxyvJCr4xa57iE=;
        b=IyQg5JcEeSQwclYEatqLH82g7J+4lACsIOMt1VhcBJ0HnWaSe/aHNHhpFhN3ZhbeA3
         6L7iXzjleSNwjV8FguM+wVVqCSy8EjrNCOrrhluOUNwoK7rv+igy1eylQE3m6AwK0ENC
         NW1kmhKCDlUmtvTy0bYqB6xZBkiSlWTGjfszMZdy4DKTJgAi91Z/hJzLVX7sI1Sgnnbo
         Kg/sCa6zSB8u760tECpPCeGXwItgY0/8fGElYFYJa60I6f/32AbWo63N0XWl/WLdlnR6
         wvoKzgdBv6VrFboMpQAzY/12GfebMIgbRi6sJTBKaj6Mo7Q/jAIyUd0HHcvbFsM4YuvL
         8Yjg==
X-Forwarded-Encrypted: i=1; AJvYcCVwwTWMkeVb7QPYTx8Ym/07+xRZhQNxpSYIerjolfixm8mWdvyNaFgXykxkzvXGXu6RtLeRerHIZWPa@vger.kernel.org
X-Gm-Message-State: AOJu0YyiyAXwFR+ZMS2EJ9dZ21fDbzGhmotSznyjdv2brU0lQp1mIg2J
	ErBgH7qarP/F8SLfkK/NXUP9tSWCgsaCVOuEu1G/i2ZPdFn+Elt1DFG1BXx7wyBUEzU=
X-Gm-Gg: AY/fxX4xT0ewc2Mc0SgHh1cUgG6D0FhXlnJLBlt4KWAzPew2CU2W0ovxGiCuxQSHGo0
	RPcve4/Z2M25LHWvLB98SAW0elQYDONn/DF2NnXLmpDoatxzTjB1jj0/iQXxUhR6UhTNfyLlgj8
	IYmEOAdjAiB4nOkCjwovRsqtBfSpVzTgO8D4xOUZ2Qr1I7hbWP+ZvEd7e1HVlcle/NDneoDYQIe
	/d7QSaIyM2v7EOsDWydqZ7Dkw0cFrULjKhmypNrs0To+FrjJsztQ82+SB407TfJzqG+vide6EoT
	OonJk2p+6931ivmgmskLJl3NrKzmYaj9PoyeerwOEPRsRUI5F1pyiUFY8IIb3msmPaxI1zrcB4F
	ac41NByneovIlvbZzIqscK/f9fRBDuaGLq+DmRNtbCnMISVzxsh7snDGkv8stnbcHgmhj7Je9Xh
	ZBtSBoBMVT93mocQzlW/N7VPuVFDZ8Nq+72C5oeNf3DV/jrgWZMgpFxVk6oj3bF789n2XdkjptP
	6fwsA==
X-Google-Smtp-Source: AGHT+IG6Z9bYMcuGRg69WSp8yaR92k8YtvKMhYw/xt3cg0I4I04maY0SK1m8WoeJjsZm7hG2dL35Jg==
X-Received: by 2002:a05:6402:27d3:b0:64c:fc09:c972 with SMTP id 4fb4d7f45d1cf-64cfc09cb6cmr23518296a12.17.1766838273894;
        Sat, 27 Dec 2025 04:24:33 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:33 +0000
Subject: [PATCH v5 11/21] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-11-0c04b360b4c9@linaro.org>
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


