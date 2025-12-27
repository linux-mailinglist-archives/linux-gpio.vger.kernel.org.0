Return-Path: <linux-gpio+bounces-29927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D56CDFA56
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E9EE3000B65
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A47732ED41;
	Sat, 27 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXiktJ+l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18932ED3F
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838274; cv=none; b=lpV4FXSylnmEtRZ/mlfu1z2dp90AtsWyVzsYeP1+yOtKC9xfgwalDezrJx7Oks9Z6rH/zI69V7y/7mHx85dDojSajNeV0prUqMZKra8pNubpmiOv/kDDegh2xID9KMHpuLsdZ/YDTwTm+hxtQT9JQEzkcht3hmciyk+FYh/gOKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838274; c=relaxed/simple;
	bh=Q0CedTDoxzAYvTyoSGG2JCu7m4Qn+Y6GBjY/RZepsts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqDRw3bapOyXcWFD0ibrNazH43c/3JvtF58mo21UY8rigpXSfqA6ZnWARGDQoI3zP5ppsjGzzJMyhEnJVGtqlDjdl4C4hrCfR3cxTQB/BwBQROd9YR2KODRVOnqmipw08k/ORO4bOMepe5tfyd887ZP5F72JZkaD5XCpsRuvZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXiktJ+l; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7277324054so1251370366b.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838270; x=1767443070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoAySoFSuOUGBXwBkj/tqOj8zEikF0/rK/x+6MrVKns=;
        b=XXiktJ+lCvjhbzo3SHLREtSuT1TMjnJ6SC5DTDmlXxrDFQFw7DapSpAmOKbqXOMp/B
         KVdJz6cltOVSUxMxLMiR0aEL8L1VCcC9OEyWArtzmS4JgsaEQBmQRskLRdCS7hkNq/Q7
         EKRLa791bfSHqfwg71+a5fBE2HbBmj2A/leKIoiBYvkoh8R9EG/tqivkluRZhNqoIyGS
         9d/zR9vqUGQID0GWTK9Xh15EF7dGhQMipw7Z6ktzWygvhMna0mSXWIsu2K3vCx4BAS/j
         CwNvkUfz//+oyuWtKDGn5d/HfXrwi15fKhp04DM5QR1APwJureRF9ZwaGSAJBKv6Tq9r
         HuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838270; x=1767443070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PoAySoFSuOUGBXwBkj/tqOj8zEikF0/rK/x+6MrVKns=;
        b=sQfJ8X66emtxc+/WYxx5UCNlZxIebR3xRwZQtxUxgMyxoNzsWRGwjYB8PUjGIan9hX
         nV8ukufqx1sGbf8slU3C3miDo5KHGdBdhY3Sk58P5FYnuQAhwnYX/j0QJWxTTwDn/q1+
         jJkyXeYH/izQOQT0JR7wR3l4XkzzDVHvX9fvAO6u6uq24RNWjLQRMk9olY6dnocPy4a3
         WgcncPkELxZbfnoiRjhy5E8A8uoTDarBjsfycLb8toIcQqO6K7fURjqi0YsUVjdPNlgI
         xeBrAfLMq3bw6vdQSokLVtZbShhlPrBtvvy6alkmaNb7kdfCRvt56CcYPpxtMK1FzIKO
         RBAg==
X-Forwarded-Encrypted: i=1; AJvYcCWsDkn9vzTHkJgCyB7CFLTwiChgJhLD5YzPFtQd4UKszxitaWUCnKuq8JDa87wGnr7Ldo8Ihah8ysxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw74nbVBHh5uGbfUMQ8wrRvaBG6nfEflJgschAcDkK5zhIcd9oD
	4tf+W+XTS6lL5450isP0W07vJLym6j9NMIe6SjJ9QdOGavrogIBgB8iGTTG8TtOwcOg=
