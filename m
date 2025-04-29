Return-Path: <linux-gpio+bounces-19439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D34AAA0590
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4073F484D3F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960CC29DB83;
	Tue, 29 Apr 2025 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bd/1cZk0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3E297A49
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914934; cv=none; b=P3EXY6/wmKnWzdsF0Dnhws355Fue376QOMXTUz6OobFQFaf0GPb9T0pPVAtLHsb6lQaBv7WU2xn0YNxqSs+NMrYpHh62bKmj2jqb5cKxBvmpOYxQ0p1C+fqnyqZQB6UNROl88vQ1Qq5qJw4X3kbQLW5Ma7YuUEguxfdFuwm57Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914934; c=relaxed/simple;
	bh=bFksOeknh8d+JfpwdhA3LClj8Y8cCin0vyzLAmX/vl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtXEvzDptXULbKmn5n1y1vTkSATCupfOOFenwhE+6oteJ+HfVy7p23NiJMXiO+Gf5lZ62LE9PG/8OlbOgRI95Ymgc81XI6iIHmrIP4XA21uspnIExORDTgpSqr/bv6OO4RRoCzdKEV3+5F12uE0r8rWzx0BMsKCRv37nAxYfQ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bd/1cZk0; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so4422088a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745914929; x=1746519729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyiytjDRdFd6s+6c7xd37xzCdnxjjI1OzqbZfUcJ7Kk=;
        b=bd/1cZk0rWDbHxQ3J04toubS5K18q6pCmY+V22R06qt0mORt1LVXtuh8L/MUzJU8DZ
         Oj0AS2oNl3+O2cFdJDYo8FPXdVC2idJb+Z3UzbyHoi3NTBTdlU8NgZdpULc5vM4xcPjZ
         b/OUdUEjHfQH0OPfRQnQn7+W9fwwD5kbHuV1WB5+867mYp34oQTsIRAVDSVYCErJqSvc
         8uO2D7+wa1o3kjFJo//YdwFru+RyYUC7ZCyeEPzLZtm8BWDwMk5cbtQHUl2x30beRwFg
         9cINqr27apkfAMIG+gA+mzbruGQ0IheHCapeifIVPSM45naZU2O9F5otH040IooI7WXT
         QOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914929; x=1746519729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyiytjDRdFd6s+6c7xd37xzCdnxjjI1OzqbZfUcJ7Kk=;
        b=vY+o3sJtnvmsRnUGOW4JUtcwCv2NbjwWuqEUlcx3aWLfjPBB/1P4TJ2zB6kl3y0oeQ
         DCsYwVy6LMb8om2PM5NtBOkAK7L2tiguYZSlPNivin0yb2R175Uw8NAQHr333fPowG24
         M10Glfsvu4nKXLLxOoBU6yG2cCVFVxTHZJI8cmYk1yeScRYhVRhtbO6A5i2V6yLHNqGn
         MWclgm2qevW5fT1J9cyUI6fC8Gjgmgs3sCrHceaI6cAVYUPX0vPwREEif4KtzNw02qYg
         TG16KUmzNBZy+n7HOhxb55PYVbgqHisK1yhyO+AyeOLyyH0jJ4OZ+p2nhzIBYEqcD2Nr
         1XTg==
X-Forwarded-Encrypted: i=1; AJvYcCVdbUeecr5P1ly3dwiy3RnpCqBtwQV0xGEUdXfGhkA+oBwrrFMPbO2gaDmIRuVH99ZlRHYGKgFtapxS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9mKYzGJkwj21a5Kq02sgxev2t1s+NqYZ+WY5foXgqw9Z0kfb2
	WOezKqJrTB4NPMth219Fcv4uppFaSm890/8BA3IzrLH92BmFOzfTY75qfR8Wsr4=
X-Gm-Gg: ASbGncuBoAAT9v7ID5Rdeip6Ms9sKxnTQW6IDw3Jv1RENlVTwRB8oRfPbxJQXmhNutt
	dPYJqt2kTX6/ediMv1+yscbBzxEOIx/EyQA11PB0VEMK2xYXyQJk0Y68ya9Z2NoZdDu2Il+geo1
	RoBwOi3CUDIifTQ5wtTduGK2v5GF6MIUgsbbCjFSLmuyO6Y4mLVkIwA2o1N1+2ec43Fdu4/X1pD
	QKZZqq82MDXJyd0HLafsTbISNe97hM3m2y2/Rg9Ugm7n8ct9XR6CQjAeWF1RJ8yp1/vcjLruQqR
	bWT5csMUY35GsXXjbShhP4UOaq44AdwnVcH/S28Ee3GJ6Xgvd6+ZwzhH07bUjkikyqOYrw4Ezcq
	sDcfhni485ZT5LK250nwqDDq6WHFBPs2Bg+w=
X-Google-Smtp-Source: AGHT+IHzcQQ+9hyFiMjckDJ0NsHxoITKhor7RUapPEL2dlwcirTYuq+HRPXA4/n2SoNbKNkmp3RVPg==
X-Received: by 2002:a17:907:72d0:b0:acb:b08c:76ae with SMTP id a640c23a62f3a-acec84d2cb7mr160276166b.16.1745914928732;
        Tue, 29 Apr 2025 01:22:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbf4sm737905466b.36.2025.04.29.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:22:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:21:39 +0100
Subject: [PATCH v8 3/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-max77759-mfd-v8-3-72d72dc79a1f@linaro.org>
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
In-Reply-To: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
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


