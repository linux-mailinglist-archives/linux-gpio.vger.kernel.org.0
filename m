Return-Path: <linux-gpio+bounces-21077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E853AD046E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF4F61889054
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FCD289820;
	Fri,  6 Jun 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGSvk6RC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD05F1B0F1E
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222196; cv=none; b=hBY6qQDuevowh0Ht7Q853UQHn9O8G3tANOx6KGZfEJddizNqwmwmbpXbjcmBQm2EH9Wo9w6aZvDvQALL0CAq/MRQCLk+hmjeXgcwRX8+sCaNbL9Spds1KJXzGuOjf6wFznPvSyQrd6L+Qkaqzxu4gjwIPUJQ0W72mLiw/CoVj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222196; c=relaxed/simple;
	bh=NrvhaelaffQkNWXehP7/rQznmZjjqC81kfB6W0U7Z5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLNAqkZWhzkM6NV5otfbtGBbvu+THkjkxN2SFt3DRF0C/fywxxNw0FcJKYzOCORsvlVicbSxZl3+bULbZAkuy2SHgbZdlb6917V65lEYRU9KKvsuG8s3CCJChQbsAYObTtZkl2vpjjcwQmlvo0I0YmCPbAH75M92lsubSc4poag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGSvk6RC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb4e36904bso413504866b.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222193; x=1749826993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6Q9Kcia6p8/L4cvfCFfuz2cptFMCP1QrB8rbp/NCAY=;
        b=yGSvk6RCO6NlVU99AirfrBD1onJwkdr99Qd1mlAHcudwZ9ae4pCH1KsbvhKT/XXf9E
         tAe7OJ/H6IX3QQCfClxiOEO1IeUu7YsJJsS9WjyVCl85UkqV0I+eyLd8PpWxRQdeXSbd
         ogKFPK0zAy185pTflATQcNNNsiu2kLkXfwZojRuelllD2p3yLcyrfpnAW7Sptb0Mx4TY
         YQiPFq1FYeWPwTq1FLbm1vxm26E3S64Tghbq9LfYPo4ig3DdMdhzlCDzhgnTuRMOqTKv
         NdIJrmRIFHx6REMnVm8kWp7ncK4eSlInOvym9FV3HMNETUHKFH7ZV22NC50ubZnHPCLy
         W6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222193; x=1749826993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6Q9Kcia6p8/L4cvfCFfuz2cptFMCP1QrB8rbp/NCAY=;
        b=reU+mymsEuCBrqSM2UNWEnTm/5AmO9BP15XtiZ0BPKn9UagOPVSm+lotpf6egFni8+
         Tbvptm7p8xXu1jU0oDNcLX2lDYfgxiSr9JJbCjK0+n2KWeYq1YsLqeaou9KadWuP7D8I
         FUF7aJ4ZFnNxGSTUWwezMW4AYKCXR/a8Rj9CMj3IxCSKZhmka8MdeL2yzw7VBFndHMfp
         KeUzVvpkl+FUwA+bxRiCGaBiQ3hDauWJUh+cbBcV8eiX5aBL2JY/aoVGpdWZSApssrUA
         2DLxI/Gkoe+n1mBkqtaxTjZKeHQEEh5R0PX1eJhuDCxeBV3uPJi0GUVPWgE0XOZ54b9y
         FGxg==
X-Forwarded-Encrypted: i=1; AJvYcCVrJQjU9kmvoK0V7atWwMoGDX+xcbhYS8KfiBw2gAc/lnCWlDEVk9ra50INFZYR6+JLLk3lv8Qc9Xzm@vger.kernel.org
X-Gm-Message-State: AOJu0YzXJxldxUBzJDcD6dFTzedAFIDIvU2riLCwdwWm5r1l+9iX36n0
	9ZtFD2PMkiW4kTQNn8wzOvSUdlXjuNe9hilvxG3Nywzv7ILQABRVu/IXjpqLrSZA+Rk=
X-Gm-Gg: ASbGnctcrY1ORjMLaEPPX1rYSHnb4k23+iCFs5Dfh6s79xGKk9zPXE4CJRyXiOEATF9
	7C9MstIMGxWBFvwYU8s/uss2+wJLThHIm1YwDYD8B2x6BcJw7ubDSrBgMUtwbBlLmE5W5s4iM7/
	bQjhAsjTwktmDRxPLqZ8J6Puu7weumnzxFYW8qX3iUKsMmrV7CDKCARDoDHgi6T9ThotyetZ6jp
	6BPFH/kVBOJX7QphSKkf6lQvAsv81iScqAmrKesiCgwX9N7RpaUKjMzSfErUbHazZNTppc4Rtgn
	Uzcw0xX8SpMUeHXqiSzNG/I9eJRhlYdZap+gvu5ZzDeRrj7cbSk53JuzVpHGcgg4u+iHM16XSVE
	7hWnGXnCN5oBTerwKjmNgrIXsajoZoAd3g5fBjpcVlXrYxw==