X-Gm-Gg: AY/fxX5ecWf4m+gzA9yibzvGsEtdC2OidYjeLJBpV3bR+be1ZRTRIleXzm21rC0oM97
	XF2tMOZqYg6yk0iqcXE6XhmRB9hS2lTpKcYeN65QDLhJaYOL26luRSy+HZMOFp35ul+13Z9JgD0
	WqInGLvzx0ZnwLmZDwFtwwGh2PBNe29NXa+rX+plwXesnWpLTd78dnDdtwOhe+KY7Kfi9Qfe0DO
	ZIM3/IHgdkOPlXmZy0sxA9OpMYM1vnpIFEwca6nQsrdbGr8Qf3REd0qWY0PQpPHU5ek72tUGTjq
	WmwcYlSx4fuKGE2oQbOKR2xGwxE764b+k7aCZJOFA7hGMBCA/HkjaOMi4QPWgPsacJWhWrajv9Z
	KPmofElWXFBlvaM9bmw3fDrK5OsD8Uw91g8t4MZRiycZeQ1zkiU2O4Gp9rdl/rNfjTXCkacB5gj
	u+AqWYJHtN+Z++b5n0v+f2lUIPad3bvHMT7oZwOsbq0mBgLKcFmD8IGFrLwtzvcv1dEGNT80XvV
	LRLiQ==
X-Google-Smtp-Source: AGHT+IFwPaGUh7AedhbGKdobDVIl693E5xOS7bnu/0qiOYY00HsSelAVrn/J5vSA6RYOmzMZGsd4tg==
X-Received: by 2002:a17:907:3da8:b0:b7a:1be1:983 with SMTP id a640c23a62f3a-b80372699eemr2839825066b.63.1766838269649;
        Sat, 27 Dec 2025 04:24:29 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:26 +0000
Subject: [PATCH v5 04/21] dt-bindings: mfd: samsung,s2mps11: Split
 s2mpg10-pmic into separate file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-4-0c04b360b4c9@linaro.org>
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

The samsung,s2mpg10-pmic binding is going to acquire various additional
properties. To avoid making the common samsung,s2mps11 binding file too
complicated due to additional nesting, split s2mpg10 out into its own
file.

As a side-effect, the oneOf for the interrupts is not required anymore,
as the required: node is at the top-level now.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

v5:
- collect tags
- fix a typo in commit message complicateddue -> complicated due

v4:
- make yaml file name match compatible
- add example (Krzysztof)

v3:
- new patch (Krzysztof)
---
 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         | 69 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 29 +--------
 2 files changed, 70 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6475cd1d2d15e07d953c8b302c90c785835985e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mpg10-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG10 Power Management IC
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MPG family of Power
+  Management IC (PMIC).
+
+  The Samsung S2MPG10 is a Power Management IC for mobile applications with buck
+  converters, various LDOs, power meters, RTC, clock outputs, and additional
+  GPIO interfaces.
+
+properties:
+  compatible:
+    const: samsung,s2mpg10-pmic
+
+  clocks:
+    $ref: /schemas/clock/samsung,s2mps11.yaml
+    description:
+      Child node describing clock provider.
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulators.
+
+  system-power-controller: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        compatible = "samsung,s2mpg10-pmic";
+        interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pmic_int>;
+        system-power-controller;
+        wakeup-source;
+
+        clocks {
+            compatible = "samsung,s2mpg10-clk";
+            #clock-cells = <1>;
+            clock-output-names = "rtc32k_ap", "peri32k1", "peri32k2";
+        };
+
+        regulators {
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 31d544a9c05cad878d10a0ae9b99631f08eb04a8..ac5d0c149796b6a4034b5d4245bfa8be0433cfab 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,7 +20,6 @@ description: |
 properties:
   compatible:
     enum:
-      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -59,42 +58,16 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
-  system-power-controller: true
-
   wakeup-source: true
 
 required:
   - compatible
+  - reg
   - regulators
 
 additionalProperties: false
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: samsung,s2mpg10-pmic
-    then:
-      properties:
-        reg: false
-        samsung,s2mps11-acokb-ground: false
-        samsung,s2mps11-wrstbi-ground: false
-
-      # oneOf is required, because dtschema's fixups.py doesn't handle this
-      # nesting here. Its special treatment to allow either interrupt property
-      # when only one is specified in the binding works at the top level only.
-      oneOf:
-        - required: [interrupts]
-        - required: [interrupts-extended]
-
-    else:
-      properties:
-        system-power-controller: false
-
-      required:
-        - reg
-
   - if:
       properties:
         compatible:

-- 
2.52.0.351.gbe84eed79e-goog


