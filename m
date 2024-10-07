Return-Path: <linux-gpio+bounces-10921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287A992585
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D31CBB2239F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E811A18C030;
	Mon,  7 Oct 2024 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsJ3UVod"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464518C01A;
	Mon,  7 Oct 2024 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284954; cv=none; b=EgA+q5+gnGAlFJV/uuLJwhxBcYr1ue3228Zkfx3H7iUCesnVRyVj281bjhW7HFG2cUjjy9aFtppCUzfWn3q0L1prF3mAskKH6gy/yd3mnS2+XppzwcJsCwACiroJjfLTimE+zi9hj1OOat8HE3otrX286xJY/8hagpMQ7iVFK9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284954; c=relaxed/simple;
	bh=WwfVEUe+ddkgzvmSOxy8bQR87mvlYQHTdjEPT1Lt/kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6DG93lshA8SEvKuvUfCtcnEiuF2fLVABlw7WBuMOvP4jafKOihanxWKAclpzk/gq9nAGtAYbudIG5dN/a3n0kF6WtmPmow/M6aU/RaBu4vCEAicKMlvc6ov4akqJNDhvQRe4HRTEeOkNXPbpZA2yrqhA60TQB/AwvKpUhwCwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsJ3UVod; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71dfe58d85fso621591b3a.1;
        Mon, 07 Oct 2024 00:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284953; x=1728889753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqN0RL0b12JN3WDoM+1XebJa+SPPD2yoa7rkpfSsQL8=;
        b=HsJ3UVodLI5KRfQnbe6/iyp18wycbqp6x0CrXUvUyzp1265M7NrFFmX6bs1+RALxV6
         Do5JYcGJIcf1DkXT1e9wEfdK3ekwH4ZaIue1bCorXdJuPwBpMREX6TYGXKxPtApVkdYI
         d+qlOo2PUAE5AEI+1SL2KEQEhPZ4MQzd0ZTbsLNMdKlOmyUQlJCXsMXvkdFF5Va58DAV
         IDpp46GY+iFyWgzUmobXGvdAy7m4sos/ct9jIz7ilGo0Ofjnqpe35YXjwW/gu6B3SOrE
         +JLLiEQJZ978rhrhvFBfQRFZcloMlQhLQFGsAbz+29IiCvuMCZxDc4R3VFkgLt1b1qmJ
         1YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284953; x=1728889753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqN0RL0b12JN3WDoM+1XebJa+SPPD2yoa7rkpfSsQL8=;
        b=ntsdEG3JlUAnXg8a0MGZ/SqVopzlUJojegeIg43qkxgVoERPyx6r3jH0QB+gvsRv8d
         L8szSew5/+MmFljk1d10ptUV+pDHIygyv42ihQhE4NWWVPokIibbkIgbTYZyRwOKe5WA
         Syx8OvwHMC11TBgYOayy3SJsxWEOwxHVjlcDk4Zv8CdJ8owk0CeZ1zaroNRAT/XbKUVk
         vfKYeLXV0ua9A2GoDYBFICejN4oY+TLZXf8yKBzlm6gdi2HGV63jRmgIZd4InZwkxX3f
         NDRdUqTpwryMOVRnVna/lsjGK0Md3C7WOARCYglXKQYKaDnOsLAktfE3beBbgNIWRyjd
         2UWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQX5Q/AsltWtGuMWQLwyMgwE4FLXGa5bWFBBXbBOKeKSAA5iUcb2Vz73JlK9uqodGh1xE4hz4j5woTbA==@vger.kernel.org, AJvYcCUYWPmvzqLKTMU7ghYefqVf3c9osfql9Mte5HfNsb+QMHQoQDDK3gvAjwaTjcK2hleCO48ouC3ULvzA@vger.kernel.org, AJvYcCVdgihOV5qoFXIY9x+ix3Z86J6GRpszimXbduxsPuiKb2vxIcogfcrdFYurYRWWmO5rgfu9lEuXn10FWD6e@vger.kernel.org, AJvYcCXofuFiPW5VeIQPvFpBjqGaU8aCmsNsVMVL+Xb8hUnz9/2Y0B4BpHFgGOjRWxEZ3XAe0PPzi7u2K4wMmPBKrpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRwbz5VSEEMCLOlS/l3YoEHEbVHDPczU5H8J9cjud6i2qGf+OQ
	422aAOqotdXz+pT32hTYgM8P+uDyyv0vcAlYPfVUc45/MW2IOJui
X-Google-Smtp-Source: AGHT+IFs01PmzAmflTxkkA6BNd1Ko2b/rLBAuL/FOOHtUNtO/VrCOB2lFtFvR+OdawXueOZoGpG/ig==
X-Received: by 2002:a05:6a00:2b54:b0:71d:eac5:f081 with SMTP id d2e1a72fcca58-71deac5f585mr10733939b3a.20.1728284952740;
        Mon, 07 Oct 2024 00:09:12 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:12 -0700 (PDT)
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
Subject: [PATCH v6 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Mon,  7 Oct 2024 15:05:34 +0800
Message-ID: <20241007070758.9961-10-towinchenmi@gmail.com>
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

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod touch 7
 - iPad 6
 - iPad 7

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 253dae759f10..b6a2916fb0f6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod touch 7
+  - iPad 6
+  - iPad 7
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -165,6 +173,21 @@ properties:
           - const: apple,s8001
           - const: apple,arm-platform
 
+      - description: Apple A10 SoC based platforms
+        items:
+          - enum:
+              - apple,d10  # iPhone 7 (Qualcomm)
+              - apple,d11  # iPhone 7 (Intel)
+              - apple,d101 # iPhone 7 Plus (Qualcomm)
+              - apple,d111 # iPhone 7 Plus (Intel)
+              - apple,j71b # iPad 6 (Wi-Fi)
+              - apple,j72b # iPad 6 (Cellular)
+              - apple,j171 # iPad 7 (Wi-Fi)
+              - apple,j172 # iPad 7 (Cellular)
+              - apple,n112 # iPod touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2


