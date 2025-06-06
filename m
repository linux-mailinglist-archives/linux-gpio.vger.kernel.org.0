Return-Path: <linux-gpio+bounces-21091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC53AD04A1
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C11418841D1
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AA428B50B;
	Fri,  6 Jun 2025 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C53/AjF8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476028A71B
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222208; cv=none; b=cihxoeoTVjqH6mhitn0vRvrsQuYbj7empkd4o//wbbUHJhMD+Z2mKnnfQ9JcIxVNfqvBzRcKyiR2xezHtMBdhaunIn9fzgSbvQZ+jhy8Cf481Sv6na0tkU0nfoKCLKk8uti6x4jbQUtYw7RBQKBBP3u0ItnbOP6W1vCtxTS1n0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222208; c=relaxed/simple;
	bh=qolkrs3g9m1XRitO5lnJhgwGXH80xlE9UKZOEGY5QLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfbJE4xkR7zwqt1id/QMgOklvHc2mJzOOyUf9FBoLAK49++rHFOtj3jN9xy+UGVg7Gf7xMC80UN8XmRiHjZoNBShPnscQ7oesC8HkUJ8P66OMtjCz73FrL8M3rumEKtqmv6xYECppMD1mD/PJCk5W3MsvLhFs2YZCderYGGRt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C53/AjF8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-addcea380eeso334145366b.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222203; x=1749827003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23HNY0T10kbJEBdypFT8EdO6lJ8vGZTGFp43/u8D8EQ=;
        b=C53/AjF826WB5HRT+muLZF6Kljdh7MIkySoy4kKeqKvUZCnx1f0BKpDfm4UYFQZitB
         9OZl0B8l+YA97xSWlSVEeL8JVsK/8/wUhAbvgCCx02zL3ZBdlBlxGdU1JMMI0WIhJ5OV
         YFvyodgN1mDPLgNwBvZGCLyuifRV5bMSeQxaFCcs3sxuyq5fvpKLlwNIuoMPdotee1gN
         SzYFOL41CXtBJ/Y3+D9xDK4VOWPiUOa3kihLWLuQeLurfNN1M0sFOEIep1rzVqoJoXP5
         1pppoNcwqgeAvRBeBPnyuOJHx1/piw+y1M4cKSUNfsxrG5LtFQqhZu1RLNLJHXLQYlu0
         O2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222203; x=1749827003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23HNY0T10kbJEBdypFT8EdO6lJ8vGZTGFp43/u8D8EQ=;
        b=RiInKBX32K1qI/Bj+tFJH34pixZffGHph5mXxuhNVzgs0K5SVIrfGvJXACuRLFCBuQ
         5I0+/DPz0bghNZA4KH6IokYncys4VajJDqT6EBBjdf2lxHbs3Zx2ZpTvRFCvmDv0pkY2
         pmnwFad2nmWakiWBfUbGQMpXVAFUzeHCEQBMrHmdxPhfgwrKo2PplsS61ghxvb0MYLcH
         N9DAFJLAKuzljKimf77gN+WWRH4+oPGjWbr2wz1fwNsztUtRXaAtk4kfvflMI8QpFNMA
         E0hWuAmWAn1pENdAMXRf0Mr9v4BVan2tiT8s+AKuKmd3voRa2paVsA2zY9rlK9ZGxAlI
         vduA==
X-Forwarded-Encrypted: i=1; AJvYcCW8hrt/moQdZPb6W73mLf012dVKtAK+6yi4avZ6dnLHZLGmpgpj+DVSPGWtiww8qjUQdvfURQ0tMd1x@vger.kernel.org
X-Gm-Message-State: AOJu0YyLfBa8SUqz43NtlwNDTt3GUDbdZAEUpMKmnvahgehlQZ1GXYqF
	4XhfKQStWJtLHi2IX8T9+RL3/+tIO9RxJe81fqxlPb3pZmYxEaOJ9zTevAExaWtmYps=
X-Gm-Gg: ASbGncvx6nkTIq3vfgJVqnIEUR4NfFfK6nJuuW06eirld27JGkNRXrjdo0lCGFOUuc0
	UL5reMVAsA+PpjoXBU81uX76d552m4ya541MYc2Rhd1NG0OvECW8FC+UBFeHSAqH78+SeLTS5AW
	aUVh/kAK7b6y89Yk2MQg+skfFy5ZpaHHLhxZAqv6c4rFofu1YmwYBZF6rK+5Nt1I8p2FC66FxtQ
	xCj/C5utG63hG/w9ITFNpWwUMWvgW25EYIPVqwKnLa6tHHpU4ikb22jU6P4BjGkqYP36FCXxdrz
	NP4kds6a+J+pPzBCSNDFHnTWBjev1K8qvTfdmlPAOQ0Vt5moBJgfnbVgaG2wkTkc2RhP6w0zS+4
	e4adFyOJVLpuP+Svi9211i/sfILq8E88XsvM=
X-Google-Smtp-Source: AGHT+IEyyt1ZlOm5xokwecrQZlojNukMbOCRBHPGSyCxVc6nJs9ihRs3pxSxkqbDaVo1utFTbV4JCg==
X-Received: by 2002:a17:906:c109:b0:adb:2db9:b0b0 with SMTP id a640c23a62f3a-ade1a978ddamr329710166b.35.1749222201191;
        Fri, 06 Jun 2025 08:03:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:13 +0100
Subject: [PATCH v2 17/17] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-17-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
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
index d46b743d4c6f5e745e101d054581a74e992fbaea..dcb813461e6d68505c21aa7deabfd03b450e1d3c 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -357,7 +357,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 					   "samsung,ext-control", 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


