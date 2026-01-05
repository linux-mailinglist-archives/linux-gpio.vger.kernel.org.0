Return-Path: <linux-gpio+bounces-30120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF7CF2904
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1CFB030028AD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58A32BF5D;
	Mon,  5 Jan 2026 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxIckNs3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE832ABCF
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603707; cv=none; b=FsuiSe4F+4qUlZRBTX9ksF1VKPws4Y8OsnZCiI2SBFmn+xa+0+IZXV1lOKdmFxA6P8NbxPHhiR1j+aGcXwgQp1M59z2ZHmkdseCuFmixTvG+LyzPN9L5p09L1SRdQeOpwFUuku8/YF67UOdk21iocJ3AdZZ2/lTYhdylZr5CfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603707; c=relaxed/simple;
	bh=eUj+8YlOMKUNf5NBtFGcV3w0vZQRcRxLXSHd68Howms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzwI8v8gDWlEpyvLA9Ng73AAcdDp7gKaRd2oV8Ajv9qNCNBQNiXHtxu3yKjAGc1jVW1y+224k9Ym6i5bV3NJrgQvktWBuF8BKijzySJ+k8/vF8JaeJSkodVv6ziil/M4tM4bZBc8RH+AKXjRhwE+nNIGdComXNQO7b2sCrkkvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxIckNs3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so15511527a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603703; x=1768208503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNYCoocek2VrCaA3pJ1kEtxh2+5LCdMec/cid7tZc1Y=;
        b=kxIckNs3pcZk2QQHUAheYFAcP1DoI+NV0u7wLL2uwmqDBllGox4r9yrn9TrIpLTPtg
         zF0uQ8pUGuztmt7tdzAiTCcHMwLzZSOsL0W/ux/3IJxQj8FhGEw+4j5NCYkEtnWrgiw9
         YhV4yDF+ddWTNriUB10/LcePkP4gyBNqysSD9yDh68gqrluuT8mr/pEatoPbZORlKrGe
         EyPIxpzwnLgWF9oS0tVFwih4d9MtLQNu60o3jkjqIDCzMkACnkyfn1ayFSBvY4kfCe4j
         ET4SOztw0EO58UKRUkVl6EMN5+ih7TRIiioesoCJaWTo2k7qpxsMmN0mRMXOkYC6/BSJ
         aULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603703; x=1768208503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNYCoocek2VrCaA3pJ1kEtxh2+5LCdMec/cid7tZc1Y=;
        b=EAVpoS6WGM42f1+qL9x1CTICpP2lkJnC8IRBZdNHPpdptaqKCBwHTwlImeq/U71FWe
         GjMhSQu/UHCjcRJ4K0MlctVnT8GYGVk98WZvyeyRI0T1+bX6e3jvvUkZedmIViEpoeCJ
         tIhpKw/Z4Bj3i2R3I0KLT3oY6spaQEaKcEcfy9r9/+00EqBWxAvQttxANujZQKL6DWkJ
         ZE0L8vjCPMWlrBVnFWLkJwKPWvv6ih1L9np3GWth3EvMKwMTg0aUzhDGht4T7vEy5sdT
         RHOeGkJq292q6ksPWKY6YguA429KGQ9e56LcVbOMcHC3qiuV5pdsDCUFtU9TgLaBndAe
         DmmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYfFpw6WAdK8cquZz/yk1Hos0hJwDNpxqhMEapKkiVIgLX+G5+UAtlF351eiq2r1LMM3hZvxV7leM7@vger.kernel.org
X-Gm-Message-State: AOJu0YwsC+Cy9zSGKeNMeh130cX1FrGE34q8vBFVCqiwJpnMAuQboS9d
	opglTiNib9EnjzpQ87Vw2fTvJlSf52MyKyF+kuPb00m3TIS+m+TU+m5ja92Ua6yqL5I=
X-Gm-Gg: AY/fxX718VhzWvfhL0ZgtqGUnrP9g/AlpzyTPZUHQypWrovV4wyd61Aonv3jGu4uvIS
	rSIydrYEunh/ZJLH+vXLygfaYFQnctLFhXsDTIJtExUp1vGE7pt9FLzQN/n2YdcJ5zVAABNW4Zg
	zm6DwIvcV+cB2WCIZ+pmhszUiNu81l1i9MMgbLxCf4iDk4O0wlRPxHYzc5HCqCNRXKAY8mWdxxJ
	x0tAESZwNxRFa2v/g4HbqEvkoVYOHE+ixbwwC4KEXTo/9i1uygX7HMHaLjCEWwruvlSmvWiS+Ik
	8veAASH8TUbdZw/6DpCZwomU6CZtWeXJoRLpthhZ1t3PM73xhlQKCU0tLFGnoE3PA4B9QN1veHU
	IpAFLpttEGw+yHS5QKYHukUdr/fZ6AbPhV3lvHRZTvr3VNk+aq0EzrglCkjL7NPXhpSlaAWQJLC
	RrRIGMDrEvhQOgsHjgUVjl2mGpEBwuPiUM29sP/R5j+oGgV9HdTF6GZP7VyB5VcFFzLNr8x939X
	hh5bg==
X-Google-Smtp-Source: AGHT+IEMhCRz3n6iUPPLVom/XCfPxIRru78z7Q3ad65RUSf5g00tOnFRHp+Tss4eC3M+LwxuogmXvw==
X-Received: by 2002:a17:907:94c9:b0:b70:7cd8:9098 with SMTP id a640c23a62f3a-b8037288a09mr5164076866b.61.1767603702943;
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:41 +0000
Subject: [PATCH v6 05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to
 its regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-5-80f4b6d1bf9d@linaro.org>
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


