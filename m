Return-Path: <linux-gpio+bounces-11887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF89AD7CA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 00:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95C72B22DF3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 22:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C33E2038B5;
	Wed, 23 Oct 2024 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRCFjkFt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA64E1FF024;
	Wed, 23 Oct 2024 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723046; cv=none; b=jkVQyjDWLknr669e2Tpqrss4TE74eN9yeD5c/Q7OITFHhhYXWqGqvuSecu7Hx5ZhpvGulFpc0T5Qpfoec5B4EdW2DH6fmdzzP6CYqTUC8waKKvrjLM8Yz3/iSC83HoqVoDUDGh49ofw1cguVUcIznFRZ/D3VUhCMCWtWrEUQMG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723046; c=relaxed/simple;
	bh=BfTwb75S2Hpyd9jfrJaq805t3UYzBkYWxGTpfUT2r8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxonecqjoGX7UD9XpCg6+dAd+8NkmUpJfqCisHavLrq6SK0NfUgnmx0F1y3uBg8NeykszUr0iFjGebjRU8x4Gqds3+1j10qOnOABh3W0h3TDZ37eTuA+q3CCfN/A8M/9MhloN+jQ8f1D1HQRkd1DBsK7ImC4irt5jbLjdjFiYIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRCFjkFt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso2062151fa.3;
        Wed, 23 Oct 2024 15:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723043; x=1730327843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSBkWGpVe2U/Z9O5WeF9k+f5OatGtFBj22iPtlufGf8=;
        b=HRCFjkFtbmFvCqBgl5Rg9oq6pHveRtVfvMlSQk+zBsoMIeuU+/ZFt8jC0Y0i9ckuyx
         6SjbUVYa7neYIGZlhmJtfyw/b3SRjjyp1GZfIsGUx7XqbEYeTDq7xLBdCj/7zdTHDDLW
         ozkCzzwMWTQVKZX4wyFkv1BmO8taxPX2mwGEA6lIsSSRYrNqEmBgq3Go4VjvRViVmW12
         Z1TW+p9XPRkI/CGjG2EDhVk9tQ2f27kFm29xna+VdnB/tuTtWMsebPG5RqpOBpPWS3Ta
         NJB+41vKgOr9V3jTWsu5YmxHbhaN0pIkgZ4VkAh+kqGVvmJ//3zhrcw/+r9RAlHPHpyw
         5PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723043; x=1730327843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSBkWGpVe2U/Z9O5WeF9k+f5OatGtFBj22iPtlufGf8=;
        b=ChFTKCEJL1WmRpxR57W7fUnJjylO5H7zsqCtAL4jbShb/ESrv7znLaKrxhbfv9LXmH
         C/2QHc7eIc1hSKRRcN8sPSo/gTAB7Sj3nTkflzg4sC1ZYNOYCoy9aGf0y/jZwo9dA+Kf
         IJjMvOwwFo0M/0ZR6hCKQBssWtkS8iT8eFoGaH0eyDGD0+ON/B2r14LM0PaxKiHcP9pv
         FDOVaGXSmG1NAEUJU0LNbuW8h2vNXo+Z5k9Hl+InICdzGLkEUvT4VRw2qsjnaCPblpfa
         nMjJRMCw2EskuBYV28OWMfI62J/G0+5VQjAm8hePyXloJtYCXNWdbLuGJzty2TS7w+fg
         4dBg==
X-Forwarded-Encrypted: i=1; AJvYcCU0J4f4IP94V6ufTQSxTt4LBV/i5KkDGc5qgRZ3BT4ihMLIH3dOsAA0CZnYL0gqltWpyC+MA9v2i+X75b2j@vger.kernel.org, AJvYcCVJHcnz1KfLs05LB4StkKNicLYfriHbvzfJ2EonbuLzdmc2ruGvnqIsU+Z+FxwzQTUNglitshX63EJj@vger.kernel.org, AJvYcCX9WI0xeFRDadO4ZHSSvs9EugQFb7tiYJA62xhubRLoIr/HS7daScP5IkYS4f0eSrHxPfsEoU/2x5ocVIojwvsYPwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpHZjjxruFDdkTw4DnzKJv7ZVX2JYaNHHlsWCV9v6SUJnjFy7
	aALvP3BnTDyfCq7Bvo7AG0ksrhEHQIXXaP/Qh5PmZWNbInYidBuY
X-Google-Smtp-Source: AGHT+IGjZMd7lNPSesBB4Tmg01Ndbwt3X3of4Q9ZQW1OG2xoTjgCMA0LpUoOoNcxpDKIH/SJlp8O9g==
X-Received: by 2002:a2e:4609:0:b0:2fb:522c:7ee2 with SMTP id 38308e7fff4ca-2fc9d3939bbmr19813691fa.21.1729723042928;
        Wed, 23 Oct 2024 15:37:22 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:22 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:38 +0300
Subject: [PATCH 07/12] dt-bindings: arm: pmu: Add Samsung Mongoose core
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-7-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=851;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=BfTwb75S2Hpyd9jfrJaq805t3UYzBkYWxGTpfUT2r8E=;
 b=LGLRAfnRMhJak84IWvBl+vHwIuNHJwU3Q21jyQ5Gtp1q1WY5CiQvm55D1fRhgNvskr6O0Xj6M
 G8tMiF3WTA8DWPz0QM5awsEsoiJ9w0LLKjnPmpo9A8Up2IOuQaSy5h0
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatible for the Samsung Mongoose CPU PMU to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
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


