Return-Path: <linux-gpio+bounces-12212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054F9B2B61
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521142828CF
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71DE1D63D3;
	Mon, 28 Oct 2024 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsRINizA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8941D5AC7;
	Mon, 28 Oct 2024 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107383; cv=none; b=PNzEMvPmJUBtVq/s0gYhilO/AS5AfrqitQK9MznHnauN2pgIUn/QdGORIMVUT5/mgU3HRfw1J7EFVLbW0WzRlMmQZYACrEBl2Be9LF1i8dg031BS8KnxWxW9jHkcjct7yFQh+Ugokgc/rvR9mDU1tPMLT9XwwAYRLyUXA3jjCKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107383; c=relaxed/simple;
	bh=tRiFoRgs2wnv5kkwhc9AnOYjzd7mmGEE34XIM9iDvVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXsGuXvfOs10OkoRyPgCigeA9um5i1KSz931QK8Vs/cZ14p/b8ey+f0tDAXEklqTBmm0AcPOEc/uOP+25nBmdFey6LScwo9h9IvPdC+nwXp0My5OU4bzoPXZIcSL6T8s5jJ04MXYxVzQ2A4jwVnU6Ju7j5+eYhe12wN/COUAxoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsRINizA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f7606199so4400862e87.0;
        Mon, 28 Oct 2024 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107380; x=1730712180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=;
        b=hsRINizA/LlUDlb31wWp6/+TaJ1tjgyk66c8WVztalBJmtzu9hPxQvDk/rsr0hIHSM
         +iFGxJjXPspIHOxu1BS95RbBA7r5XMU4hzLOQsV6m9n5VTfYZepXvZ8uFErKKjcb4HwC
         g4pwYEFqpFwtXDBVittHitfs81zID9yMv7i+uY2TkW5EuqEIu7oZ1eSCCoV+2Sb/swHR
         ASu8kJI66iJxnocsMykTY3QE9z8jibB/SjGGdXnuf5M+jBC8XQPjwIuwJwx1V0E/ugru
         tqIR8gqLPD519bM/VY28HcT6PQVqlU3wftxoCfSgtcsoJFEGdfgfC4emthQWS0Yif8um
         +7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107380; x=1730712180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r3f1+NvBb+8lEJPQFzoU+pVWA5C1a/T6mdun4fd2Zs=;
        b=BohkkLlP6DldVySJRdaGCqLbtN1OtyZah23KHLzNeD0Nul6dhglBQyIx21JkmZonXJ
         ipCRpM4D0f8R3hInnPcBShlWELAfJWmVxsbJsaIl40IXZCqPERTIAg92+7tvdkmzwBlI
         Tg2sI1yRQi1sM+JQzFOIKAbhndK3bjdARASFkCB7nam3tRfZG8l2A/QHkTtnZKXpD8J1
         kG1EsUJrknEEGLV6wlZgQai8lX9+EDmisvPUZT2EANPQp5VqzG6ArAMRitPL5enxDgC2
         QhZsDgEE2N8yQSUA2HJrujxJ0dHU36P4zFAj2eaHXZoXZ1/8/KfoOjBk+SvUqSz3mP9u
         FRmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGKoqHSPFwHi3NcHNe1Ikgbn6bmcxFySxqtMaIi7VCwLVkaVobcQ0Pwgc2U0lKU0V7+o1CN3KzHMo5qwSx@vger.kernel.org, AJvYcCWMT48jBLHkg639YkDO77bLQ2rps0DUE50gImiEyU+zJB2pqoG2c/wHriLjAGKblx9qj1i6mtosTlYkQBLbYNWmxyY=@vger.kernel.org, AJvYcCXifb+y9+p6TJSjZuOExvJ0tgoO3mmCDoHQjBqoK9J0K3uqoHDk+f/VEhJi5ni+Q4cHwyTVhU41reyc@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsm6yKeSw4X7wEN8GsOlgq65H2maJ8rtMdDkECKn9KiCofRHY
	YPVZEbbs6QIuxmah7izBDMD5b5I0TZ9pVh6KjlNz1N5iZiHKjvtw
X-Google-Smtp-Source: AGHT+IH07RwlPseCZh3Qqq6xIql8XwOMCafaD48lvgI8JY9keCi0ZdDu5sKIL6X4mpiSYvma7Su+AQ==
X-Received: by 2002:a05:6512:2386:b0:539:e6fc:4172 with SMTP id 2adb3069b0e04-53b348cb8e4mr3184554e87.21.1730107379503;
        Mon, 28 Oct 2024 02:22:59 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:59 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:34 +0200
Subject: [PATCH v4 06/10] dt-bindings: arm: samsung: Document Exynos9810
 and starlte board binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-6-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1321;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=tRiFoRgs2wnv5kkwhc9AnOYjzd7mmGEE34XIM9iDvVU=;
 b=NmelZtkcGbyG2Z/YEv0xQlsB+So1lJkC2PTIeVFmVgQ61ByV4QHe7sV6BX/jf12Ti0b2E2gSj
 PUCWT3VY7IfB524i6xOBTcnF+ayBSP7XK23ndFbkDYdLswsHd4gbwWE
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=

Add the compatibles for Exynos9810 SoC and samsung,starlte board to the
list of boards. Samsung Galaxy S9 (SM-G960F, codenamed starlte)
is a mobile phone, released in 2018.

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


