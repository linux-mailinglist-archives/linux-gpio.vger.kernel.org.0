Return-Path: <linux-gpio+bounces-12074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3165F9B0137
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9E15284201
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DDC205147;
	Fri, 25 Oct 2024 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT4GDnmA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B8204945;
	Fri, 25 Oct 2024 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855521; cv=none; b=Y5BlkF2ufPMfzBkosBs4UoJO7t0NckN3+ZAHsz0jY55HuESGigItXJK6b6o8jzS52siDhRQcWXVZNGv150EVz1tNGsgwoEQn6itmy8hjIFddCyPS2ixUslyi9iEOgBKoMwUjS6ZlfW0GNoaaoDtmZAJZ5xJ2z8Ka1tFltyfnF08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855521; c=relaxed/simple;
	bh=wJq9r0ywpF+U/F21JjpDFPiTiDgeAY0OfPL9TFD6z20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4c7CMaEK+wgyYmAUGzY0VEdQRSAlVrf8kJg5wSQUfDOvx3zR4FiZEW9KqQrQDyC9dWnYJ1bkgofmDpMe1nQE99DE8DOHYS1ZNG59gKUL3kUPku2aeFcXdOOw+yMxMDHiJjwtuO+P2+ClgpQXEWveUIKWnH0/YnZr3bKRJPfJWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT4GDnmA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539fb49c64aso3395269e87.0;
        Fri, 25 Oct 2024 04:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855516; x=1730460316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq/rBsz2NNFRmkY6+lVKp+BodwGY3KG6DCpN92vktQ8=;
        b=DT4GDnmAIYnwRe79ChoNO2YN481jtWM5qssDxlJIW1Wi1aEjPMgGNex7K9TLzvwv2s
         cn142hQsXSmCnfHfOCY41hT3obV7IXXUdrTTBwGKlbmOwgOD7XiukGejJjbRM+IJ3L3y
         fNh6AP4pzrpA05F0+mRQLc1Xt3EIHp1wimFo1CH7QgSugrUbZ087iLxa7uj/fdcFS+en
         Etoj/kwgV/71JvHoE/7PuFf0rNtK6iy5XbDAbsdowMKfCLrB6Df/iZhWr0tv9peerrvx
         skQLbnDT+bZ2gJ/oSvCOqZ5QtG02q6P1b755HnfFkFKHpL5NMM5BKGMziATF/H5NWYz0
         hQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855516; x=1730460316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq/rBsz2NNFRmkY6+lVKp+BodwGY3KG6DCpN92vktQ8=;
        b=bE+tvvEqRnnvs9TF/SDgRxOoylDVpL1WJ174ujDjzkf4RcuOuNQcHdwWJ2y957Wh+j
         jJDI7MovDcHYH+Cj/E63D1Rcn/dLD/K9LJ05eYCcw9ILPOg35HvEl2mADAaCLHWzrU/h
         ayFue/gvBv61O4GjVZJUjKJ+8bWf383OWBsXz3CvFJCn2gBFc0QIOPxa4cO1D15MuOFi
         R2grt/Wvz7XMXn/oJn82jxSa1EmmX7UatcIVPCrwmCOBKFZOhA8Sy1Nu0S9pSK5RrEYJ
         KTPLJzQ86sMWqoGglyvoZCIIzToGFyEHnb0TMz5pJLvmye3AWlIlhQA8T9xrYd//wyVQ
         sqeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5EzAeaqfRmkQx8jgzVA7rhgNABgsoXkSLA2SopEEWk5mii0kfRjm4ZZUT1PKQb0vlayNQajGpLFSV@vger.kernel.org, AJvYcCWuDsvipjAz0JdboJhFdw+gxwX2ptg93EsZyyZkPRQu5yNfUSskiwTqYuuKZdorcKJvQ8OhGrYudjxTpC1g0KCUJ6M=@vger.kernel.org, AJvYcCXIOmXyJvyfLyHpTEvJlmfVh4BbJ/AiLcxyoCW8/F7aawh88/GcNPH6pRDNwnUOngvJ1Yl1oPhxdSVhIrRs@vger.kernel.org
X-Gm-Message-State: AOJu0YwB+U5ApQcQnqSH7DRKzciz+zWS+KY0MnVX8PZ8ldnJ08757B/P
	nbHuWr1CsXOQFHehTR9iMFFnmpUtG0V7qITrHuU9DFz0Jf9l4A+wbBAWNw==
X-Google-Smtp-Source: AGHT+IEoGnK9HtNPYcj0srNrK0pE4zJKU1523ypWxDLogLufFQrVDkefq4lkrpeUeQjY70p05SL7zw==
X-Received: by 2002:a05:6512:3d8f:b0:536:542e:ce1f with SMTP id 2adb3069b0e04-53b1a328380mr8381074e87.18.1729855516137;
        Fri, 25 Oct 2024 04:25:16 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:15 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:53 +0300
Subject: [PATCH v2 06/12] dt-bindings: arm: samsung: Document Exynos9810
 and starlte board binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-6-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1237;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=wJq9r0ywpF+U/F21JjpDFPiTiDgeAY0OfPL9TFD6z20=;
 b=cyhMpCuNS6CZPtIHrXY+B7GQEuyo73CRXCgppXOZkGv53V0LbIPEuKjFHjz+ZgBBe79rktv82
 7o4L1mpgke0DoGvU9FyMdZkq87oQp/FS13XBJwWkEgWimCwkxhatcvS
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatibles for Exynos9810 SoC and samsung,starlte board to the
list of boards.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d25a17e697256f8d868e24bea47d21accd1184ed..b5ba5ffc36d687a6fdbc625e6d95c37a8a2e2b93 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -230,6 +230,12 @@ properties:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
           - const: samsung,exynos8895
 
+      - description: Exynos9810 based boards
+        items:
+          - enum:
+              - samsung,starlte                 # Samsung Galaxy S9 (SM-G960F)
+          - const: samsung,exynos9810
+
       - description: Exynos990 based boards
         items:
           - enum:

-- 
2.46.2


