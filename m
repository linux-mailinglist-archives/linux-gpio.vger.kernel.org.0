Return-Path: <linux-gpio+bounces-28046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42BC32FEE
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F0784EAFEA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B26F2FAC18;
	Tue,  4 Nov 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDkjBmC1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F20C2580D7
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762290034; cv=none; b=F/XlRADgjngyyh4eW0N6/ht5n0DTbrCqZexjkMg04g7eFErYdfgmF9hBeeZhlkwXq8sueLCT7N3l1xaTFJ0hZc6UehkLtxUlvz557zuurChM49jRNYL8QWp+JRh/sEE35AQJSeUZkqKNWZVExxHG7mttpifdw5CjJcCp07PdSco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762290034; c=relaxed/simple;
	bh=HGBTfOQBPwpsmExRchxi1+yUGYBmqmX1znyWWlQLGsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceF+DNv94b9Exj4aSZcXlzYMxATZcao6m1jrRyy7uClHJNeQymLngICqu487VKWV0ER1v7/lsWzbb2w5Rgzbv2LaG3IlfvlTy/9ahV+GoYG1lvpPXNtGmPRshWLemfiRjZRsJNoG0S/q9QFzQz62Q3/7oSf5UpEqztD6DcMs8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDkjBmC1; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640741cdda7so7796068a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Nov 2025 13:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762290031; x=1762894831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diMGLQMOH2QeJxZ+8+/p5Vax6ZB1kADxnRzyZWCkaKc=;
        b=eDkjBmC1l/l9p8/H504uum+4L2PO0JnfnBcaL935Q1yRHorjvKR02Oxzy3rSv9+zcy
         nXmXSp+Buynyv4/f/21X2/LzXJyOu45lLIlYRao4Dvu5SeAblMl2XSfAbVjgDjYTqhfn
         2inNBcOzOemmP9wDTWKXH90TNJg9e0yjbg5Onz1QlMz2AhdmbEOmpKPE3N7mUtWNoL1K
         THkwAuDtxqlNP5bUM6EJN5KLTTNSzD0LQVQG7TsJucaGFR5Lm2Q2UimiRDkg3Fcp9Xez
         3RhyNxmTzDtZ8d77kgoCMVg/5iD37A4TmapcY/yrn34ZBf0BnvIWhlLD3Mq+8YUo81gv
         5s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762290031; x=1762894831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diMGLQMOH2QeJxZ+8+/p5Vax6ZB1kADxnRzyZWCkaKc=;
        b=kKv/G26WkpyRqCqeprPARraACLqQ/gaKvuRyqUeqFMRb5ivOYvXfuJvVY/OR83q7W1
         c/1e3s6tvsjpKgsQx5DTTXrEQU2nClwemC9dLCC7CaEhN97pOHABl8urFTSBIKBx42/4
         EeEONkmvDvyuZY3X+c+99bjii7T4adCHR/kcdOjG+VdCFUgvf56Z02udJLcTwmkG9ODA
         xw823d4ygydM0YfpyjARABEpl3AkwpehPHvqwCe69Pt+n+qP5hiv5Z2xJr5Vl7nHkQb9
         dMfMX4QZ/9xtSXUsOHhuYvCvRWnr8jjd84LcXqWSj2penPWzN/XZDpqAwl1qUILlf77K
         ZJ6A==
X-Gm-Message-State: AOJu0YxdLDaVUz2MfcMpzRipcoXImvG07BTt8UQP6+Gjj5fkYQeqBOeZ
	PbSPpcQ46CvFQHypYbTKTSCg5fPAHwp3VuNKHzU2T8otD0nU+/rk+Aa+
X-Gm-Gg: ASbGncuyh+cL2pMYLZ8WY81+GFwkjH/JuELNPbBnI2v5ERa+op0Ad5pNRC3/Drn6FbT
	lglADTI9RhU7gNUMJVx07HTUDm0VRjmwyGQHJXgDWGvBbfij9+K8shS4zXjO8Zlh1f1SvBhk7Ei
	I35h1EqwaIxQ4nu1nSLFn8+diydxxvQ0v64g9IZfbuFpW6x3hXD4fYDoyDxA+QABmJceNuSd3Di
	iGOuDY8z6f4owHTz6ceuh8hI1UWqsFM8DmbIpLUZTyo8wMpvsm8J3R3eFvcwr6ruLLWFzu25a9j
	YirY1t+LFHg73nktcbfxKv7F6fEQaOkrhqey3vxQae267Uc0HDfdadJPGGfBpuRbfOJd7Riki0E
	k+KsYGL/N7voclyNIw/fqAlxtqa9QRtMGeltcPFt/TlYg8zlPVJ8Wm8BO9CoM35Tt/nSUdef79P
	Ttrsk=
