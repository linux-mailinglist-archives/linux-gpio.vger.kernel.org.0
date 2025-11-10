Return-Path: <linux-gpio+bounces-28310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63657C4906E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 20:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46F914EB6B0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 19:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7D83396E0;
	Mon, 10 Nov 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAyJc5Jq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697DE2FC011
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 19:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802948; cv=none; b=Jfb1+o/4bOKuOMZm54RciwRpYggjcItYwinqilKim+APv2cGKNCmANu2r4gWoO1eGevkLOIhDJ0kmAhYyjpHOG291gqqW33auVD+YWHs7WfYCcI22B77bMplfZ2BkDTbhdMFSNQpkhziXNPxK5+vk9bFyd83ePASIkhIbRsYcpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802948; c=relaxed/simple;
	bh=tg0hD3bAsokB+sNMkDp5zswpWKbl3nvQ7gPQzb6+rJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EgyQ5g49nftxJN61Rd3bDsypB1HMOoIipKdQ0Lf4rgJJvGC1N7Spmp6hNSp9DCFterPFVZFh95am902CEXcTl47kN3k04/HiyHFAaxBqMYJMGdBeYEHFHKYUmtotbn+Hdl/iwiwZWz8cQmc8tpKJXkFYZ0Pj/ocv02mkhiYVOQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kAyJc5Jq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b713c7096f9so495407266b.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802943; x=1763407743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSZz9jWuIHisRe8wOS8N84JguuB1ECjaPpku1rLPAeE=;
        b=kAyJc5JqGGwD2QVjoBUT1nEZXaei+kmyrrpA4TqIw8xXZLe+DEX9s4k58DZTpoX460
         yfQCNR6XxvIjZ7NGczisyWde9wcjpT5TkV5IQDiA+Mmw7C4JnNraR3pg6lS2Ct/szyWv
         FIDOa6Vt7sQ6O4NqfXeDC2jsp1FvBeYUv4wJ+Zd49NLCgPEG6O3xH2vWUw1GrKGyzmzV
         L4ObZjZgVCld4BrYmG6k94XvX9SOoYEUYmrCQQPBeriCR9s6s9v0LfgbzRBHwDkiylRH
         +gR9jivYs5F0uS4jGSy30+Nm65r0IRIFmdShLICPuGWuK60tJgdXV5hKMisUpKaC1yY8
         s7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802943; x=1763407743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSZz9jWuIHisRe8wOS8N84JguuB1ECjaPpku1rLPAeE=;
        b=tCXgn2t02l8PO+cqr0s6gARHL4cif2c9v9dB8Atg4w/l0LGQ4t1gIizeGnSgxSPjlJ
         ngTGG/iCPmysmVoIog8Io9hvJbrzA6NG2w1lELc0HQN0a9MaJyVYvWs+zbdryyQB74ZW
         Olue/MeW4EET3WQEiHVAqj6noHm9pPVsFmrJtc4CxL4ZExXohIdGVof9M9qGOFByzZaB
         CmY908bCNPcAePPtjDwgMEGhUKXAE5f9Lqqj7Gsfla81+fjJhMtUo7lUBTq9amHXPTNl
         2qABxjebx1nmTG07qK0ulJm7Kh3cIJs5rvqc75U86eT5ZYbQwW7LXUQp2qTaTXvMki1R
         3S2g==
X-Forwarded-Encrypted: i=1; AJvYcCV/RtBme6S4GRrfVoD+ciRixvMLt4P+l21NlmQ0K4mXtDadz2HBB+UzLcQB4mRnQeZB8eHnSsG4cnRz@vger.kernel.org
X-Gm-Message-State: AOJu0YwzbYWtKfK4MxEgHqPKoGeLlwXvwhX9EHod9LdlZU3FD6KKED6e
	XFIhyJNsEEPz8pOpRCHErlccb/qZnifKrSRav+4ruCokyQyiIip+x7I7ZSNbnRM9zoBt788Nbs+
	Z3aNiuIw=
X-Gm-Gg: ASbGncuOhXsV/CGQg535kM7Vfs7sdiMc0zQKoTwmjsDE9jdL5IDrEuCEBr/YGJ0zan/
	wao1ynuak9p2qNZdhwiLjU4XNPVg17otPcLHlpJmwUMpVPNeAZLJXQ8JH0rSGe/J2kQ8swPkx8y
	n7VPkSJXS0tkoK5Hrqjm/9nMyafBffPgmTbh/uXxCsbZB7ekoQb+/Oiu10cmJFy/6fU1L6vFYw9
	yAkKuZ7lC0cohJOUfiHVll/5so8lEEf9qMN6FgjlpQUpwr14hTmIgh44zmL4p/6Gjl24WyF5tib
	QUFW15qEVPDVxBspxF2UiM0iXdL63aCR0DaGEMqEPNXfkUs4/Ezez3iDb0yN35SdZEojbViz5Jm
	WWHG0FMmwJAvHiRnKEqsF5gKPEqDQjnFU+LhApTejCKkSdk7o8SZHdPvkGNKsKNPqRxMU0/ctkM
	GhYWpWMCa95+/vt7RO+VTCWHRdlT9KLZ4GvpkUrDzeeRLRJYiVP8z5DPVl+jJ6
X-Google-Smtp-Source: AGHT+IFp4Nb0Sqv+lUeapxXU50UZ70IvOd7/8OXWBTaTDcVRGEo2OioMu2sexdsxPqumNEOUbAc0JQ==
X-Received: by 2002:a17:907:7206:b0:b6d:4fe5:ead8 with SMTP id a640c23a62f3a-b72e037b177mr1015877866b.25.1762802942524;
        Mon, 10 Nov 2025 11:29:02 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:02 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:49 +0000
Subject: [PATCH v4 06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-6-94c9e726d4ba@linaro.org>
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
2.51.2.1041.gc1ab5b90ca-goog


