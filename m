Return-Path: <linux-gpio+bounces-12154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06B9B1AD5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 22:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F05F1B21638
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 20:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B0A1D95A1;
	Sat, 26 Oct 2024 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0x91KJr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750AF1D89EF;
	Sat, 26 Oct 2024 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974780; cv=none; b=UTu8ksUkhuSheK4VmGrGOel2aBhHpy0otLcl+wBxlfuZVMJGCgCsDO75jjeMaMv8Tosk1y7jHD0pwwXc/RUORbw6yGYleqUt4rM0KgpH0AXdyLiZUByyCSK6s7F3ViH2w7aLKuwdsT7twZbwqVo0YlJT7+Oz6GQUEryUg0CeO4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974780; c=relaxed/simple;
	bh=nX/aujPmPzzwxGs4OFiOnvYO/MsiQA4p8l4iwrKD/GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgL3VHWqui6/VmcPggEucduOi0r9qboGhqeLZtLpQFs5IwAN4D0bckhXtqRcAN3bh0v8eqjmfHyLcka+zPmBWPY7GfvCbXsOoaX7aoPeaCydYVE92cq3KCUfepGSaHNLpy4VEsB92oO0pnSg9YWB1ROJGQv3zaO7Apk8MQ/W29E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0x91KJr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so4965082e87.2;
        Sat, 26 Oct 2024 13:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974777; x=1730579577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=Q0x91KJryEHMX+vTr7YPP9hKdntjvo3DJPl1QDGHA2KirUQ3F0nLDNZ8uaQqAI6ST6
         w1rRhLRLgyvVKEMyRi60esJZB9fCYvC7Vr9eoHTN5TU+0SfU9iT2esjQVW26jDM3YUeG
         HMlQXQv/Y5kBdFgwZNRTp+Da62cUaiNMwHT3orKaZ5fqDEEwGcZ3JygqeOgSP5hjbrGD
         6qggn4a/HVvMtmEzRh6R2p865y+HNPclShYFQljTzfE699MuwUxHV9GX6plHRL5Lq9HP
         CYOlwkCGSYofo3dqfzpcbC2VxJYiacRIguD2ffCMNxlCzPNLuY50pZNqmo5trO1r/r6m
         NewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974777; x=1730579577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=X4j5nTWP8mQpvuKaivdll+eFSU7ulJqT5Yzi7bLlBV522TimU0oYh5fSzJ2YbMkaG9
         FhJ5Yot0HS6Wzg2qyCX8my6yQ3IKeV4u+7XBcMA6BIfyJZiHQvaa9+zRvnAG0m++PK0T
         9JcqRE7ilCaju/dV6zFNtMXQVbdw156aGdvHTJxas9GpEy5j7w2F7WY59EE5Z2mRQQS0
         UT3qAD0DP4NEHofcr/3d80yJ8PIK5lcgL3M1PdVstC3EiOxeNXug7dY8MT0IJPgzHADI
         s+TgixTYDMztpjSgid2z48s0Y6hIALe7hiD6O0LNUaVyHod4HMlxZgAdl0F+JlLsm5mJ
         fChg==
X-Forwarded-Encrypted: i=1; AJvYcCU8evlS2molxTPnmnyaIsi4nn6KI5OV6+ChQqbRbBgDAAz/JIEFkwcZigg8mPT5IkSQ1r2PSi4Z6Vr5cRJV/hqWY5s=@vger.kernel.org, AJvYcCUll97hi129+LzW+7YndtcujuUaiStoBrTsJ2pdgFmcpk+ppRYfT+SLVgPeG8uFaLqLxAFyuS3kbtgf@vger.kernel.org, AJvYcCVgAKoZ7dEbQm8ZPzSvdx5+iI4wB+TM6oF+Yqws/lhY59W8Arbrr0mHovecV94/HS+rrmgfWe13u+IkDL+f@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCi59pYOAfusXOJEiEfnVIRW6oj7VKcK5818w2whcWIVzsqQf
	7/tJtD9GADWlwHmvak1JWgQuTmKOSGRJkmNioo/MG77O2QTNSzFE
X-Google-Smtp-Source: AGHT+IFa2cx+0Db9MPUpvPUybZJma51YVLqGjs037Ljgs+OOjPeRfsff6mJqSA/kPnjStiC9XI1WDA==
X-Received: by 2002:a05:6512:33cf:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-53b348ba0bemr2131592e87.4.1729974776404;
        Sat, 26 Oct 2024 13:32:56 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:56 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:35 +0300
Subject: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-4-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1230;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=nX/aujPmPzzwxGs4OFiOnvYO/MsiQA4p8l4iwrKD/GI=;
 b=ulm69Z4o3o1cahCfZW8YV+xutp/R9Nj7er2UZqMzbkJfaINK9TcPgF83sxdHRHBdWexXx7rHG
 5GF51DcJR18DQbQcLzdR7sea1bpqyFfBfZD8hlg2oWgkqzFZ2wbgH/a
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


