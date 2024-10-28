Return-Path: <linux-gpio+bounces-12208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3079B2B4D
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94E711F21917
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7BB1C7B7F;
	Mon, 28 Oct 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QP5javdL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3915E8B;
	Mon, 28 Oct 2024 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107376; cv=none; b=f+hy22dylM6qGUOZ6kbXUu9kF8OxuBXWi4bGiTsUMKcdsYEqAGXDRx4huVGIPYy4fk0242I4MSIiD7nwArctwZOLJAnptPsLZnQY7sQvhTApn0mwie/liCX+74Zx5floTz2R2LMXJrQLHn4n4axBiXW4jh45w5q0/+r1Wsfo12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107376; c=relaxed/simple;
	bh=UwXq8/s+/ZWgzHv8GxfRHapMvLu4ujsMuyVEiwqZOGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TouiFjrVTT7v1FTLONVwqqaGUOJ1Qz/XAEaKS8qslAJ9zeUyw0MOhXJ71AmoVG3CsW1lVq/WOwCBxaQqk19MIf0aPMuBq5fxA9Aqx6ukZgdrK6MfKE7i1+y6qHn/7rRG+je5224wQGLsjlsqEW4UWCBRMKIS92WX4A0Gc0vPzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QP5javdL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e63c8678so3975810e87.0;
        Mon, 28 Oct 2024 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107373; x=1730712173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=QP5javdLBTDENr7mInSkLlcblccY5IUfAjaXnwZ2BhCLquF/1BIIS/6st9+WDiwAPn
         3L9eK0sfadmvaMeGLb4WSKV10CYlz7WnpT1xv4+g5x0BXO5s1hwEduZheVGfwlD/Cm4b
         iggNXFKjdnsdD73P7li0NtegW1yvfNQpMS1TOjC4iZz1bYl91KYti8RFvatvn5SV6oAh
         n8xIc5DlsQC9p1NxvYd814fJk/BcL/EgRuLG+McvsO9eSTIbdBvOocUgpyxu8vHaE2hL
         lLk6DNkHkIhAYkK7lQYXPxvTnitiUyNqBZDcfKDppSZ9mCTVz0AYFGO0LguR3CmHISVZ
         Y9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107373; x=1730712173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=QJ/phsWqkIa90CaJFD7vvtf1jRGjDar8+eafeEkTSq/MhMOXl7Nxx7tI0v6Xa2HX2T
         JIZUO9NXnqdniwaEUciA5ZqMFDc4BvZKHQubcA6WUjHiKz9SGWxPJmwdRaG8a3lrVNDG
         XqNyGyIFDzjMvikzHRn/mLkPi+3EZHRbyuCe83EBaxxvlGIMHTl/XmZYcQiudWvar6BS
         fBsFxNjaWYX6P5xSFp+C0Seifx1/Q9ydoE0tufTADhgNrLCb0FhWlZNbNkAuBGf/JS07
         5SLkssMl1njMoznXbwgL9ZQmiv0JVVKz/xDr9B/iZTTLYopsR7oVjPpd54nMf50e656o
         UWzg==
X-Forwarded-Encrypted: i=1; AJvYcCU1w2fO5ICWK70SaS22BwNW/m1gMLJS6dpD59wO/2Vgmi8F/GHCtJAVXgIKZ+E+9rUflzmcjPx8BA4Q@vger.kernel.org, AJvYcCW444Ii2EqGksYdDMYrvkGtui5AqUlpSS3a3sIGiAdt9p4qxCIByHMEuOxPpkHyiorqm+N7SXzmsrgt+4TJ@vger.kernel.org, AJvYcCXgFDpZrH7eewl1ulUjK3NhOmbtGW92wE0ZFZkLfO7xpN2u65CmOPvnUGuSUChGhcOfOYaDilbvEKqQ4eLghORZsl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0a1C/Sf/E6O0JGKoknvO4KeXpwbv6HQ6h2dVaUtWabdX9coZL
	tIqFCeEU09rI84Teu1q3WyMCcEGjx3vXphoQkWoZHzf/aBMDmBZZ
X-Google-Smtp-Source: AGHT+IE+Ev9N1xNlkGTKVpoO2qeGQ9vWoj/Z7Tf2T0auYtqb7BI0SMITAYGyR+Qtz9DG724XXJZWJA==
X-Received: by 2002:a05:6512:318c:b0:539:918c:5124 with SMTP id 2adb3069b0e04-53b348df188mr2752749e87.31.1730107372891;
        Mon, 28 Oct 2024 02:22:52 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:52 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:29 +0200
Subject: [PATCH v4 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-1-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=977;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UwXq8/s+/ZWgzHv8GxfRHapMvLu4ujsMuyVEiwqZOGw=;
 b=UEC62CDHdhTaw/gc44/m2/6av2OQGEdphnBwv4+sZ2AFqTkHx3KbF0dwtXTALXrc0rbPEIvPc
 dltazm5zyzQD/XEstuSvL2pbQ2hyrGcl3pK+ymHuyUP2zlh11igxW3O
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


