Return-Path: <linux-gpio+bounces-29928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A6CDFA71
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FB0A301459A
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAEE330305;
	Sat, 27 Dec 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7HXxYxt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1D32ED48
	for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838275; cv=none; b=goxJLf0Un3sTz2Z7HYpTcMVJMeA+V3YhudbPTkpJR99GkE8k7bzt06h/2qG38U3k5gAnxzOlocEFy6aI7l+z8DUkQcR8rBcR6YolRtcNOm+Z53GA6xVmj5ds2wRJQwDWTOCxcpDg4NsIgWBH3cnY7d0hVjdUxqicaxBqNiUX6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838275; c=relaxed/simple;
	bh=eUj+8YlOMKUNf5NBtFGcV3w0vZQRcRxLXSHd68Howms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gg5RBJnZMBY7PBXhwx/Re7XNRaum9kqOoTrO9kGuMPufu9OfiOnGYmWAf2+W25CgPMjtCB2Bzu9r9+2uyTCpp0/DNOYkkzhisZhaMjlU3EU9uLxDZzPNpyFeV20Z478+ChxFjgwAhRf/+Om91sYQ0skcsfIHY5yUsLs/DYYkbaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7HXxYxt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso13190152a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2025 04:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838270; x=1767443070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNYCoocek2VrCaA3pJ1kEtxh2+5LCdMec/cid7tZc1Y=;
        b=s7HXxYxtHm7QKhtecTjJOzXWTEcTulQLkQBBziOHCliTsUgApqwMWr19cE1Pio6HvS
         3b9M0QEe8a5AgTiOa/15RN5Dzu8qcWkCmzHlnLf1hzACz0ESHBrp6UEonKk2+15Rraal
         UZbiuNieRIzEKEfrFZcNu/xy+geeLC3vsuCz9FKt4FOIr3BXY7E4F4Vveb725WsANVRz
         xco/e2Ks5lM2/9gKz7U3ceoA2ZBaJqDiBR1jVDeswmk1Whi4kL18jKIioEkSB4NtuKIY
         QHNTvwgVLA/1jD/SCzD5GJSyEWRGLGmVFIvv289OfOtnaS0mUS4RcwXcwkCyeoyKxI2F
         SEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838270; x=1767443070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNYCoocek2VrCaA3pJ1kEtxh2+5LCdMec/cid7tZc1Y=;
        b=g50f47u7V1auIw2vpf90egBWZvTk6Qz5+3N+nl1HUXn66QHFrbDSrkg694Fcw30QVw
         z5HO7h+eCLS+dp1cPII0IosIwUqQAAZl56OL//RzPn9Nq/j4B2HG/qoo7iYf066fTTQK
         xNFu4kA2xld3cnNPCx1LRcEVvPh50RytAtKH7qHdw1dNj5WId9S/GxFTGCzo7AQqYgo0
         6Vtn9y1InTzkEc7CzdeuwWPbSvw0lQTp0RxFxP5FTvpFrRy748EPGiJZJoceWDB3MtKV
         66HECTOFbZRanmVBwqDvZ31WAOzawddE4HNHTc7MXqv0P5k1rQbI9sGaL7oloQN99Jns
         RLzw==
X-Forwarded-Encrypted: i=1; AJvYcCX6IBvxWTMdUeRrKCHw0I2nFpwjrNF3H/vO/Dw0jtTnoBDXBwz6Bv3eKNkFgYCghEOv5G7ldz3BGTgv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+cm4jtlVL8C8oCFwyBJ7wVv2BgySY2/7d4H3yueoJgLFoIc8r
	8atMzt2Tcc+wRQsmMX087kLNkOgbqoLvfgU4zcn92BOO+dvJ78UXupStcBXfBbyqx6s=
X-Gm-Gg: AY/fxX6uhJvaIyQ+3fQYI3E6TmAkHvetn6MjNbVOEwz8z9NYIyD2x8gxJmIOIMIWVDu
	jIA8OFnLhC2r5hDxGjotswLB1z+8431H46ZPbCws4CIPKk6CDGlgeRkfzCD4zKGUbZUYIb0loOr
	BgO4fmFWQlNC4PVPboC1mAppD5z8kCp3QJUAnBWXCJmnvjY+cs7aRPGLGVV8ZKJZXu56nHoqHo0
	WfrL4oT+4ABfTFXdLwet7VPMjRNEw3BQ2sNg6Q7UcL5M6IPHqxDmEsYNZGLlpE4kBwAgHHvnXm1
	8iCgm0WvhkkSj4bM0aOYtjBq6YfnGwJfVaqNGjTNbGSHEwieWcAkowOc8Vj07AacxMmmUY+/Nl1
	tTVNCkMG0MPmRBpPvkqgaNepMak9WDMRedbc1iTVHnvJdJNO9tkX180TfL8rrf4R7SjCYloB5+H
	UamB7MXKhkvIMrwAsIvaR8zNUwt7FK+AGs4jFRQrMxPuh5FbW4Gq4j7RHQj94nHsMw70+DKezJl
	sEKqA==
