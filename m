Return-Path: <linux-gpio+bounces-20992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D5ACE133
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 249BD3A86D2
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850CB1A316C;
	Wed,  4 Jun 2025 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KbyHrIEY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F11917F1
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050750; cv=none; b=Uf7W4u5TIVcx75nTNpVhthfF7HhAwFBE6mDiUwHIFzEu4oCEDu6bsvARxsz/v5PbyVEN+y69qkMILoMO/6dpjvqHrQkYCDT6smkEj8V3ZIstN1u1ZAUjpnETsF/EWOqtw7piVSHJg36OTka9H3l5FuzYO+aAEC+mhwVUj1Lhch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050750; c=relaxed/simple;
	bh=i7LYP+2b/HhCF2Z1/IxiMY41qTXY9usnHls789FLRiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JG1Bu9CMMbTb9sYNYQLgOTiGvipxYDiBBFLTfKa5OGoSbsMeBCUg/uM8Uhy/dOAEyMeKPC8YCRF7c+bADlbrBjhqfl/6GhJ5XohjnwCIS5hvaBBjsdAF2AUe3zIS2oHRb4a1+SwG03JSP9xGeUzqXen25e34vzJ0RW5nQzSCBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KbyHrIEY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-602e203db66so11904299a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050746; x=1749655546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/Nuhjkvj2i8BYs2yY8o0DBKFzqmFzKeDEHJy4UYUW4=;
        b=KbyHrIEYUN26mnkqWSrWSJd5KNb4MpWT217AzQ8UD1twgK0n2hXlsZ1n1uH9x/12zp
         EuNyRt2g08UFW6eZoOVMJrlKBTlx90fjwksopv0KI6IdpqQJFiAr8AMQyw5HUvh9NzJA
         G4H+vg++OFqqWp/U6f1oZeqVhsMKFa5VzRr1ZYrIlLBs2ADdp1LIvHYtrdGi7EW0ASoZ
         1u+lkngxb81NswwMp6pEf/TPoiBxsXpKXAoEykVMKWtIbWjvqOoETdzQUs2UwAl+JdAN
         acTKLIubHDJs+aRKYCf4lk31T+t7Rx8B3Mbw7sryu5v8Cnf9WibdLAScD8A175rUTQ3l
         djSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050746; x=1749655546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/Nuhjkvj2i8BYs2yY8o0DBKFzqmFzKeDEHJy4UYUW4=;
        b=RbhBdxoHh59MKh8WmmPjGdV11PsBuh2SKRd9fyyQQYh9vG/649vzxUbkxk4n79OYF0
         ry2gRnbZS5rs5h/ShYYyYfzs73+9plQ7gdnslzZUt9yl2TRy6fbwOpZ+6dcfdGr/Lfvz
         hrVW1U4xPzM4FEjRusJRLvZSS5D9vvAmapj7nAwIkY8+rpg/bctss/IaUnBly540I8aU
         Jwhl3xxU7rFoXsfGSurZsHvaRCLocMu27ZAWFj6Ije3f0fcfBW9tORhtrZWrPQuM5ai2
         VIu0MIrTjd5YryoZtKqA9yXog9fUT5I8p44xUgp1BqO+5pd41K7C+Cxyx0oVvy3Kc/l7
         WAGA==
X-Forwarded-Encrypted: i=1; AJvYcCVRLTY1BTToVIQkSMkGSuP1WipmF6iv7VlE5hjKVA+zBnNe8cJiglvp3XRphmrGM0TI2VuGpdrbKJK9@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmQHnkE21Wx/Ly/v4az4nTZntu+aUSSQ+UCZe5zeTszq300pf
	JSNpIygiKNbX+r8aSBTeR4gZ9UGeGo+RblXfLs44t4rCTERLL8ux/70d6Ei0JQDFnsk=
