Return-Path: <linux-gpio+bounces-27971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57406C2DD39
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F8711898376
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53756322A00;
	Mon,  3 Nov 2025 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6HenyUp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3F31D740
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197291; cv=none; b=nXTea+a3p6m6WnBTsPL+hs7r4AAguwWPFLBOB3xoyJQe7htk52Dml3Z0tJ8ZZkeert5u5MifjoO3xt44YfSgDdEhsDXYoqEhvz6dThJwnmIX53PT7q/VrtrLoI1LCxZnPbSTQDVRAkvsgJ4qqRzkrmlKeoaKw0lTGLyNgTDwXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197291; c=relaxed/simple;
	bh=e7VXM6Vq/efnjQz1ILRI3v4/VjtY6t/RaBjA4AYjpz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=po5ILbwSuyJcHhyl+dpUnzxkcNE+Y/KiDRznT9P5yPxNd+UH90IFMeMMTkOzDCSEuzIGxflBCX0WImggn9M8mLt9djJNXufnTgbCzikFBrXrXv0on7nUwbx/RZnIfIdIxR+vxh+VFdWibbYbLAO+vvrEVFhREYvZfDWAM8x2s7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d6HenyUp; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63bdfd73e6eso10833474a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197286; x=1762802086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABQF+EmreEAWsZQ+SiZe1Wt85VEHsER8DTZu8Adt3i8=;
        b=d6HenyUp5I8FOV31eHTUMHdCNbs4mYTOZ9YBnvbQSTB7oJgboI/FhuZUr4H/rdrTtH
         k5PX7fJDjZBKiAnqTDsUhFnMxcxsFs5lWo/znF/RXPKRQ0r90QiL9X5S/9zYM0Z0LEjH
         U0fINVtOy88DkRRb2GV54929nqkqELPlgRmnU0LhDecB3GS6WoToIVJra8kCCekxQ+qX
         eekwLNY+8pZveUzkCNdGSfes/aNZoQAL1JIWKCYOsv91cjEdh8L3IYmo6RTAFWDFO3kh
         u7ouLaxbbU20nHQ5wpfz3i8MiuPG56FsKVRKSpad8iDFnB6uFbNT7MNT12vCpefnRGLN
         V8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197286; x=1762802086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABQF+EmreEAWsZQ+SiZe1Wt85VEHsER8DTZu8Adt3i8=;
        b=qrh0lforICNHCM7rzfUNCNuVvq6m5IR6oyAhsTwlYANpA4l607HXEUIjJd7/bAYLEF
         INGbaiECG19j6By0WIMpLOK8gi2eHesBcV7sBiLP6YEt37NNvlgd7HmWErbEzXUBxMj/
         uiAGJLpFmJP9G08rUmDRgn83pDoNLm/xwqIz/vAKbqJG0qOI5uxpTqPFTKjS2LkkwpRm
         t9PwBO1G4Az/6aUNe9BsZLaGA+SRg1D2+4ROdQT1Olfp1ZErVE2yQm136i+AQk1M8yIR
         SRCFMwPu1WQrgcEDdM7qVE0pke0cFcfo5f6fgAiwYKvKQUSyYBC10WT34y69Xy1bGWr+
         28hw==
X-Forwarded-Encrypted: i=1; AJvYcCWOl4mW90i8YqLJM9nXAv9tujcYXlN07ZYEj6U+bRchAPkSPZlLY/1TquPWVGiAGBfDVqv00MCwEQkP@vger.kernel.org
X-Gm-Message-State: AOJu0YzFAc3eOpHpdtVFNS8madalvBBJf2XqjrdxgbyHRMKvQBBUP+YA
	PqLUtPr2yvQ2UM1KdsniX/z9MS3XIFWCa+x0DfHS41e0269/CMdNKcNVlG+MhDYiDaZcf+Ha4XW
	2likj3Q4DMA==
