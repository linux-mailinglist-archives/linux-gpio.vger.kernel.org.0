Return-Path: <linux-gpio+bounces-27975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D88C2DD63
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 20:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D61444EE328
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 19:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4797C31E0FF;
	Mon,  3 Nov 2025 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Th4VRFNF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2D631CA5A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197292; cv=none; b=DrUN5lFzcCo8LN0hohZG8qj9wqGFNZ3vLccO0Xcln7+lUOGuPKOaCNB5YJkhPyPVadFVbDFI4y3/CYcN1edjqLNQHtpHWaOjYXBUuMXSKlmOuaTtxpGJn5xh6tiRbJeUebGYu1Y4aoiQ/Y5kjQkK/ctgtnzX+miCwvx4LBGwLus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197292; c=relaxed/simple;
	bh=WT2dsAzXYVBb9NdPdZeThrS/5TWjahvSwPKAMVOLm+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ot+ncKlpLY4O1eM+iwr7lASCsKMfOUvSJ3IM+Psbj6HtIcAa664aEVGpovHWpw7njKgqwuKEfXDS20UuM3kqqM71nsQ5x6j6MqETeSEM2dUY6eF4p9UsqORVSeY2ZkOUqbqEgmTSH1PDQOaalw8v7cx2fdf8LQtnBbJWdfJtagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Th4VRFNF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so2096579a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197285; x=1762802085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHGPwfdrGUrUwEO7k7GuS8nV8/DWovHVstgAXC/1GYE=;
        b=Th4VRFNF9ke5Pm17QmuZ2MRPKcRCkPFu3xb/LHXta3bIzmAb4Fmw8tKo6xn57+q+EN
         kusL1GzxEhhR4rZLJKCR5LMFiE1QDKU5ZhUvXvKbAo+MDIJYADY+qFMcAWvHSJxJknMt
         GMT+/yh4WyegWNqtD3mPbs15XxtmfEc7zZb0Kyyp0jPJBG5G4fgIY9yeiDQPILIkBGpo
         3P9hTCZspQKIKbmx0nqvzWhdABNcorJ9rjA9Rl9VwnYo7NNp7NnmvSz591/tMZubSX8k
         U7zyLavv4MB+37eV2yLtMHBUiPKo6FIE8brWIMvzU4CNe88F0jygQxBeTXHeTgMlxvFR
         QJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197285; x=1762802085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHGPwfdrGUrUwEO7k7GuS8nV8/DWovHVstgAXC/1GYE=;
        b=CuXI7qnNCJ4WFb3OZ0lkOWYUrI0znn7qN4QxxOi+WDyqXB0KUqZ1jq8Av7B1OfqrB4
         Av+eoCLFGlQ3vQgSxNK83ldTPm8SopAcZEje9EDkKcK5pDw5W1g4uRIpGK5bv7wZkGEJ
         +MhB9qHg6e7AXuBNLTZY1j2p9B3dErEXAVHHcqFKOJ3WHEkDeSM7BjZK1NHe8gO0b0MM
         vN2fxq8/MkEyLbsjInw3Rv2v7cBm7gV4/DPoAaJzPRv8DJnxaIeuL6EF3uMX2ciJuAEU
         ksbZOBRumeb4hymTs2npWdoaXffuiyzc90NwraCbJCdllHniVppYu4kKzHT0e99lUpeO
         9MwA==
X-Forwarded-Encrypted: i=1; AJvYcCUWmb/hXhtcANdP90UcSazMe3RWnR1IaMs4d5T2A+8xJ0pN2NZ5CRwhMW6MjWQPZWrticHijk4DAGNS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Eh1ELTvESPITJgSsl78bqsZS6gGs7l0pfkdYUF9t56ECwtYD
	iOH9uQsbchFuM4ig0U/ObDlgp4zrkRN48itnIFeF/bs4VkqlbedeqgLRfKrhnh7ZnoY=
X-Gm-Gg: ASbGnct9QD9bOQTiecmR9i6y5kpFTDO7iGgvkupPr1g8NnLgIXP8euccw09239UQuTF
	ZD0wZmSANxNz//R8zbdADkEQZJjlr+DvQP3lOJSHT5jqJSXu+efIZ6tTrz9lg1uw5mu8z/xA1O9
	ldouUTKuy3gXlEG3n86T0OCPlB62o/dEsehtcokzoWyp3k9AhBJuDr2D5InF7rtKDGvBk1Ci7sb
	eko7VQtW0Qhp3Mv6o73L8iKYj1mHusPowv3fXYPxImJ+BP1KnxJOTR4M46P6xJ3L3eV2yhTKGnn
	xmwM7XdDu3pAyFdfXo5xZiwz6NtP27QrxyTe0YLrR0nzML3jwlkv7MRuFgOpL/h43GzLJe2nZ9A
	4T4lHtrwWZtzq9/rWfMPVSWpcdaQ1tAbsX4gZjl6HEZlGJMeq38Ggx6i9VtGiz7pelXSXfh5sV9
	//JeAGc/8VtVGlYUPEP+DDugqp8uvAFMFD/RlWsKX9gyRcci7uaV9CmZWlWfYlG7j/Yue/tb1Ke
	nILF3m2yQ==
X-Google-Smtp-Source: AGHT+IErKoUS3GpwEuzvpwY/f4z4DJdXi43mFUP7RFgT7Le8+6xbUl3oFknUE11HGTaGzQhPL0D5Jg==
X-Received: by 2002:a17:907:7f2a:b0:b57:2ffa:f17e with SMTP id a640c23a62f3a-b7070132a9dmr1462021566b.19.1762197285392;
        Mon, 03 Nov 2025 11:14:45 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:45 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:43 +0000
Subject: [PATCH v3 04/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-4-b8b96b79e058@linaro.org>
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
index 0000000000000000000000000000000000000000..0080ac23b6c926cdc632903e2b2716c12e8a4991
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
+definitions:
+  s2mpg11-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. The following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG11_PCTRLSEL_PWREN - PWREN pin
+            - 1 # S2MPG11_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
+            - 2 # S2MPG11_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 3 # S2MPG11_PCTRLSEL_G3D_EN - G3D_EN pin
+            - 4 # S2MPG11_PCTRLSEL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
+            - 5 # S2MPG11_PCTRLSEL_AOC_VDD - AOC_VDD pin
+            - 6 # S2MPG11_PCTRLSEL_AOC_RET - AOC_RET pin
+            - 7 # S2MPG11_PCTRLSEL_UFS_EN - UFS_EN pin
+            - 8 # S2MPG11_PCTRLSEL_LDO13S_EN - VLDO13S_EN pin
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
+      - $ref: "#/definitions/s2mpg11-ext-control"
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
+      - $ref: "#/definitions/s2mpg11-ext-control"
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
+      - $ref: "#/definitions/s2mpg11-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500]
+        default: 6250
+
+additionalProperties: false
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
2.51.2.997.g839fc31de9-goog


