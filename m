Return-Path: <linux-gpio+bounces-16827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB11DA49BF0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 15:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E4CA1738EB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4D32702C4;
	Fri, 28 Feb 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CiMC9zrE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186326E97C
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752726; cv=none; b=THqN0ZysluWXH9jcGQi4+yCPlvLTGdm6+1TJURiwDrTod3GeSeTKVJLAFrTNhuC1d3D3yA4SgkYtWFq/csSqJ5DRxFFcbnku0YuL6y2aAcP8gwuIedBIOhtekP+XD3U+pwNBBDwriK1aJCv7V/uDLM25wuGX+F+cFwnKTYYzzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752726; c=relaxed/simple;
	bh=A1c7oPj+mHgomHNOeZfQ5imtH0eO01+ucNLtjE3IxZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZwyTNv8WKPmrJCGd7B+RNUsRqutTuxlCSeDvD7NZxzw0A3us5CevB2teo/wp5stKRp+6MXdbSWjA5ZKicQf0IZxhZTqRXK6+H0CYKg2pwxYFMyJ1XdmsvF2/mWJ5wMQTxRsbwYDPqXH5mGkn37WtNaUXdAobzCxvjtUBKTbj20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CiMC9zrE; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso3118740a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740752721; x=1741357521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbGkP6lgrmkK8Sb6Eo6E5YJrFog34o66alqe4OQ4cJM=;
        b=CiMC9zrEe91nKl7iq6Eehit1qnI6rCRsg+Do1L3Jr0ywfn3LdAiOuZlnLzXXT3UBJa
         prFUhykB0AyAnGQ5lnAz0rsKYs93N/m/y8PpoNw3tD1CTOeq881ncWWTSkSqUdMF27Sr
         dlzsEtqRk0HfSsABMDPIqrL0mAT5hWywQIliEqZcv1SnHDQLXqBtiECEUQct0A96+cco
         vwNKUahIwZBqqWByWCu51olH8IBOT5hKaZXl17K3m1rEvw5N7L1wlDvNLy9qp5aB6kcs
         4cyUbPtQ7Ws4DaLnNi0HNKRUlohoJFWHRIIEkubCtBhv2cGqB5tuiM70xShzLwfcLSFy
         al6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740752721; x=1741357521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbGkP6lgrmkK8Sb6Eo6E5YJrFog34o66alqe4OQ4cJM=;
        b=spZ+d8mTyfVvkWAV6GBmWMC3WvM/WX7uBr8JPMKxtQYucCC4jCiOIe62SdZngff5xr
         QJjkcE2+Rhgxb6Cgv7S+R0DqeTZCCc0zrkuSf/oKswS9bszOtPxGj/6i0ffBByCiQae3
         saEp9Ym5IxOMh32cbUpDCYmVUwRy62pWCgxppTH6c/wR6GqU00HNNzrOmk4duClGThyP
         79raLzTW23cgVvmpTGpMagonQQODnH9L9NqBWFXMAw2LFNcKQ6SLJmpUY0e6jg/olW61
         FSuhz20mEA1/NlwIGGlFEHc/Bl9/MDpOLp6cb8q+MGhZCKCZHzH7lo9PO/kdKmqpIGv1
         RAZA==
X-Forwarded-Encrypted: i=1; AJvYcCXJn4dvbMQSPBpHTOyeb6kAzSxlE3vfTqz28ZKvpCZGVipnzYCXWof5txveAMVf4g5zBzEaVfbj+mZi@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjqvB2Mdd+KG5Hc6LGERmVlgvJmHogqsOGzF0yVyXyCdb3gs8
	6sh/GL8a5DcnW9EH7Bk4ofrVs/U75vwA6hnACOaHArd8W9MudLLbDm25EBCwgzM=
X-Gm-Gg: ASbGncsukTfCP8fLxI2dFmZNYtXclgomoFNf5n40p+pC46lmJbI+rK2JKq0bue7iSBC
	hBbvqCJE0th2wOShI+tIjVGbrLpBzHBZEhlrSb/YYRbAVPN0b0K9PBqR0u+B6GLp+ez/CN1J6hX
	9TW2EXCaZBTMdGuTMWIhxRuYVdStPmb32YrXI+PcU+5o7LumIhUS6R7o7ICVbX2B9pTdoujEHKc
	ulBrEEVSw9P6Ck9Zy7BXddTo1gysURmReerwMMOaoyZe0VkmaQlCfNT0pKDwUao+6qkJEeHZ+UP
	lROYg8ZrlOgb6qisjFlZiLzKV1i6hJAOFwnS6MPEEYrGbbErVepO4HftYo4dAWFsUcStldFXoWi
	b5xrNVR3vKg==
X-Google-Smtp-Source: AGHT+IGqhQFvrzNMYQjiKO9Vc60qd948jBI9yWaEAq0UnRjcu0b6mkDidj6LMsQD1AYOi6xvC5fWXQ==
X-Received: by 2002:a17:907:2d28:b0:abf:1379:d67a with SMTP id a640c23a62f3a-abf261f9661mr404014266b.8.1740752721106;
        Fri, 28 Feb 2025 06:25:21 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c75bffcsm298754466b.143.2025.02.28.06.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:25:20 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:25:17 +0000
Subject: [PATCH v3 3/6] dt-bindings: mfd: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-max77759-mfd-v3-3-0c3627d42526@linaro.org>
References: <20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org>
In-Reply-To: <20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org>
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
2.48.1.711.g2feabab25a-goog


