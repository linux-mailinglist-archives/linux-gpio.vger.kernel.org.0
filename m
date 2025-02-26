Return-Path: <linux-gpio+bounces-16648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1780A46877
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 18:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E06E7A1C51
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 17:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1E222A7F3;
	Wed, 26 Feb 2025 17:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ffGik0Uy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88622A4C5
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592290; cv=none; b=gVb8lkuQU+Quo+D5a45Be9jkg5E17x6HJLRJfqGZieLZgW4WQpzJmHHGSrRb9Wccoo2iv3DojbKTdQeWxUQsujRt65RGmCpa/Fa4Z//W94IM06RRApw+yg8YMr6unZwAcgdEfgAN0vahrkTY54FX9Y+noamMXbOj2dkBIgZU9U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592290; c=relaxed/simple;
	bh=Wrk3Tbjy48DhMXMrJ6FsxsEEZWO2wkyYnH7V/hmHbpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSW0ifUcRWMw6xcrU2UbVzQARr/0MUz8IC7J4ug7v+J+UoYohsZ61ZSS02IEP46Hy/CV3NGOe9NeXIV9jQULxLGJT95wpJjB1+R4pisOa4KGE+7wnpsh5Mlvft2UqgGUCicApGeRGnDwEh1aVsTiMh0A033j48qYugYWn89ROTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ffGik0Uy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb79af88afso4692166b.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 09:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740592285; x=1741197085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JO1yRDgm5kl/hQVQWW5vYh5O5OnfQpLxrGfUp86iA18=;
        b=ffGik0UyZ4H1FZtySsggiTuIg8yRHhj0ec76bakiPDSk2i6s/i+HTahRaoxvkpm7za
         UWZbNHMlbD21o1ixSWUfMfNn7Qm4nt9rOPXJzd1X7nq7qTaZK+EAlZ3k6WYReYuRXMfR
         3dgep0O5GTTLVZ8Qa1Elgl3a56HyF5jrQqPUWhucWAUtsBhe0QJ0YoWvqH1tVoQKingp
         ojZFyajXjNW15pmdgKDEaIDOizj5GvfgiKdMJgebTYBdwyyxygkneNpbye0ZtFTVck9x
         0H18AUMcC2amR1kFm39vXJninBn0yL4bQD4ZyQ6P2K0IKRmiB+meEv8etMxszHkdBO3C
         s8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592285; x=1741197085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JO1yRDgm5kl/hQVQWW5vYh5O5OnfQpLxrGfUp86iA18=;
        b=NfFRm7VX/hTtJZUs5BsPg8+IJDWao4HdPgXsY6fiPP3Rc+PIFZkMm75PoaSzUVEDjr
         TAXC+JGEaXA85EGXNjjcP43b/fKpb8VquHbH8/IatvtYQzjIG4cJEYXJzgnalm0TRYzO
         kBwgPThGY6LNjq2Tqhwny/pscTEnl57dpO6+tvxJuDyLaE3s2MNHCVm/A9ANmKtZICbu
         SklHTu0cng2SSX6P4v9K4h6BqEuDFLz5EuczGth9ydNFg6D0vk61ErzBNMKmfdqQhfp6
         9zLnecEKqsMd1nqiY2H/yTekmvuWZmejYixsM3EpDJPL0VqzlgGWmZfJK5TDN7th5HIJ
         qVsg==
X-Forwarded-Encrypted: i=1; AJvYcCX33GE8o2p75znRJoqRBWjp8mX2Kug6sCINoKKJcTdR/snL/o/fPY5RANRt6xdBsEk9tOifIFDGhqCH@vger.kernel.org
X-Gm-Message-State: AOJu0YymMqpmqVSwYsjU2vsAGENH92Nps+y9uJM0rJCXuRFFd1XYsC+8
	9UFXZnDrgPxQR4c+k88HbGs9fO8XakHGgceobgheLOaKVQ1stR8mItJasMvV4ug=
X-Gm-Gg: ASbGncskcfA3Tzx4YBQMdcRREaf6cH4xGw6n/JBdQeRSM2dXXrbWKm71dWiq1qWrRK3
	o+7C5NORO4KTPiK6fgaUJv68Djsbl+WCp66zL0SnrVMl9VJ8nyNc7emxZl7Ct0W7tTqXmokg+jB
	vA330RtSTbBu9OF+htWj6uaK3Tj29Di3jStdXA6oFiIbLl591JiyjurvJLEvj8dG1YdUCAY/R9k
	yQKE2W0XSNAcRm2OQpr9cAoRrkxLVq9ZdCfDj2lOpcE0AT6X6PgoxQ6yH3MGi1EBACBGY78wpmm
	0v4kHvjTf5Fj1mStBXiczSjvtC6kxMwjoGIqBHvFl3swH+zLht5reUOA8XtYNP0nszE56cuKFEE
	GcMa24GFrkA==
X-Google-Smtp-Source: AGHT+IFmKSPF6nqqiaetA3heVfq299jPwpErUmra97HCWFZu+Y10xqFwRt4yZaOIXY+ZiDT6DcAWfQ==
X-Received: by 2002:a17:907:728a:b0:aba:608d:4a22 with SMTP id a640c23a62f3a-abc09a09707mr2420013566b.21.1740592285488;
        Wed, 26 Feb 2025 09:51:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdb131sm361889866b.7.2025.02.26.09.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:51:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 26 Feb 2025 17:51:22 +0000
Subject: [PATCH v2 3/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
In-Reply-To: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
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
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes the top-level device.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* rename expected nvmem subdev nodename to 'nvmem-0'
  I'd have preferred just 'nvmem', but that matches nvmem-consumer.yaml
  and fails validation.

Note: MAINTAINERS doesn't need updating, the binding update for the
first leaf device (gpio) adds a wildcard matching all max77759 bindings
---
 .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..87e3737896a289998a18b67932dbccacfb8e3150
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
2.48.1.658.g4767266eb4-goog


