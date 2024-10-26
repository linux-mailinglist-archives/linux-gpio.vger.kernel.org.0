Return-Path: <linux-gpio+bounces-12153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 639099B1ACF
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25936282500
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116AC1D9324;
	Sat, 26 Oct 2024 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxa6J9Iu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08A1D86E4;
	Sat, 26 Oct 2024 20:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974779; cv=none; b=cisu9yMVgrqDsAr3VjN5/bukKcnFZCf/ODRURnmg2cvEdzh6jV+XELPCZ9XUIzXmnqmOCCEVxa8S/Q+OEe2aerTEqWQ/aw2s7DRTMR7XBd6CDLLWLh3TYaK91DXulPpr3m54BGCbhr9NBE/tscJ4kzxKNm+eUfoEXvp+G6j4rTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974779; c=relaxed/simple;
	bh=QRm1Gv2AA1GFAPmeHv5zxFsdSoDgKKQmqGhsA6AhOnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZsAs3/O5TfcaMlvc7fGVQM8GIQWTKhYgeFRY+Ci8t3Wks87bWVO/E9vosbQTXGyaaD1Jmqj2ZA/2qFttuOCLeVOeEqux4EUEo9/HXCJSjjNBgHbeEUsPl8LCKeLdEaLsL+zJUw/lYfXz4xqPiUg1tQrWGKDStJ0g/Lwdwa8vgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxa6J9Iu; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so4312232e87.1;
        Sat, 26 Oct 2024 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974775; x=1730579575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=kxa6J9Iu41NNm8hdX8kbXtO+MNqSG4gEPWt2Y3Ttnkp2iihGmDNseCSIIV3m1y/YIb
         4x4WxuC7mm+c+mhTB0N9Pq4uMy5HNfxQ7nVXvd4RB41zecDbQGPomUYkFvj3BPPRAQIx
         4DX90UIxG9VTfvAwDhdIWozHcQy/BycsuJAcsJkLnOFLO8az2iswjPq0+Es6WKUtFsVP
         6rtuiiqRMhpQRj+39XLNh7ZTO9i8tY9ceuW/Oh00TOVutzTdIBS9WNd4vY1IhneJ/nnY
         s8gmfR2ZwOjtwu5mwRDYy7MvBi2J+cnN91gz+FAJYBCv7nLx6Z7QT+4INoGGMEqlze42
         Fpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974775; x=1730579575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=PvlCrMdpYOLHX/s8a1tR+1N0YH8bzRRMGfYTdHM5Kpu2dWMRlTpEbsBA5PAdBJfyPD
         vOQ5p9imbp8Gg5TqdmCsragylcRKNvEBfpv5p7kMK/lFBB6/uDllF0f4kOaP9qb++2cH
         iv7OJDYHF665hgmFioXGZREjZAGZbd8DdI/bEYtknEDgrGKmV41ERlKd0IoXTgK6C0Mz
         K2tWBbsk4arAnithhz3mjtqYnqxpo39zil6o+t6lfOKnv15BTOIFdnBbRau1PZnoWYN9
         xrBB4QnACvo22jLqZHqtdS2xXPJKx8VO8/c71T/42TDBTudsLt0Pz/RpDI/7AooYknn/
         0u1g==
X-Forwarded-Encrypted: i=1; AJvYcCVgda9fRLnvNzlz1h6BJqAajbpHacYBGYjriIiTa64DlvW26h3P0Sou62x+760N8so+ZKqQBJAfaGP4lr9x@vger.kernel.org, AJvYcCVgpdUCjes1e601whwwyS5RMKRw7UXkJ2XvQ+TvfEXoGthMvGY/DBt/VCOwgBx17yBmOcAUE3i19jl0tr72KTSqkLw=@vger.kernel.org, AJvYcCXugRBnufseRUTMwHVZvQuagV2+n7J6m5UtJBNE5ix4WwttGDBwHZ94ldPJHm/+Tme07qHTjOJgtC+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwPZTGdUH0PD3xtnm9kMXialWO36BaMujeiUTpIlpr6D6Ivrkab
	g6kJ6Vzw2U0W9z1wyR9Q8gvKZZeWlkX05ZOwMiDI+D7gDqzeQ4sY
X-Google-Smtp-Source: AGHT+IGe/U7xw7yCNlVrZkKflCS/QoksZPIgpTjKEK2BqRkydCbpcJIzK6HfwaBb965DKr+e1v5fYQ==
X-Received: by 2002:a05:6512:1383:b0:539:a3cd:97ca with SMTP id 2adb3069b0e04-53b34a1b050mr1384179e87.36.1729974775252;
        Sat, 26 Oct 2024 13:32:55 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:54 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:34 +0300
Subject: [PATCH v3 03/10] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-3-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1128;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=QRm1Gv2AA1GFAPmeHv5zxFsdSoDgKKQmqGhsA6AhOnc=;
 b=HDW1N7iiH21cJLtmEurHMCvgcqcgWvT8OTEhZSo9//vXyw7gqKZHkQXBXRI43H4K1hRsp3UWF
 2pLP0DVbPlvBhkSNA9pO2Qo5gsoBtgkSnBUhlu7p131+IutUlluARIp
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add a compatible for Samsung Exynos9810 pinctrl block to the schema.
Exynos9810 has 9 total pin banks and it's similar to other Samsung
SoC pinctrl blocks.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7e6ef8249de6c2eeedfaab0ad6316af135c2ec31..5296a9e4faaec691994cd567bc3805f870aaebf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl

-- 
2.46.2


