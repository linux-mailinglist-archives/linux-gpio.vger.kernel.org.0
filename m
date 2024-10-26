Return-Path: <linux-gpio+bounces-12157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A269B1AE1
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FA0BB22252
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ECC1DB362;
	Sat, 26 Oct 2024 20:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PICSJUMm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4511DA10B;
	Sat, 26 Oct 2024 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974784; cv=none; b=fqZ2VNNhWFQTIHBuKsYpgW6USQ9mwYna6D1A4UPpTZ87HEM8PhdErhlERKNJCa2zs1QIV8uOYrEWPT/bHtFjV06oJ4XXVUnj5/mrC/aOjgdIDwVnUrGF0aeNgF9hgIHyB0nzSd9tPhVOOv6dh9NeOQBn3aCa5xVvNxwRnqXLRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974784; c=relaxed/simple;
	bh=UX/VlaIr9ETHnZFFn3Brzw/0L1791ZTGgYbdKg640mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iizt61lEaK2qo7ddKIbGFdjiI5ksOI0r/nWfdDsagixBF+F3ii3uh/+UxLxhKLJ3bQbyGwq4PGZ9ai39G61z/0u9Kanx5zsQsWMCgMH+qSf5lEdOxkSJ5pq/uJrVY4yczxc3zmdKUIYlJFnEz8HR3L4szK1zyJ+Vbx5A28WyB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PICSJUMm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e59dadebso3769023e87.0;
        Sat, 26 Oct 2024 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974780; x=1730579580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=PICSJUMmNO1Edx4fv6jVBDyFtGp1ctDFQEDYGBxrj81G3HavqCbFf3mQhzyDa/j6pq
         /HLaI3SgOXy4Jh6e1vqJxP5KVJou1HXryBMd/RDos4NkFiamJIPov/kC7JvHjG2LlM0o
         qhvS8HYpWLUP0i7yNCWkiwzF+XCWwERNURLJtIfLHWZi9ov76SrfsNbwvvP1ZgVThJxi
         uRw2d7PZWnn/VPCIG6JWapfmzBw0WOl9YzpLJhAv1YCVD6p3kiQ69XrCULORZoWdhGt/
         jiAWILIXGgZoytXBUciMAhFO/eLV2G8UUTy04g2E6zkiIWmOjAK7+s/Basfxl0VvwT6S
         PNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974780; x=1730579580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1grSvU5Tn2s3ry5oErdwTQ9/uQCVVjQWC+Dff+1YOQ=;
        b=bwADYvrWbOpatXPM2d6S9kMLUIZKFYWFAU3Z96lcMEAY3MJNlvfNqZWter7Ko/5Imx
         gPVbzeUwTmAA/xJVZQplH2kwv5EBoHw40ogIRUX0nDY7A120NVoamEDSdO3HSzI78C4f
         XEm/TQHaNTJX65JNyyS1fdjE5e5OyxquoszAUEnNS3jUlDjAgUoOiFkHutbgvg0h6CKK
         FsfbNw2jEbxv0Q3Hb/LQkZAnxbnKOWjWfcAIEX0QPrAVZ3GDhFf3GrVCgoMwJA9AiuoN
         8WClkT2EErJk7RYqchyryYR9M3IvM9SOpo5g4A+hKSXt1DxP0XD7Cr1WWFx83oKsoViR
         666g==
X-Forwarded-Encrypted: i=1; AJvYcCVcl2fmGONziFLyWdiUuESvuQRTAmhmaMYFYXvpfiU12LhTJjQKbPEsHem8b2P88pCFccuRPmrhwUU5RChexAgniUQ=@vger.kernel.org, AJvYcCWfoVYSC6FxK4xhVu/IUW/OaZTAJLdiZNKR4syCx7BnGzNTG0DmgOtAr1NH35Dz4+Ws2mLIzjyYihdC@vger.kernel.org, AJvYcCXaJmGgSeNFDJEfCeyXW4WDYaXI+R1Xhp+gDXdkwy5gY/x55E3pIhN2R0sSh+8UEvjiS6OxjlwpVOrhnyCC@vger.kernel.org
X-Gm-Message-State: AOJu0YygQuRukVvCPyD1h5/0VOM/5HWrpkv5/AZ7afqRjE58w9Vs4/1F
	2K4FzjgI89SAE9QiEYfCEINKVDgciRoJmGw9aQQbIc1fDXhPudoO
X-Google-Smtp-Source: AGHT+IHWZf3xXJWbjclTAVdzqiSi3SC8R16MfNzyEIkT5MszF0E+oAKczTmO03v+bTX0CcurM/WUAw==
X-Received: by 2002:a05:6512:1392:b0:536:73b5:d971 with SMTP id 2adb3069b0e04-53b34c5f886mr1377958e87.38.1729974780318;
        Sat, 26 Oct 2024 13:33:00 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:33:00 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:38 +0300
Subject: [PATCH v3 07/10] soc: samsung: exynos-chipid: Add support for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-7-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=938;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UX/VlaIr9ETHnZFFn3Brzw/0L1791ZTGgYbdKg640mU=;
 b=MHk0C/fqCvgcyc7O1jK3IuskS2dcJ9ZvFOTuuysMIFpOtlxHJFOoxLb1kpPBG/il7YSBGNHVl
 0PYfyTQlzt9CLdXffsjft5doo8Xa7NF3hB5T/jsMfhcuFta/xr1PBeO
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Exynos 9810 has the product ID of "0xE9810000". Add this ID to
the IDs together with the name of the SoC.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 94c7cc0d11e4c6f151336dc6e25495a31cbec02d..23cc20896b85a2da02f36703225a4f62e7538a62 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -59,6 +59,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS7885", 0xE7885000 },
 	{ "EXYNOS850", 0xE3830000 },
 	{ "EXYNOS8895", 0xE8895000 },
+	{ "EXYNOS9810", 0xE9810000 },
 	{ "EXYNOS990", 0xE9830000 },
 	{ "EXYNOSAUTOV9", 0xAAA80000 },
 	{ "EXYNOSAUTOV920", 0x0A920000 },

-- 
2.46.2


