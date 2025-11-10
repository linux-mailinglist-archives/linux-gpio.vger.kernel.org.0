Return-Path: <linux-gpio+bounces-28306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A51C49051
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D9124E7E3F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E483375CF;
	Mon, 10 Nov 2025 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDRnxRzF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB633358AF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802946; cv=none; b=nUNKOHo3FvIJYn+5RKbkwzjXGaaeuUI2TK9+7dx//K8Jpl3P4jRwrzKv3ZI+ydVgbECxWbXjiS2MwcaldB/Qq6fYRBgz5qsMbdMIcwK6/StMj7UuuohCffF/ELrGw6eJ+pkZCog7a/4H131uIA6zSgmBC46TBZKTSajPwckWmRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802946; c=relaxed/simple;
	bh=5LoeQ3netC7v69zsj8B7NfdcCxJO3H35xRsDG/Gv7pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hY58fUo5aNEwKiuXsta+9sySEo5/m6f3Sn5yK6W2UaJOLwqCnOUbKo4ffVXkhAhS2JsCLfHMpjGAnBDNbDFh52VxZGP5lD2i8z69qxgCuS83+A5DOGCLwZQQo9hxRo3+RXRmjZkWQGgEzIagMWXLGMxUZ3dXl74u58nsALgb7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDRnxRzF; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so6257523a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802941; x=1763407741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRWk1kscfN6FJwekg6ouD0GTonEVhSc1K4PKrC1kP/k=;
        b=BDRnxRzF3Rtl0meUqoePs0npktSMKSkWx50RPuYm0F7cIbcZLKvg8P404fArOvx4rX
         6JwPp8hEHl/fZw7jaP6i1n1Fz89vMZ4aBKE9FRoeVj07cGwvZVjnUu41drBR1BavQHGH
         sJuZaWcGYVF7UPEZUB35MmpusiG44HbzKt7qierlq3V0/4Rh3LCQNFt//MCZrFYeh3Dt
         XONnlXiNjeGQulO3psMalrSrlv1qUkn2wIAsCo1abgqTd3CAKGiqo8D6ZbHx8tHXl/EN
         oKa4EN8UlZMhtpccwASGtg00MhTW28zH2LfDg+Tcy28kqcFehDY/Q5lspVYZdGDxpkSQ
         pcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802942; x=1763407742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IRWk1kscfN6FJwekg6ouD0GTonEVhSc1K4PKrC1kP/k=;
        b=G4FPtkAJXor0EF0/l2Eesnyea0Bj+0MfhA/y2TPPuWAox9dPcXjt0u+bRVhLKt6git
         qGOAtN49AvL76Pz7ogA8VCGpApJxb3TPRsUKqFOKzF0Sj67Bkky51LpbQs8RLc3s77j4
         n/rgnXUMLQC4sBTSthOcAZtn/wJbvCPgaDhZntnkbuCqwmwBcmUx829EdaQNem7gkLUU
         Ga2cEzLO26f5KqddRAi1DDeYaIvLuF6qY2rK1CWiTDokSQp/fySU16X6bZAD4eiKonC1
         eiBgCKTKOfX0JMvgmX40WemYKsYwbn1MDiO+fHKD1BeDMhRAcCS1e97vR47m+kALUKj9
         PtfA==
X-Forwarded-Encrypted: i=1; AJvYcCWbOlMdQQmZIixWOrqQBDRztrFe1kmwqL8lN6CCUJF3j0+mygEf6QakCXyONnRLwCVTmoc2FCW5+SN5@vger.kernel.org
X-Gm-Message-State: AOJu0YwBX37vLwH2+xEa+8qUx0mMuasVCdBfv6DwKePIoWtewZU43+o/
	rJGRzcHPiP0qJqMfCzbaavOSOdvhCG3QFOVqYrH3ri54tLVzubsS+tJLVCDzq7gHQZhP4z9L1xl
	RwLrvAT0=
X-Gm-Gg: ASbGncvb5dYQieGaZ8igGkJiKgnrqI89m6fHB9HUl4G/u99xsapxjADM8AmgWcnJNEs
	4QWwR2aLyNuaricjkRNuqjuVsXaS0Y9MY86Bbmx6okll1wTooFsDfUTxpuFXIzh+iygKoxjM5P6
	8304WWr1TQEwzDSobjscN55R7wCOFkDFuGMsfAvw4xHMZ/pvgXmN0FamXMZz32jb5qL9cwh/fRI
	nffBKc7yfcuMwDSfYUUq8MuErC77tR7XN8d9vWzJj/osHqtxPqs6N/I9ktEl6mBkMtXpa9jDeq0
	iYQnNJILmcO+sjHL4W9hCYop/RbC28J7BIZHebddK3b7T6LRoX3XFzjJyLCNW1jzt3K+EQ4ACjH
	GJ7RULLCoOYPNGUAzF91FtQ5ZjgLSnY8dXvziLP/xeDpWNINwOJGhP4Pe6NvUbKPwjVLv6B2Bke
	fX9Nt5ws8rBGykrBkhLoivqA+DZef6b5H+1T6HvJqs0mDhWA1ypT0SdXdBixym9zb0n31m98I=
X-Google-Smtp-Source: AGHT+IFMyrQxnmGV9RRdZq2J7DvBjCJJHTfrK8wDJvifJiEy4dLU58hNJxSP3QiQOzPK8F57Z0KQdg==
X-Received: by 2002:a17:906:6a19:b0:b72:9d56:ab52 with SMTP id a640c23a62f3a-b72e02d20c7mr927791866b.8.1762802941539;
        Mon, 10 Nov 2025 11:29:01 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:47 +0000
Subject: [PATCH v4 04/20] dt-bindings: mfd: samsung,s2mps11: Split
 s2mpg10-pmic into separate file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-4-94c9e726d4ba@linaro.org>
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

The samsung,s2mpg10-pmic binding is going to acquire various additional
properties. To avoid making the common samsung,s2mps11 binding file too
complicateddue to additional nesting, split s2mpg10 out into its own
file.

As a side-effect, the oneOf for the interrupts is not required anymore,
as the required: node is at the top-level now.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch suggests to update MAINTAINERS, but the new file is
covered already due to using a wildcard.

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
2.51.2.1041.gc1ab5b90ca-goog