X-Gm-Gg: ASbGncuim8vfurTqzbA/DOZDo9VB/TH1qLbDQRxBPgXL0pZ2EVVEULINEYtskQvyq9a
	idHI5F0FOue+w5rU3j0VZgMxzsI37uOikdijQAN+5DUINO6xHBhWOLoDiMXkUJOLhUV/Qs+l10s
	wgm3egMdoldh2EGBUD6AmncnDMcxW87alXvnOFTV9EWFaORIHtCl+veY3aMyxm9/zA8JYwFTJnJ
	bS0agmdiEeKznutxw/gfK3KMmwAmxy1EFP2aetBK8sbwYR5JLGOirKioQ7XgIe97utsoj1gnICG
	xnyWOu4zs0ydeyitYX7i0t30vmKfPrNFbRxurGlVONxd+ns6XMLrd5Gjy58MkTGT81IveHWTI6u
	LHuubUD3s88JhEhZEu+AW5CKfzV1lGjeBeRiU5kKdhweC1Folru3z0s67snS2SSvB30kNpZ5+IO
	pmRyqloxFwV9sbOT8FXfuYUt0m44rRqAF2X5ewqzknyNTRd+D1hFf4uUTMb7E9Sq4XjjstmNc=
X-Google-Smtp-Source: AGHT+IHei/xdh4dX7CczGjh2MRHVq35xrr88Jy3aisIcVsaRfP81u8CKnx7idkSNn+v/T3BCn0deWw==
X-Received: by 2002:a17:906:9f8c:b0:b72:671:b2a5 with SMTP id a640c23a62f3a-b72155a9e2emr58236066b.3.1762197286331;
        Mon, 03 Nov 2025 11:14:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:45 +0000
Subject: [PATCH v3 06/20] dt-bindings: mfd: samsung,s2mpg10: Add
 s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-6-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
supported by this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, NTC thermistor inputs, and
additional GPIO interfaces and typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC.

Like S2MPG10, communication is via the Samsung ACPM firmware and it
therefore needs to be a child of the ACPM firmware node.

Add the PMIC, the regulators node, and the supply inputs of the
regulator rails, with the supply names matching the datasheet.

Note: S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- move to new samsung,s2mpg10.yaml file
- deny 'clocks' property
- mention NTC thermistor inputs in commit message
- move all patternProperties to top-level

v2:
- add | to vinb*-supply description for better formatting to mark as
  literal style
- mention GPIOs in commit message
---
 .../devicetree/bindings/mfd/samsung,s2mpg10.yaml   | 49 ++++++++++++++++++++--
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
index dc06333a4050af69297ac3cae0628a0fffc3fcc9..6f0912989f2eff12d04dea03b3a067529327e8d3 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: samsung,s2mpg10-pmic
+    enum:
+      - samsung,s2mpg10-pmic
+      - samsung,s2mpg11-pmic
 
   clocks:
     $ref: /schemas/clock/samsung,s2mps11.yaml
@@ -39,15 +41,15 @@ properties:
   wakeup-source: true
 
 patternProperties:
-  "^vinb([1-9]|10)m-supply$":
+  "^vinb([1-9]|10)[ms]-supply$":
     description:
       Phandle to the power supply for each buck rail of this PMIC. There is a
       1:1 mapping of supply to rail, e.g. vinb1m-supply supplies buck1m.
 
   "^vinl([1-9]|1[0-5])m-supply$":
     description: |
-      Phandle to the power supply for one or multiple LDO rails of this PMIC.
-      The mapping of supply to rail(s) is as follows:
+      Phandle to the power supply for one or multiple LDO rails of the S2MPG10
+      PMIC. The mapping of supply to rail(s) is as follows:
         vinl1m - ldo13m
         vinl2m - ldo15m
         vinl3m - ldo1m, ldo5m, ldo7m
@@ -64,6 +66,25 @@ patternProperties:
         vinl14m - ldo21m
         vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
 
+  "^vinb[abd]-supply$":
+    description: |
+      Phandle to the power supply for the additional buck rails of the S2MPG11
+      PMIC. The mapping of supply to rail is as follows::
+        vinba - bucka
+        vinbb - buck boost
+        vinbd - buckd
+
+  "^vinl[1-6]s-supply$":
+    description: |
+      Phandle to the power supply for one or multiple LDO rails of the S2MPG11
+      PMIC. The mapping of supply to rail(s) is as follows:
+        vinl1s - ldo1s, ldo2s
+        vinl2s - ldo8s, ldo9s
+        vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
+        vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
+        vinl5s - ldo4s, ldo6s
+        vinl6s - ldo13s
+
 required:
   - compatible
   - interrupts
@@ -81,3 +102,23 @@ allOf:
       properties:
         regulators:
           $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
+
+      patternProperties:
+        "[^m]-supply$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg11-pmic
+    then:
+      properties:
+        clocks: false
+
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg11-regulator.yaml
+
+        system-power-controller: false
+
+      patternProperties:
+        "m-supply$": false

-- 
2.51.2.997.g839fc31de9-goog


