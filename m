Return-Path: <linux-gpio+bounces-12151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A21999B1AC9
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A43FB21588
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FDA1D79BE;
	Sat, 26 Oct 2024 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZnYIzzj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429E20326;
	Sat, 26 Oct 2024 20:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974776; cv=none; b=Bp6yykZ3dNWMxGPbZgtC2E0/LFFv9D4tD37nWDQsMoukL4dXdYhIGhN/wMpfxqi18otoKTVy0dNVbdQbzK05HEuoKIOXuDG7xFvCdfMuKDhYxqMfudzNDyWyDbKVoLDUsFJeQW+8MgQmuTraqgCIsX9zFI4z+uQ25vtNoRhIKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974776; c=relaxed/simple;
	bh=UwXq8/s+/ZWgzHv8GxfRHapMvLu4ujsMuyVEiwqZOGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilw4Y+IaNAPoTBNP3LRUReaAZxUASleqq/0ptkLSxl846WSjUNJCJAaCpSg/BUbjY4nPtf4WhYPE+USGpA03IpPpOAdr+g8u0zhvzotLrxaPHGoZFXvAY5/NisCBcTrxzmno5cEGfKFqF1q/TufZEx02vyL32DHwON2T6+SdNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZnYIzzj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so3206886e87.1;
        Sat, 26 Oct 2024 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974773; x=1730579573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=UZnYIzzjTAIsJq+HEWSYe5FX8z7nmtzCtre3CbVewphpZG6Zi2TsaXxTLfIcONDc6m
         wW7LsXlD0zpVEA/h4XFQ40wWE0w6Ny5Yv2v9xl3k/EofSlhI2cjZ88NH75FmNXFBLg5G
         aXkol6FO1fxoSRjLVXbTNBh4Wxfugy3o01dt/46YlMUYTgQ92sthrnvpkZ3Q4WL/a2Se
         y9rIffd9L8QAM83C8JMbjxSmf2SkIcHtJglAn4oZa+NKCw25XzdbzjZtQxeIT0BerK8j
         8kqsF0/Pm+//x7uDcoyRDYc1d7RD89Rx7X4BS1XgDhW2pvCuq6rKnLwlsXXCC2WZmGNz
         UwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974773; x=1730579573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=eovSAVAdWv+RCmv3+cfmPm2EKAzz5od4s8zJZU0ej0JY/j47/GozFk2Irm5AxWfl+j
         CYW5Ecn5dYd5PexocUeU2Q952YJL32RXrkqB+vCD99uJz7k3shyLri28A1LoFiLRdbWn
         0VCaGraeKrwdDgtQhXgze54f6wlFPx/LTdG5LPqx0NwJTha9Nu+wT8ZhiYSQpRtnPTPY
         XyOzW1CzaD7Ek9NcG6sYcln26PDDlLN9ElfQqpC8UCKNb3jvotP60tuMQgqiTPlVtJYK
         /3CmBckm+NDVl3AVWyr4bQ5qBDj0y+80bqLi6eckr1SpiFW4MHO5B8sb8ixzyN/7/2MR
         RGVg==
X-Forwarded-Encrypted: i=1; AJvYcCU9pG7gQrRLk4QIJErsfee1XVNd008PhlB9/VxNo+qK8W4taTdVk7SgAHlCmt6Nf/o+ccTrl+Gm+2ZoI4i4@vger.kernel.org, AJvYcCVsDnFyORFXNhqrvHhHvWdiK8msx3+LSwVUeZWvO+/nxAJ3QCEW+NL1HPhS9w+UYwMV7101DQyWqgvM@vger.kernel.org, AJvYcCWLrjASCO3qmrFmE6y3Bl8IgGYbiuHk7f1T+y6ZxGr9BndjgRUqoiAbni4Y2yTIFE9dsGXBbJvP2GUI7ujDallcZU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMpzooRqWOQyS50+7iAPs19AQA8d7iLORWeWvppFrtlMKd4aq
	tZ662dgGjbdmjUHYDLyNiKF83zmF2kzd2FxQ0aZiF+FKu6f2SNFd
X-Google-Smtp-Source: AGHT+IFLxbRdaCEjkbzhHVNrBiPqEaPx3e+Cav6SBYUMEISg8VJPQ5muiArk4TMAIABtjOOheplC7g==
X-Received: by 2002:a05:6512:b10:b0:53a:1b6:4624 with SMTP id 2adb3069b0e04-53b236a6986mr3415466e87.5.1729974772337;
        Sat, 26 Oct 2024 13:32:52 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:52 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:32 +0300
Subject: [PATCH v3 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-1-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=977;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UwXq8/s+/ZWgzHv8GxfRHapMvLu4ujsMuyVEiwqZOGw=;
 b=pEgrZ5Ow4GFlkux1RDET5/Od+ZRKUIB3LBVDU83F8TVAIUJCjWsnr2oMj3M/bUm5C0iUTkEDQ
 FLN5CFlwbJpCuWSERdsz8d0FR9f4Tb1A7Tmtw1Y8943Lrupob1xPM/+
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Mongoose M3 CPU core to the schema.
Mongoose M3 (codenamed Meerkat) is the big core in Exynos9810 SoC,
designed by Samsung. It implements ARMv8.2-A ISA.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7efcbbfe73e5a63fd2f61d1e010d29..2fa7d3513da839ddfb2844628b1249567226a025 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m3
       - samsung,mongoose-m5
 
   enable-method:

-- 
2.46.2


