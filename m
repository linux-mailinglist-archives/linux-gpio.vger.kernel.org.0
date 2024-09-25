Return-Path: <linux-gpio+bounces-10422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A3B9853CA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE6B81C23146
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C9415B135;
	Wed, 25 Sep 2024 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3h3royl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33745157E88;
	Wed, 25 Sep 2024 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248850; cv=none; b=Mej8hCwBwmndsuO1Y5QhUhVd37D3V0OaP6KUeMBK+JFI9ig09XxNEIqgwSRtc4IYm6uyoEHPdL0zNLpzGdatSzpj3ZRtvwcwx47ilZIMbuAZ4lwt3nnBL6IVIiyZFroQQYwSP1CxhpTH1t/tbRauVivn+qjV1sOc+a/DlVqIvtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248850; c=relaxed/simple;
	bh=RQmYiPdslbIR5WscGyWKOAVQAC1T8nRhDcoGKPyyZtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6LnIzdS7FwEVFLbTjoQTyb/S4O+FJo55GF2e0Sx8mypd8Eya8prf29deaULEM2bsGA51Mekj1PaAODoOHJmsWpTpsCx3jD7lEbH1aMZoWle2NKmlW7eYbn3nCz01R3W+fHW/xo/1STtju7F7axvaWCkCeJavDue5siKIxUSybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3h3royl; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a043496fdeso20612455ab.3;
        Wed, 25 Sep 2024 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248848; x=1727853648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gzlAb6tAbaYqxXPRjbN4tCFBYWmIDA5QUr0hx9IZZE=;
        b=S3h3royl58nvcUvh99fthvXqOrpUxhn0mt0bXhG5lO/Zga27+oTL8Bje5H+sRN6R6Z
         03MxeDqmlXAahPw2wPl3gfCklHU8iZtM/zhscB8l5ZaEElzM0b36R45P90v1Nu3fR5i5
         yb2xINrJGQ8c3T5YJGor3TOeqkO7StztcOKDbY2pCqAq7ycuyy+CSXsmJUPZaAb24zKn
         kjTgR2RAMd/C9xMJqlNFg3763RBX4wKxTLfUKhtlcL01R1h6vKfuGLzRbUVD/QEQqjeU
         95Ru5+NhH0Cpd6eJdg170FlthHt6ZHu2QY/gVLESb6qEN031Gxnad2A/7haxZ91Y7nGo
         AVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248848; x=1727853648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gzlAb6tAbaYqxXPRjbN4tCFBYWmIDA5QUr0hx9IZZE=;
        b=IQxdCMi7M5HxJ7tDSS1829t5BrVIJGI/nTKZyMEnBrYZd4QCNywvNTbVjcmktf62is
         IcuqBj7TWg3RPObU9E68SJjt2NG7q+9bUcDQRWynwputb6pK4dXXSjeXYRBotyRyd2AQ
         gvvw70/2aCN6KM3nWqRgtgSTWBcQOIqrbIkaR/itb6r5Kc/sfKMP/+Ea9PDphMpK1Kin
         h+/AFhiulYThKLMVvFtGUO22eMCJdHEUviFoqL7TSHKqPd2pwstzOBwMs4pYk+RAdGJB
         fIiHkTanPGAxJMavZbUVcxYC88Q5mpjn1SqZXLXo8/gOOsGpqDPo8ysVt9ImuZupGNtx
         jU6w==
X-Forwarded-Encrypted: i=1; AJvYcCUdFxR4CzXsGNGAbBa1NqlZg4UL0Hcj5XXFomGV2tphi8GsF5b6mtUHkxvlBWQObectBBnyMPwCGiWzF9u7@vger.kernel.org, AJvYcCUyOQokYtUQvGBmjZInCAXsKomEclAs9tu781aCnRoQV6HzwahvP31Fuzg/M0mkGmTIhahWv+FZieubcQ==@vger.kernel.org, AJvYcCVvm/qEGCLPgcCmAg3LQOOnSTPI7m2RBPDhqRLjl8FGG7Y+5HkIes/pp3DMjeH+ORXaMjUpX0x3AMWr@vger.kernel.org, AJvYcCXcKvRb9GWBIEpS1KSjot2nMs5YZA1mP0KXK295blLvVnck15kYSZCd8bCrxeoAT73EagJ1exzq4toGD7vs9Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy206OGUccNk7ZsUXsr8pQVIfYHSbqf/he63/H2X46mn8y4eZbm
	8Y7rRAL7ZgLRZpCUYKhG9l5XE/+eUP3nK65hHnMzz8ofn0UfeWVQ
X-Google-Smtp-Source: AGHT+IHHRXHmkDoV6cYjtUdS6It/5KruAyPCBuIpMtTf3yOkX3h4v/vIxT0bKREhjmU8Nf1G+8aXwA==
X-Received: by 2002:a05:6e02:1d97:b0:3a0:9244:1916 with SMTP id e9e14a558f8ab-3a26d78af3fmr17300025ab.11.1727248848032;
        Wed, 25 Sep 2024 00:20:48 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:47 -0700 (PDT)
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
Subject: [PATCH v5 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Wed, 25 Sep 2024 15:18:02 +0800
Message-ID: <20240925071939.6107-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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
2.46.0


