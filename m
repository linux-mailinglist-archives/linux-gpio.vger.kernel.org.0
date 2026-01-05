Return-Path: <linux-gpio+bounces-30121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CAFCF2967
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0063A3046FA8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E3332C328;
	Mon,  5 Jan 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCjSF9Cs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9732ABDC
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603708; cv=none; b=mnzfv65YANVehqnGqJgwiWN03sC9UmR189cwANKMg1ykWKpMuRhOlo2gcw8kszCCoUMaEX1KWXEuL4POFqBhTGsbKrM/oJpexCLqatmOXU/H4srMO/qZxpi8UQdQQLvU3paGVP4Gv7swPyClSdk4s0dpC8YKEliOHZ2yh8M66Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603708; c=relaxed/simple;
	bh=aubReYwjqANuwkLNLEVgfFzepyO8fT5RaOuCKS4xuyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjOUmozyeAPdFNj9epG4ic62FMYmBzVWX62vt71SNwfSu+b4UlqRKYuXYDkO82RqaJGUoIAWbYar+ssm4zjMq+MeUtbogWvS9fj+2+wAM0d0X+T4fOToNRCrzvzY6j0laFgxfcAZpvq01hf4RE5KIYvcjJLcfiw8+/ZRY3OMPic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCjSF9Cs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so20122480a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603704; x=1768208504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W1/4QyvrrrF6qZFn1ADTO8hKq/uJgt895DTkpi0Lzo=;
        b=yCjSF9CsppFCDSlhTit1XntcRS2VIfLQwiGjd2oLenlVwkBWRJl6EUPUFEuFgpAqb5
         S/ReMBl/lnd3juF8P0RFiGIAg4ZDKuW49t0nM5f71P2jisD1ZDXRW7rBtIrj1l+s1MpQ
         3kzhGTQh0rZrVT99GTLUpuidnQ63yFQ6tuqXyRyyqjD0EDsuU5ID7wE2sWIs/uQ4aCNa
         UEZIbwv7Vc0j8pg/kfwt3zU6bH/N3JyTAFeUwDcaT1KZ5erlt0ug31X+7lAcJRYpekKu
         H1j0JspPoOnHyoSvs4dVEHrJw4zgkEDq94qzE/GFiyPqyDgPSCeNSG4upfe2S1kiVQvw
         ubQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603704; x=1768208504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5W1/4QyvrrrF6qZFn1ADTO8hKq/uJgt895DTkpi0Lzo=;
        b=qRV+C/Pg64a7avbupEVqHq6eOXgz50j3i1f/mEDMArQkc7LKX2FzVy/WfWd7EzWl9o
         p6CsGC7K0huEOBqqSkGIt0IEtTANo+wAg9roJqrUKcV036VBeCSmKoDUwp9uyAFbOnMD
         4QP3QG0FiGyXjXxIAMNiBfBXrqy2hXCjnzxMzDeTBs2PgoJrWPzEkKHtw8DbGRIJaMKM
         GaL7OAIQh1wNraA+SALwDcrc9AvkTtZo0x0eUhG80MK91CWHKqDP7wp1VHzSNXYpxnu5
         G6+QpAipqcILhzYDVG1qkYeQPnFyYACRYh1KSQ8NcqsOgTvYYmVobprGpN7V3AnvQucx
         8lFw==
X-Forwarded-Encrypted: i=1; AJvYcCWJZWKQBRO/LCrkbvlsjmLplGDVcIV8+uaki9iImK4PWkxFrmo/Z+ko52CDyjIZy05snhIoj1eg0ea8@vger.kernel.org
X-Gm-Message-State: AOJu0YyPF0MYhPHIjCrrBy1lH8zTlxHBhFkXqI81OBWzbex6FKIv+x8Q
	bwjKupKV4MzUjQX3Gpqi6nTsS1clzXeWvG3gJSI1jI7TyxUCGqs9BhrBwIl7Sjq5E7k=
