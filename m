Return-Path: <linux-gpio+bounces-17937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E8FA6EB02
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9633AE9F3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5258A25485D;
	Tue, 25 Mar 2025 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sh/yOetQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8471A5B91
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889776; cv=none; b=eWuzCl+a9eExRl4bRKMK+7Ztl+qer64y0pzgeT3wmhi8IK8WD3g7ih/XqE/N/8NZvFyVFgSJzNv128bKq34LaVRoFFaNEn6POUAbeEsXpEqZXVfuy4yReO5+iz1UIYYLPOv4GFkJuzy84dVadSmsksRrky2XW8HwXPbl1xM4NjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889776; c=relaxed/simple;
	bh=Kyd5Vj5Wtgn7kWZUmlkSip+En4I9UUHkx0BnikIJZpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHIGCiEwFxNGVLB3ccvsqqDetO9zlIovktcThJK+3KSFA9vUj8un9TgF1kwxiWO8Nzh51a7nSU+oMUJYJ6FNg51QVwvSZZGfRztb1GvDY3i0VIvK7fS4W+Dn0fL6sz5OSbWydqwHItYv/5Fv3IRhFE/8t3+hfHbY0DMr95bFJRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sh/yOetQ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so430200a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742889772; x=1743494572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dExfc0LrUCiaYdxVn5B5O2p+BcM4AL59uS0XF6ohUVg=;
        b=Sh/yOetQx7qlE6xZ4IKElb55bK+IAdqaqOXkTk4T8ps6a1LUHbunvwJxpiL6nU7wKo
         OZ6ElVF1DuVoRrmzewl2K5dA8xUI1vE5dYL2nYC5VpL63d8DemfEUt5I6Alx2qgfdYN5
         ul+Ps42jrXGIpMB/98NAzaqjTpK5zm4ugJxafXVCVplFqFZZgS89IJRblUAoD3gq58v6
         6rpOlasXGgipT8b6SGme2tLcCdwtX7KEEA7MVqbC4LxILsd7Yem2dnpXtFkANzCwskwa
         25+JYJUsDWrCLyfqwVfhnbAI1pyfbkC6RNoPw6TYFLwJeggXkIs1UqhTWZMdpY6LfSzE
         KrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742889772; x=1743494572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dExfc0LrUCiaYdxVn5B5O2p+BcM4AL59uS0XF6ohUVg=;
        b=N58nbBvOTsZ506AKRgL5NCI6f7/sez1rPpf79sFHUwFjQbKlXmrUNQ2yVM0cgVNKqv
         IpTFXk9+6NdbrtKFCl4vrIvlSnnatz2ZlMkIItkN6JAplXGYo6T2nfxciFxV3NimZ7XG
         yimpEjj2cmLe3VWEnnhyM/oZe0oiv5SQtxDZ89Q/RoXhg/NuLOTA27yIrUZ8LIezfgtR
         VfDjUtQvTF4MwiTBUoK9wimAKOJ3yhRESTAY73fphazPqucariQt+I7dr8+Di6aMhzZE
         5qx6Pp9nHORQwkUUKXK2znphocvGXHwc20Ig7WebmMJVDZQza+cmWtZyVDJYNBmCqghP
         QNdA==
X-Forwarded-Encrypted: i=1; AJvYcCVRypUAZFY8v2z1eAGJDkeBFH0O1uC8S1c6716b7cF1EZPDu6mGDZL/FdS0oR88RfdWZEkap+qi1eEf@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpAyYZ29rhJE8FYMG3OSfe9K6sYl1rOOmqnpei5TdV67rIL3S
	FUXjvm1d0fn2C8Caiep27tftvIh1Eb30xsgG5temSiBFxYFwF9JlEV807r0Wq0Y=
X-Gm-Gg: ASbGncvwIk6nlUgeb9Kgf5NPuRBgzo4Js/3bmtQ226KAZqTGFROXaYHDX/N2UthKor2
	VY849eZlBFKnTIstvKHloF7wv30gFY7N3B+7mmCCMa2+AgNYdMAAjFd0cTvdUeBD5vAASCpAdtE
	1B1NZFkQSX6n+ax76HZwDEK2phTs1Wy72KzD7/8uT+/mcAcBrpTQk+RVZAjsi2QawryCXW4ZxW+
	c/GHDnOJrTfUVufTPX49pBcvJzF25cUK05jLGIDnqAeQNwmmYI1NliFNKl5o7AvHTAhHwXWuTuy
	WX6i58uQiZOn8CIZcTrJFhc0ND1BN4QRcVmSmooXGReonNtLL/ToYFhX/dTUjcs15kkwSmFyyOt
	wzjeJ2Y5Nv9+IbBxmL4Mcd0I7o9RF
X-Google-Smtp-Source: AGHT+IEqZqvkWsL1rJSlE/DLcPlmZaynYCxoREH4kRFmKv9BJrVDGJjfkKncZLOyDfxBKQoYgQpPWA==
X-Received: by 2002:a05:6402:4307:b0:5ec:cd7c:de55 with SMTP id 4fb4d7f45d1cf-5eccd7ce06dmr4085552a12.17.1742889771562;
        Tue, 25 Mar 2025 01:02:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb004fsm7446785a12.40.2025.03.25.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:02:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:02:26 +0000
Subject: [PATCH v5 3/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v5-3-69bd6f07a77b@linaro.org>
References: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org>
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
2.49.0.395.g12beb8f557-goog


