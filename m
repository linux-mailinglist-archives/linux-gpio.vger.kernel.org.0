Return-Path: <linux-gpio+bounces-28305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA9C4904A
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2808A4EA10D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A7D337699;
	Mon, 10 Nov 2025 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWMTJ0/5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32E73358CF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802945; cv=none; b=HOR6b/0d/PkPsJfCNjVVoVfOSWF/TAbQRnAG7GRZpOazvspfFIe6R8A8/v5GG8OrGmO0luL8QWvVeuuIFiddXdXFeguuB9LwptNAYJl7nWAIwkYzWc6MrYGVnp35CwEuI7f0CAxj5lXZaUW7shtWocDk5lIhaSUgt9XFeK5mwkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802945; c=relaxed/simple;
	bh=Iturht1z4J5VCGdq2uxO5/JtdngohPB50fNeYkz5Be0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfPAR6bU9+jrqoFVOBTKpjXb5Z8bG3KrX8kVS22CBgUQ9BRHkYCXL9LWtsWDpOp8/sXH98CLsBqiiy1lxOnHQGFE8GIglWQSfIqiOs02BDbG6JcDwqcUmUcmcaJ3G4AsxmGhzJa1vl/2l4xEV0FTMjK/6jWDL83JySYJvrTWigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWMTJ0/5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7272012d30so629492066b.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802941; x=1763407741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiI3ga5iXjBfQ+EAlf6AmxG+ll0vZYfLdFbrUr44oag=;
        b=eWMTJ0/5Ca0GJDdsn07ueToLpR20SHOJzaJTplfJk85PWylIg32IDyuLoojY78WUaA
         pgCNB0Gliqi24AArTOC/MDyxavVPrpLFZGqfF46qAlV11Fyhbnpe11KvU1DpWpEfnoIW
         GwnI62Siup1ZPA44gM9JtgJLGA7RGJHW7Mp/gHO6nJCEbcoWz35kNY2/4H85Vp5R+XSP
         OBhGZNIt3PH0ph5ud8VFk4r8gH+MNo1S8abjP4s8+OGU/lIfVo+CQn72SHTytOW1T+Lp
         Sw6u9Rj02JvfXYp//aNvslxXN5xCfQ1EjPcmZ2vrRDQi1CCU4+ghpKMRj6GLR0KQPDBo
         YaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802941; x=1763407741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiI3ga5iXjBfQ+EAlf6AmxG+ll0vZYfLdFbrUr44oag=;
        b=PIaUemxfX5Z+a2NACSR+37Zs444+uvWmT65rSlur/ohtapQ0V3Ojteasu4cFUFWBgi
         99mEW95HJe0/bEUIEHBCcxBvAarZZI/7l2Ij8uZQuKwPlzA8Ves4H9kg9J1+jC7Ny1oC
         djzkgJNKAsdRD/fSKwn5+Y295ai5rqEFh4yRpgsWr7zNvzG2xaLkx12mv7AijrLk3DHI
         CQnFqq4aykmrghPQcYXIXv1lX4mUhSER/HZZ3Ln2Wt9L+b8ZPXcHy0VUIa2r6ia8fuUo
         5dVnJFCNhvh/voNXxtXNvAQa4dFbM0R0C/eZS3/04c2/P/Lv/HBu+1dgkfE15ckncS77
         sQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYpiF0VD4X64cv398ACLXrQHV+JB4hOpaGk+Y/39rFhEXniqceyhSBpCHzDA38VL8b+X2e2wscV60c@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9Ia6zMVZetVLjYtSP/fDZlVTu+lMm/cZ/UA9QUJ4KNjd3uRU
	7Ry3RG5v1VmS5cIecPcORIONhP/MujZvriovLWyhaH9r1dqlVNr8P51UUUNuLd3MAjM=
X-Gm-Gg: ASbGncsGswnwGTvIneL+Wf9ixW5DnZPmlHLb5gGTm+Llc8EM9gWOnof5mMzO+I30NHe
	/kSt8otqIXQ1EF0FN9bejtSCoECybATtUzM8VTL6Ry7PxaCFr+MNvhCcSj8tu4fORHF4ZF/ZhRs
	Y/J+RwHcXQVIKlzKlP7aANyytR2ySaTfkoY4mpcYWdsPflC2NlTO/Of/yIgwtgGxPs7zsP1ey8l
	q3gI4YXBPm1euEKrHAiP12fmbAcDOkOl/s9lAh5laxb5Oj8xpcS2p/F5OhiDhkdecEoS6IjGh6S
	XhcxcdDdUxXfYuNxqAbibZIGBoEnwtuG7eg1rAi9xViDmotFJZVMNflvm50MZrqAxzAqetp4C19
	F60eWQdVKc3fOO7k4qLhV6NcTtgBrY23fL5AUJc5FPTfQejVFstynGFmWmoA4O5Y57rpNwZZqnx
	aWz1AZPZhCsXwlqi/Czvy0lfilFz8dwH4LYCrAF45IS6XPTF49mg50hvrbOgJjzb67y/STDQ8=
X-Google-Smtp-Source: AGHT+IHMusIGLU03fNsfdJtUUbDSIW3BGC4hBoJ45/tEDTDinhOCVakoQvnZg/iQ1d4Ttnda5vuCZw==
X-Received: by 2002:a17:907:3f11:b0:b72:ddc4:2a7b with SMTP id a640c23a62f3a-b72e0562e47mr980105066b.63.1762802941064;
        Mon, 10 Nov 2025 11:29:01 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:00 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:46 +0000
