Return-Path: <linux-gpio+bounces-12075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559959B013D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 13:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E27CB223D9
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 11:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB4B205E04;
	Fri, 25 Oct 2024 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqGKY5jw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250F1204F73;
	Fri, 25 Oct 2024 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729855522; cv=none; b=WtE3E4mf9KUOR5EyF0cA7mmWUzugZeHjL2BXWenXv3vQNSltUtPHGh5yLElBU94SQ8pE8d12OWUjjxLLvhqJm7pFV+ghtEXTaj9z3TgnKVyaRVDr4sG4Mvic/x6gorB3GIxecw1KIgdrJ33/pRgRr2Vqlf9IpZldUWUK/EMppwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729855522; c=relaxed/simple;
	bh=gIFcDF3Nn6a13khPJ7KdJaPJmVQk2lFc9U58rW96C90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQ/gXX+fyBNMt4NPhl4LtCM8tOw1kJbJ8/tkEWKeICWEeGkVZqx8nealSUGd6tNf/Z29vMHxuB/LczY1A9fA71G/CpuGkCKkYXfOuct32sVKBLunZg98Ql/6qB48YhKTnWdEC1lHM5ed5GTGtLdXahv08Liy3J6rXvAdem+KOTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqGKY5jw; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb58980711so18590201fa.0;
        Fri, 25 Oct 2024 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855518; x=1730460318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvC6tvQpNPhsh9+31TY8jiPxbsRMSiM5T6Ner8SFI7g=;
        b=cqGKY5jwk/niIjegGHDHFvLDTL9oYfQxtG0OWD8Ql7EdeuzfxGGGNIiFqWX9PlZpxf
         5IY1rv9i+wCwIAQIx6/hv/uSHcvfVc/+jbjkEit6oHikry4YZM3thq4tVkQUWBcDpUIn
         2R99tmg7+KoSP0j1lltw4dgqQ7n0W3A31jlFphG3qCZxsF17xbiOY/gpYEPxgqbHe1um
         nM02v+iMH1BckBGgLTDvyIrmmtaeR78MOXCgn13idthBOufO+KkVIDpScmm1+vpwS3Gd
         dJUhvJ5g5UC3h3AdmdObIrEDbRFsEHT+LPOV7nLcMwiJRqbfftgt2caFn9jg8CYYjHFL
         uIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855518; x=1730460318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvC6tvQpNPhsh9+31TY8jiPxbsRMSiM5T6Ner8SFI7g=;
        b=CAXLaScz59vgxvYX33kj9gVImpnwOhg164sXbnCPbmP65lAXOUSU2UiaI7944K4+u+
         GHzP4Lejak5XjKq/jiAOM0k8gsDC+IPEvvdBTlC+oXR5Y6ZnDVtjj2n1cDJWe3N+akAs
         OqsUQ6vdl5Ebmlg4t/oMwoQrFD8oKWcKodyCChzmiE56gy+EA9n2RIzTZXqudDPM2/rJ
         zXPUCG6yph0hKjabzLi/RxnUqg8raoWFzcLbJvlGqvQ//VFhcR0NVUvYEMOun4HnrwUr
         m7eeW/oW/0K+7v5qI7ohr1PU5J2w7AY2v+3dYGW0djRE1fv8C8AgG+o1zcLmrOgMdyeY
         S/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8EdVrmbCysKgvkKCx0IqElecXSmXtHHv4plTzGJFl4FQqQ8xHwFcmS/kR0YRLghTq/RqZYW11ibXhypSV@vger.kernel.org, AJvYcCVpFvNfV6hLxItk8MpYKn5etB6t/gZQKMn/yfmj27DhxYWCWEBmuOV0i3HP0AGPRF4zAb2zCDCOi/JXSlg6nVvxHfY=@vger.kernel.org, AJvYcCXp5PXZaESagp75QBAle37rRgcLuHUBhyV6+DfsiMAViT07pT4DvPn/eo6p9msTOtAok0jXGxZk98Ae@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59hTZBKzeR0rMWCLMIj5WGQjKdunIVezE9v4so87dGJpRO7mw
	cbYiwlAeU9pD5TCygXX5Xck8JylzuCFWzs+8iDt2jQUMvJx9YJCWKXyo0A==
X-Google-Smtp-Source: AGHT+IEONmK3EqNWp4ION2KugVO6B1hwdllH6wTUgZsutfMNSrjvSI/avK47fOi+sOs5xNNmozjsLg==
X-Received: by 2002:a05:6512:b0d:b0:539:e6bf:ca9a with SMTP id 2adb3069b0e04-53b23ddee9amr3249227e87.6.1729855517710;
        Fri, 25 Oct 2024 04:25:17 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:17 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:54 +0300
Subject: [PATCH v2 07/12] dt-bindings: arm: pmu: Add Samsung Mongoose core
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-7-99ca3f316e21@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=909;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=gIFcDF3Nn6a13khPJ7KdJaPJmVQk2lFc9U58rW96C90=;
 b=Xzf7ozUZ1q/1szWYfZVgSzhsL4JnYbG8DEq99qnIfLpVmOvmJOCvyh0nKtj1bvGBmRExXcn9E
 YF7V9B58yKTATw5eyOEgWrsP9PyqRpzj2XLIpfup9Co1vU0qKMFygZp
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for the Samsung Mongoose CPU PMU to the schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 528544d0a1614c9f9bddaafa8dac4782d09ac7e9..a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
+          - samsung,mongoose-pmu
 
   interrupts:
     # Don't know how many CPUs, so no constraints to specify

-- 
2.46.2


