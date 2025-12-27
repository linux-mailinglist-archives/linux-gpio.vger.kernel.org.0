Return-Path: <linux-gpio+bounces-29925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28311CDFA5C
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7957B30181B9
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAD832ED5C;
	Sat, 27 Dec 2025 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6vfb/N8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D832E72A
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838272; cv=none; b=SAftY5wF+Las0svTCEK9fGMY9PEQjVGo/7NHkFYxKj/OhzS35ySkGbHMaNBlkZmaO9l4dtmLMQNIMYGU9o0kzrixd01lE9BAngbLMbtaf+f6YIy1MhLB17U5qArtu/4VpZfmXCn2Skawt93tFLKFEppz5sU11KnKFpGTxihD+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838272; c=relaxed/simple;
	bh=2d0/0d8m3hoPTVwM5bL/RvUwiky6FkNHvNZvc4rhp20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jt/Xr79H5pA0UxZDiNWi4/FjnYsdpc0az2yovGgPrtiLHrfOGmJRKPSp5KEnaoI6SMJBulxMOKx2eAh91yxKtQ7AGLRyis8sJjCtJiIEtLMYurWIhLRW7MUn1Lg2/4BYx9ASlo/PlNakIyazky9Wucf3bIqnUdJtSXKi74USXOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6vfb/N8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so9427621a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838268; x=1767443068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnmKgwlb3Memk9Nw/lLRlBwA50fe1rJg2Ys2TdZg8gU=;
        b=o6vfb/N87o5yuvwT6MJuk/ti8/VV5CDDZ+PqSvbI9VrRiQa44zUOuGQ19q3ZfOB5mN
         Cd8EH9deBHJzt7XrqNrY0UZSvwVaB4uTSgZMt9VLE4OxysUKsH/Yolvo+qC0muEUfNmW
         SupDPI9EKILYtXDHCYKTs/nlmujAShRYgNm8v1o4MVxb5YPUylxMLPpJTO1qKRE6g02i
         qs7Dg/gl7Idu7yOI5GEEhjJ2jyJSwD3HsScwbGCQwMIVPUaxHpSsF3D6ws0zx3k4Al9z
         FQQkNyOdpABkIkX91n8tU8RiAOEImmc82NhXy8C9ZuNkerdaUX0BojbqV2odRcW9vZ7g
         PWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838268; x=1767443068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnmKgwlb3Memk9Nw/lLRlBwA50fe1rJg2Ys2TdZg8gU=;
        b=qhnhQ/2WDJq4XzBa9k+oLldvd24to6ScmU3zWV0l1hEma0arDkql2A5F723dVpIcqd
         CZLjCCs3XJHKOp6zFQsJDH55UfttDjFS4VtBID2uqKHdMCmTdBrlRaTAX9JHKE/8xfi4
         38la5wkk9hz2tyKq7IY687fVtKzRKhfgbktPeaOyVyuMJwMcsrAYQrm/Ezsdp81+qBc8
         AEwpA7wiMRLoWaJbDyTi///qgDpdch7aa6wRxIRSoGEU3DeQ4+3VwuPmX+UBVu9en7/p
         U60F4Sf3Oh3sC55ePd7H85JjgZPhTpEtKEqvk5Ql7OQwQeQZJ0M4mrBlVHjQrt1bawG0
         UCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaB8oAykO6Hz0iJu/T4JWCm31V6AOeoJDnjYC71HryNXA9vycAG5ElYOraw0DkFxgs8MD/HKZ9dMkk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2VFSs0BHBc28ZgINarjPb1Azvz5vMBe3szkysJO55TaVytlEq
	cYQy3w9L6/SVoEUBI61zj3Gbsf9ThH7DV9F0HzWzylML343l7tFNISlHQl+TCpUyKxU=