X-Google-Smtp-Source: AGHT+IGyl/lJzchfJ2skPsCGUli0VUF4l3MAyFYs1v7or+qo9zmqJmfA5AFatFoi+gPZUcmP4XN9nA==
X-Received: by 2002:a17:906:6a0e:b0:ad2:24e5:27c9 with SMTP id a640c23a62f3a-ade1a9c8039mr336406466b.44.1749222192643;
        Fri, 06 Jun 2025 08:03:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:02:58 +0100
Subject: [PATCH v2 02/17] regulator: dt-bindings: add s2mpg10-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
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

The S2MPG10 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIO interfaces.

It has 10 buck and 31 LDO rails. Several of these can either be
controlled via software or via external signals, e.g. input pins
connected to a main processor's GPIO pins.

Add documentation related to the regulator (buck & ldo) parts like
devicetree definitions, regulator naming patterns, and additional
properties.

S2MPG10 is typically used as the main-PMIC together with an S2MPG11
PMIC in a main/sub configuration, hence the datasheet and the binding
both suffix the rails with an 'm'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- drop | (literal style mark) from samsung,ext-control-gpios
  description
---
 .../regulator/samsung,s2mpg10-regulator.yaml       | 147 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 .../regulator/samsung,s2mpg10-regulator.h          |  48 +++++++
 3 files changed, 196 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..82f2b06205e9bdb15cf90b1e896fe52c335c52c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
@@ -0,0 +1,147 @@
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
+definitions:
+  s2mpg10-ext-control:
+    properties:
+      samsung,ext-control:
+        description: |
+          These rails can be controlled via one of several possible external
+          (hardware) signals. If so, this property configures the signal the PMIC
+          should monitor. For S2MPG10 rails where external control is possible other
+          than ldo20m, the following values generally corresponding to the
+          respective on-chip pin are valid:
+            - 0 # S2MPG10_PCTRLSEL_ON - always on
+            - 1 # S2MPG10_PCTRLSEL_PWREN - PWREN pin
+            - 2 # S2MPG10_PCTRLSEL_PWREN_TRG - PWREN_TRG bit in MIMICKING_CTRL
+            - 3 # S2MPG10_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
+            - 4 # S2MPG10_PCTRLSEL_PWREN_MIF_TRG - PWREN_MIF_TRG bit in MIMICKING_CTRL
+            - 5 # S2MPG10_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
+            - 6 # S2MPG10_PCTRLSEL_AP_ACTIVE_N_TRG - ~AP_ACTIVE_N_TRG bit in MIMICKING_CTRL
+            - 7 # S2MPG10_PCTRLSEL_CPUCL1_EN - CPUCL1_EN pin
+            - 8 # S2MPG10_PCTRLSEL_CPUCL1_EN2 - CPUCL1_EN & PWREN pins
+            - 9 # S2MPG10_PCTRLSEL_CPUCL2_EN - CPUCL2_EN pin
+            - 10 # S2MPG10_PCTRLSEL_CPUCL2_EN2 - CPUCL2_E2 & PWREN pins
+            - 11 # S2MPG10_PCTRLSEL_TPU_EN - TPU_EN pin
+            - 12 # S2MPG10_PCTRLSEL_TPU_EN2 - TPU_EN & ~AP_ACTIVE_N pins
+            - 13 # S2MPG10_PCTRLSEL_TCXO_ON - TCXO_ON pin
+            - 14 # S2MPG10_PCTRLSEL_TCXO_ON2 - TCXO_ON & ~AP_ACTIVE_N pins
+
+          For S2MPG10 ldo20m, the following values are valid
+            - 0 # S2MPG10_PCTRLSEL_LDO20M_ON - always on
+            - 1 # S2MPG10_PCTRLSEL_LDO20M_EN_SFR - VLDO20M_EN & LDO20M_SFR
+            - 2 # S2MPG10_PCTRLSEL_LDO20M_EN - VLDO20M_EN pin
+            - 3 # S2MPG10_PCTRLSEL_LDO20M_SFR - LDO20M_SFR in LDO_CTRL1 register
+            - 4 # S2MPG10_PCTRLSEL_LDO20M_OFF - disable
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 14
+
+      samsung,ext-control-gpios:
+        description:
+          For rails where external control is done via a GPIO, this optional
+          property describes the GPIO line used.
+
+        maxItems: 1
+
+    dependentRequired:
+      samsung,ext-control-gpios: [ "samsung,ext-control" ]
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
+    properties:
+      regulator-ramp-delay:
+        enum: [6250, 12500, 25000]
+        default: 6250
+
+    allOf:
+      - $ref: "#/definitions/s2mpg10-ext-control"
+
+  # 13 standard LDOs
+  "^ldo([12]|2[1-9]|3[0-1])m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+  # 14 LDOs with possible external control
+  "^ldo([3-9]|1[046-9]|20)m$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LDO regulator.
+
+    properties:
+      regulator-ramp-delay: false
+
+    allOf:
+      - $ref: "#/definitions/s2mpg10-ext-control"
+
+  # 4 LDOs with ramp support and possible external control
+  "^ldo1[1235]m$":
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
+      - $ref: "#/definitions/s2mpg10-ext-control"
+
+additionalProperties: false
+
+allOf:
+  - if:
+      anyOf:
+        - required: [buck8m]
+        - required: [buck9m]
+    then:
+      patternProperties:
+        "^buck[8-9]m$":
+          properties:
+            samsung,ext-control: false
+
+  - if:
+      required:
+        - ldo20m
+    then:
+      properties:
+        ldo20m:
+          properties:
+            samsung,ext-control:
+              maximum: 4
diff --git a/MAINTAINERS b/MAINTAINERS
index 1615a93528bdfffa421eb8cad259fecd1488fc51..3fc6bd0dd15a504c498e56d425731b5234dce63a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22006,6 +22006,7 @@ F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
+F:	include/dt-bindings/regulator/samsung,s2m*.h
 F:	include/linux/mfd/samsung/
 
 SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
