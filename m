Return-Path: <linux-gpio+bounces-30119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7C6CF2958
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68CB4303EB93
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52ACA32BF25;
	Mon,  5 Jan 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MgTfXMRQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC321CFFA
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603707; cv=none; b=q/x/Un0dFGoYFnYCPRgnrl0+6mYVBe5qWNYUR7lUtLxbPDlXKc+QClMsNRAEC3B/l+JjlpOJr0YwBxtdk3Mx4Qf/wI9he8TxCNTXRAow2S3GjtrHJrSs1VE9RR+nR7MfybKYOSOZrexsXx3VOqaq/uR8REZ3lyPi6mEGEx56YLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603707; c=relaxed/simple;
	bh=Q0CedTDoxzAYvTyoSGG2JCu7m4Qn+Y6GBjY/RZepsts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifCbQ+iaGwZauyQXzHnIx9JM5r8iuTPMi4XmueL/0uv9fgVYP8i4YA94Ej9nEMHG1IdrNtjuuesrvCg8SrtOToH7NoneCSeZT/DaOST9VJQG+JATgb+dhQiqSr0QFoRaGfYVnbma2RyGiJJPwWgVNZZwjtbSwBIo0Gcs18YdQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MgTfXMRQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so16461526a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603702; x=1768208502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoAySoFSuOUGBXwBkj/tqOj8zEikF0/rK/x+6MrVKns=;
        b=MgTfXMRQb7z4QC8fF8udBaOyALbslF4vq3V0KGigPvYaJrUQ3OhKu5kBDco5aBzwwC
         ymu94mand20FlHJ9pp5edUAEN98L+DpWUpqHXdbhZ5TghFqeFbtfTgVmElTL1stqiWLa
         RHk/11l44ntf7rPulGzwUNljBFfPo6+rsAo6FY+RiMIrQolqKZwSphAiLu5TyFN8b0+m
         BPZj94wC6aFlKHFmQKf0FzRr+dT5Cgc2GtKPCcfZnLJzdh2MJs2rBDYX3cGP+QrBGKSq
         EulDZpUIf3Qb2DpkYMCdcucw7kXb+r1RGSnSnk5v3lTwbfMu4oovrEOBiyab4NpD7tx1
         FRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603702; x=1768208502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PoAySoFSuOUGBXwBkj/tqOj8zEikF0/rK/x+6MrVKns=;
        b=fMZ9ISEBN1GdIoLHhjeTkrtuuKVtP/jO9LvrZNIDI5OckrvcJLHgkYRkohBq0+u+HX
         Ll6PQwUpi3nqF6VHBt+I9O68dOOu5NRAxmbTjfNR2MdEOXclCvpGUqLqaZFtGXLpqBFC
         FWHGtInjTcdr8dpnkMa9OlDnWFpXhSIlvD3vj2dkU6I2QAH0vN5VOMlRMZc+Y56ePHZG
         OXLfnCnmI+WJDdoz1bMorkR3X10P4U+exi7MgmIwKF1Uwaave4a2YVlkVpMLpoo0+1f8
         f32Q7oWY1HcYt0wlcNJw8E+Nt+B0NYR+MAFvwnbSq2E9qj/gn8/dkCTyIpybvD93XUrh
         aCaw==
X-Forwarded-Encrypted: i=1; AJvYcCXKijmErXnmm5vbLIkuPRAZWy42M+qomfdojbZ3JZwW8keITteLEyfpuvzrNUqpgFa3OoNNeXxSIdfN@vger.kernel.org
X-Gm-Message-State: AOJu0YxnjyLah14FwmMBcp6pRkBZAn77NYdna3UNO+Vl+ktuj1EnhXFd
	0k7+X2EsWxIgllkpsKJ2UzxzKFfFyuogdLafnERdrLuXXnwQwrG1Wwly6hY6B3Yva/Q=
X-Gm-Gg: AY/fxX5G82V5D+90xduy3Kfy4aJwH31Zc/xLHPrhEoUUYom1PMeZI9EBqzPPp695Bjo
	vSsFc+XjuKwu2cf5jf7b5Bl+OLDtc/tvYbzqgxjPoazcLRUcRoNBtkPxtVkrhcyCyL6l8n4ZSyM
	pe8x6/ujBD4zb8MD8hpMIta96PlxrwVn6S3LphfpfF/X1i1STd3VAntqiqMijVPQj7pAF5KZi/9
	51Umfe/COC4IJtXDzZI6QrPEUL1EBH6erwo3bMKY04kuypUphr7SgY47qnwBp0PSjZIsVUwopjp
	In+1Qc1SNb1HEqdcTaSIaxL7KlN6jbT7ncLeNgHUif+KJst+dXbLi359qih7fstHYUbJayiJgZn
	B0EPbvSBMNqj1DDBRwlYCdtBZETFu8oBIv4NrBiqlK43qdxa/EHp2BVfezAW6GV5S9XGnPzbQm6
	xDAulGvsGvrXkAQ6zunQFZ9SMkGP75T12RHb8+XkIgp7KzaiQmJrdrGAH8MBahGl0SzTmoAOeF1
	HkfmA==
X-Google-Smtp-Source: AGHT+IHLNZp+Jq1jsa53Bnqvt7GnC4A/Xve6KIieFsmmoiEgzeIhn3tFkD2eHD+IaKS3ZUoDDcDeqA==
X-Received: by 2002:a17:907:5c2:b0:b73:572d:3aff with SMTP id a640c23a62f3a-b80371533ecmr4767140866b.35.1767603702389;
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:40 +0000
Subject: [PATCH v6 04/20] dt-bindings: mfd: samsung,s2mps11: Split
 s2mpg10-pmic into separate file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-4-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
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


