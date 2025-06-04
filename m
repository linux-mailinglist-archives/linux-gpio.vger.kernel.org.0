Return-Path: <linux-gpio+bounces-20993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5597ACE139
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 610617A6578
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95471AD3E5;
	Wed,  4 Jun 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oY+sXTUS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554119D09C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050751; cv=none; b=f5A5bY1I+L8YgfHHwrHWQww5wjjRcV0IjbHHxmIaj4VNtRd+jbnKllTpVewJI2nP+271SsJ9uiil1DBxArbOcjOx363FFBJzJVkB8eh/SJGz7f9P+VXnOyVoJPKuqxj4Myoo0i/Y+kOjjYMgB506gAU2lW+uNqP0bQ4vt1/pPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050751; c=relaxed/simple;
	bh=AJLbutT5f80u713gohP/P4oFnY0KLyNPkjsRDaAt050=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3OMfeJV7qQbimwSSmGPfrLitGnCpn0/IaRWG/GcQFhK5gAAPWC2q2vrdj1xprBtiMpyEh5pOxUpZdwAhn8sE8EYh7eZhxsPNAbZkAtMV5s9BRBNUSgpw8588pviH4z/rbeBjDnI+EDt6+S3mSNPEamEelD4v/Z2FXNMUVq0Dnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oY+sXTUS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso12670689a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050748; x=1749655548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXs2zA73ZRuBPLzY+I20lVoCbiqQa8Pw8YT+g/k8k0Q=;
        b=oY+sXTUSMmseGBluOqETW0Zj8coxx/IaSM0V/MNyb7xbL4qEi3Xj27Ej05lAZQzA+w
         IAC2+kGnZ5OeinpsrAIviaAVcVlH4zZN2LtmxHGkGKh7CiuhFShA4Gu57EVkXxSv5vIy
         FtYmafPI60dYcaQPaloxTEKx1/tmbR22+GyjAA1SotuxSFIrC1EoO6lJF5/wtdoIB/VZ
         +fpKuBXTUViaYzxBrEAVfVsk4CjIcrdBD3Y4ymmVFB3cpRPTBpwezrKv7P0o6tT+7809
         G5u7SWkwsUhekFTz6sGDzNQ52gSoNy+SjW+xvuS0rhIQJ3w+2IYU1a7pmX5QXbOWVvv+
         e3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050748; x=1749655548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXs2zA73ZRuBPLzY+I20lVoCbiqQa8Pw8YT+g/k8k0Q=;
        b=nlc6i3FvO2Uqkky41ykXkBwBsihuC0N1YlVeLF6apPBnCf2S/C1tPSNdxn1zPLx4nF
         8Am+tz7HLlk5DBRspuwaYppR0DYQK3Es2VqScz9ZG6VrLJk+t7fdHoE56x4TYO9fsJ1G
         KnE9lvJa0sgrLtRRrQm2llTvQTF87xd7F3jNHEwOjE81v6ZDHZ20aIS8TVuz/psM8sxb
         GzIv6k8QZaCVLUQWJZSvWE2j5cEWzSWJh6FOwMSWBIvxSXpao+SQoEgzIJTC95MZxspt
         Szlkm8YCMI9KsVwQuvHku0Ncm8wLEUdKZvlm19xvnQNn8bma6HMZmRVEW0bPQu0fSbtj
         2rNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCDkX+4Aw3Zql1gnBQZgvtLpOes3PKZ/sfaGFhwVDagmt7VzNIzl19PbJJoD3NOgmJc5nk13ezRph0@vger.kernel.org
X-Gm-Message-State: AOJu0YyNxh3toBjwisJJvrWVzt4wGv/6H0fAvfGY2uoeMdI0LkraYzGz
	oSSSzlRbKF0S+VxY/9WS4Go94bcouXb/zKgMkUpz/0lpyss0zWkUwxc//irdktES3yo=
