Return-Path: <linux-gpio+bounces-9646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A1969E2B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609CF1F21CA4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B4B1A725E;
	Tue,  3 Sep 2024 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ts+1Yktp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0BB1D61A4;
	Tue,  3 Sep 2024 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367487; cv=none; b=pNkR/Q4eHdEMj07nrbyPHD2u6hqXFp6dzIRuvNu/I3fOWVKtejqeclIqixWp5KopyoFSJ2rIWev6qGibfXFkD5l8a1SmfR2ZL3dO0fxKOdagCqxvSXkTWki3Onp3+GXoVmtp7r3+KW3ZIMT6rCatkcBTcDGTO/uRDk5MlGLBrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367487; c=relaxed/simple;
	bh=AiWC3ZfhqL6ldc1FB2y26ZdRa35WGsVGr4Q8zOs9JoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7pCSNH3P7XbC0lcp9+zIKnyTIvZNGAqYIqAoqeivvnte2qOk4wLz6OG66gYrwfC9rib9BlIfM4cBFJgPTLrjkS46B8dmXv3i7CNFZ6DdTzebuYUW6kO0Dc0NmciOdP7ax2TLoGlV6OmoGuwzhPj7s4eV5i+9iuUeVzGXipGzsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ts+1Yktp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a83597ce5beso842684166b.1;
        Tue, 03 Sep 2024 05:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367483; x=1725972283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS4Hn7bIf4a0dCsNyQ0Lh+IAlZYQwZkw+bfpG9czwyA=;
        b=Ts+1YktpmONUnN5/sPMIofJrbSnz+1b2SMbY52Q1naEM7Rw7yAaBaKhqHVz2JcpEcT
         7hCFyjcReooAHvmulEcfaLJ/5Cbg408HaMQn7M6O+tw8eYlfRGgOA0JPysFLrPORETVC
         OSv2N0rgcOIbWeOa4jLdw98PPkvQ1VtBd6okEnbErJnhuuLJGLnUrUQvzJXcdC4hS7ok
         jpnsnw+Y0zaEzT9eja9g/orzBIACX/GPrrQqAji/ReKAIQgUx1ZRzMUHEwdEL3I6BzXy
         bog+e6LT7b+Bn7NlHrfDoXfh5wlLJbpILlznpJUijrypFPhTDzE7wPl7SUgIM9znpRgA
         5N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367483; x=1725972283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS4Hn7bIf4a0dCsNyQ0Lh+IAlZYQwZkw+bfpG9czwyA=;
        b=b8MQqxAqy9ykiG8EGllGcPTwUkAKC66gDputXPk0WbJw0Xl3qc/KNd9lUVF1AdxY6W
         lBXHnYmH53fhIPHRPOuI/bmM++ggz/wJcI5qCTGK65u3B6byQO1CgdWVcQXl4Ui8idBf
         pn2ZtOEX0xDVQi5vRNyDr4emvI1EVjZUbwbknCbMI+7vg40ZNzOziv5HBT0hqd9VS4Rr
         El0UkTSLGsjusRzjgyWgCIb8tp7Td0HLMEtPqkyRwab9WX7AMklTBh7+FLCbLoWWC0Yy
         wk6nR74EoECfKihsum8YTcFjAXK6xfrDzAmA1aJZ4RSyWPIKK4yfs/iDfDMSYIWFajDp
         OmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSoFEDvjousIuq/eMpqKC8CDK9dnfFSaW4DN3mB9mRdxC2qYyUe+ZkQnZc7ay8W29DP6xnRHvY1CDn@vger.kernel.org, AJvYcCVlS0jHbgZgxAYW8gOIsKrjOuWvAHDj8534xkfNZQcIrNfaogaaD7GT2Cf2x3CLT0ObHCmBZO8LTQuScZHr@vger.kernel.org, AJvYcCXW2ZJTI2l1tjsB7k7McCdYzXCIIiU0IRGAIX+ToaS3HSTzjsuN/zFwkDVGkFt+c8xW2ePjhIM8vRzAmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1RQuyduBdGHCP5QRuhBGppJAgqbM8qBlNkqxHpkbdpm3lFEO
	Z0G2hjJLefR+97S2PC+2kyrqYqyKRn+Wbs6OIBWqhZFiMioEX3T8
X-Google-Smtp-Source: AGHT+IGLBNC8MUEfSzsyKDPkV5fJzvotpRGY92QnlYeT1MmPELE+hr21sQcCzrKOO20LhyjbVlplzQ==
X-Received: by 2002:a17:907:1ca4:b0:a86:84c3:a87 with SMTP id a640c23a62f3a-a89827a9635mr1797406366b.24.1725367483446;
        Tue, 03 Sep 2024 05:44:43 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:42 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] dt-bindings: soc: samsung: exynos-pmu: Add exynos8895 compatible
Date: Tue,  3 Sep 2024 15:44:26 +0300
Message-Id: <20240903124429.107076-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add exynos8895-pmu compatible to the bindings documentation. Since
Samsung, as usual, reuses devices from older designs, use the
samsung,exynos7-pmu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 15fcd8f1d..5c4ba6c65 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -53,6 +53,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7885-pmu
+              - samsung,exynos8895-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.34.1


