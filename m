Return-Path: <linux-gpio+bounces-10427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592D9853DF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 09:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB98287F5B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FAC189BA5;
	Wed, 25 Sep 2024 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0V/RLXY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA81189B81;
	Wed, 25 Sep 2024 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248879; cv=none; b=es744JEvRgg8l840ET1fezmqK0gSJs9b9XNjTJTBAYgG7XFPlCEUNGEUBLlhKqP5fqGPVG95khyHUtiU/qoceaaakWRtCuAjE0t7ZCsF/pXA580FvcV3kViE3li/wIKWaWHX5/OPjWiNOZIHhBWFr7GsnrJQb7TgE3vdGgFzJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248879; c=relaxed/simple;
	bh=lLIpUpx9sX7Qxk53isyMJp3chqURyyT7v/0grC16keM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5/N/Gj9XZSDTGNJwrIU7igf/Vf8Ff3T+X7OOVb90WlzEkolx/BKZ4X4USrhirlyC/sAmOrBtzYiWWhUzz/hZFig53Hi2VLJxF5Rv+HoVKORgMpLikgliMf7A5Gf4OI9ohIcGsD2drkJVkL/0NMhNfPzGt4mZpKUohc2CJxz6mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0V/RLXY; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e03e9d1f8dso3593044b6e.2;
        Wed, 25 Sep 2024 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248876; x=1727853676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNGT3yJDofmpc53HtmnunbqePjpMbshwu+vDeo17w6o=;
        b=S0V/RLXYYfcKU4Ne/1v+9ZqkMD2/ZoSQfqPIj9rp8ywjj7/nocT26e3acFXI8jTag4
         4jC8Y4uNpDk8UnhTg+l4ni9KRVGtsMk96KA2bOy0GLAJigzr/etxfObcHOprTXkpcnRr
         ephthKcAYMU0ce+xaEc6AhCop6K7znx6cL7mB696hQYim92ZbePe+hEnxp31gDuR55zs
         ek7kjWtjfve2IK6ukTp+N7m59sn10FRp4abgXj/PolcIYRO1L7T2snu1jt5ATBQ0wPUB
         AcL+0pfo2PZJwxjgW8nlT9FcgFMHgM/kB+FK1PF5qn/YecSg6qu7JBOwTK5AmCOcN85v
         NyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248876; x=1727853676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNGT3yJDofmpc53HtmnunbqePjpMbshwu+vDeo17w6o=;
        b=PQKRyiJ7VPWLmBnRShzp65QEBp80K8rSsycFKs2xvh52eKUd0Zfy7cZ01GX0fb9uHS
         tDtBaJzE0K1k7YVUrd8wfM1jMMk3MeiYVxzX04uEyk9vM3UZnxF7iy78QZ62h2sX7AWc
         vXDGMLMknO1Nu0w0MdwBbx3bLytAe2uYDMcdY4pLjqX/kvxM1086C0tctrzbLgOKOIAn
         ZdcrIurh098U7n5ePK6TWPiL2/mngG9YZITc+Wgt8c9XQY6cJr7knGArumRUP7EITbNi
         9iOqOythKg4y6jYWsj5oLrSiPZt2xYit+LdrM0yq2c4zIrnNZSwhcKOP3Rkudbn0/PtJ
         OiTg==
X-Forwarded-Encrypted: i=1; AJvYcCU+WYGDbiixZItLkkPGBQNGaBYMLKWdQD+EOlZTa/S9kSKM0UZTgZiJv0HxpDhV9uHmZ2Z04MVLUsCJMU6rb6M=@vger.kernel.org, AJvYcCV1IdG7RtO/nKaJMgSOse7egdLhME9eSzR1LeoCfqfJ1QS5gniL7kf125U1R3a6Gww9JCmfH1VZI4qN@vger.kernel.org, AJvYcCWMsDkrWcc4gGXhETWzO9zf/m9ZEwuiT1Ls9cCpqxf2ZF6/gYLYEAYm7aWlazTEoslWpHuIbRtLVJgQww==@vger.kernel.org, AJvYcCXfpidq0BQ1Dti2l33K7BOIWbZaNtpSLDgz582LoTRLj1Vut+J8Ru41i0viqq7MZakMs9oO7DY2UoMhVyon@vger.kernel.org
X-Gm-Message-State: AOJu0YwdIE0cpaImlFRjjyqmoX7ZKIMuZKMxtu2lqkqa7HrKgSHqSitv
	ommjiFneDovQ49VaRcWLEg2aBWxr9Q8UAUgTqbxNyYjOQJ39OmuO
X-Google-Smtp-Source: AGHT+IEH+eVIQLfasu9dmEOPukCBYRwG0d+Bh43vyIopQLquRuxM9H7X758qKOFcZWA2TLkwvZ3Jzw==
X-Received: by 2002:a05:6808:1902:b0:3e0:7678:f665 with SMTP id 5614622812f47-3e29b76cca1mr1682703b6e.11.1727248876587;
        Wed, 25 Sep 2024 00:21:16 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:16 -0700 (PDT)
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
Subject: [PATCH v5 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Wed, 25 Sep 2024 15:18:07 +0800
Message-ID: <20240925071939.6107-10-towinchenmi@gmail.com>
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
2.46.0


