Return-Path: <linux-gpio+bounces-12155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A08BB9B1AD9
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400DF282556
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0171D9A63;
	Sat, 26 Oct 2024 20:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXfT+Uf1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12584C83;
	Sat, 26 Oct 2024 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974781; cv=none; b=o3AqgFjTFDtxU8274CjmpFkeMA2s3Qca9+brQqzGYT7XV0RRh0GEDgGpXCvCGHX/prUzo8a4APGxwfjeNxryKHpmtcAjO/FeNxnS7BBk3gxz9w8ZQEkvI5cqB70GumBJG+4Bu4y+xnh1rHT9zf0TrOdmpu2JoaMttZPyEbDFRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974781; c=relaxed/simple;
	bh=BYkuQEvmBOjDeOJiyY2S6irVYNGpBs7FyenLcNADI/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+u2n/7FNNfRdFubTPIPPgS7Sn7f4tvTWbSagYIfNzqGqJUZH0mgk25Rh2nrBCPZkDoRgSPZTzKY8vNfY2zptSNsdBLsWlqx+YJk5AoIJvGJIn8gVqqk3RCqInZuJNJBThlFpDjklbV6lLnYZos0WKdA9+xRxgWDvM8xK5AooqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXfT+Uf1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso2845877e87.1;
        Sat, 26 Oct 2024 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974778; x=1730579578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=TXfT+Uf1HcXd5kkxDLM7sIuWlSr4oTJ7qFNmv82DR5yG8gvzIhDWjLD//IqRtQrgy9
         eL+foEkj1l8vJ/AnFVlUmqeUmzaf8bD48i3kZyMfz1F+PPMhFg6s+x93UWolveaM4S5d
         kSE4qvX9dyMMmrcN/YoPFPYGD8djW5YAD6ZwcslccAxz72LH2KFmDY8KhoeqYEqODSws
         xPLnnHn5D2YYxTITHKDujZtf+Bc5ObMB7/TzU6R946NdCEl0/8Tor+Sw50GWHUMwUK32
         NLCqLs2G2rshcgLG/DyX7Nk36KpL/BYB8cm/8IJI2gLWWUgsPnIk4EqF8Yr5ut0enri3
         Q17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974778; x=1730579578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt0YV3G/Lz+aotZMK2Qv9/6LIC8i2CceAvIskO4P2nY=;
        b=LVEjbXMlNMlck5a5OwuCz0U84G5d0HqcFyLj0m2mo7nO1py1XT4RTfk18MGVZcAq5L
         /HEGDfsZ5g2TvQeCsf93XHXGwHYiTLoP9XOxsTXHy9JstG3NCIL2JhGRur1JmK9HcWbl
         4tx/rG/WlFFg5PBBNV5UusVf/ql/bzg8ryYDd3s3I1IbDw6icTnFceDoSz26JXHoGhm/
         Osro3sNzFYqD6eKZpoOATC6NI+cQFvMts2lFStdjYzECZWlzorWd9ssfQVhArcNPjREY
         vsk6ANKikjDLDgZ8IY7+eReLWXLIMxwsfvvVia+VunALj419QRGd26vVr7YsskrPPJTl
         1Tew==
X-Forwarded-Encrypted: i=1; AJvYcCV4TTXAtWD1JPVkF+ELObKTJUj/G1Fz/dkS6zUvGN9HfGcsyh2+lV65zzthEdJcQ4mPMZmuB/vWdqelsQmM1oecPXU=@vger.kernel.org, AJvYcCVJR7FEbuNqsFsv5wLXLcTW++Bb1wz4tv+RM55nZyS4fGgaU1+p+Lox+UsGvloMdRh0NA7IG8XF4+goesG3@vger.kernel.org, AJvYcCVnafmgl1zD2ZK2net+3LzWk14Pa9KXg4mEbF1vrMtICeiE5TSiPW3dOjuEGdPDL3UtHoTPRANxfHce@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh1YxLXsj+afTlVuGr5Xqv1+HWwIcPSbKkqs5fzE7goZdFHgNu
	k3KTXM1am3iNld/0JOw2oQjhilKdKw/wAIkbVLlOQcRVZxfic7qw
X-Google-Smtp-Source: AGHT+IE94seOWjt2vhWS2tlD1plFCn950iTFoMq3FqH1akUBlIephQUCBaDTJE0ncDjQg1eAFgLidQ==
X-Received: by 2002:a05:6512:2304:b0:53a:aea:a9e1 with SMTP id 2adb3069b0e04-53b34a1afd9mr1629513e87.54.1729974777564;
        Sat, 26 Oct 2024 13:32:57 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:57 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:36 +0300
Subject: [PATCH v3 05/10] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos9810 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-5-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1139;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BYkuQEvmBOjDeOJiyY2S6irVYNGpBs7FyenLcNADI/8=;
 b=gh2voepCAWzOdRwEp6EGoiNM1UJuCN8nlQjrzfp0lhXDOIUobIKmQErhH3P2veI/Ysa90ryWQ
 FExTP4oPA0zDOUyGoTDJAxdOb5rEXpB0kQqefZHS0fIim3KtlfDxzvP
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add compatible for Samsung Exynos9810 PMU to the schema.
Like on other devices, it contains various registers related
to power management and other vital to SoC functions.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5c4ba6c65e6926467ff0e90142ad62fbd0b9e1e8..6cdfe7e059a3556dfb872818f1b2649ab6b0e8af 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -54,6 +54,7 @@ properties:
           - enum:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
+              - samsung,exynos9810-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu

-- 
2.46.2