Subject: [PATCH v4 03/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-3-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
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

The S2MPG11 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, NTC thermistor inputs, and
additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
a main/sub configuration as the sub-PMIC.

S2MPG11 has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these
can either be controlled via software (register writes) or via external
signals, in particular by:
    * one out of several input pins connected to a main processor's:
        *  GPIO pins
        * other pins that are e.g. firmware- or power-domain-controlled
          without explicit driver intervention
    * a combination of input pins and register writes.

Control via input pins allows PMIC rails to be controlled by firmware,
e.g. during standby/suspend, or as part of power domain handling where
otherwise that would not be possible. Additionally toggling a pin is
faster than register writes, and it also allows the PMIC to ensure that
any necessary timing requirements between rails are respected
automatically if multiple rails are to be enabled or disabled quasi
simultaneously.

While external control via input pins appears to exist on other
versions of this PMIC, there is more flexibility in this version, in
particular there is a selection of input pins to choose from for each
rail (which must therefore be configured accordingly if in use),
whereas other versions don't have this flexibility.

Add documentation related to the regulator (buck & ldo) parts like
devicetree definitions, regulator naming patterns, and additional
properties.

Since S2MPG11 is typically used as the sub-PMIC together with an
S2MPG10 as the main-PMIC, the datasheet and the binding both suffix the
rails with an 's'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

v4:
- Krzysztof:
  - move additionalProperties to after allOf
  - use $defs, not definitions
- update samsung,ext-control: description

v3:
- mention NTC thermistor inputs in commit message
- drop PCTRLSEL values that can be described using standard properties
  (Krzysztof), drop useless ones, rename the remaining ones
- drop maxItems:1 where not needed (Krzysztof)
- samsung,ext-control-gpios -> enable-gpios (Krzysztof)
- drop buckboost from 'allOf' limitation - not needed as it has its own
  specific description

v2:
- fix commit message typos: s2mp1 -> s2mpg1
- mention GPIOs in commit message
---
 .../regulator/samsung,s2mpg11-regulator.yaml       | 136 +++++++++++++++++++++
 .../regulator/samsung,s2mpg10-regulator.h          |  14 +++
 2 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..119386325d1b5b6b0fe35c1f17d86e3671fe0fc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulator.yaml
@@ -0,0 +1,136 @@
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
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500, 25000]
+        default: 6250
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
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 2 LDOs with ramp support and possible external control
+  "^ldo[12]s$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500]
+        default: 6250
+
+$defs:
+  s2mpg11-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. The following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG11_EXTCTRL_PWREN - PWREN pin
+            - 1 # S2MPG11_EXTCTRL_PWREN_MIF - PWREN_MIF pin
+            - 2 # S2MPG11_EXTCTRL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 3 # S2MPG11_EXTCTRL_G3D_EN - G3D_EN pin
+            - 4 # S2MPG11_EXTCTRL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
+            - 5 # S2MPG11_EXTCTRL_AOC_VDD - AOC_VDD pin
+            - 6 # S2MPG11_EXTCTRL_AOC_RET - AOC_RET pin
+            - 7 # S2MPG11_EXTCTRL_UFS_EN - UFS_EN pin
+            - 8 # S2MPG11_EXTCTRL_LDO13S_EN - VLDO13S_EN pin
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 8
+
+      enable-gpios:
+        description:
+          For rails where external control is done via a GPIO, this optional
+          property describes the GPIO line used.
+
+    dependentRequired:
+      enable-gpios: [ "samsung,ext-control" ]
+
+allOf:
+  # Bucks 4, 6, 7 and 10 can not be controlled externally - above definition
+  # allows it and we deny it here. This approach reduces repetition.
+  - if:
+      anyOf:
+        - required: [buck4s]
+        - required: [buck6s]
+        - required: [buck7s]
+        - required: [buck10s]
+    then:
+      patternProperties:
+        "^buck([467]|10)s$":
+          properties:
+            samsung,ext-control: false
+
+additionalProperties: false
diff --git a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
index 4a6bf13442f50bb1c475728722eaebd0ec3dcbfa..d9c16bba4d85809df99c2887b8dc61ea1bea5ad1 100644
--- a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
+++ b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
@@ -20,6 +20,10 @@
  *
  * ldo20m supports external control, but using a different set of control
  * signals.
+ *
+ * S2MPG11 regulators supporting these are:
+ * - buck1s .. buck3s buck5s buck8s buck9s bucka buckd
+ * - ldo1s ldo2s ldo8s ldo13s
  */
 #define S2MPG10_EXTCTRL_PWREN       0 /* PWREN pin */
 #define S2MPG10_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
@@ -36,4 +40,14 @@
 #define S2MPG10_EXTCTRL_LDO20M_EN2  11 /* VLDO20M_EN & LDO20M_SFR */
 #define S2MPG10_EXTCTRL_LDO20M_EN   12 /* VLDO20M_EN pin */
 
+#define S2MPG11_EXTCTRL_PWREN       0 /* PWREN pin */
+#define S2MPG11_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
+#define S2MPG11_EXTCTRL_AP_ACTIVE_N 2 /* ~AP_ACTIVE_N pin */
+#define S2MPG11_EXTCTRL_G3D_EN      3 /* G3D_EN pin */
+#define S2MPG11_EXTCTRL_G3D_EN2     4 /* G3D_EN & ~AP_ACTIVE_N pins */
+#define S2MPG11_EXTCTRL_AOC_VDD     5 /* AOC_VDD pin */
+#define S2MPG11_EXTCTRL_AOC_RET     6 /* AOC_RET pin */
+#define S2MPG11_EXTCTRL_UFS_EN      7 /* UFS_EN pin */
+#define S2MPG11_EXTCTRL_LDO13S_EN   8 /* VLDO13S_EN pin */
+
 #endif /* _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H */

-- 
2.51.2.1041.gc1ab5b90ca-goog


