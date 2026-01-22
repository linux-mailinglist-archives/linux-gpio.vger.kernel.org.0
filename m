Return-Path: <linux-gpio+bounces-30910-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FDSLT1LcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30910-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:07:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9116988C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5CE1308FABA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6313E44BCB4;
	Thu, 22 Jan 2026 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8JImzqo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB913EDAA4
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096622; cv=none; b=mGq31CvJgJS34PhEy0g9ieHqrDxuUftx+9ftqiEHciTNgTMkSi42pKbiNdz/13Hgl9uZWIi1dqjEEcQrrk0rRyhxdpiUtXQ9SY71DsZFt0LnU+jTCutpqZ9kRAUaJT4kWk/5sjnR+NlsomL2wAbJ9k3v4ep5c8wzX8RxSWE4trI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096622; c=relaxed/simple;
	bh=IdJM14bhYFkWf52LD0C9dJhppRDj3HdvF9dTSIO9ErA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEzo5rZqLyCCe33Q6YZHoxKalHcsVQ4h83gT6ZE/Fy+UHpEiDMfbNde5ZWj0/bPKBQoCR2ywV1H6Cc3kBVG/aXreLdhzUll2C2eefublaniGGpOduQ51tDxof25jjJdRLmFWjsBGQBwVIoJe/gB8sPq92wNOsq1oZJsLAWMIy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8JImzqo; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso1788741a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096615; x=1769701415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrxuZNdFKpOadQkL2KgXIOQYBGlhSnNKxvjwkbrXw4Y=;
        b=A8JImzqoCRJntw5xhk7mM4Pp47d0PuEgidzrK57zhOGuHeesr7yYspttWlnLGLHci8
         bpau0SeqaBIIGoxj+l3MAVr+hAGlY4duA2seXhzmpQ9Pnl7DwQtSora0oc6CI8tiAXNL
         owzUnW3IXyVlY4whhmbGa9CNh3eMiVG1kmriRcD7qAMtRhS/XO/cpc4Qd+8qsfZGK1R3
         OfGCCRX9dGUDf/f71Fn3cJ9S/lurGyF18QkFNYLfkoATOp/QNWfOY7rfvJN7emhM3XTu
         /w37RXo1zmp1sIoJAQXAHkeNlDStaXcQg2Y5DuVvmI/l8glzoVKH8sphxDgDDBCmlYAp
         fFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096615; x=1769701415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrxuZNdFKpOadQkL2KgXIOQYBGlhSnNKxvjwkbrXw4Y=;
        b=ZKdSJX1/UGIF0nFqRHbSEhBhBPITM8Y4w/EvNDt0soGUk/YvCzHrBG2YSA2hbXmiBE
         x1DKhyRVk41AJdjqF3FRxIfYz0BGVCuQZdrAG+sK2YtjnCUYA9g5cO7dm0IE6EgIMQWr
         qYq+Hv0fxEFr86kbMF1xa7r04Yex5Te+dY++YV7B8gt3XXoGnCApIsGmqd5rvo5WpRD0
         vfL47koSsy7wu93YV2jGGtrABbjFIRnoVG2L3E1IFko9mUEF6TH14UlRKcerMoE4Gm8W
         Dp2bwywLGYdWCrvu1HOpZHyUUY9MqEFQ8y9AC9qoAqYIHatCbrXSuq11nmmcveyqb3fH
         RXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbuqKTd8lAnogGR98BklVQg71/Vhk96GDUfL+M0QsEB/Y/wh2nlrBwA6ZqaeA+ShRToKSq7oh8nBVe@vger.kernel.org
X-Gm-Message-State: AOJu0YwSijtQDmj/H9Fo2LOSdThxlE89vVPRLGfE+MNouRYQ4VOvk98u
	fqBiFUEcmz5VO2PWpBmoF2fu7HBiu+5XCGM6onmj5F0C7J+2UW5hZnN89iidd9vQKi0=
X-Gm-Gg: AZuq6aL5HPgJQuyn61H2nORq+bPIml8PSvYimtBq12GSMGkF3U1Haak8zZgYpKl0KUz
	BhKozvV52LBU6HFMV9kyfRVclZFuqKfe0hUXm7lceFkXrI8g04DSyS+Wu+K98e8qicExnkTawTq
	gZoAIko7G2GuFpTlgiU9+/lD2CevcP/xyfIHEc+ojwuiBJCrvVq7enS9iHFLhS6SaY3hva4WybB
	q+eVETtvRWm6BtskK8a6/b5DhlLswr+b4YAuY+j9WL9WSXSn/wLjWYXpzD57IadAKiK/q5ZHyRg
	lX/sIzK72+MeE2fBqTnXxX2hRAUKOANKUwGhciiiDSGiKwQDWMjM/nbbCqU+sRWt3L0+/UqASOo
	AjwI4+uIA3XXNfOCpj9p0A/j0L5SsFEc3RKV1VSGN8GWJPDotS/uLASQDWhUtWWIR7+cFeAX0Ui
	TZWxuhQAX5ENijSctNOLQglxoEUDSTubjCxO2StU2PNw6txU5bMP1QQ/PjYJGivep9Ob/gLTdau
	bDnEA==
X-Received: by 2002:a05:6402:5252:b0:658:380a:e243 with SMTP id 4fb4d7f45d1cf-658487c675fmr18470a12.25.1769096615362;
        Thu, 22 Jan 2026 07:43:35 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:29 +0000
Subject: [PATCH v7 02/20] regulator: dt-bindings: add s2mpg10-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-2-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30910-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A9116988C
X-Rspamd-Action: no action

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
index 23bf05492d349b33f4d50dc8141e9179fcb72600..4d1a09eb3673e9237ad28153e61ce9384f5d9043 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23241,6 +23241,7 @@ F:	drivers/mfd/sec*.[ch]
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
2.52.0.457.g6b5491de43-goog


