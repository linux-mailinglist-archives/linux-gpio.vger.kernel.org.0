Return-Path: <linux-gpio+bounces-11804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE29ABD42
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 06:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC9751C22E8C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 04:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC8914A4E7;
	Wed, 23 Oct 2024 04:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ex2D56g/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE068143890;
	Wed, 23 Oct 2024 04:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658722; cv=none; b=kibZKaRuAqU7SqLuniGhX5Ug6f0WkQW8WUrCsM8KMuCB9vHnYgW9Z6ncAnxAJtVLZ9BaZm1AbcnmBxQ3mZDBLFjZYFQWs5XmC/VXsmyWRBUQy0lGAY1Pg+BOpsMeLgm+jTvHAn3aEFgpLw8pR9FKavJi4hFc6J8pfU/fcBeOq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658722; c=relaxed/simple;
	bh=6B3oNBth7WdCDZKAEv+sr4ONIRSxuWPkgVqTYOi3EKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8hZGtiqAvDWSNqq4ek3Yj0xsfI91S3CheNXsZ5TNQsX2/Ed+5uxfjS+ndy3Rn3tKUTo+3k/BLkmAsGc3vRP25y52rd9KfAhEkYWKVz8EGfPt24C0W4ZJ80EMgwC53fneqbZ5u6Pr15gLWMCO3i/BVR5cm7mUW3THGqXJIHzKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ex2D56g/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cf6eea3c0so52200845ad.0;
        Tue, 22 Oct 2024 21:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658719; x=1730263519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxIREcENY/VE72Bee6nwhWXzCYg9Bd3zdNVXoWML8C0=;
        b=ex2D56g/TkleuumGvIEK5GxC/UkO2YgQvxZp2rCwL/3LQUKqDVu/qEtEXwHqTtx31H
         dBhLiHkWcmv2y+8B7TVdz2VEwfyijDry1GM8OB1rskNm7MU2YZO7wEDbWSjE70LeeGah
         /0RN91fjKPtw0u5IcxxG1z/Yh+QE4/Jo3JArINR7Dnn4aLt2RKKGaJ9XzGDDO8VkPlXc
         ZNnsUi6rTKVw9MSNNRigb7jaLaYsl7g7HA7uagZJIS3VAuoSLyfUYKu3UkqCYlX7tql5
         nsqrIR+X+ZyJoV8PzFZc4KP80W4hgPiO8MPOji/qGNoIO3eBrSTLaxpkkBpuTjlxFmeQ
         bkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658719; x=1730263519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxIREcENY/VE72Bee6nwhWXzCYg9Bd3zdNVXoWML8C0=;
        b=TL3zz6nXly7f5zoV5tZVluwQzg4pAQ1RMJ/2UiNgfsqT6C+Nuor3BXYrnrHVJvjJcn
         /yp6O+QKFcDJN0H73lzamoc1MVX7OaaHN4kjgjtR7HyG7RhHZLCXyz14fnFMoNHzC6s/
         LpWn2LPqNsvQ14qM2HC11nY9fZF4oROBp/FUQxXGxe8S0SZRepV+vNPb3It+RLglod6R
         91aGTpl9In1lcFQBngnUnzBj2pxiAlgUBgueFROIPyvcrBcGL77WVHKrwRHza/9oFKEi
         7QTALDsglwtR+ptbtKOnoVCk0a97OUvWRCD0wYGIoTfKP553N93ilwYn9AYk2gtRrZJE
         8bXw==
X-Forwarded-Encrypted: i=1; AJvYcCUaZO8+QryjhuH6c0cANkJwCGw2Iw3VWU8MZckVWi0Nx1sePr3FR7k/WIBG7oI6gsmk+8N5wEzuGhsiJ3G6@vger.kernel.org, AJvYcCVt0g3OFa4MMHkRxVJKpAWTwMdyZSsL0+w7RIiMVIsv0uXNI9u8P/+9HLI5D0PuFth6rsmeQnSBxzBmgg==@vger.kernel.org, AJvYcCW4thtDIhQKbaptcsqI5YY9T1rnqcmsZsupLHLo4hm9WkwCP9qsLviF8N2o/8r7WtY6xRRCffiRWRamhSAFKNc=@vger.kernel.org, AJvYcCXVeQYXyVMH2WtxCpwsRA4NAaq/gsbzC980LN8a9ngv2dJ+yD+ul4Nw3fLGQ/u4CnsBthI6VKIJyBVt@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtFFkoV3xgwAD7dgpNuVHWgSYWrwHSnKfrDWv3WWnm3cliBYT
	1QZtPGJDmYzpVJgPs4COHMLIj2hr7QMmsAVir4kg+tA2YNJwNqBw
X-Google-Smtp-Source: AGHT+IGgXur+PX0IJXc2NTjsffcocHTpbrnxwthHzYoKrR4LqxCxd1MUW6l8EO4Kl2BjcMtY5PnxnA==
X-Received: by 2002:a17:902:cf07:b0:20b:8776:4902 with SMTP id d9443c01a7336-20fa9ea14cemr19282485ad.38.1729658719265;
        Tue, 22 Oct 2024 21:45:19 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:18 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Wed, 23 Oct 2024 12:40:42 +0800
Message-ID: <20241023044423.18294-8-towinchenmi@gmail.com>
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
2.47.0


