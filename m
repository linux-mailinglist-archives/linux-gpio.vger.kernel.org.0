Return-Path: <linux-gpio+bounces-27976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D6DC2DD73
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C161E3B4EB0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE1E325488;
	Mon,  3 Nov 2025 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRFun7YI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA10321426
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197294; cv=none; b=F1iiTQtCD07tl6LogU0y/xd2BnnMoCotnIWRvVwDlKgu7PFFVJLC4jnuvDaaRODIDzx7kO8xnWqOIaqHh5zp6n3TTf/u7Y5F0gEfyE7jCXphEb76LxSBlWyTmx+xYfImGaPbzfN2TBg/TFF7cG9iXIvpTawA7OyKCqNVHD1RHDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197294; c=relaxed/simple;
	bh=cLBJsaXRCjW8ED7+56uxdLLlUd8ALRghlBAhPAVov44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u89O1cTvLWfgE5lGEuXsF78EHR7L4///Jeo8KzMVYm3B/wf51Y4AlGnd/wBT3LK5iPcol25ism3lJn89V11I0gOeL+mh5/ud30ARLzcTppNfokVxmYqXM7dOmocwB1GxkyNdoul269fOOBN5ZXtTjLZ7bb0qKdxaDkRExSEW32w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRFun7YI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b715064bed6so111984866b.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197289; x=1762802089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icN5yYkXgcEYignZ+Xa1ClAR+0DBwP6iwKaUoFu4GLY=;
        b=VRFun7YIS2I3ggIfibtlAWO0MT2KlFGqgYEhDHxunMlGdyoxV7oQSeTsWu7qVumpvS
         2QAdSdKwOnGAsrwjvwzy/4LfVt2txV9ixmqRbjSeFB54XQiVEbSvWpg4fwCv2Ru4EAiY
         SgxLTX2OOmDF3nAbH61XIck+kixvQRNOeg4YdCdO4cKfqbaLIqCEiNl4dNdWcjNMRWoP
         yLXlZfbmeDwTVpNw0r7P/aAD8tYssHRUvGFtpZfnuiJwLZXgcuDwp3L4sUMAuAgcikAa
         7St9LvgDBiuv294fEvdkx1by0I10nCEX15MY0tAtbaf6idY20WSfOYkkbTzF2t1fEa6n
         KZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197289; x=1762802089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icN5yYkXgcEYignZ+Xa1ClAR+0DBwP6iwKaUoFu4GLY=;
        b=Gk2X9LpJDbMUGfI6CDZiMgdvZ6YDBh0lDp2mM1jeJL/C2LeVmETIbg5jArgHQX2PnC
         SceyPL8CsajuSsEv0Nxsh+H0Ku7YBXPioKVk53HCIj6932146JRcYHHoOi6CS7SoqUjh
         RQbUvktjVU8o190+SCGLbhSHg1wBIHaL48DC5Ymb/Tg8vXZeSnSEsQZy3GdVq6Kh+TR/
         osKcFwSpW3Tg19wzRiqGJPlEnN+rMQ2YDLulX5qBVDSueDYdTIlET4oQvzc4DzzcR2J8
         BdrcWVAPIvQy+yiYR2hhxoBXwzssdJQU0Y1oEmF7RN2G9IYqdJNLezSeGabXb6p4FanK
         QrzA==
X-Forwarded-Encrypted: i=1; AJvYcCUMgKk20U+7ItTGy5uZ85Y/vu0uwHhJwON/T3ATOEoAu5HkwPbXdSPWBunySJchTDChlgbR16TaPyFJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyvgOmBHRbh3YDYkcsuo9pKRegXBKmHirdsaHR0h0/PqmEK5GoM
	TXeaEPcUamOkFPYJi6WRtPG2Gwscy9gPgcfnQFBvDUk7XWENKxsCG4BK8ZN5q559/9A=
X-Gm-Gg: ASbGncuPcT4kWatUiU7+//hTDCCHDbMNxy6bWodR8t6FGM32h12MvMAe2SSjbsH3WOe
	ENHv8neM9MZTAdf3Qsbz7MfFJXKyN8X+yGgt034Ks06V8Cfw8BQjS8DASHXLEn0pcxFQpuovSHR
	9H3gxlCAVbLbfhK9W57imLfNvlTOl7t6fEPvR7lQ1bOanyWTem+1ssBNRCIUalIDr1OIx+LbogM
	rnY2S8y2ACQnrlckcRPX7peR6voBTIqlBZY1TkosmkO6s9A7spgT/L9fDw7CFnJ2uB7/wvF2Fm7
	gMlSLkAsw8Bht3jjRKzDb2CR8rbRYqE4jBb3SMsDDIVpQwVZonhAASVAxa4CEE9QSDD1P+O2JvX
	+xtElAY8lyhaPt8dJspW4vrOfSmxYrxrjAqAGr4PryNRSHyfUXMIvuoE4Vpn/EglXBQu290NNgM
	niQIEUq3n3kBGeK3irnex7V8DRy4pafozyrEJ+XbXT2rF4j6BORA+XyM8pP0ix1wjcpRdTPeI=
X-Google-Smtp-Source: AGHT+IG5Udj3lRW+AqeTrbpalAuPKgShqrf7tFTaxqWNlY3DqKR8V5lRcyVUxOq5iUJ4O0Pi32zz9A==
X-Received: by 2002:a17:906:6984:b0:b6d:c44a:b698 with SMTP id a640c23a62f3a-b70704c5a0amr981892566b.40.1762197288829;
        Mon, 03 Nov 2025 11:14:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:50 +0000
Subject: [PATCH v3 11/20] regulator: s2mps11: drop two needless variable
 initialisations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-11-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
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

The initialisations being removed are needless, as both variables are
being assigned values unconditionally further down. Additionally, doing
this eager init here might lead to preventing the compiler from issuing
a warning if a future code change actually forgets to assign a useful
value in some code path.

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
2.51.2.997.g839fc31de9-goog