X-Google-Smtp-Source: AGHT+IGe88tQlCXZ1detqx04tkzOyjNn+VPlSyky3nCcOGM0tLRYBgYcMOCqO7uFpOPlo7oKEg8VBg==
X-Received: by 2002:a05:6402:274b:b0:640:efad:cdf4 with SMTP id 4fb4d7f45d1cf-6410588ddd5mr577387a12.6.1762290030506;
        Tue, 04 Nov 2025 13:00:30 -0800 (PST)
Received: from builder.. ([2001:9e8:f13f:9116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a70b5bsm2990017a12.26.2025.11.04.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 13:00:30 -0800 (PST)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: gpio: add gpio-line-mux controller
Date: Tue,  4 Nov 2025 21:00:20 +0000
Message-ID: <20251104210021.247476-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251104210021.247476-1-jelonek.jonas@gmail.com>
References: <20251104210021.247476-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-schema for a gpio-line-mux controller which exposes virtual
GPIOs for a shared GPIO controlled by a multiplexer, e.g. a gpio-mux.

The gpio-line-mux controller is a gpio-controller, thus has mostly the
same semantics. However, it requires a mux-control to be specified upon
which it will operate.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 .../bindings/gpio/gpio-line-mux.yaml          | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
new file mode 100644
index 000000000000..fb91500fa10f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-line-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO line mux
+
+maintainers:
+  - Jonas Jelonek <jelonek.jonas@gmail.com>
+
+description: |
+  A GPIO controller to provide virtual GPIOs for a 1-to-many input-only mapping
+  backed by a single shared GPIO and a multiplexer. A simple illustrated
+  example is
+
+            +----- A
+    IN     /
+    <-----o------- B
+        / |\
+        | | +----- C
+        | |  \
+        | |   +--- D
+        | |
+       M1 M0
+
+    MUX CONTROL
+
+     M1 M0   IN
+      0  0   A
+      0  1   B
+      1  0   C
+      1  1   D
+
+  This can be used in case a real GPIO is connected to multiple inputs and
+  controlled by a multiplexer, and another subsystem/driver does not work
+  directly with the multiplexer subsystem.
+
+properties:
+  compatible:
+    const: gpio-line-mux
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-mux-states:
+    description: Mux states corresponding to the virtual GPIOs.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  gpio-line-names: true
+
+  mux-controls:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description:
+      Phandle to the multiplexer to control access to the GPIOs.
+
+  ngpios: false
+
+  shared-gpios:
+    maxItems: 1
+    description:
+      GPIO which is the '1' in 1-to-many and is shared by the virtual GPIOs
+      and controlled via the mux.
+
+required:
+  - compatible
+  - gpio-controller
+  - gpio-line-mux-states
+  - mux-controls
+  - shared-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/mux/mux.h>
+
+    sfp_gpio_mux: mux-controller-1 {
+        compatible = "gpio-mux";
+        mux-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>,
+                    <&gpio0 1 GPIO_ACTIVE_HIGH>;
+        #mux-control-cells = <0>;
+        idle-state = <MUX_IDLE_AS_IS>;
+    };
+
+    sfp1_gpio: sfp-gpio-1 {
+        compatible = "gpio-line-mux";
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        mux-controls = <&sfp_gpio_mux>;
+        shared-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+
+        gpio-line-names = "SFP1_LOS", "SFP1_MOD_ABS", "SFP1_TX_FAULT";
+        gpio-line-mux-states = <0>, <1>, <3>;
+    };
+
+    sfp1: sfp-p1 {
+        compatible = "sff,sfp";
+
+        i2c-bus = <&sfp1_i2c>;
+        los-gpios = <&sfp1_gpio 0 GPIO_ACTIVE_HIGH>;
+        mod-def0-gpios = <&sfp1_gpio 1 GPIO_ACTIVE_LOW>;
+        tx-fault-gpios = <&sfp1_gpio 2 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.48.1


