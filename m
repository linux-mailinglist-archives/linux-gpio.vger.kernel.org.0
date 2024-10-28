Return-Path: <linux-gpio+bounces-12211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2259B2B5B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20F081C218B6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4220F1D54CF;
	Mon, 28 Oct 2024 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWpNNADa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067331D2709;
	Mon, 28 Oct 2024 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107381; cv=none; b=k+Hg0wRJTNKH8YjPaWlKAelIeSqNhWpMbvqVl/bEyCzuLOr7Kl1SVxgl19QP4MJtfZ3sqo+DKVKSKXauEHvQwGvS9d3PN0RFaMi/D1xrRIyyaEO8RlzvvaHkKKIEdCIKJ+9fY1d/NfsnurgabrBaLnF/Fb9q19hYiq+7L+KY8jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107381; c=relaxed/simple;
	bh=nX/aujPmPzzwxGs4OFiOnvYO/MsiQA4p8l4iwrKD/GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9NrXGpS7iog8kPRGt8qswDbz90ILS+bjOKzzZXnMTLycJSA10VfB8RJ8GXOhl4kxPG/wa3GAsCCgcvX7/qlAc1JuMDIJtYKr4yFtgp+ijNaDxsAO30x7cYFDc6ite4n/KWQw/pP88h5XL6VHTGzdilO0DureZO/DFKrcMnoRzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWpNNADa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so4825738e87.1;
        Mon, 28 Oct 2024 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107377; x=1730712177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=BWpNNADaj008pU++DjBRKrUX8W05NyB/DdGpgldHOTcCqh+mKy1LHvRpc2wHJb1AiN
         Ldwokpd5phuhBqyItttRc3CZWEXwfyMEdDkaIlfaWZjrB1UukX8QKzB5H3/UPsbp3zbz
         kGbWz9WKYnW2a1JzO9mjVjvxqMexarXzmnnYWzY014j4E26gJCRTN9suAG6dqogdn/Ub
         zgGYtnrATkNTNBzyQeRLRyP/9g77nDAbOG+1tLXpqftxcMHihQxgVsT30MrcKYCPbVFN
         3mVY0tzALELe1f7ECkatXFXLQgE/OL5cLiBMN5bnhYNnbZbJbT5HIqV2WdOkcc0Wtyji
         0alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107377; x=1730712177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=gle7GmATAei9JfKtpjV3/x+4+ktk9Rv0bRM17TvhUWiNX+beFrdplgIWxqv9LzVjZd
         CNHSJ4B6W98Hf+chZi33jMi4zOlKWBeD0YPYqjG4mZtDFmSH5X/2Ts+n31XkaCzj1g1f
         Tc2lPDaHuEX69KF3RRGQC1v6/sjtBfqw9XsvmjXz7Ouv1xJlcxhVfoCR/KUgU+bPX0NZ
         cX1mnBshHFPMSEvIqaA91imBqD+iiv/5yPBg1bQAmBWMW9TNZaM7a7A8eQ2QWboq8o1L
         hDYvohx947EknxSQyUvN5lk9O4AqDT807zzvxcdhf7Nk0nNqJtYaei5dIJW14ehBqbVP
         HApg==
X-Forwarded-Encrypted: i=1; AJvYcCUA1MEXzKObCV7lGHdU4VBgtKXDkfZKRmv/+ZjH3gdtSC0kBFORcrQ01AwIBs52eztRStbMuNcFrrunqAJx@vger.kernel.org, AJvYcCVO083b3vF3o3RRrLyASNg/OLow1L5aqewmsB1RwYF8VsPlR0fRrvDaS7c0d1aqaMy06kW7OewaYP8+Y271536AhSE=@vger.kernel.org, AJvYcCXEYl4xNLtvI+hco8c8ltxmluvugx4nbwcpu9no2SCfbboxcFTbuylaoWZzntNGBp5V4hSFI5mbzKj3@vger.kernel.org
X-Gm-Message-State: AOJu0YxB9+3myOSM/P6pCXUo1GL9YHCdySJ/Ycx4e0xB9qvoeYNrW0LP
	6EuUB+RvOl7PlQ7nZHxxQDdHQdrJe0HeAOnxnXVgEFN0waXB7uvDUmerPw==
X-Google-Smtp-Source: AGHT+IH0r7NhuE4e3aS5DFYvV11dcgTWYihLpCXJFndQTB+bM4ir6kkVsAOB7fNFSclJ4Bc1GcbMCw==
X-Received: by 2002:a05:6512:138b:b0:539:eb82:d453 with SMTP id 2adb3069b0e04-53b3491cb31mr2950188e87.39.1730107377080;
        Mon, 28 Oct 2024 02:22:57 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:56 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:32 +0200
Subject: [PATCH v4 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-4-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1230;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=nX/aujPmPzzwxGs4OFiOnvYO/MsiQA4p8l4iwrKD/GI=;
 b=Sq9kFPvTP9YcHAGpXXU9jGFS9IuV7ycqPn3PuCUuF91KwF8lJYHbzjJsZ1CKRsmse5ZyVGwcI
 3/73NGYtnQfDIa63R+wT1vGaT4m2M01R0YDaurWfxn2T24Pxj7cdD2j
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for Samsung Exynos9810 pinctrl eint block
to the schema. It is compatible with Exynos850 EINT controller,
and doesn't have a dedicated IRQ line.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 565cacadb6be77b1be1a7423f88564dd950c44db..68ed714eb0a178c46228bac142d69bbd6baa6277 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint

-- 
2.46.2


