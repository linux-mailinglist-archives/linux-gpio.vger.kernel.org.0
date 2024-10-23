Return-Path: <linux-gpio+bounces-11801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0A9ABD36
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FB6285144
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CEB148833;
	Wed, 23 Oct 2024 04:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOoQ/N96"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B913CABC;
	Wed, 23 Oct 2024 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658706; cv=none; b=Dy0Zr0841lwd3L+oqeDnpNMQKVv/9qzG1gfO7AGSNGeAlvHKcAdpFLBxOYq1JIVnr5VZSdWXBcgHhT4/zySliU3hp0faW7tVhlm1QARRtravja84KD0vcBUi7KHKwhqEVLe79ZJs+IQumk0GZViBrspCjARPJSY5iiWmMklxwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658706; c=relaxed/simple;
	bh=UlYlVeLWj1/jD4Wc+V8YqMdxC72e0nUCkBxTnqcmimI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krr561RUu8GyXVrM2MB/0PkCy7PjbM3enSVmg6RR2H6BL0gfsKVIHsqRV9Z+RwowkFxR7blwbn7woNFg8zu3EpsBQaoqngCatfDuojO4ktalHsSC3wOjdkuOY6z3B7G5G7Ko3r1uavVpiQVepcGDduVdIKN/jMhutfD7yx1C7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOoQ/N96; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-207115e3056so53727535ad.2;
        Tue, 22 Oct 2024 21:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658704; x=1730263504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0oa/ZitNLoZMPejVfhkyWaBLfp6DNfNYv6Lewc+8d8=;
        b=hOoQ/N96Ccries0ORljx6qXWEfiQTVo84RZaKssBm0ot3dBbZ+7oL2hbuUOc4ZTboj
         PsBNYvZbkvm+m05ytHKciVT1ErGrOx/ogsHIlNkGiEMCNDByI5aBvQiAvh9bsxHJRJKD
         oqHuuvn64xYe+M6qjOwgEAHK9O3mXKSCaRvrdqievbAMHb8O174tcD6M2RfsdcplgWu1
         VRdHVsolIAZ/+NvlLvH3l6hT8ia2xbBoQjDnHSbaWNRlgzeoD+ULC5IzPtqyUG7BZZMP
         Tb3tjKbCfcL/nzujGdpGlmslt02R4D94+HXtqAZwR96JPcT9ftq01b1bRaNfK0Skp3YY
         FYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658704; x=1730263504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0oa/ZitNLoZMPejVfhkyWaBLfp6DNfNYv6Lewc+8d8=;
        b=rjfzk5aHlO7yH4TOTIL8LQqD4b2zxTvU6BlQo7x0qm6+sgG6xYnyPoqu623Yi6Zjpq
         9fVjFm28XHB2KV6lUkTI5QsyUxOoHDsFiAlaVslyFdTlhUOUFg9vcT+fQMhoSj/8Ckve
         aJqUhN4tLnHRFcVpTV/Wd2h0fwztuxolgMiTnHGsRg9rDFEbKlVa7UGVhWmA/Rhjdho8
         vHTP80k2GqJ7YV1WDgjDYFFBcwx+US4tKtLPP77imo3SphHpUwAaLiHr9Jni6LvoKLVG
         JQmseQp1KQh/qp1QwG22PyRDL9Jkmp1JMaTrRhuiVVgi8nNT+ORMDET9d0GRoKUGXYuq
         qEIA==
X-Forwarded-Encrypted: i=1; AJvYcCVkN7tq4SosZ3hQMxG64nJl42SE0h1XtGAEJMw7SmrbjaI2dispiKgq4YIbvsBPqJ4abRxRa5PYv+Bl5H5V@vger.kernel.org, AJvYcCVsGVsJr/azlJlu+ZVkMYq0/2ymyB0Y+WsDd+zAfiAg7y1yrSb8+AjuuOupFjsHxTGrWgVrhGWN3a7PlQ==@vger.kernel.org, AJvYcCWrkB6liPbaUHPEiZEgZbdwRbjDoe+JdpekFyClYmb6CA4r1ARk4rLm+M+SgWlDUGI9yrmEvMi7gXIUbKyUd94=@vger.kernel.org, AJvYcCWtv8tjk2nAajVXHUd8j8bx654pgCI0Jzx/8rzlKTfyi8c9+8QiZtCcVtx/cLa+U1VtZQlYoAMkLQa9@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxsGOYVxIvIe5D8qPLyNZsdYyYHFOKIhkCJGNXbb3MYXfs50+
	X9axMiIaAcYIt1VA+NHNKoioqSzyPsNvRfdAyzVG4Fo4rUDNM+L9
X-Google-Smtp-Source: AGHT+IGCGpL8XgY9O4we1vfDkxsryUCPguaJHl/7uD/PqNglBhxVGjPdAOM5ExueRp/VXl6sB8J85A==
X-Received: by 2002:a17:903:2308:b0:20c:e8df:2516 with SMTP id d9443c01a7336-20fa9ea159dmr19234095ad.42.1729658704219;
        Tue, 22 Oct 2024 21:45:04 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 RESEND 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Wed, 23 Oct 2024 12:40:39 +0800
Message-ID: <20241023044423.18294-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,s5l8960x platforms:

- iPhone 5s
- iPad Air (1)
- iPad Mini 2
- iPad Mini 3

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 883fd67e3752..89c1e35e404b 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -12,7 +12,14 @@ maintainers:
 description: |
   ARM platforms using SoCs designed by Apple Inc., branded "Apple Silicon".
 
-  This currently includes devices based on the "M1" SoC:
+  This currently includes devices based on the "A7" SoC:
+
+  - iPhone 5s
+  - iPad Air (1)
+  - iPad mini 2
+  - iPad mini 3
+
+  Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
   - MacBook Pro (13-inch, M1, 2020)
@@ -65,6 +72,23 @@ properties:
     const: "/"
   compatible:
     oneOf:
+      - description: Apple A7 SoC based platforms
+        items:
+          - enum:
+              - apple,j71  # iPad Air (Wi-Fi)
+              - apple,j72  # iPad Air (Cellular)
+              - apple,j73  # iPad Air (Cellular, China)
+              - apple,j85  # iPad mini 2 (Wi-Fi)
+              - apple,j85m # iPad mini 3 (Wi-Fi)
+              - apple,j86  # iPad mini 2 (Cellular)
+              - apple,j86m # iPad mini 3 (Cellular)
+              - apple,j87  # iPad mini 2 (Cellular, China)
+              - apple,j87m # iPad mini 3 (Cellular, China)
+              - apple,n51  # iPhone 5s (GSM)
+              - apple,n53  # iPhone 5s (LTE)
+          - const: apple,s5l8960x
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.47.0