X-Gm-Gg: ASbGncsifykoClQjtCzT1GHa+ELqv6RM2tMZLAaVk9CeYoB+wL5c2mMPMeiFrU4cqDP
	D3vGyOcA5J7igKAIswj1M6lpewSCszeqEusIyAkHMAHTO1cTR86y4zctTJPqjcmnJKZtgfTIomQ
	bkbDyCE/Adf7JkRSqZOQbaGnh/NfifaFwg8rxiKF7Ym5R7nSyHEYKrfuFr7pf3vDwgoVy02+k8e
	GK63L5tgQRsM5e/H9S5+rbXi2edcU3APnX2qxooLPrRNTuNKRfn+3uIzw5GXsSPv4Zo05uFnG7e
	nxtQqzALLa3o4r++pvkturRad9IT/rjBJQGnn3FnLB22QFxF4LYmf7R8RoVlBG5+9OKynE9G6SI
	R4lVHrhBTBfHVIoReECuyZegidC07sHeFrWE=
X-Google-Smtp-Source: AGHT+IGNeOInImc3IiLEgN6dgTSjuYlEJ0cGTX8zNFDeGDe2e91LE/P2zcqlG80knQ7jcN+ctu99FA==
X-Received: by 2002:a05:6402:50c9:b0:601:a681:4d5c with SMTP id 4fb4d7f45d1cf-606ea15f66fmr3407522a12.32.1749050746101;
        Wed, 04 Jun 2025 08:25:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:42 +0100
Subject: [PATCH 03/17] regulator: dt-bindings: add s2mpg11-pmic regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-3-6038740f49ae@linaro.org>
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

The S2MPG11 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, and power meters. It typically
complements an S2MPG10 PMIC in a main/sub configuration as the
sub-PMIC.

S2MPG11 has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these
can either be controlled via software or via external signals, e.g.
input pins connected to a main processor's GPIO pins.

Add documentation related to the regulator (buck & ldo) parts like
devicetree definitions, regulator naming patterns, and additional
properties.

Since S2MPG11 is typically used as the sub-PMIC together with an S2MP10
as the main-PMIC, the datasheet and the binding both suffix the rails
with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.
---
 .../regulator/samsung,s2mpg11-regulator.yaml       | 150 +++++++++++++++++++++
 .../regulator/samsung,s2mpg10-regulator.h          |  18 +++
 2 files changed, 168 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f2d596642501c197e2911ee3b9caac189cf541a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpg11-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG11 Power Management IC regulators
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MG11 Power Management IC
+  (PMIC).
+
+  The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+definitions:
+  s2mpg11-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. The following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG11_PCTRLSEL_ON - always on
+            - 1 # S2MPG11_PCTRLSEL_PWREN - PWREN pin
+            - 2 # S2MPG11_PCTRLSEL_PWREN_TRG - PWREN_TRG bit in MIMICKING_CTRL
+            - 3 # S2MPG11_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
+            - 4 # S2MPG11_PCTRLSEL_PWREN_MIF_TRG - PWREN_MIF_TRG bit in MIMICKING_CTRL
+            - 5 # S2MPG11_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 6 # S2MPG11_PCTRLSEL_AP_ACTIVE_N_TRG - ~AP_ACTIVE_N_TRG bit in MIMICKING_CTRL
+            - 7 # S2MPG11_PCTRLSEL_G3D_EN - G3D_EN pin
+            - 8 # S2MPG11_PCTRLSEL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
+            - 9 # S2MPG11_PCTRLSEL_AOC_VDD - AOC_VDD pin
+            - 10 # S2MPG11_PCTRLSEL_AOC_RET - AOC_RET pin
+            - 11 # S2MPG11_PCTRLSEL_UFS_EN - UFS_EN pin
+            - 12 # S2MPG11_PCTRLSEL_LDO13S_EN - VLDO13S_EN pin
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 12
+
+      samsung,ext-control-gpios:
+        description: |
+          For rails where external control is done via a GPIO, this optional
+          property describes the GPIO line used.
+
+        maxItems: 1
+
+    dependentRequired:
+      samsung,ext-control-gpios: [ "samsung,ext-control" ]
+
+properties:
+  buckboost:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for the buck-boost regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+patternProperties:
+  # 12 bucks
+  "^buck(([1-9]|10)s|[ad])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single buck regulator.
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500, 25000]
+        default: 6250
+
+    allOf:
+      - $ref: "#/definitions/s2mpg11-ext-control"
+
+  # 11 standard LDOs
+  "^ldo([3-79]|1[01245])s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 2 LDOs with possible external control
+  "^ldo(8|13)s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+    allOf:
+      - $ref: "#/definitions/s2mpg11-ext-control"
+
+  # 2 LDOs with ramp support and possible external control
+  "^ldo[12]s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500]
+        default: 6250
+
+    allOf:
+      - $ref: "#/definitions/s2mpg11-ext-control"
+
+additionalProperties: false
+
+allOf:
+  - if:
+      anyOf:
+        - required: [buck4s]
+        - required: [buck6s]
+        - required: [buck7s]
+        - required: [buck10s]
+        - required: [buckboost]
+    then:
+      patternProperties:
+        "^buck([467]|10|boost)s$":
+          properties:
+            samsung,ext-control: false
+
+  - if:
+      required:
+        - buckboost
+    then:
+      properties:
+        buckboost:
+          properties:
+            regulator-ramp-delay: false
diff --git a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
index 1d4e34a756efa46afeb9f018c3e8644ebc373b07..0203946b7215eca615c27482be906c3100b899ee 100644
--- a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
+++ b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
@@ -22,6 +22,10 @@
  *
  * ldo20m supports external control, but using a different set of control
  * signals.