X-Gm-Gg: ASbGncvnvrgOI2fCFBaR4Q58W3C+v1iXCtxhqB8sdoJUEWn6eLewifv/056DLFfqTrw
	FU2OV7a+GKR/++numoYdyDm4DlORcsu1Ez20E4FnDfFUAeTNiP8G36U9cQEV5eYSU+lAFA2Vxy8
	Os7Gnpr5wxMOZNBLPnbnOP8o+4RPbWjmGPjaxseVdJbj8P44wipfPgK0dHU6SG18INz1Lr7joR1
	zGFvq0K3H7B4tz0GoFtGFNG6wqY/zSoj/lok2pr9ehno+J31+YoNuynZfdN2xaruRHS1puuI4yB
	J4wCbdDsPQeWxMU8xT82Ejeb31EV6tFWa/LoKFPTxDrj2bqkj0H//I6vl7d3J4vkeRJM7AiiV/F
	2ETBxb6Wp3AFayidhUJk2pnzRoSnWrgYAgUo=
X-Google-Smtp-Source: AGHT+IEpnyZ5RcSizQ8OwBQIqB98hY8tFDyFT8RcDjsboJfv/HhXCPW14p5ZpmW4M5LV1bKLv8xaOw==
X-Received: by 2002:a05:6402:84d:b0:604:e99e:b78f with SMTP id 4fb4d7f45d1cf-606ea3b00f1mr3402513a12.16.1749050747900;
        Wed, 04 Jun 2025 08:25:47 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:44 +0100
Subject: [PATCH 05/17] dt-bindings: mfd: samsung,s2mps11: add s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-5-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
supported by this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, and power meters and typically complements an
S2MPG10 PMIC in a main/sub configuration as the sub-PMIC.

Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
firmware, it therefore doesn't need a 'reg' property but needs to be a
child of the ACPM firmware node instead.

Add the PMIC, the regulators node, and the supply inputs of the
regulator rails, with the supply names matching the datasheet.

Note: S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 70 ++++++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 0b834a02368f7867a2d093cbb3a9f374bb2acf41..f859a7e4a962a6013712ac6c62dd04eeadc5e0f4 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - samsung,s2mpg10-pmic
+      - samsung,s2mpg11-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -70,21 +71,46 @@ required:
 unevaluatedProperties: false
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        system-power-controller: false
+
   - if:
       properties:
         compatible:
           contains:
-            const: samsung,s2mpg10-pmic
+            enum:
+              - samsung,s2mpg10-pmic
+              - samsung,s2mpg11-pmic
     then:
       properties:
         reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      required:
+        - reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
         regulators:
           $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
 
-        samsung,s2mps11-acokb-ground: false
-        samsung,s2mps11-wrstbi-ground: false
-
       patternProperties:
         "^vinb([1-9]|10)m-supply$":
           description:
@@ -112,16 +138,36 @@ allOf:
               vinl14m - ldo21m
               vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
 
-      oneOf:
-        - required: [interrupts]
-        - required: [interrupts-extended]
-
-    else:
+  - if:
       properties:
-        system-power-controller: false
+        compatible:
+          contains:
+            const: samsung,s2mpg11-pmic
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg11-regulator.yaml
 
-      required:
-        - reg
+      patternProperties:
+        "^vinb(([1-9]|10)s|[abd])-supply$":
+          description:
+            Phandle to the power supply for each buck rail of this PMIC. There
+            is a 1:1 mapping of numbered supply to rail, e.g. vinb1s-supply
+            supplies buck1s. The remaining mapping is as follows
+              vinba - bucka
+              vinbb - buck boost
+              vinbd - buckd
+
+        "^vinl[1-6]s-supply$":
+          description: |
+            Phandle to the power supply for one or multiple LDO rails of this
+            PMIC. The mapping of supply to rail(s) is as follows
+              vinl1s - ldo1s, ldo2s
+              vinl2s - ldo8s, ldo9s
+              vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
+              vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
+              vinl5s - ldo4s, ldo6s
+              vinl6s - ldo13s
 
   - if:
       properties:

-- 
2.49.0.1204.g71687c7c1d-goog


