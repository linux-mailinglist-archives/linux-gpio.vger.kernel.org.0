Return-Path: <linux-gpio+bounces-10425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E589853D8
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C68872878E5
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7389315F418;
	Wed, 25 Sep 2024 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnOma+dz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93B1158861;
	Wed, 25 Sep 2024 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248867; cv=none; b=d4nITExnLe02TgaI6uIJrN/E4MZUFgCS0PAAVCFoV5pi8ghMcf1tShcatZtCmq1yGomvq5DWE9hneENfvRXKXQhVOzh8x3xf5OTcpbDGgewhySOxUB+XVkAMKcO8CNUE+iyZKgXNN/h/hVeAx3VbKilSaXgkowIWmc2X4Wy7nhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248867; c=relaxed/simple;
	bh=nXFKcfSCBd2hhQ2LEB0Wn+zEqtvm7yqHEZh7oXPnPu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ad6wPiIy49A+fKvvlvbtmh0adYHpHt+kHoh6+xDifH/ckWuk/zlfEN5p55vvX1sDAAM4O5nfgpQ/Z9HthWGHZjfGZolMXVrlI+oDCo+d/9ESyfHUP4K1op9CT1WkXVri5cmea4uuOjBNmPrUOiFpIyZfSy296UxTuEzI8iXZC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnOma+dz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71798a15ce5so455854b3a.0;
        Wed, 25 Sep 2024 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248865; x=1727853665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOjVxN+4UCui/1bGVCeKqXEKHkc9ro0dr055Y8OKSYI=;
        b=PnOma+dzuwK8OvfOZQoMrnMjw28VHo5XJAoqfX5PmD78pRTmQ260NCLYZfEs/OaOO8
         0IufdW3p+szeg/kpeVvHEu8mmcw4g6umIATrfWI8MvHMSpVrK8/M+vyHU65LI5tMgl2y
         55AR9TOxbXCaG8ZhNIQBLHSeaIaYIiZ7AAw5c/cWWlnMPNYKUs3SeVOhrFIrscyoJPDG
         eRtjyHL5eo42fFC27yAViXHIFBMmtBL7zaJch9oXfE5ll4tCAmVDYaUHDCnATzVH75yp
         pfsuYwF2XJYY9zqqre5vRW6IW554W97pap9wMkm/pGW7zAFk7ICGefksegdrto2dRiEE
         7q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248865; x=1727853665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOjVxN+4UCui/1bGVCeKqXEKHkc9ro0dr055Y8OKSYI=;
        b=r87TUCSatDl08sk3qEyV2e5EpwTlF27WHSkWFPhkKhsGu6MId5dfci+FVwP3iEdg9P
         PEaYrYNw+Ap14M3/GzrNA+grLfQohfR/DeEbNrhP9z+atsOBHyw5kX3vTZgWmQPv3ORe
         ks+Hyr3TxK0NBirF4ijEMj37CLJ4TNRiVBV2xuCwAxAh7+ksdJ7v64sbyAi5gKEBSSMn
         VKQ7lY7RTLvwa4o6bnkymHyb39MwRrN4OJZO5KpOT6cCtn0w1B6JZmQR9ZKbyYu7y697
         FxxjYQgVn+Rt8dyBb5rUngO9v/VWL5jE19ykjy9K+pF3Aft1zMZfLlxRzjkujVk2z2pu
         JEjA==
X-Forwarded-Encrypted: i=1; AJvYcCVPAbEDGiHYOsraylAC1iiNM9J0ADSn6Nj7la1GliNOnqN/UBSpvIRC3ZUEYi2D1T2Ij/hWZ66+D3XnLg==@vger.kernel.org, AJvYcCVjiE6wj2Dt+dj/KyOXSahma5wmI4CBHRYnsBhoraPkDp0NMkhQR8RXE/5LJK9LAgHV65tOLmr2Lysf8cyb@vger.kernel.org, AJvYcCW052W6P6GT8PxTnrpHcE+IX/ew/6V39r5PJQDqp2YLuK0bfV+vJ4stge4bieFJJNL5PTbx4CNWc77R@vger.kernel.org, AJvYcCWLlxdZVjAJSP/N4L3H1Gava3skkDKoZ6kzy8KY24/tieBy1CSWPMoOUkbUMfpGZWZctQ4J3oysgflsaPA/T3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwReHEiJru4k+Gt3Gk9a9CJUU9LP6rsmrYVAKX2M6ij41k3/EEz
	UYOTJOAyF5VdkU29QwAkLeY3KgG30Ux8uWQDXe1YOitTYk6RhHYO
X-Google-Smtp-Source: AGHT+IFkEqW5cQWTnJdHp+oQMG5w7aNEOsa82IG6A8zXmG4k2wmgLgb9XqX+XPEM+tCrK3pJxkSOOg==
X-Received: by 2002:a05:6a20:ac43:b0:1d3:1fea:27d8 with SMTP id adf61e73a8af0-1d4bed0b288mr3085067637.5.1727248865133;
        Wed, 25 Sep 2024 00:21:05 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:04 -0700 (PDT)
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
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Wed, 25 Sep 2024 15:18:05 +0800
Message-ID: <20240925071939.6107-8-towinchenmi@gmail.com>
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

Adds the following apple,s8000 and apple,s8003 based platforms:

- iPhone 6s
- iPhone 6s Plus
- iPhone SE (2016)
- iPad 5

apple,s8000 is the Samsung A9, while apple,s8003 is the TSMC A9.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index fecc4953df33..01965890b4ef 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -31,6 +31,13 @@ description: |
 
   - iPad Air 2
 
+  Devices based on the "A9" SoC:
+
+  - iPhone 6s
+  - iPhone 6s Plus
+  - iPhone SE (2016)
+  - iPad 5
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -121,6 +128,28 @@ properties:
           - const: apple,t7001
           - const: apple,arm-platform
 
+      - description: Apple Samsung A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71s # iPad 5 (Wi-Fi) (S8000)
+              - apple,j72s # iPad 5 (Cellular) (S8000)
+              - apple,n66  # iPhone 6s Plus (S8000)
+              - apple,n69u # iPhone SE (S8000)
+              - apple,n71  # iPhone 6S (S8000)
+          - const: apple,s8000
+          - const: apple,arm-platform
+
+      - description: Apple TSMC A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71t # iPad 5 (Wi-Fi) (S8003)
+              - apple,j72t # iPad 5 (Cellular) (S8003)
+              - apple,n66m # iPhone 6s Plus (S8003)
+              - apple,n69  # iPhone SE (S8003)
+              - apple,n71m # iPhone 6S (S8003)
+          - const: apple,s8003
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0


