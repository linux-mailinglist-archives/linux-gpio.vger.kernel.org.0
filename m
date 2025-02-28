Return-Path: <linux-gpio+bounces-16825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD4A49BE4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 15:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EE761894D39
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F2726FD9C;
	Fri, 28 Feb 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNruckEa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB68426D5D2
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752723; cv=none; b=DR7+QoTEuU5V8OiXVJXtrV+dCJc82xitKyQnftlM1/lP08iCAzCIVKOAtZqJzZQui7Q6VCbsvRRqV8yN7SqMyNHMA+BS4+xUW8qIcDzv6n3cHuNSxRxZONdayyvPaaAJBODuKZSjrtXyxjBxX+4llG424n9ty2GjWOh7Kef1Bhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752723; c=relaxed/simple;
	bh=q8yvSV3OfR1cMeYWUwudsYOgSeKbzLSKCy1iuJ6/+EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+fN6T/4t5I/MmK2bhcm3nejrHFXPBmkUlwkeZDkcJ0G3ntDaIfXgz/LlwguiUnPkAQkM1QZkx/mM0T07iMLpigON2SsKsQR+9ud59SlgJpKtiqmc8wR7la/Gq2oG9iD+bBIySR4fF+nHiDk1/cdQFFGPAV/b/YD21jKNuVvW4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNruckEa; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so3368039a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 06:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740752720; x=1741357520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pv4wwRg4MWsotmAwTgSc9LO+fNoS+BdIZnuXjMZYvGI=;
        b=sNruckEamZmIgRbxuKsDuxtQ2qhK0FsXxlNgxFoEGvnqgQAvpE4XZGWpyDeuCIJx3a
         zZ7qnE6eVY75VGT9RSahq/loP+KUwrOV/xq21lCuDXF1cCD0Orsr3TWLn/X/+k5MwN45
         yvTX4YvhedbAbwK8/jMrnMUi6jLWw6c4V68efQcq63+pG37+yYWlSRHno5Izz9pleDW8
         S+WaTeSCY0iC17+uP7jY2tP6pvqmAsdGNI0SsoFByMoGADPLWS5ntNfzVUf5ksPR3a3V
         VNQMprq8QBVlbxukdhR4hnnyIaVjOzv3h0pq+c0U7THK7rozvXPAa4MIQ14dy7LPBofX
         M+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740752720; x=1741357520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pv4wwRg4MWsotmAwTgSc9LO+fNoS+BdIZnuXjMZYvGI=;
        b=SS0rnUYReN9RKHNEX5/48XzIpfnMm2YJGC0rB8WreNGpY58NaHt+UBuoUGm3xuZCpC
         UC4PKj2rTXEuyChGYM8NTmffHgiDR4KBio2dV2Y+vpuPCkLWhXzD5C5qyvrZgOBp2PrK
         xBdxWZr8vsHcIF/8yfHbqZRv2IduSLQIrzgyGAxrsqX3o3iAKwW63DU5AXNyvTCPJBCg
         olW01ZJVzKiF0rqJhleyK+GaIitHGdRquGbwOpn+Wf5cKICg6Ko1o9QkcJs0gu+izKud
         /U92vZycVNbr/PmzDjhLbEtdGKYEk9+CAIvCeK0KTHs5r58rb7qMLMihpmtuRrwQOLni
         uK+w==
X-Forwarded-Encrypted: i=1; AJvYcCXmd5N1Ic/KkgD/KpJgcSZ9Jiuh832wtTPv9/h08Yrx3Jlbkxc+qU5M+JBDBbGxxjQ4LqZykvmwfCmG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47I7LSDcX7R3/t35cJ2V/B+trVmH1IhGzVA1WKs6/OLbO+HJ9
	FFZXnBDyVJAPPokoUc3vQuvc4TPHQvrG/BKn09WOg6RzPLIoTfTPM4GJnZkU2q0=
X-Gm-Gg: ASbGnctnMY6xp/Pd63L3Ke196YMIacTluWXRa5NQFljeBOleKtN+LQlnkjJI7LnmS77
	a4ThPxfzxNsIpIs3zfhu8fr2R8THSrxG6LJbX2pO/fi9rTDQareD+nH9fyEeTGXIKs620/7xLQY
	7uXjTHIKkWPygb9QMtYbe7w3yYFuwVEd84HoOE0NTcZduhMJNEuCambIy5QAG0mwwJXccLaE50N
	I4TwC+PBj3BkFokOJg4EOWIlQ8W3y9mk1EM7GzQ2qMTNlX8enSkFK8crNZy53qAdn4yvquKNpVZ
	w3/iqJlNMeMtamuC9LhIzeB91IfviQPffyW4l5MR6XDJywt5mOr47VE+EmeMqgA8wjdew8lFZt8
	/xg2YCmGGvQ==
X-Google-Smtp-Source: AGHT+IE/1tdmhyjPnwbfzddWeK3bk95/GNSAF7R8hQFGpqHDHMj7vR+nD7yX+QHUckF9GBrqLY5hFw==
X-Received: by 2002:a17:907:7f27:b0:abe:fa17:12e0 with SMTP id a640c23a62f3a-abf25f8dd1dmr349589766b.11.1740752720119;
        Fri, 28 Feb 2025 06:25:20 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c75bffcsm298754466b.143.2025.02.28.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:25:19 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:25:15 +0000
Subject: [PATCH v3 1/6] dt-bindings: gpio: add max77759 binding
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-max77759-mfd-v3-1-0c3627d42526@linaro.org>
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

This describes its GPIO module.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.48.1.711.g2feabab25a-goog


