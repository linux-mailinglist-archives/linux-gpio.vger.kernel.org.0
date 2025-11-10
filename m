Return-Path: <linux-gpio+bounces-28321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8DC490CE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0DC0034B2E6
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976FF33DEE7;
	Mon, 10 Nov 2025 19:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rTnk17oz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC0D3002A0
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802956; cv=none; b=Qbe1y9JOXuLXbqZhD6MnXGELga8lXdjJTFrilb0dMOjUshLOpyl/meUpn4lXd+A2Kmbaj/SAwDm8TFfRXjABHWKRJVRjBt2s+KopmX7OMB2QQp5pfdIkwIzFwLzhVyeDOx5GaL4IxpXuv/1v7cXPCgQmnmNZE50spABHde76Ra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802956; c=relaxed/simple;
	bh=RzBGsCn87G8Sx3N+xmIXdtBJ0l0kWfW0p7tCuHwvI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEu7QYxEROr+mc2XgSbRh9Ja2H4ft8FqMq9nxe0hU+HMSjTreYVPM+IspTHQya8iuk2Da6NQvNMR/ZwsOG11wTANYcID0UoOSdeSnPiI4O/P2pTU2SDUA3bGlCdCN9TcOVUIgfiUZx3X2rbOL7xWJJvFPCaKGFXRAi34vnHbehQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rTnk17oz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b72dad1b713so405524466b.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802950; x=1763407750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jumGSBrz6UJPB93YzP/ypMhQMv7kILadjYtPvrV2cZM=;
        b=rTnk17ozRBwpoSJoTMGRHP/mdkG1ZwdxIj+43UUty2dcF+hxkGHan0pyeiJoAHEPEH
         hsya4xIr1KJBlJAen6ShfDd87jB4mRKEWLgfGgocYLq2v7DOEesUuDp4z77d69ltanVS
         ilrXi3OWebiy6izoNvAtyaJu1xrTZ9lawzz+qhZoNi1OA7y7YkTxVMYlob9jgY/Va+i3
         B36ueBo8zG6C2w4iP34Ngbu1HOrmQehv4XbEF1IMw0Y1HcMytnWqDt8MuYHGMxo59KWC
         FWBWarqm5C9lAeaOLZQr5g3SypAhdN5McC8fqliq0dqb8lPnlx2E3YOLeA5IB8Y2I/q3
         RHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802950; x=1763407750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jumGSBrz6UJPB93YzP/ypMhQMv7kILadjYtPvrV2cZM=;
        b=JLDu792hsXX/GFjvNbFis5DwzL6AnpV4X1qcYCJS1YuSlkxsiwaokF82Pq5SuyUbjR
         fHlzffxYwQ0YCAJdizpy5z6AgP8l2DAVE7Ll9/JTBOiEN4NlKgueXutmvw6/sxAZwlfM
         4i3/F0aiGFvfeRO6mLfXjnkBJuh6ZigFk6eM3t1mdpoMcbup52MMQ3Hfe0Kcs5WAzeVv
         BI7bmpco2b0c8tsn8iopnbc49WJdZIWJ4iIN5FEvNdTZROwtu6KGEr+8XdO67Y1+MLFT
         BG2GSWKMyeW9CBcfKcYnaCbJxVp20O4pQ5piWo650qByJ8zmuhi2HfG+Vo66evRLmQMt
         qK1w==
X-Forwarded-Encrypted: i=1; AJvYcCUBX7F/Sa+QRq64VmQgA7UnFLdgMCrU9ayb2mj4i1i6+9J0xADWc0DGc1isiznSuqVVJqtytYF6JRWx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1Y6EoNfV/mkM8ViZHb7wQDf8QJCHIu2wJo2Pz8WXaBxz5rds
	C818RzfY7vVq0LwJX1MfW8yvgwyS51ObqFI0IsdLx080fH7uAmBSMJRIlTqV6KTQisw=
X-Gm-Gg: ASbGncvQ8ddN5moEXsVFwdQ8ePJLYYxklFbgHFJ9prvRxtVH6WTSOKWXqt+zcOz3spB
	rRN04C6WoXTk0Bd/6fSGJOt+UPHS3J7sgTMFQI6Yzz9thV+STT5YIdQwImPFh2xVXqy/rOytY2N
	wuiX/ctoB9jO6frRUg2nLnt6SwaFBzlbOUZgNL87jSPiN9FgqpKnNNTIkR9OTKpaWxRIQvBxyd2
	1t4MhUZ6N7hd9FFflikLg7k7aKOHNKQ8Lr6AHkwFb/KGK3n380+r6EF1GiFygqsAaidWDGdXkL+
	pruzEKJ71mwnN1pOfE78S7OGvRp5KA3FqKCL57F+WF3tourAXzCYqt8BkKQX+cT1y3YJKB5BnmE
	HG1Ea0lJLlzzd2zl7Znv1ImpujV6v5aZvv2TvJHmGHwfD54xf6kuMAR2ZBtFfpXAGP/NFcqb/w1
	Gs1Gc8+X1dceaYoilKvudMm2mAbq8wFWN4Op3hj3G8f0zCpWVJ3JEJKYenSNIA
X-Google-Smtp-Source: AGHT+IFpqR3MayLxCuVGV8uSOt13EYeoXGaPrtL/jHLhv195Pfx49CWhTUu8/3DnrKLv5DW2F0sE3A==
X-Received: by 2002:a17:907:5c9:b0:b6d:8da0:9a24 with SMTP id a640c23a62f3a-b72e036c9e5mr914118866b.9.1762802949657;
        Mon, 10 Nov 2025 11:29:09 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:09 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:29:03 +0000
Subject: [PATCH v4 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-20-94c9e726d4ba@linaro.org>
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

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index f19140e97b9d7a5e7c07cdc5e002de345aad32d9..3e9da15081e680d7660c60270af54ba2a4f8da1d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -363,7 +363,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.51.2.1041.gc1ab5b90ca-goog