X-Google-Smtp-Source: AGHT+IHdzwZJtexRIcWn/+xe4M9EI9DTqd9NWIK8B+RdKJRz9/fkaZ7FEbohni14WsyusLd1OU/7tA==
X-Received: by 2002:a05:6402:3550:b0:64b:5885:87d6 with SMTP id 4fb4d7f45d1cf-64b8eca9ba6mr21097989a12.24.1766838270141;
        Sat, 27 Dec 2025 04:24:30 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:29 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:27 +0000
Subject: [PATCH v5 05/21] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to
 its regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-5-0c04b360b4c9@linaro.org>
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

Update the regulators node to link to the correct and expected
samsung,s2mpg10-regulators binding, in order to describe the regulators
available on this PMIC.

Additionally, describe the supply inputs of the regulator rails, with
the supply names matching the datasheet.

While at it, update the description and example slightly.

Note: S2MPG10 is typically used as the main-PMIC together with an
S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 'm'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v4:
- separate bindings for s2mpg10-pmic and s2mpg11-pmic (Krzysztof)

v3:
- move to new samsung,s2mpg10.yaml file
- move all patternProperties to top-level
---
 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         | 57 ++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
index 6475cd1d2d15e07d953c8b302c90c785835985e5..0ea1a440b983a47a55fc86d6251b89056ba51172 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
@@ -10,12 +10,13 @@ maintainers:
   - André Draszik <andre.draszik@linaro.org>
 
 description: |
-  This is part of the device tree bindings for the S2MPG family of Power
-  Management IC (PMIC).
+  This is part of the device tree bindings for the S2MPG10 Power Management IC
+  (PMIC).
 
   The Samsung S2MPG10 is a Power Management IC for mobile applications with buck
   converters, various LDOs, power meters, RTC, clock outputs, and additional
-  GPIO interfaces.
+  GPIO interfaces and is typically complemented by S2MPG10 PMIC in a main/sub
+  configuration as the main PMIC.
 
 properties:
   compatible:
@@ -31,6 +32,7 @@ properties:
 
   regulators:
     type: object
+    $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
     description:
       List of child nodes that specify the regulators.
 
@@ -38,6 +40,32 @@ properties:
 
   wakeup-source: true
 
+patternProperties:
+  "^vinb([1-9]|10)m-supply$":
+    description:
+      Phandle to the power supply for each buck rail of this PMIC. There is a
+      1:1 mapping of supply to rail, e.g. vinb1m-supply supplies buck1m.
+
+  "^vinl([1-9]|1[0-5])m-supply$":
+    description: |
+      Phandle to the power supply for one or multiple LDO rails of this PMIC.
+      The mapping of supply to rail(s) is as follows:
+        vinl1m - ldo13m
+        vinl2m - ldo15m
+        vinl3m - ldo1m, ldo5m, ldo7m
+        vinl4m - ldo3m, ldo8m
+        vinl5m - ldo16m
+        vinl6m - ldo17m
+        vinl7m - ldo6m, ldo11m, ldo24m, ldo28m
+        vinl8m - ldo12m
+        vinl9m - ldo2m, ldo4m
+        vinl10m - ldo9m, ldo14m, ldo18m, 19m, ldo20m, ldo25m
+        vinl11m - ldo23m, ldo31m
+        vinl12m - ldo29m
+        vinl13m - ldo30m
+        vinl14m - ldo21m
+        vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
+
 required:
   - compatible
   - interrupts
@@ -49,6 +77,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 
     pmic {
         compatible = "samsung,s2mpg10-pmic";
@@ -58,6 +87,8 @@ examples:
         system-power-controller;
         wakeup-source;
 
+        vinl3m-supply = <&buck8m>;
+
         clocks {
             compatible = "samsung,s2mpg10-clk";
             #clock-cells = <1>;
@@ -65,5 +96,25 @@ examples:
         };
 
         regulators {
+            buck8m {
+                regulator-name = "vdd_mif";
+                regulator-min-microvolt = <450000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-ramp-delay = <6250>;
+            };
+
+            ldo1m {
+                regulator-name = "vdd_ldo1";
+                regulator-min-microvolt = <700000>;
+                regulator-max-microvolt = <1300000>;
+            };
+
+            ldo20m {
+                regulator-name = "vdd_dmics";
+                regulator-min-microvolt = <700000>;
+                regulator-max-microvolt = <1300000>;
+                regulator-always-on;
+                samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN2>;
+            };
         };
     };

-- 
2.52.0.351.gbe84eed79e-goog