X-Gm-Gg: AY/fxX7OhN8DQbMEFnieMXqKlqBPD7wzBJ80lutBJB1yH9/JRbgg6lgygWrvNv8fpX9
	XoF/8mQxKF6OOKVMN1M4aCuz1i7CFBARvUw2RSw6pLgSDAoWRLYp7pFNIOC7A3CCtQdaJ3uDAZh
	AhPUznfk22/dQPwV4QIma/ALnvIzJXqg6MLrWtZKixXICafp1PLZW+useoI1E7X3prfLA27tTjV
	iKWmxTLY0hQSzPqNCIp9ulyCpWTe1GEf72govryFRqXshJvjhF8X2iL0ydxiB3ASpDLHQ9WBE9s
	xiM/+qIPYY/A2vT1ceDFZo8gntfUkTp6UhKtO6zNYHY/BcWN0Ev9LEXqQCQZ4qhHe/aDxo8gbOM
	1kwkfAYKT6u0Ov536ddGFTUpZB779ulLsIPJOQDNBirDMExVcLcX5Yorjt0bySFyRxGR8YJ5qSs
	DPTcgyepgE9iKxGrdCKmI3c3n0gkXjnPQpWX5oUEhPRcexoBsLxP/Py4tD+xJAfABf8OBpie4RJ
	wwu5w==
X-Google-Smtp-Source: AGHT+IHybXHHNMvOSBwJoAL1yd8LuSR2TLHTL8LaPWQ5jPyfAMZ3/vyTjIsZupiSCPkSLv6GAFSsvQ==
X-Received: by 2002:a17:906:6a19:b0:b7a:1be1:86e7 with SMTP id a640c23a62f3a-b80372287a8mr4738073466b.63.1767603703497;
        Mon, 05 Jan 2026 01:01:43 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:42 +0000
Subject: [PATCH v6 06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-6-80f4b6d1bf9d@linaro.org>
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

The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
supported by this binding, but still differs enough from it to justify
a separate binding.

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- Krzysztof:
  - move to new separate binding samsung,s2mpg11-pmic.yaml
  - add example

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
 .../bindings/mfd/samsung,s2mpg11-pmic.yaml         | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg11-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg11-pmic.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..62cedbbd9d8c4cb7e9dfc039c1c747e334903b20
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg11-pmic.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mpg11-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPG11 Power Management IC
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is part of the device tree bindings for the S2MPG11 Power Management IC
+  (PMIC).
+
+  The Samsung S2MPG11 is a Power Management IC for mobile applications with buck
+  converters, various LDOs, power meters, NTC thermistor inputs, and additional
+  GPIO interfaces and typically complements an S2MPG10 PMIC in a main/sub
+  configuration as the sub-PMIC.
+
+properties:
+  compatible:
+    const: samsung,s2mpg11-pmic
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    $ref: /schemas/regulator/samsung,s2mpg11-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+  wakeup-source: true
+
+patternProperties:
+  "^vinb(([1-9]|10)s|[abd])-supply$":
+    description:
+      Phandle to the power supply for each buck rail of this PMIC. There is a
+      1:1 mapping of numbered supply to rail, e.g. vinb1s-supply supplies
+      buck1s. The remaining mapping is as follows
+        vinba - bucka
+        vinbb - buck boost
+        vinbd - buckd
+
+  "^vinl[1-6]s-supply$":
+    description: |
+      Phandle to the power supply for one or multiple LDO rails of this PMIC.
+      The mapping of supply to rail(s) is as follows
+        vinl1s - ldo1s, ldo2s
+        vinl2s - ldo8s, ldo9s
+        vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
+        vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
+        vinl5s - ldo4s, ldo6s
+        vinl6s - ldo13s
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
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
+
+    pmic {
+        compatible = "samsung,s2mpg11-pmic";
+        interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pmic_int>;
+        wakeup-source;
+
+        vinl1s-supply = <&buck8m>;
+        vinl2s-supply = <&buck6s>;
+
+        regulators {
+            buckd {
+                regulator-name = "vcc_ufs";
+                regulator-ramp-delay = <6250>;
+                enable-gpios = <&gpp0 1 GPIO_ACTIVE_HIGH>;
+                samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+            };
+        };
+    };

-- 
2.52.0.351.gbe84eed79e-goog


