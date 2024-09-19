Return-Path: <linux-gpio+bounces-10282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E000597CC2D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 18:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A56AC28798D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2024 16:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739D11A257A;
	Thu, 19 Sep 2024 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPKWMPzi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE041A2551;
	Thu, 19 Sep 2024 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762560; cv=none; b=qEmsXsQ1eqe6O2Hbcu37pePMxa9LmUIEpKC975k1UfGzw0A/yPPJa5UA8A8CWrAPUdlbvL4ZLgXcCFLJJrJOHXzPGu/G5ZWUKuRDSUKSUX9nFItPqcjwdUD8SMQonL5TyTJKY0k4tSAb7UYDC1bsp/tr+9szEQm89aGxn7yZJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762560; c=relaxed/simple;
	bh=1do3oMHa+zZtMgWoYxSILBP1btrTVDMYuMavL2iJt/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnF4Zj+s80eh9vgxRoHIuXvkncaKTzfGt4s8kiM6xrZIVaHYRn3vkGJNNBbKjisWvW/CwlOvJA4nGj0fUKo1nMMo6ocx234y4kcMYeF5saBl8SPYc7ikEfeZg0crij05A8Dv71Yqab+8sz8n8D+4Rd5EqdIJMz7lTGg7qJ/WGEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPKWMPzi; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2068acc8a4fso11660095ad.1;
        Thu, 19 Sep 2024 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762558; x=1727367358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx9QUOiQgqEszXRAMdnqMOxDufFUf+ALloEhf90CVgc=;
        b=fPKWMPzim9Kxi4Nv6GHQOt/wafrv334XRkU3AhoJ5evJnxPGytSfjzsXXyXddi6Nn9
         RCUchuzeW4I7MPd0D1yiOTnfdttv1pmvwlPjuLP2pKfxm+g09RCbRe0iw80YHedM5QuS
         Fp1G8r+5YgjYaD1D+4FsHzX5rbabS1cDKtCV3fBdRLKD1MbhK3cPP9bYPG7hausfoXqm
         Bv1hu05eLfUWB372M8EqMpFHzLvmiZAEVVIwTMgaiWef1AK2BraD6Clbn6UY/eGj2dyL
         YSv+wLqpDcHYMtg3L+JZbdZUVWA8D9JmOx2bJLR0jUc0cjB4B8JiDnq8r3TN32IE4iOK
         I5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762558; x=1727367358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx9QUOiQgqEszXRAMdnqMOxDufFUf+ALloEhf90CVgc=;
        b=cOQxWO4ILeIjJB6rQ1wRVONmSSbzBe275rCxjR8re+Mj4c+mwk3GRm7WntsWDsTqps
         Ep09Ci59IOuJvq9TibD9mnGVNzRHMXCazUAlbp25hSC9eseBRf2wmTHl+T34fluc81Zl
         TDwkfUbylH04zo005OumEA+/uhQYjaduUVf+Z61dcVWemzjFxMt90zIqIgxEZc2HuMBJ
         E4ha21MUSU9ZvD6ceEZlAFi5EJFCpkVJ6ysmoSDIf21VSGNhZzWJkpCnFHO5Ew38JmiJ
         8xoXvqJMxo7J1fpyLYKe6EAFIAw6zG4S19GkjEwgQWIuii/CyDMRSbAESFzzdCsofhMz
         +x3w==
X-Forwarded-Encrypted: i=1; AJvYcCVu3HU4kiUM0VRPusFn7j7JTN8IT5mFYpitQh/t9E7fnAFnaRrBq/qz382ktJK84O5p39VcjD0sDymPryMsGgA=@vger.kernel.org, AJvYcCX5nFq15Tg5eEQP2DQ6Ksfaq7lmh0t6RQEQrdzmZn9vMmVoUoot95tjJ4IcGkJjx3wzBC+Jn/dLmsz8cg==@vger.kernel.org, AJvYcCX9qweLIxvB8K24/kfSS+V03Mwd3SxXoBONt66QC193+mwl7atyPvEbVdN+rB5rh0cI9f/ZjE40w2IkIXKk@vger.kernel.org, AJvYcCXu1b+iG/HBuaQKfiu0mL2OiyKGaimat/DayYjn3l+4z4rr4yC780T8XKHJy9rEjGPGgC25wTXVLkuX@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTEONf19CRRMBMEI3tN0DY/ZX7f4/SnuiwYgtCuysOl+j/iPU
	iSrlvg5iQLTulgnDeFrAi6lAYPq2pm1NiS18A3HHWGuwk8EQLxgD
X-Google-Smtp-Source: AGHT+IEgXtLkIjPRdY2PBg77XYN7b22QxEN76FgfhZTUQgMO6VvpQEnaywV6N3VeJVR46skd/N3KiA==
X-Received: by 2002:a17:902:f54f:b0:207:457f:b8a6 with SMTP id d9443c01a7336-2078262ccc1mr331463075ad.12.1726762557945;
        Thu, 19 Sep 2024 09:15:57 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:57 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Fri, 20 Sep 2024 00:05:53 +0800
Message-ID: <20240919161443.10340-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
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


