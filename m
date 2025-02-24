Return-Path: <linux-gpio+bounces-16479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7CDA41AED
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D772618967F1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52990250BF5;
	Mon, 24 Feb 2025 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mefa7rEM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47824E4B1
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392936; cv=none; b=ppXQOUvbThTa09gI82NU5DoFLXJy6mR0Pnce8rCj4iipuADucPfHOIBuDlGw3sW3ifIqmJVym1wi626FaYbC/clK5EAYtKwFrW6LIyDbf2NlJuPueNHxfFJR26/iORh6Zg6DSAtoegz7Dd3uim18brV6HEV8bVrYL6nmOV0x43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392936; c=relaxed/simple;
	bh=RfDmPlOAgquyAi9eWxA84ntLw1H8mX7TzxnK5gtEdTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpdFQdHFd6QM0KAe49VJJ81NrMochw24jpU0pAaY5H400ctzbwfZQeOy5Yg3k2KLPICmi7eiqyNeA9/Ye2BNZP6DWt7bRLqce+mBK2z5fnwJDS5+gCUBnwvc3ZL++JARS3ZtB3yhfKONgXUh4rjkLuSLT6H/2gIaRm5ODjvGEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mefa7rEM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so690828366b.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 02:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740392932; x=1740997732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0+1xTYqd6Ues9edEFg3QVRmfx7blQqw3yHw24nagIs=;
        b=Mefa7rEMRpe5z5E6Z5//5qOHgwmZtvbz8V5gs6gsBy1dTY91nKcy/FL/6lu+y292eG
         ZBZZKykyEdnw0uo69zOP0PpL5ebDHqNrcutQFYhENcl+Cb1yvJszgIn8h+/kLA1KN94m
         uEHjiunP5/o8KIpzKeBj9QHNif1fwxT3TBY7YAfXIK8/XlCYQfvbAyT2ntFLZGrj/KFB
         WZBw5j4DmD4pk88ffJVKO5zyLyru4GJTgzVzZyEnq2RIQK2+uToOQm3IgQirxsEu7jJ4
         TfRolz6wac65pzx2fqRXsMWwWLzbjkIaxebDGOg4MjiM6aGbfyGy3DpGiOtL8QVyP0Eg
         K6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740392932; x=1740997732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0+1xTYqd6Ues9edEFg3QVRmfx7blQqw3yHw24nagIs=;
        b=rumh8JdaTLTvmTO3IH6z5ovhsafxaV4adLmMVpp7y/8xvcbWmeAVcyN0RlIqieRMit
         mHWLTtC804skcHWrEXXXdWbZebV50gtqlvNPNo1DQBncFoysYkxO6mn5iWvtTtAWDfcu
         BNq/Pko+9xmWxmGLssoyReKjtqPVcLq3Hkceuewbgzi+w6UOiYzUOIzvZHxeki/HXtWC
         SzpCmvjh1G9Ow+Ix6DhGUusyjJR9vXXs3RTomqmGosSp8dpE7v2EvExmFxUYjL5yOPlx
         w62Ypeoq6aqgh9tIhFXmrGOQB7mBLS+xeuFOpCbmqJxZRPxwiEdftNPvXDU4IipP7nHD
         zTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJh4EzGlsfaa5HArEBmbtSyvvimXI3w2uMBgOdFrsJv5QTCgBy2vmZDJc4Zt+JOBRrXZVRoLzPzduV@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGCB7wWwOF68dbSW2jr5FHQoLdLejK23TXaVuNRASUjQS+XS8
	Z5Ts4Q+LQp/eIVdjYw7uQnj9J992kHXTMK7pB+eOBfSdUcdzFCqnH5rUGCsMWjU=
X-Gm-Gg: ASbGnctXLSimPznWBew70uXE27w/TwiCL8lxKAzNCABPmxQSPVSEpNDyYEcAzIE1srW
	RLQB/P8nSHsACVktnJlMvFkNSTDmBuemIZQMl6a4MYTF6zV1xoap6t6dtjU+23lyweQah4TYJDJ
	3ZcNQ+YfT2zuFn0irNs0+iTK3ctWlHfODIC7IOhFreBsVb/9aDIuryNktC9cYgZ25ICyhjgRach
	TnZGGLSB1Pp0bsCOrFrRpQAiZyU5hbQTFABdzi3Jzer/cUsI7pcQritz+k1lCwikVoTLayhP4ts
	znaJKUTRM9juvJfZmItDVslC44/7Pifx9YNhkshpKng7RPO5Lj8P/+cqTMg5RJU+ve0grQIzEgg
	wyJolNiipSQ==
X-Google-Smtp-Source: AGHT+IFTii9yMUKiP6DZuuLdEYvVA2bQTvO54PTHXzyTObw7JnjU+saEMwl9lGijNxfVg+uKK7EKNA==
X-Received: by 2002:a17:907:c0f:b0:aab:9430:40e9 with SMTP id a640c23a62f3a-abc09ab56bfmr1154111466b.32.1740392932169;
        Mon, 24 Feb 2025 02:28:52 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb186c5d5sm1349206666b.51.2025.02.24.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:28:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Feb 2025 10:28:49 +0000
Subject: [PATCH 1/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-max77759-mfd-v1-1-2bff36f9d055@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
In-Reply-To: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.1

Add device tree binding for the Maxim MAX77759 companion PMIC for USB
Type-C applications.

The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors,
USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes the core mfd device.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
new file mode 100644
index 000000000000..1efb841289fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/maxim,max77759.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 PMIC for USB Type-C applications
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This is a part of device tree bindings for the MAX77759 companion Power
+  Management IC for USB Type-C applications.
+
+  The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors, USB
+  Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
+
+properties:
+  compatible:
+    const: maxim,max77759
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio:
+    $ref: /schemas/gpio/maxim,max77759-gpio.yaml
+
+  reg:
+    maxItems: 1
+
+  pmic-nvmem:
+    $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
+
+required:
+  - compatible
+  - interrupts
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "maxim,max77759";
+            reg = <0x66>;
+            interrupts-extended = <&gpa8 3 IRQ_TYPE_LEVEL_LOW>;
+
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            gpio {
+                compatible = "maxim,max77759-gpio";
+
+                gpio-controller;
+                #gpio-cells = <2>;
+
+                interrupt-controller;
+                #interrupt-cells = <2>;
+            };
+
+            pmic-nvmem {
+                compatible = "maxim,max77759-nvmem";
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    reboot-mode@0 {
+                        reg = <0x0 0x4>;
+                    };
+
+                    boot-reason@4 {
+                        reg = <0x4 0x4>;
+                    };
+
+                    shutdown-user-flag@8 {
+                        reg = <0x8 0x1>;
+                    };
+
+                    rsoc@10 {
+                        reg = <0xa 0x2>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f076360ce3c6..f2c19a1b4c05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14322,6 +14322,12 @@ F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
 F:	drivers/mfd/max77714.c
 F:	include/linux/mfd/max77714.h
 
+MAXIM MAX77759 PMIC MFD DRIVER
+M:	André Draszik <andre.draszik@linaro.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
+
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.48.1.658.g4767266eb4-goog


