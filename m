Return-Path: <linux-gpio+bounces-19496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE32AA464B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 11:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56561C04C62
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 09:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957E1221726;
	Wed, 30 Apr 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SpnR9hNl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3CA21B9F2
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003798; cv=none; b=tf12Y6J6vcbt2fo5/zUlcH2Lm3vFrON5ErU5YFsFcVrMnj4d7U+p8cWWNJQ/l31eKONtw9dtKcVix5NaTyFDKKyL7R5Ih/JS/23q0vnD7cIXl2tn+HPUb7RjCp8GLLm6qtdGWZr9VZMng2KPLi1d7SA4RTALm14mg173zs90T34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003798; c=relaxed/simple;
	bh=bFksOeknh8d+JfpwdhA3LClj8Y8cCin0vyzLAmX/vl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFbvjn/oTuofUFOqOQq9X9SGgXbOUoNZ5iNkrf23cFunVL5hsR0xYkTOiNpeTALmhB4LTFaUJxLQH5N5OpsFUcyG2ZhSjaS3t5ETKMqYpNw95Zph3Mw5D+n09yQFJPfpgCgNKvjOiqKogOPYYTm1r2AOo2+jKlyxamyOa8O0ysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SpnR9hNl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2aeada833so148133466b.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 02:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746003794; x=1746608594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyiytjDRdFd6s+6c7xd37xzCdnxjjI1OzqbZfUcJ7Kk=;
        b=SpnR9hNl9mWf+MlzGEOO3WnMpHiOBSGnU437elz744n2CDKB5ZyIS62qos4elyYpZO
         m2aQxpVcXAxbhg0eUcNDuYhjJ0yPxl5Km1SA47YQ6EG3fURKHyWChpBw+jpSTzstIsE1
         KhL4KRQdgnc5bkNkubk3ixyYV/NVJcXwKG1dwNbvlu85t+ZXqsSSyzCe4XL73ccrA54l
         aOwRG8ByaUMAFGl3eVSKFgkLsWLBBeTaboTQcSM4seJiPhrjNnSv5ldBEx5+jaEc8a5B
         vVFkDvyHRUw5WXoL4blNNoZroeU3ZBVc8osHJs8gbIToUFuJoWwVM3FUZPqwXPI1Il/x
         WfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746003794; x=1746608594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyiytjDRdFd6s+6c7xd37xzCdnxjjI1OzqbZfUcJ7Kk=;
        b=ApO7v4NCtyU6js6qcdyu2naXkWuLd9DhAYEifqn7I+f3p5VHtuNgrYdUv7dTweapKl
         FbWH/eVGrKPCab9Xt/CcD1o/UpBof9jYCMPWPlDyCzn6YyportB1eJiT+uN3g3C+3Ptt
         SFrTKPQwALbkTpG3ZNoTv0bwT3wkQaOGtU8sOKlcPxh2xVpT+x94LrDbDUApAnkI36JM
         bFf1Av0QV2mxREt1uPWjQg8Y7MYlHN9YgnpAQ5XEv9dZwIRfoNWE3gvrmDfdq5mTLwOj
         CgrW9cjrUgNg+Gbtra9I5Tb5d6BBs9h3kVtIrX02e0Yx8X8wFA7blKHJGnxvw6/wkfHe
         /HTg==
X-Forwarded-Encrypted: i=1; AJvYcCURwczjU0bie7TrkXOYym/Z9GJ4Zd5uDv9uLZp3fpwBv72Hxl0jUlq3uoFYUxPvbJsjAjie6PAIhJSk@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIVKOrwfMzkSE0NxmvIzptnEhOWJoHiMPXcY2W+Am4DFTOMha
	Ci40McdO4s1qs22TZ516T71CQHv/rSWXhUcJQNFnv9EY5iY1Dn9eTgB5PJFmURQ=
X-Gm-Gg: ASbGncsLu0scJDnRxyPgN0prfKdGUjs/ac55B5dcWQjz1U9gl3xr5cQIbbjRSfXhSGa
	Qj3ZD2/a67h/IxAvaena3QMOAf1tfhtspVJpI4Lkuz8Uz/FQyrpkAfBszGn4xNyPdd3NDK9QOpz
	xH0dlj1IVibQeb5CUM96bHeFa0ZDlBlL6lJto+6ePAuOAEvw7Hi4+KWE2CgGX6uhz5d7wHvmkTB
	um4YlSOHQbeVR3KB8K8qh9NYMXHRtK+HYw8Ejs59VdxSU/K3OiJzWNcYybOS5hNw5dQRefmBnHS
	VCjPk0a4rFzpjG4UZwHSI194EtxP8aiOLZre8/oaV/rVzTT+m+2c2tQ9nPVde3VQduLO/tnXfi9
	l3XJajOakTHWkjwETphl6wwaA
X-Google-Smtp-Source: AGHT+IGcixekqMbiCwTt0euFgr8qyktPoka758m284mP8XwKbyfXBT71rs+QPFdZrVWILYzT2lipaw==
X-Received: by 2002:a17:907:72ca:b0:acb:37ae:619c with SMTP id a640c23a62f3a-acedf6be04dmr180503466b.15.1746003793663;
        Wed, 30 Apr 2025 02:03:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbb6sm889676766b.28.2025.04.30.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:03:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Apr 2025 10:03:10 +0100
Subject: [PATCH v9 3/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-max77759-mfd-v9-3-639763e23598@linaro.org>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
In-Reply-To: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
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
2.49.0.901.g37484f566f-goog