X-Gm-Gg: AY/fxX4BWqaKBH9RhlTedd0PaP/DzyqpGChadSV3ezdwrSN7Ryru5HCc2yLm5Yac0iO
	/9EPJltJ9RMha+llQ/W98ei468lQmxINZON6E6vaMqLWavTX+0nkGHZL2gd41mQLzly+Z/4pQiH
	NFdro5iZlB568vLNblFb0NjiMOEvRMu7vaP+pGt/DHt3FLWyHV50I1FR1lgvTSsCo2pmFASK/9j
	+H3kRna1+vVd+FSH2eW3dmishc/QmwHsI27LB4YyQdqmk9v85mEPPnaxjCcZCV6Cir3wdhmx2EU
	n5RH75LQibWvhisLCIuJHeZtBZ6AIQq0Yeg+UH5BYYZSRkbIRfxz+decr6EeIbRd1f9M2F1geDO
	6HxEi3ctoxHkmBouDuXL7kKAwJH7WX5N+NzhxykqCO35ba/ZS6MSZZml1502OnDlIv6yk9LxTzA
	If3r6E+8BPPChiTrCT6m8YIM0+bZEIiJAk2mhs+I3ZnXIqWonkV2OhzQixjIKki7PWxwK6xu6ar
	gUFXg==
X-Google-Smtp-Source: AGHT+IGAcCMtQHlT4XKKFtGADWVcFNE1VJZMxUrv/NHf8LsqTZUlbV8TWqIQWo02tj9Et2Cnmt9Aaw==
X-Received: by 2002:a05:6402:2386:b0:640:93ea:8ff3 with SMTP id 4fb4d7f45d1cf-64b584ec371mr19471561a12.13.1766838267912;
        Sat, 27 Dec 2025 04:24:27 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:24 +0000
Subject: [PATCH v5 02/21] regulator: dt-bindings: add s2mpg10-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-2-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

The S2MPG10 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIO interfaces.

It has 10 buck and 31 LDO rails. Several of these can either be
controlled via software (register writes) or via external signals, in
particular by:
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

S2MPG10 is typically used as the main-PMIC together with an S2MPG11
PMIC in a main/sub configuration, hence the datasheet and the binding
both suffix the rails with an 'm'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- Krzysztof:
  - move additionalProperties to after allOf
  - use $defs, not definitions

v3:
- drop PCTRLSEL values that can be described using standard properties
  (Krzysztof), drop useless ones, rename the remaining ones
- drop maxItems:1 where not needed (Krzysztof)
- samsung,ext-control-gpios -> enable-gpios (Krzysztof)
- fix LDO20M_EN pin name -> VLDO20M_EN

v2:
- drop | (literal style mark) from samsung,ext-control-gpios
  description
---
 .../regulator/samsung,s2mpg10-regulator.yaml       | 158 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 .../regulator/samsung,s2mpg10-regulator.h          |  39 +++++
 3 files changed, 198 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7252f94b3a8f3ae339ff6cf3080786ba88d44f7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpg10-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG10 Power Management IC regulators
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MG10 Power Management IC
+  (PMIC).
+
+  The S2MPG10 PMIC provides 10 buck and 31 LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+properties:
+  # 1 LDO with possible (but limited) external control
+  ldo20m:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay: false
+
+      samsung,ext-control:
+        minimum: 11
+
+patternProperties:
+  # 10 bucks
+  "^buck([1-9]|10)m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single buck regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500, 25000]
+        default: 6250
+
+      samsung,ext-control:
+        maximum: 10
+
+  # 12 standard LDOs
+  "^ldo(2[1-9]?|3[0-1])m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 12 LDOs with possible external control
+  "^ldo([3-689]|1[046-9])m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay: false
+
+      samsung,ext-control:
+        maximum: 10
+
+  # 6 LDOs with ramp support, 5 out of those with possible external control
+  "^ldo(1[1235]?|7)m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    allOf:
+      - $ref: "#/$defs/s2mpg10-ext-control"
+
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500]
+        default: 6250
+
+      samsung,ext-control:
+        maximum: 10
+
+$defs:
+  s2mpg10-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. For S2MPG10 rails where external control is possible other
+          than ldo20m, the following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG10_EXTCTRL_PWREN - PWREN pin
+            - 1 # S2MPG10_EXTCTRL_PWREN_MIF - PWREN_MIF pin
+            - 2 # S2MPG10_EXTCTRL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 3 # S2MPG10_EXTCTRL_CPUCL1_EN - CPUCL1_EN pin
+            - 4 # S2MPG10_EXTCTRL_CPUCL1_EN2 - CPUCL1_EN & PWREN pins
+            - 5 # S2MPG10_EXTCTRL_CPUCL2_EN - CPUCL2_EN pin
+            - 6 # S2MPG10_EXTCTRL_CPUCL2_EN2 - CPUCL2_E2 & PWREN pins
+            - 7 # S2MPG10_EXTCTRL_TPU_EN - TPU_EN pin
+            - 8 # S2MPG10_EXTCTRL_TPU_EN2 - TPU_EN & ~AP_ACTIVE_N pins
+            - 9 # S2MPG10_EXTCTRL_TCXO_ON - TCXO_ON pin
+            - 10 # S2MPG10_EXTCTRL_TCXO_ON2 - TCXO_ON & ~AP_ACTIVE_N pins
+
+          For S2MPG10 ldo20m, the following values are valid
+            - 11 # S2MPG10_EXTCTRL_LDO20M_EN2 - VLDO20M_EN & LDO20M_SFR
+            - 12 # S2MPG10_EXTCTRL_LDO20M_EN - VLDO20M_EN pin
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 12
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
+  # Bucks 8, 9, and LDO 1 can not be controlled externally - above definition
+  # allows it and we deny it here. This approach reduces repetition.
+  - if:
+      anyOf:
+        - required: [buck8m]
+        - required: [buck9m]
+        - required: [ldo1m]
+    then:
+      patternProperties:
+        "^(buck[8-9]|ldo1)m$":
+          properties:
+            samsung,ext-control: false
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 0dbf349fc1edb33a57894e5ef1610b350ddf13a5..c1a93a6b005355bc109da9548493b3eb28e391fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23277,6 +23277,7 @@ F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
+F:	include/dt-bindings/regulator/samsung,s2m*.h
 F:	include/linux/mfd/samsung/
 
 SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