diff --git a/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
new file mode 100644
index 0000000000000000000000000000000000000000..1d4e34a756efa46afeb9f018c3e8644ebc373b07
--- /dev/null
+++ b/include/dt-bindings/regulator/samsung,s2mpg10-regulator.h
@@ -0,0 +1,48 @@
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
+ * and generally correspond to the respecitve on-chip pins. The constants
+ * suffixed with _TRG enable control using the respective bits in the
+ * MIMICKING_CTRL register instead.
+ *
+ * S2MPG10 regulators supporting these are:
+ * - buck1m .. buck7m buck10m
+ * - ldo3m .. ldo19m
+ *
+ * ldo20m supports external control, but using a different set of control
+ * signals.
+ */
+#define S2MPG10_PCTRLSEL_ON               0x0 /* always on */
+#define S2MPG10_PCTRLSEL_PWREN            0x1 /* PWREN pin */
+#define S2MPG10_PCTRLSEL_PWREN_TRG        0x2 /* PWREN_TRG bit in MIMICKING_CTRL */
+#define S2MPG10_PCTRLSEL_PWREN_MIF        0x3 /* PWREN_MIF pin */
+#define S2MPG10_PCTRLSEL_PWREN_MIF_TRG    0x4 /* PWREN_MIF_TRG bit in MIMICKING_CTRL */
+#define S2MPG10_PCTRLSEL_AP_ACTIVE_N      0x5 /* ~AP_ACTIVE_N pin */
+#define S2MPG10_PCTRLSEL_AP_ACTIVE_N_TRG  0x6 /* ~AP_ACTIVE_N_TRG bit in MIMICKING_CTRL */
+#define S2MPG10_PCTRLSEL_CPUCL1_EN        0x7 /* CPUCL1_EN pin */
+#define S2MPG10_PCTRLSEL_CPUCL1_EN2       0x8 /* CPUCL1_EN & PWREN pins */
+#define S2MPG10_PCTRLSEL_CPUCL2_EN        0x9 /* CPUCL2_EN pin */
+#define S2MPG10_PCTRLSEL_CPUCL2_EN2       0xa /* CPUCL2_E2 & PWREN pins */
+#define S2MPG10_PCTRLSEL_TPU_EN           0xb /* TPU_EN pin */
+#define S2MPG10_PCTRLSEL_TPU_EN2          0xc /* TPU_EN & ~AP_ACTIVE_N pins */
+#define S2MPG10_PCTRLSEL_TCXO_ON          0xd /* TCXO_ON pin */
+#define S2MPG10_PCTRLSEL_TCXO_ON2         0xe /* TCXO_ON & ~AP_ACTIVE_N pins */
+
+#define S2MPG10_PCTRLSEL_LDO20M_ON        0x0 /* always on */
+#define S2MPG10_PCTRLSEL_LDO20M_EN_SFR    0x1 /* LDO20M_EN & LDO20M_SFR */
+#define S2MPG10_PCTRLSEL_LDO20M_EN        0x2 /* VLDO20M_EN pin */
+#define S2MPG10_PCTRLSEL_LDO20M_SFR       0x3 /* LDO20M_SFR bit in LDO_CTRL1 register */
+#define S2MPG10_PCTRLSEL_LDO20M_OFF       0x4 /* disable */
+
+#endif /* _DT_BINDINGS_REGULATOR_SAMSUNG_S2MPG10_H */

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


