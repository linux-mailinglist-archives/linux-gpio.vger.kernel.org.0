Return-Path: <linux-gpio+bounces-19400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFB3A9EF42
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 13:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CF3C17DF12
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 11:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A987426280A;
	Mon, 28 Apr 2025 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ot1E999+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED426772E
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840174; cv=none; b=IxVel34EnhzGmH0CiwXub23OGHbJzop1dzo57XjXXhpmfOba1tS5/JLpKho18Dnu5BhoEjE5PoNR8ekxOyOLTFcxeq2bIkJ+Z7z2vNDs9HVRSxD7SLPBBLLktH76GaqKffGydtMM7EOd/+bhiCacQPC01F6hmLthFMUuhDBgQY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840174; c=relaxed/simple;
	bh=czCaHwjdEKe3NKt0rJIH+1zUCm2b7l284FqXlB+S5Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DD3IyrgHAIatEJw5trIGXbaxKNJ7qkFsaNS5GaoVI2XABATBDXnRaKwc2mXRxwmywQERJnz5AHfFbWQzjz/oCq8X05KKXryFXT+9cBy2VvUfml/s2Sjpa8cWf/rvd84P23GUvc2m9wP9v8EOr1EgNa4sLWFtczthS9vKN9B6vhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ot1E999+; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so8612462a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745840169; x=1746444969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VxOVJp6hEBHMDCosFs6ZILrioIDtRgANEDqPaH5GyA=;
        b=ot1E999+n4zAfsnQhrEexGU6YI6Ag7M+zN6Y05AXOIbClgut8fGFMmjly6tHZWZLe4
         cotflAjRhvOMEjzGezg8VP0loOue2T+fw+zJBHc8llq+4Y3Yd1uks/UAt6VHI4vcxqkI
         jRDT4La8wfvXEX2+RBPW8su29PcVisNlSKcDbMPQhWqvknuY7fc2FxPDFNQXYH9XD+5v
         QDapUbV56oSZlZj61DsXwPuQOUwJ9sZ8EzhMeCsb7+KavosPNy0Q56AB2JBOjOK5iPCh
         OyxNwncNxT6LqB4P7LOrikQ6ZJdWtYn3i/qTbwBM7y+EBlQH/SgzNDTwYIpb49qX2XHX
         RrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840169; x=1746444969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8VxOVJp6hEBHMDCosFs6ZILrioIDtRgANEDqPaH5GyA=;
        b=LXFRnKyeT2WdztZPRmXoWBUqTzk1vNqz6OrdI5rphjNF8vz8wO5xHPjQISazU4lces
         s+SCg3g05pvmP1lq6+R11V7CZYeltBhvHHl7+CauI+mGQwkilpF1/emerwmlAvpeHnkF
         GrLbCM5tYeMQ+YbDFsr69z+rCXXEhJIJ+1LW+0uLfqNxYhzbgqWn5cjhfD1XmJpVsJIV
         tfDMKI4LV59qJ8GxG4zjl+jQGIe1IJyT9cvrHJ3aQog5k7xgzKxE0wwNhpmP9FZ8gEN6
         Gl/uxEhZ4esiAUa9PUhXXl2G6Y7izoBv0asJeUAkZE+/8InDtRFw+62nb37nvY1ukSWE
         LnZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0mJz+fZzBTZpQ9gAcOqEmTgntrB0d8R0+rifGESlb39QMZaPyKPYbETY6pjNJkqxKvmSFCcQbFF2S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/SfVRj1/3dkP54AQfyjyPlr5w8AYN4LUQsVPINIwlI7nREAnk
	qzYN07C0LLWC5h6M9DUjuI4nBuJJrfFHYV8+0HL5wlpXh/568iJ2FQI0oyKSnm8=
X-Gm-Gg: ASbGncuE1xQVejIdu08K/2d/EL35Rloz2ZRK3mEJLXkjFJjdHLQhXuYrEGe4vT1dZk3
	ix3WcMha9ZyntN/zxUBrSdVRFqNAXJ80XilKeSGjnUeDJhaoCfS/1vwY4vN2xgreypH02tlSQt1
	ketmIwa1rqvlNdLRIe0HNHQUvwWUdPNlEdVxfG1DhRj7/7NLuXB15Dq92mJVKSDtn4AMXhCClNj
	lzZjyVVzaDvEImMOTvK0xfAzFTwu60em8pXm6wOzC72RL3DFH/mHRDiFxFjM65AoZNZsXX3hFml
	zskxK37uSlbB0AtIJENrr6SH10tv/l6/eBlyqChsBXpxOMVk26oiQCEMo6zajkk/8aNfyOXs1sA
	k2v5Idy89xlKI6uXutEBkmd3f
X-Google-Smtp-Source: AGHT+IF2Mpec2Ou5p/cywTqDhvwcf0ewlmn9clUMEbkPcU/0VUXa88a61N24Naca0NbKAtf/tGsywQ==
X-Received: by 2002:a17:907:9617:b0:aca:d4f0:2b9f with SMTP id a640c23a62f3a-ace848c0531mr707750066b.10.1745840168997;
        Mon, 28 Apr 2025 04:36:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1580sm619937766b.175.2025.04.28.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:36:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 28 Apr 2025 12:36:06 +0100
Subject: [PATCH v7 3/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-max77759-mfd-v7-3-edfe40c16fe8@linaro.org>
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes the top-level device.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
* drop gpio-controller and gpio-cells, GPIO is provided by the child
  (Rob)

v2:
* rename expected nvmem subdev nodename to 'nvmem-0'
  I'd have preferred just 'nvmem', but that matches nvmem-consumer.yaml
  and fails validation.

Note: MAINTAINERS doesn't need updating, the binding update for the
first leaf device (gpio) adds a wildcard matching all max77759 bindings
---
 .../devicetree/bindings/mfd/maxim,max77759.yaml    | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..525de9ab3c2b7b431e48497330640857540625b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
@@ -0,0 +1,99 @@
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
+  reg:
+    maxItems: 1
+
+  gpio:
+    $ref: /schemas/gpio/maxim,max77759-gpio.yaml
+
+  nvmem-0:
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
+            nvmem-0 {
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

-- 
2.49.0.850.g28803427d3-goog


