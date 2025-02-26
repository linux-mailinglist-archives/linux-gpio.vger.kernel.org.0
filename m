Return-Path: <linux-gpio+bounces-16646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5384A46870
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 18:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D74B1886695
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C9822A4DE;
	Wed, 26 Feb 2025 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lu6AG8on"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CB522A1E4
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592288; cv=none; b=Q4CG2IvQpdt22+AIxW+DpHfxOeqcG2t3ryqr0XRXEZwvhKwUJASIzmNbnJEcaN3bpEMW2bDZxTa2ynsY3l6FPUZ4t9yz2pRP/XKgqOOqA6rVoc6OAM03fWNO+b6bESKnyF0st32Ou2LSUQ6Q+146yP+UD4BJELzT+AlNYWmIMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592288; c=relaxed/simple;
	bh=PsNx77qzhJzPPjeq4lLbR/H5A7DBpnLiTnBW5yUJssk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhsA0QYR3j74bMxiAN35uU76haj4+iELA0E0LwEcZLf36wnWI/XrpkMTKrHshixyrfUU3uidAHemLIgBK5mugIILenY43zubO2ft5M9lT0nq4nLyc0y3bVzNZIoCP/RcGkqkALuTh4ld+dWbxp2P4favTIPHrAfbw9uwkwHsh3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lu6AG8on; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb8045c3f3so1269666b.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740592284; x=1741197084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp4TWEA8z4tp7SimvO4HzAXyTNpNhSjLUqF9AYCLCY4=;
        b=lu6AG8onL4I9xiUpEAR0JxqUU/HXHEIzsH2qK66jfFmxd0BVl5+eQZHxkcm1cnJy8s
         Kv3xCiwUFT812ZLXkeOjbx4tHqKnKvlVB9d8Bewyefs6jyXNsdzeDi5LAzG/TBz3Xxuq
         fnfFGJbE30UZkbo7Az440C0IvBEHAX2Bt7aT4W/sPL5/AQvcYCO6gRpqKsCHLDZLuDKK
         nMXxtMDIgeyXtbqyjo8XwwDOhc9SafFLJHcqBORB0gIDZSii07KdC0DDGfOAAYryKwqg
         wamEh1Ez8TduGc+CKIU5nCv6owyBckWc9X7XtlU7R0FhmOvXsql80q7EEo8Fbqc987ac
         xNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592284; x=1741197084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vp4TWEA8z4tp7SimvO4HzAXyTNpNhSjLUqF9AYCLCY4=;
        b=vv3cqJXXQ1z+oWh9oZBhGtOXxofvGS/gT6W7p42/8aWYnDHLpqtDFs4leUS6StxPMK
         JqMXWMTcloSKti+MaV+nbvkYQKsNO/WQFWoxfNFJd2WydzKt7xI1s4mjiCKHQ7gF8Ahj
         Vo3NQOFMXwgPVKiLo/uMKsFCVFfeDi3amiWclmmu4Yq+IpfjMWwEAuW37c129RfEDZfg
         MIuWUHng6Gc+ujUaEk/oZDld+4ypri4K944nA0uiklcSxwsWJc+w0GUy+rqIYUeJQHAE
         iv/b4XuIWllft8UAL9qFwyf3lCYS9dBSiIm8C8xHGVO9r6wsXNoClZpG6G5TG4BXIV1V
         l3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWO7LhJqA8su+sfdD/cVtFg30N0YiDIHIzm7AcJMTT6sTAE0i5j6d21hrXZZqP6WdLbrO8GM2G72u1M@vger.kernel.org
X-Gm-Message-State: AOJu0YwHlQ9S//G617L0zahk87F3+e02UDV7Gzis3I9lnRWpNIadk4A2
	qPKwtolddrKYSQuVt0gmJtfWZIdhPH8p+fNbdvf/Xice17vMBG0S8vg8bqJeJrA=
X-Gm-Gg: ASbGncvplGUz9rmfwUTbWIiWyYIkW29jFt8sfuqqDVazCUiVdivE58Ef9UFhpoTynDM
	dmMwwnY0Je97930PwVKBRY6TFVPfQQ5MQKR6y7cCM8sQgbLdDtInMuo+Jk9ZFABK5L5kon9i8jc
	NPSXEnIQbUI/5nkAw93FRc66BC0tudOJYg0dbVMQcMhvkinvBVNG9LZBsysWWxrTcrAojcUkGQq
	R8cGJtaFAYSTiZZhIYBC0bAh6HcC+Ch/6mGr8yl4SKOA4QfhWflCot1dBTj379NUYY2cgiB9rQg
	Qr1L9DcZrc6QlCiylmPoqCL4oo8hCVNIEBXwgHi887keym+t2A4SH/mdmMjM4NLVCHvAyZZEy4A
	EXMELhqlhug==
X-Google-Smtp-Source: AGHT+IEdfFhNcKgkZvxT66Ew3Z/Wtr+Qqk6RH7/uf1S4Xn/P1+vdzKAPT+kZGF4bOb33+f21nORedw==
X-Received: by 2002:a17:906:2a4c:b0:abe:fed3:9eb8 with SMTP id a640c23a62f3a-abefed3b1abmr260593066b.41.1740592284382;
        Wed, 26 Feb 2025 09:51:24 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdb131sm361889866b.7.2025.02.26.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:51:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 26 Feb 2025 17:51:20 +0000
Subject: [PATCH v2 1/6] dt-bindings: gpio: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-max77759-mfd-v2-1-a65ebe2bc0a9@linaro.org>
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

This describes its GPIO module.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* drop 'interrupts' property and sort properties alphabetically
---
 .../bindings/gpio/maxim,max77759-gpio.yaml         | 44 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..55734190d5ebdbc351e1f91675dddd8a9db80cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/maxim,max77759-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77759 GPIO
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description: |
+  This module is part of the MAX77759 PMIC. For additional information, see
+  Documentation/devicetree/bindings/mfd/maxim,max77759.yaml.
+
+  The MAX77759 is a PMIC integrating, amongst others, a GPIO controller
+  including interrupt support for 2 GPIO lines.
+
+properties:
+  compatible:
+    const: maxim,max77759-gpio
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 2
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 86fa62154d3b23bf84ce2d53cbbdc33f3d43006e..a45d1bd64d116d14bc05a64fa3da852a41e1de7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14347,6 +14347,12 @@ F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
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