diff --git a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
new file mode 100644
index 0000000000000000000000000000000000000000..4a6bf13442f50bb1c475728722eaebd0ec3dcbfa
--- /dev/null
+++ b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2021 Google LLC
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Device Tree binding constants for the Samsung S2MPG1x PMIC regulators
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H
+#define _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H
+
+/*
+ * Several regulators may be controlled via external signals instead of via
+ * software. These constants describe the possible signals for such regulators
+ * and generally correspond to the respecitve on-chip pins.
+ *
+ * S2MPG10 regulators supporting these are:
+ * - buck1m .. buck7m buck10m
+ * - ldo3m .. ldo19m
+ *
+ * ldo20m supports external control, but using a different set of control
+ * signals.
+ */
+#define S2MPG10_EXTCTRL_PWREN       0 /* PWREN pin */
+#define S2MPG10_EXTCTRL_PWREN_MIF   1 /* PWREN_MIF pin */
+#define S2MPG10_EXTCTRL_AP_ACTIVE_N 2 /* ~AP_ACTIVE_N pin */
+#define S2MPG10_EXTCTRL_CPUCL1_EN   3 /* CPUCL1_EN pin */
+#define S2MPG10_EXTCTRL_CPUCL1_EN2  4 /* CPUCL1_EN & PWREN pins */
+#define S2MPG10_EXTCTRL_CPUCL2_EN   5 /* CPUCL2_EN pin */
+#define S2MPG10_EXTCTRL_CPUCL2_EN2  6 /* CPUCL2_E2 & PWREN pins */
+#define S2MPG10_EXTCTRL_TPU_EN      7 /* TPU_EN pin */
+#define S2MPG10_EXTCTRL_TPU_EN2     8 /* TPU_EN & ~AP_ACTIVE_N pins */
+#define S2MPG10_EXTCTRL_TCXO_ON     9 /* TCXO_ON pin */
+#define S2MPG10_EXTCTRL_TCXO_ON2    10 /* TCXO_ON & ~AP_ACTIVE_N pins */
+
+#define S2MPG10_EXTCTRL_LDO20M_EN2  11 /* VLDO20M_EN & LDO20M_SFR */
+#define S2MPG10_EXTCTRL_LDO20M_EN   12 /* VLDO20M_EN pin */
+
+#endif /* _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H */

-- 
2.52.0.351.gbe84eed79e-goog


