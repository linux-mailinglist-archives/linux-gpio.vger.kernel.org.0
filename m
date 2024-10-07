Return-Path: <linux-gpio+bounces-10916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086899256F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C3E1F2316F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA351714D7;
	Mon,  7 Oct 2024 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz8+Rv7w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF92187879;
	Mon,  7 Oct 2024 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284935; cv=none; b=FFqavZvfnw18rejGrIBDH8kHVOB/v7CfrXAMmmMQk5rpPDw8aLR4oRkS7IBMkrwUl29JEvmZiUeOzob735MuNSzExRY8+L3aEOQ0dakfUzth5MrkVyW0KfuoGOwR0IK2Wb+zPfrqrVvj+3n9pEvYOyTSbsa9qx0HvlxboLhddrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284935; c=relaxed/simple;
	bh=wPBuEzygUbrx/t62Ag29JfuC3CiSgmOrXkdS4/uqaLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UN4q1pVJIHfGRwxMnHASV9lHlB1WQl9Wyj/9iAeu8qlvLGjloClOh7PIg3IGQ76330j9dNBRLOSgSkHbXVV7W6yktn+LmJ5Bz5WpnJaye+BqTPEPGhMKpc4GSy4VtT1E5UHQLC+OxK1Bja/czKYKDocjbAyknBbzIi8t2kN0RQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz8+Rv7w; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso3286993a12.1;
        Mon, 07 Oct 2024 00:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284933; x=1728889733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DltuEaUBaiw3tycBdjnR62le+ZratQI7UqJxxkPzMVg=;
        b=bz8+Rv7wM23iMrsr3tLzLUwyjuTVZBteLx4qltEFtqoDlktRkBleEKYqNvhcnojqDV
         WCSsc340s8dEWBS6AvTODz+/atzniLli/Uc755H7scZmNLKeHlgPXNB9zORhn81saJJh
         2ljyjCCHJGdhU/cd79EEASvFPkPN43Iayu9n08q6hsFnGY1ihXQiK5w2Fd4ZINnv8K3+
         inz9UVG0LxzNS21+OycDz/iGbvTzltIW7lJKlZCd4Wf40i2oHAh9Dk8GUphsaR6EKDHa
         CP5fw+DJDSQ2h4fvBNyudNWKggtng4lDhWBjXORVYbZc+mAewYkKnri1L39VFGIjCmDa
         xpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284933; x=1728889733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DltuEaUBaiw3tycBdjnR62le+ZratQI7UqJxxkPzMVg=;
        b=hqWsupYrtQZ7iSAZv2W+bZp3MAeyEON3tyU9oyDyVL0Byd+08Bu26P9WMhVbRFoF2+
         JUjquTxArIdGtBZAULd45jYQAfbSm+QJt1W2YiwPmoXZ/Y7KGZ6PWJBS+PK7MGSFSCXB
         ATDp0dnhpFxigS104IdXLe8oP5C0Vh1IhmokVh275Z5b9exzn9f1Qq8ObXUaHk1f4sbT
         vnPOW4KyaVGoV0XfDarI7j6aehJ43Lh4ertd/auvV0MlYpq+zbRyL9nW8s125uMxXE8n
         RjfQU8bJa/4vQOk56C46nayR2mXdm3eKkvuyLd2scjuaxPhL3+9UtTnuI1qUti+vJh5m
         j6rA==
X-Forwarded-Encrypted: i=1; AJvYcCUnwm/q0PKPX+EOTgaRy9SXx+utLaKEp3dzmGvFhKSDEafhDE4J7u6a+Ot++x5JGA6JN+/vR091UhnS@vger.kernel.org, AJvYcCVpf0Ce22uOStopb9I9zKwFth7f0xQc2T0ReEJlwcdBXXbQsEIKJgsYcTMxRjnJJkLtv9+Uyc4qS/+SQ9nFG7Q=@vger.kernel.org, AJvYcCX0q5chCSFZKiaPG5v8YEii2zptGat5T3cKtzmccdtvEckenFG99J1CVnbxbBwiJOeHuIkNc8GwnSjEmA==@vger.kernel.org, AJvYcCXIhK0V1lO7235hxx/9TV0Xe+Wh1jyrIXPC6X5AfgbMGa3ILVOAnp9oMeMRV7MoMEjk1hIAcULNxfBVo0M5@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlmdK4z1foUXuj2nVrMuJbvcsQHVWHvMwu6iK9gw0KfY3+lkB
	dKK9s24mVed3GI9f8Ll1Q8mIlq9RvqYeYLB5BQK+UQnjh6/sTuUK
X-Google-Smtp-Source: AGHT+IH8fcU/zLugtd1pifrYht6xlQMm5dTtZxQSNJh5udWYh1E4dvQRN0jc4L4JIEBZc8L3zYlfGA==
X-Received: by 2002:a05:6a21:1796:b0:1d7:3d:6000 with SMTP id adf61e73a8af0-1d7003d617fmr1192438637.24.1728284933366;
        Mon, 07 Oct 2024 00:08:53 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:53 -0700 (PDT)
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
Subject: [PATCH v6 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Mon,  7 Oct 2024 15:05:29 +0800
Message-ID: <20241007070758.9961-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
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
2.46.2


