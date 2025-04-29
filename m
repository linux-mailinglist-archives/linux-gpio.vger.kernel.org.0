Return-Path: <linux-gpio+bounces-19437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C5AA05A4
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309FB845582
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D6229CB44;
	Tue, 29 Apr 2025 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V213g7fd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9733B2951B9
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914932; cv=none; b=CiJILwWS3NLNb7KIdKc09LqzS39miQvlzDJTbwPX28pifEp5s2+xi2U9iJ0AQBDIXk9LeXyK0xguu9hXOTpaYv0rMrZhM3FIHbbJ/aWbfbQmrq1Egkb3bL/PUyMpU1+34Iiw16NdMPLH2124lJQuwsPTbAx5IO6YDYe3dHAWj3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914932; c=relaxed/simple;
	bh=4SBDb8RMix1AfTeAapS22vbsprNHW5kDlKivkfzgJb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Atikxw2PyWY6Xo74zZ9aL2ZGgNiYq4s+9cXbNAKSguDHvbF3WLudwTw3hf+cimy+We2LgxK02K4iWVJ1kRy3tSDtCIIztXgE6WgT+QzjgdAR34kztZxFzknyusVBU1mF0TrWjacNMLNnPqoGj/FY8Y8HUBZPzURlqA01okHnqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V213g7fd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb39c45b4eso904971766b.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745914928; x=1746519728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsPhnEzsIjMyr2jWNVlW883QIlYElONTjUn31M/bDFU=;
        b=V213g7fdjlzD8p0pydscPcSBtYQ2ey2pm02mGAtkuCKZXE+ufB8hHmidHEagPvSaqB
         FrJLdOpLwBOQ6dXgdxqqXYwE0/OnHZji3bdHZMPLlMyKPpYimz9V1poORaD40BEqrJe3
         zmJY+cAIbo2sfibyutyrhgttEVVkonQwPhnO66DqCkJcZpvPUA89Apy7h3lpygYGCzG9
         VkEBKxVgtcz2Ezw3fXK7gcEVo7UDZ4YTVhuIiU3JYb1E0AJyb2jhty9Y3jt/rEWhTQvU
         cEK5thfDTyEhid5YZlAO+w5j+PKktAiecXDVoli65xBQv7YonqrHPEmZgTFn5Wqd1iK3
         5eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914928; x=1746519728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsPhnEzsIjMyr2jWNVlW883QIlYElONTjUn31M/bDFU=;
        b=vsb4WtVF4wBAU7dF7Kjavsuxuw9m/tVVfiySIrSjznUd4lUibXhJf8r22SqSCmZGkK
         eAiwPVnXZWMOKlXzfqtNtGf4MWyJl+WlrFLFUqfuzZ6vcIsw+ybC0wFBhM1rE7TUZlYZ
         BhUtKMG279hDcPZjK7N/+VKJ4l8Xn2ysBnj6LqxufwG2Vv1j6ZsSB0k+E4Fi+qUxZo/v
         MalwyqrKIGIBleGNsJtVWIrGV35sXnVgz5UYd80wK8DnSYCzTivJTHUryH9O72Mnl/5L
         c1uq+I3lZTUb+PKZ4u3N/XxDzWtO8lDOvV9sZIezjm2qvw9WGSg383+3hUWbJQ9yCLWw
         i+pA==
X-Forwarded-Encrypted: i=1; AJvYcCXMtJ/lqq0boH27ckZ/1qDHNIDloZ8KAr780OlIYKzld5gWYqVgSsKrRiR+eKJdNYWqNnd4nmymqzo2@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/TXQ3NedpDUlqHwpMN+JA/BFv5QauHavITfJvzgffjyef68M
	WhzGi41LF4WfQ4PQ97H2kVJS/8QBmrNrIrEbay0jrCfdFNQV7Rmb1zqqjnybJ78=
X-Gm-Gg: ASbGncs7ngBorUnm5nj8vY9zwsUNjyMFe96I3XW8qIXVktXou6cUXFgxmC8yT6PnC/K
	OxvunJJDAttVpAxcffMjBVs/C2yLYZz6RDbCMxGdtBFZ4HMcTPlsGbgRqcCqNGDJklYIW89cPdG
	dgTaW+nrm7+b37bTTWUQaXUSle1ex4NdApZo5ksEwLUms8BYKOXb3WNyF9DfpM2fpO5UR3b03hD
	k0iJozZXoK3MC4aHzg5bEIKp0P1RU35y4GPb8S7yfZkLayChs99toar7qK9HKhHhPvnz0ktOnz4
	CmWvdintuA8q+e10a29fjTQO9DMqH6VrwfF2x/vQ+WvYjr+hs8mRI2RN1ITaUc2lHPiG66WmVL4
	yVGbccy8SWhzawYBU5FJGxWjT
X-Google-Smtp-Source: AGHT+IFKdKniSEsGUnq1iYx8etj6NA6NxBliPsow0jh+bOsIlETHYTkVhBYFIQ8GlA5A8lzlAc2nDA==
X-Received: by 2002:a17:907:7b9a:b0:aca:c924:c14 with SMTP id a640c23a62f3a-acec69721e7mr248138766b.17.1745914927654;
        Tue, 29 Apr 2025 01:22:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbf4sm737905466b.36.2025.04.29.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:22:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 29 Apr 2025 09:21:37 +0100
Subject: [PATCH v8 1/6] dt-bindings: gpio: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-max77759-mfd-v8-1-72d72dc79a1f@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This describes its GPIO module.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 906881b6c5cb6ff743e13b251873b89138c69a1c..0c7bf694468e9798946baecdfd03d6eacdba2ce3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14663,6 +14663,12 @@ F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
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
2.49.0.901.g37484f566f-goog