+ *
+ * S2MPG11 regulators supporting these are:
+ * - buck1s .. buck3s buck5s buck8s buck9s bucka buckd
+ * - ldo1s ldo2s ldo8s ldo13s
  */
 #define S2MPG10_PCTRLSEL_ON               0x0 /* always on */
 #define S2MPG10_PCTRLSEL_PWREN            0x1 /* PWREN pin */
@@ -45,4 +49,18 @@
 #define S2MPG10_PCTRLSEL_LDO20M_SFR       0x3 /* LDO20M_SFR bit in LDO_CTRL1 register */
 #define S2MPG10_PCTRLSEL_LDO20M_OFF       0x4 /* disable */
 
+#define S2MPG11_PCTRLSEL_ON               0x0 /* always on */
+#define S2MPG11_PCTRLSEL_PWREN            0x1 /* PWREN pin */
+#define S2MPG11_PCTRLSEL_PWREN_TRG        0x2 /* PWREN_TRG bit in MIMICKING_CTRL */
+#define S2MPG11_PCTRLSEL_PWREN_MIF        0x3 /* PWREN_MIF pin */
+#define S2MPG11_PCTRLSEL_PWREN_MIF_TRG    0x4 /* PWREN_MIF_TRG bit in MIMICKING_CTRL */
+#define S2MPG11_PCTRLSEL_AP_ACTIVE_N      0x5 /* ~AP_ACTIVE_N pin */
+#define S2MPG11_PCTRLSEL_AP_ACTIVE_N_TRG  0x6 /* ~AP_ACTIVE_N_TRG bit in MIMICKING_CTRL */
+#define S2MPG11_PCTRLSEL_G3D_EN           0x7 /* G3D_EN pin */
+#define S2MPG11_PCTRLSEL_G3D_EN2          0x8 /* G3D_EN & ~AP_ACTIVE_N pins */
+#define S2MPG11_PCTRLSEL_AOC_VDD          0x9 /* AOC_VDD pin */
+#define S2MPG11_PCTRLSEL_AOC_RET          0xa /* AOC_RET pin */
+#define S2MPG11_PCTRLSEL_UFS_EN           0xb /* UFS_EN pin */
+#define S2MPG11_PCTRLSEL_LDO13S_EN        0xc /* VLDO13S_EN pin */
+
 #endif /* _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H */

-- 
2.49.0.1204.g71687c7c1d-goog


