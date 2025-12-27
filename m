Return-Path: <linux-gpio+bounces-29926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1ECDFA3E
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5A4430076A3
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC7D32F75A;
	Sat, 27 Dec 2025 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+pYYOfx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489632E748
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838272; cv=none; b=IJoYGm5Ae5qiRkYgHEQt1+KOhc25APPvPG0/mIjwLOPHV/QIsmliQAaLR9GiIUT1fP3M/Ls+cPseUOz6eqwiT29/pv5BzHqvZXFVULfJnbg/cKAg5qOZtjJPIOwxY9qoWOt+2+2t2Z22d9E0P6MJd+frthbOuZFWOwB3elJ7MJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838272; c=relaxed/simple;
	bh=hCyU+UvoqAZ0y+DMEsx1d4h3jN+BwHub9jI2bDgl3kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBf8wBRK/6mHraln+4rOow07Tu0OYA+N42N86OucV/wKj6rEs2YkhaWwOssWpvygeNMdYL4v5+6v4JNCtGo8TP4afg+BVnB+dXKc6zMsSPttltLcTRsS93ePTvdLmjtgCt4OskDtCOAv4W7YgByLp+JrnAQD/pYNHpQPjAgu+xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+pYYOfx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso8881476a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838268; x=1767443068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYMpGHqEe3Pcj/Iu077fbSOBxW1M8Fmnn10jzmEF0+8=;
        b=n+pYYOfx+3BcnnYj0Lf/7kGYZV00r1T/M3g/Z/QUr2HwZsiLCNqQIVlqsqVyYyE912
         rSsMdwhWEzG8/Pb0BlmL3MyeXv1D8mk3Ij3Tb4pGi89Mw1mn0xzI4a5U5gGNcndi3SUk
         v5SkPWTJ7EeQcm12QJ3pMIVesUqC2kofwIk4PD6DM0vcFziSplEBdIYyAUKTrryElwGm
         CP6htp6P5i0WSOmsoYv60jJf6G6V9xSvntn47TStvRJ+4bkVIKVbppwwjq7YW04VQPob
         70O4CnjUYEKzVl0Soe3HbjA0gVYBCGltl5cYGlENOqhTcuedBHb1yS6ANXy8vA3cuPbW
         f6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838268; x=1767443068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYMpGHqEe3Pcj/Iu077fbSOBxW1M8Fmnn10jzmEF0+8=;
        b=LIieV/naVAhX/fsP+BeDQyQiYcsP0e2vt35IbM6X6UcCqhLSynJMQHcQUNcmNZAz6f
         +whsfyLcXyXM58SsZbtvIt3ovOhGbXqpzydFSrIFvdrCOCZrvxYjzh1C2rFypjhC8zer
         ADsapsHYO4wkY5z80PCM2hkZ1sfGaPOA+vXzUtD3Sg1mo7+jf9wEK68nkKp/E7eTfSFH
         mdzpn28yDAsHmC8nsO79TRgW0dRxcyODrDHkgHMUGF+tI9zk43r0qZC4FlCrkg4K/CEe
         Z0CK1ESdmLnNr9RMu7VMXzR9WAtP7431TufKSu46VaBSj7Zzm3vx2ZW5QG1JJ+MHhBuf
         nVzA==
X-Forwarded-Encrypted: i=1; AJvYcCXJTw89HUlibmM/KvzIThBOR5y+MvRp4WFRd7YOBjdCWQLMkIvXJiRgxm60ZnrAlhVSFOrqfjdccwIt@vger.kernel.org
X-Gm-Message-State: AOJu0YyXt6w6kHQk8aHn+h8ZN47mkSY1a0EoynDY/m3H+Q0e9odTRO84
	yRdfvhltb/dNCfDyCzto9cFg9h0k4N5WZo0f7P9uKX42LIMw/QDf79fVYfrvyfJd95A=
X-Gm-Gg: AY/fxX6zU9rEmk/JT6DmvdYE2NBf8niV6PeRSXcZk3U91HI4e97NbWQ3QEZN7PD3Hjs
	zDa/+L1tTwGkuN68rJJ1zGHXSYgBiTPxguUvngXsHKUHhnuBeYD4VCeytHc64L6mZFvm9zI6c3H
	3JfEXEWdhcQH9vXm08D64EC3/RnnRK4NonMAmYz5WXsWcXUtqiNyolQCIzl4XzlrazYoxeApaO7
	bN1A/X+Dmlw7jpszifpthjhZ4Ig82nvH1ufuTylYE/Ou5E565S63aDa/lRpakkIuNPgqYwNzDo4
	zWRo2ZWWWYImYj0Nf0POXv58yyBHv7yW0LOWrLc7aFD90lUHf1gr91R0h1TiJZ8uOmJS8wStk2i
	NpUjJmeGGQsx6BokW5niDU2jjyu4ElANOErZsjH6J8eLEK8soehaGca6QbPQa8KJlPGcreqMOFO
	G0e1cl9vu+pK7dbnLKuS26rKtJLNEJtRxEMUSW8viHKWnhbaB2ABqh6gO0g7bfaxMhhtW+oEcMB
	1rbNTmRKDUd/R7D
X-Google-Smtp-Source: AGHT+IFvyBuqAZVJcAozcjdd53m/LBVDlibKqGXngB5R5irvk0HKcI3nzx0//hHmWtl6MYgm4HdjHg==
X-Received: by 2002:a05:6402:2755:b0:64d:4894:774c with SMTP id 4fb4d7f45d1cf-64d48947a3emr18801127a12.7.1766838268423;
        Sat, 27 Dec 2025 04:24:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:25 +0000
Subject: [PATCH v5 03/21] regulator: dt-bindings: add s2mpg11-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-3-0c04b360b4c9@linaro.org>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.52.0.351.gbe84eed79e-goog


