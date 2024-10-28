Return-Path: <linux-gpio+bounces-12210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED7D9B2B59
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E30EB22343
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A491D3653;
	Mon, 28 Oct 2024 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OT7xi9/v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111C1CCB20;
	Mon, 28 Oct 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107379; cv=none; b=I3Z2fE8adPMx68lmyvQdB7ZKKzQ8/Ao9ccCIF7oXQVhcT+qJD1hVcU0Wn7N0pPqrA0b8K6KAhIc5wCQG5dtBMyD34Wv5Ig1NGJ2Ba9b63WgJenbBgLozxm0lUTamWVBiqeVZpQ0NZ3OF56Jd6N0B81rG4/6FBX2YKsma9xDNPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107379; c=relaxed/simple;
	bh=QRm1Gv2AA1GFAPmeHv5zxFsdSoDgKKQmqGhsA6AhOnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3Sb4K1T/pLn/InBTk0lOKyLKPT1T+zvKsJdQnlo6D4gRb786JWjiGNIgb99rxY4CDgvpHoWl4HE+rtG12HFdQKdaIyubNA5qkXCePiDeNqdCM67ksNOD7X0uh9+W7WWpvHk5fT4ajnW0nahFKdOTDTMJnvcqVTFClWvSvfqaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OT7xi9/v; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f6e1f756so4256523e87.0;
        Mon, 28 Oct 2024 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107376; x=1730712176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=OT7xi9/vqzaAFNo0iwKF7GrtHQ1TpZpppFWzG/gj7dAKO0tglThFRL57RY1GVBr4xX
         psuoWjH0Avibriadlio7YmvuevQEC+MDJ08qP3vSaKH40IOntmCXPZ7H9DNNOj/1dKVt
         nBPNHXvlhNE8vyTODSMuK7e5HMaswK8tD7SscOmHGs5NnBrS74sbF6F5iYz04CYVWNGj
         KGNl7xKm3wgMwQ0Hnc7vdXwsGFrUGGqmjNO32+0FHvQFn/6IZvrdirEx9C4NLCzzTyd5
         3sIkqqU9DvzK4Tl321DhX0csLmLuiPCtOrsl1Oc3xg/GhAIAMl+DCv2mFcDiWYCDU908
         Sdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107376; x=1730712176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=FIbZoN4shNsKX5cs14nUypQQRNWygy4Exya4Wu8ImvAbUtaztWJaAOXwPqcb6+T05/
         wKlyErfdV9V7S/+W8SDjBxs8O3F/y733tH6/o1tLkP9I6w8VqA8KOozi1pOND033gLn6
         S2hFYv/Ymv9ISv2oCWfJCFSz9DmsALuiT5P/eJjnbTf20LN90wRCwvKaWNknPgTqIpZP
         Tffq+w2NuqqJ6aeu1MbwigKBZES1m55SBP3iPVXPGfcjwiBap/BTqmNmEv/w46YWVKYe
         8sl0x49jVHtRra9cUBY+J1Hieb3ztYTb3j6qqcM4MJd7ZF0b9NoYv2UY4/R0AoMeEoQB
         cyqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3JT6Ey5nK+4Cr9GGSTK+GFKsnPnzWNIxbneQKDs5jW6y5UMgay+2/he73j3IecRUCP0Rfed3BdpGXjHnR@vger.kernel.org, AJvYcCUSv84bHW4vejdDa7QKYKajj6sS9EpkJXiav7mgZBXhyb81nIqNNpKJzdjcG3ICREYLOvDgAsElhZC1mV0s57wKVXI=@vger.kernel.org, AJvYcCUlnSgtTNB4gfElZ1YdTyS3hadE08FEJjvYw7ncOwQvyeAF2QnexzZQ3uNumYoDfqvijMQdHtCqiIsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwjZ/Ekfewn1CmlbbrKUrBifletSyMHfi/kxImv/Nmx+2vFQpnq
	Dcbarfv567txVveCvJJgId56fXhufSWZ0ZkbSTRTWEBeAKeft9V7
X-Google-Smtp-Source: AGHT+IH4Qn0DWlrgDH6dSglOEm0aPX5GaLiU/VFtyCehoRKway/fv9to6M8P70PfL70BsV/WQYkMjQ==
X-Received: by 2002:a05:6512:398d:b0:533:711:35be with SMTP id 2adb3069b0e04-53b348e154fmr2628861e87.26.1730107375577;
        Mon, 28 Oct 2024 02:22:55 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:55 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:31 +0200
Subject: [PATCH v4 03/10] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-3-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1128;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=QRm1Gv2AA1GFAPmeHv5zxFsdSoDgKKQmqGhsA6AhOnc=;
 b=SO38jkxxf+cL+EcxaLHg1ull8iFa1CiKhCwNTDWNov2Dn54a+i9AN0q6a3EOBeY9WbvQzHvxA
 1zw91RduGl1BEgyim6tFUDcRRRk/t50MSPTqUysznPyF40hunoElSuS
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


